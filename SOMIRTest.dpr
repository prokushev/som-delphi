program SOMIRTest;

{$APPTYPE CONSOLE}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

uses
  SysUtils,
  Classes,
  TypInfo,
  SOM in 'SOM.pas',
  SOM.Thin in 'SOM.Thin.pas',
  SOM.DelphiFeatures in 'SOM.DelphiFeatures.pas',
  SOM.Thin.Emitter in 'SOM.Thin.Emitter.pas',
  SOM.Thin.DLL in 'SOM.Thin.DLL.pas',
  SOM.Thin.RTL in 'SOM.Thin.RTL.pas',
  SOM.Thin.TypeCodes in 'SOM.Thin.TypeCodes.pas',
  SOM.Thin.InterfaceRepository in 'SOM.Thin.InterfaceRepository.pas';

var
  ev: PEnvironment;

function getErrorType(ec: Repository_irOpenErrorCodes): string;
begin
  case ec of
    Repository_NOACCESS: Result := 'NOACCESS';
    Repository_BADMAGICNUMBER: Result := 'BADMAGICNUMBER';
    Repository_MISSINGVERSIONINFO: Result := 'MISSINGVERSIONINFO';
    Repository_IOERROR: Result := 'IOERROR';
    Repository_VERSIONMISMATCH: Result := 'VERSIONMISMATCH';
    else Result := 'UNKNOWN';
  end;
end;

type
  TWriteTypePass = (wtpOnDemandForeignOnly, wtpOnDemandBeforeTypeDef, wtpOnDemand, wtpTypeDef, wtpFinal, wtpImplementation, wtpLowLevelImplementation);
  // wtpOnDemandForeignOnly: the write position is at the beginning of line, and if required, importer can write xxx = yyy lines
  //                         only foreign types can be output at this moment (this is to make as much opaque pointers as possible)
  // wtpOnDemandBeforeTypeDef: the write position is at the beginning of line, and if required, importer can write xxx = yyy lines
  //                           however, the next action would be to output this type, so it does not make sense to output it sometimes
  // wtpOnDemand: the write position is at the beginning of line, and if required, importer can write xxx = yyy lines
  // wtpTypeDef: '  xxx = ' is already written, and it's time to output something that is appropriate for type definition
  // wtpFinal: it's too late to define anything now, it's time to output identifier that should be defined previously
  // wtpImplementation: write implementation part (equals to wtpFinal for types, makes difference for methods)
  // wtpLowLevelImplementation: write typedef for methods; add "self" and "ev"; turn "any" result into TAnyResult

  // wtpFinal is not used for WriteRecordType; TCToImportedType should return string instead

  TSOMIRQuickLookupForClass = class
  protected
    FOIDL: Boolean;
  public
    constructor Create(Definition: InterfaceDef);
    property OIDL: Boolean read FOIDL;
  end;

  TSOMIRImporter = class
  private
    FRootNamespace: string;
    F: Text;
    FRepo: Repository;
    FExistingTypeIds: TStringList; // '::TypeName', '::ModuleName::TypeName'
    FReservedWords: TStringList; // 'file', 'type', 'result', ...
    FGeneratedOnDemand: TStringList; // '_IDL_Sequence_Byte', '^SOM_FILE', ...
    FResolutionAid: TStringList; // 'Binding=::CosNaming::Binding', ...
    FOriginalTypeIds: TStringList; // non-inherited '::TypeName', '::ModuleName::TypeName'
    FPostponedArrayNames: TStringList; // 'CosNaming_NameComponent', 'CosNaming_Binding', ...
    FWasConst: Boolean;
    FDLLs: TStringList; // 'som.dll', 'somir.dll', ...
  public
    constructor Create(const ARootNamespace: string; ARepo: Repository);
    destructor Destroy; override;
    function FallbackResolveTypeId(const Id: string): string;
    function ResolveTypeId(const Id, CurrentNamespace: string): string;
    function UnreserveIdentifier(const Identifier: string): string;
    function IdToImportedType(const Id, CurrentNamespace: string): string;
    procedure WriteObjRefType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteForeignType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteRecordType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteEnumType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WritePointerType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteArrayType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteSequenceType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);

    function ExtractName(TC: TypeCode; Index: LongInt = 0): string;
    function ExtractSubTC(TC: TypeCode; Index: LongInt): TypeCode;
    function ExtractInteger(TC: TypeCode; Index: LongInt): LongInt;
    function TCToImportedType(TC: TypeCode; const CurrentNamespace: string): string;

    procedure WriteMethodArguments(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
    procedure WriteMethodDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
    procedure WriteClassDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: InterfaceDef);

    procedure WriteRepositoryFirstPass(Item: Contained; const CurrentNamespace: string; var WasForwardType: Boolean);
    procedure WriteRepositorySecondPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepositoryThirdPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepositoryFourthPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepositoryFifthPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepositorySeventhPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepositoryEighthPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepository;

    property RootNamespace: string read FRootNamespace;
    property Repo: Repository read FRepo;
  end;

constructor TSOMIRQuickLookupForClass.Create(Definition: InterfaceDef);
var
  I: LongWord;
  Modifiers: _IDL_SEQUENCE_somModifier;
  Modifier: somModifier;
begin
  inherited Create;

  Modifiers := Contained__get_somModifiers(Definition, ev);
  if Modifiers._length > 0 then
  begin
    for I := 0 to Modifiers._length - 1 do
    begin
      Modifier := PsomModifier(PAnsiChar(Modifiers._buffer) + I * SizeOf(somModifier))^;
      if Modifier.name = 'callstyle' then
      begin
        FOIDL := Modifier.value = 'oidl';
      end;
    end;
  end;
end;

constructor TSOMIRImporter.Create(const ARootNamespace: string; ARepo: Repository);
begin
  inherited Create;
  FRootNamespace := ARootNamespace;
  FRepo := ARepo;
  FExistingTypeIds := TStringList.Create;
  FReservedWords := TStringList.Create;
  FGeneratedOnDemand := TStringList.Create;
  FResolutionAid := TStringList.Create;
  FOriginalTypeIds := TStringList.Create;
  FPostponedArrayNames := TStringList.Create;
  FDLLs := TStringList.Create;
  FReservedWords.Add('create');
  FReservedWords.Add('destroy');
  FReservedWords.Add('file');
  FReservedWords.Add('function');
  FReservedWords.Add('label');
  FReservedWords.Add('mod');
  FReservedWords.Add('object');
  FReservedWords.Add('result');
  FReservedWords.Add('to');
  FReservedWords.Add('type');
  FReservedWords.Sorted := True;

  // from System
  FGeneratedOnDemand.Add('PByte');
  FGeneratedOnDemand.Add('PEnvironment'); // from hardwired
  FGeneratedOnDemand.Add('PDouble');
  FGeneratedOnDemand.Add('PLongInt');
  FGeneratedOnDemand.Add('PLongWord');
  FGeneratedOnDemand.Add('PPointer');
  FGeneratedOnDemand.Add('PSingle');
  FGeneratedOnDemand.Add('PShortInt');
  FGeneratedOnDemand.Add('PSmallInt');
  FGeneratedOnDemand.Add('PWord');
  FGeneratedOnDemand.Sorted := True;

  FDLLs.Sorted := True;
end;

destructor TSOMIRImporter.Destroy;
var
  I: Integer;
  O: TObject;
begin
  // Close(F);

  for I := 0 to FExistingTypeIds.Count - 1 do
  begin
    O := FExistingTypeIds.Objects[I];
    FreeAndNil(O);
  end;
  FreeAndNil(FDLLs);
  FreeAndNil(FPostponedArrayNames);
  FreeAndNil(FOriginalTypeIds);
  FreeAndNil(FResolutionAid);
  FreeAndNil(FGeneratedOnDemand);
  FreeAndNil(FReservedWords);
  FreeAndNil(FExistingTypeIds);
  inherited Destroy;
end;

function TSOMIRImporter.FallbackResolveTypeId(const Id: string): string;
begin
  Result := FResolutionAid.Values[Id];
  if Result = '' then
  begin
    Result := '::Unresolved::' + Id;
    Exit;
  end;
end;

function TSOMIRImporter.ResolveTypeId(const Id, CurrentNamespace: string): string;
var
  Index, I: Integer;
  ParentNamespace: string;
begin
  if Length(Id) >= 2 then
  begin
    if Copy(Id, 1, 2) = '::' then
    begin
      // Absolute id
      Result := Id;
      Exit;
    end;
  end;

  if Length(CurrentNamespace) < 2 then
  begin
    // should not happen
    Result := FallbackResolveTypeId(Id);
    Exit;
  end;

  if Copy(CurrentNamespace, 1, 2) <> '::' then
  begin
    // should not happen
    Result := FallbackResolveTypeId(Id);
    Exit;
  end;

  if (Length(CurrentNamespace) > 2) and (Copy(CurrentNamespace, Length(CurrentNamespace) - 1, 2) <> '::') then
  begin
    // should not happen
    Result := FallbackResolveTypeId(Id);
    Exit;
  end;

  if FExistingTypeIds.Find(CurrentNamespace + Id, Index) then
  begin
    Result := CurrentNamespace + Id;
    Exit;
  end;

  if Length(CurrentNamespace) < 5 then //  Length('::N::') = 5
  begin
    Result := FallbackResolveTypeId(Id);
    Exit;
  end;

  ParentNamespace := CurrentNamespace;
  repeat
    if Length(ParentNamespace) < 5 then //  Length('::N::') = 5
    begin
      Result := FallbackResolveTypeId(Id);
      Exit;
    end;

    Index := -1;
    for I := Length(ParentNamespace) - 2 downto 2 do
    begin
      if ParentNamespace[I] = ':' then
      begin
        Index := I - 1;
        Break;
      end;
    end;

    if Index < 0 then
    begin
      Result := FallbackResolveTypeId(Id);
      Exit;
    end;

    if ParentNamespace[Index] <> ':' then
    begin
      Result := FallbackResolveTypeId(Id);
      Exit;
    end;

    SetLength(ParentNamespace, Index + 1);
  until FExistingTypeIds.Find(ParentNamespace + Id, Index);
  Result := ParentNamespace + Id;
end;

function TSOMIRImporter.UnreserveIdentifier(const Identifier: string): string;
var
  Index: Integer;
begin
  if FReservedWords.Find(LowerCase(Identifier), Index) then
  begin
    Result := 'SOM_' + Identifier;
  end
  else
  begin
    Result := Identifier;
  end;
end;

function TSOMIRImporter.IdToImportedType(const Id, CurrentNamespace: string): string;
var
  Index: Integer;
begin
  Result := ResolveTypeId(Id, CurrentNamespace);

  if Length(Result) >= 2 then
  begin
    if Copy(Result, 1, 2) = '::' then
    begin
      Result := Copy(Result, 3, Length(Result) - 2);
    end
  end;

  Index := Pos('::', Result);
  
  while Index > 0 do
  begin
    Result := Copy(Result, 1, Index - 1) + '_' + Copy(Result, Index + 2, Length(Result) - Index - 1);
    Index := Pos('::', Result);
  end;

  Result := UnreserveIdentifier(Result);
end;

procedure TSOMIRImporter.WriteObjRefType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  Name: string;
  Index: Integer;
begin
  if Pass <= wtpOnDemand then
  begin
    if Pass <> wtpOnDemandForeignOnly then
    begin
      Name := ExtractName(TC);
      if Length(Name) >= 2 then
      begin
        if Copy(Name, 1, 2) = '::' then
        begin
          if not FExistingTypeIds.Find(Name, Index) then
          begin
            WriteLn(F, '  ', IdToImportedType(Name, CurrentNamespace), ' = class(SOMObjectBase) { unresolved class name };');
            // TODO we can generate SOMObject interface clone to make it distinguished type, but no creation means
            FExistingTypeIds.Add(Name);
          end;
        end;
      end;
    end;
  end
  else
  begin
    Name := ExtractName(TC);
    Write(F, IdToImportedType(Name, CurrentNamespace));
  end;
end;

procedure TSOMIRImporter.WriteForeignType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  Name: string;
  Index: Integer;
begin
  Name := TCToImportedType(TC, CurrentNamespace);
  if Pass > wtpOnDemand then
  begin
    Write(F, Name);
  end
  else if Pass = wtpOnDemandForeignOnly then
  begin
    if not FGeneratedOnDemand.Find(Name, Index) then
    begin
      WriteLn(F, '  ', Name, ' = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };');
      FGeneratedOnDemand.Add(Name);
    end;
  end;
end;

procedure TSOMIRImporter.WriteRecordType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
  I: Integer;
  Name: string;
begin
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_string then
    begin
      Name := TCToImportedType(TC, CurrentNamespace);
      if Pass > wtpOnDemand then
      begin
        WriteLn(F, 'record');
      end;

      for I := 1 to ParamCount div 2 do
      begin
        if Pass > wtpOnDemand then
        begin
          Write(F, '    ');
        end;
        Parameter := TypeCode_parameter(TC, ev, I * 2 - 1);
        Parameter_TC := TAnyRecord(Parameter)._type;
        Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
        if Pass > wtpOnDemand then
        begin
          if Parameter_Kind = TypeCode_tk_string then
          begin
            Write(F, UnreserveIdentifier(PAnsiChar(TAnyRecord(Parameter)._value^)), ': ');
          end
          else
          begin
            Write(F, '{ TypeCode_kind = ', LongWord(Parameter_Kind), ' }: ');
          end;
        end;

        if Pass = wtpOnDemandBeforeTypeDef then
        begin
          WriteType(CurrentNamespace, wtpOnDemand, ExtractSubTC(TC, I * 2));
        end
        else if Pass = wtpTypeDef then
        begin
          WriteType(CurrentNamespace, wtpFinal, ExtractSubTC(TC, I * 2));
        end
        else
        begin
          WriteType(CurrentNamespace, Pass, ExtractSubTC(TC, I * 2));
        end;

        if Pass > wtpOnDemand then
        begin
          WriteLn(F, ';');
        end;
      end;

      if Pass > wtpOnDemand then
      begin
        Write(F, '  end');
      end;
    end
    else
    begin
      if Pass > wtpOnDemand then
      begin
        Write(F, 'record { TypeCode_kind = ', Parameter_Kind, '} end');
      end;
    end;
  end
  else
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, 'record { TypeCode_param_count = ', ParamCount, '} end');
    end;
  end;
end;

procedure TSOMIRImporter.WriteEnumType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
begin
  if Pass > wtpOnDemand then
  begin
    Write(F, 'type LongWord');
  end;
end;

procedure TSOMIRImporter.WritePointerType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  TC2: TypeCode;
  Parameter_Kind: TCKind;
  Index: Integer;
  Name: string;
begin
  TC2 := ExtractSubTC(TC, 0);
  Parameter_Kind := TypeCode_kind(TC2, ev);
  if Parameter_Kind = TypeCode_tk_void then
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, 'Pointer');
    end;
  end
  else
  begin
    Name := TCToImportedType(TC2, CurrentNamespace);
    if Pass <= wtpOnDemand then
    begin
      if Pass = wtpOnDemandForeignOnly then
      begin
        if Parameter_Kind <> TypeCode_tk_foreign then
        begin
          WriteType(CurrentNamespace, wtpOnDemandForeignOnly, TC2);
        end;
      end
      else
      if Pass = wtpOnDemandBeforeTypedef then
      begin
        if Parameter_Kind <> TypeCode_tk_foreign then
        begin
          WriteType(CurrentNamespace, wtpOnDemand, TC2);
        end;
      end
      else
      begin
        if not FGeneratedOnDemand.Find('P' + Name, Index) then
        begin
          FGeneratedOnDemand.Add('P' + Name); // support self-referential types
          if Parameter_Kind <> TypeCode_tk_foreign then
          begin
            WriteType(CurrentNamespace, wtpOnDemand, TC2);
            WriteLn(F, '  P', Name, ' = ^', Name, ';');
          end
          else if FGeneratedOnDemand.Find(Name, Index) then
          begin
            WriteLn(F, '  P', Name, ' = ^', Name, ';');
          end
          else
          begin
            WriteLn(F, '  P', Name, ' = Pointer{ opaque ^', Name, ' };');
          end;
        end;
      end;
    end
    else
    begin
      if Parameter_Kind <> TypeCode_tk_foreign then
      begin
        Write(F, '^', Name);
      end
      else if FGeneratedOnDemand.Find(Name, Index) then
      begin
        Write(F, '^', Name);  // tried to make it opaque, but failed
      end
      else
      begin
        Write(F, 'P', Name);
      end;
    end;
  end;
end;

procedure TSOMIRImporter.WriteArrayType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  TC2: TypeCode;
  Index: Integer;
  Name: string;
  Size: LongInt;
begin
  TC2 := ExtractSubTC(TC, 0);
  Size := ExtractInteger(TC, 1);
  Name := TCToImportedType(TC2, CurrentNamespace);
  if Pass <= wtpOnDemand then
  begin
    if Pass = wtpOnDemandForeignOnly then
    begin
      WriteType(CurrentNamespace, wtpOnDemandForeignOnly, TC2);
    end
    else
    if Pass = wtpOnDemandBeforeTypedef then
    begin
      WriteType(CurrentNamespace, wtpOnDemand, TC2);
    end
    else
    begin
      if not FGeneratedOnDemand.Find('_IDL_Array' + IntToStr(Size) + 'Of_' + Name, Index) then
      begin
        WriteType(CurrentNamespace, wtpOnDemand, TC2);
        WriteLn(F, '  _IDL_Array' + IntToStr(Size) + 'Of_', Name, ' = array[0 .. ', Size - 1, '] of ', Name, ';');
        FGeneratedOnDemand.Add('_IDL_Array' + IntToStr(Size) + 'Of_' + Name);
      end;
    end;
  end
  else
  begin
    Write(F, 'array[0 .. ', Size - 1, '] of ', Name);
  end;
end;

procedure TSOMIRImporter.WriteSequenceType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  TC2: TypeCode;
  Index: Integer;
  Name: string;
begin
  TC2 := ExtractSubTC(TC, 0);
  Name := TCToImportedType(TC2, CurrentNamespace);
  if Pass = wtpOnDemandForeignOnly then
  begin
    WriteType(CurrentNamespace, wtpOnDemandForeignOnly, TC2);
  end
  else if Pass <= wtpOnDemand then
  begin
    if not FGeneratedOnDemand.Find('_IDL_Sequence_' + Name, Index) then
    begin
      if not FGeneratedOnDemand.Find('_IDL_ArrayOf_' + Name, Index) then
      begin
        WriteType(CurrentNamespace, wtpOnDemand, TC2);
        // avoid division by zero in compiler
        FPostponedArrayNames.Add(Name);
        // WriteLn(F, '  _IDL_ArrayOf_', Name, ' = packed array[0 .. (MaxLongInt div (Abs(SizeOf(', Name,') - 1) + 1)) - 1] of ', Name, ';');
        FGeneratedOnDemand.Add('_IDL_ArrayOf_' + Name);
      end;

      if not FGeneratedOnDemand.Find('P_IDL_ArrayOf_' + Name, Index) then
      begin
        WriteLn(F, '  P_IDL_ArrayOf_', Name, ' = ^_IDL_ArrayOf_', Name, ';');
        FGeneratedOnDemand.Add('P_IDL_ArrayOf_' + Name);
      end;

      WriteLn(F, '  _IDL_Sequence_', Name, ' = record');
      WriteLn(F, '    _maximum: LongWord;');
      WriteLn(F, '    _length: LongWord;');
      WriteLn(F, '    _buffer: P_IDL_ArrayOf_', Name, ';');
      WriteLn(F, '  end;');
      FGeneratedOnDemand.Add('_IDL_Sequence_' + Name);
    end;
  end
  else
  begin
    Write(F, '_IDL_Sequence_', Name);
  end;
end;

procedure TSOMIRImporter.WriteType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  Kind: TCKind;
begin
  if Pass >= wtpFinal then
  begin
    Write(F, TCToImportedType(TC, CurrentNamespace));
    Exit;
  end;

  Kind := TypeCode_kind(TC, ev);
  case Kind of
  TypeCode_tk_null: if Pass > wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_null}');
  TypeCode_tk_void: if Pass > wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_void}');
  TypeCode_tk_short: if Pass > wtpOnDemand then Write(F, 'SmallInt');
  TypeCode_tk_long: if Pass > wtpOnDemand then Write(F, 'LongInt');
  TypeCode_tk_ushort: if Pass > wtpOnDemand then Write(F, 'Word');
  TypeCode_tk_ulong: if Pass > wtpOnDemand then Write(F, 'LongWord');
  TypeCode_tk_float: if Pass > wtpOnDemand then Write(F, 'Single');
  TypeCode_tk_double: if Pass > wtpOnDemand then Write(F, 'Double');
  TypeCode_tk_boolean: if Pass > wtpOnDemand then Write(F, 'CORBABoolean');
  TypeCode_tk_char: if Pass > wtpOnDemand then Write(F, 'ShortInt');
  TypeCode_tk_octet: if Pass > wtpOnDemand then Write(F, 'Byte');
  TypeCode_tk_any: if Pass > wtpOnDemand then Write(F, 'any');
  TypeCode_tk_TypeCode: if Pass > wtpOnDemand then Write(F, 'TypeCode');
  TypeCode_tk_Principal: if Pass > wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_Principal}');
  TypeCode_tk_objref: WriteObjRefType(CurrentNamespace, Pass, TC);
  TypeCode_tk_struct: WriteRecordType(CurrentNamespace, Pass, TC);
  TypeCode_tk_union: if Pass > wtpOnDemand then Write(F, 'record case Integer of {...} end');
  TypeCode_tk_enum: WriteEnumType(CurrentNamespace, Pass, TC);
  TypeCode_tk_string: if Pass > wtpOnDemand then Write(F, 'CORBAString');
  TypeCode_tk_sequence: WriteSequenceType(CurrentNamespace, Pass, TC);
  TypeCode_tk_array: WriteArrayType(CurrentNamespace, Pass, TC);
                       
  TypeCode_tk_pointer: WritePointerType(CurrentNamespace, Pass, TC);
  TypeCode_tk_self: if Pass > wtpOnDemand then Write(F, IdToImportedType(ExtractName(TC), CurrentNamespace));
  TypeCode_tk_foreign: WriteForeignType(CurrentNamespace, Pass, TC);
  else if Pass <> wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = ', LongWord(Kind), '}');
  end;
end;

function TSOMIRImporter.ExtractName(TC: TypeCode; Index: LongInt = 0): string;
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= Index + 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, Index);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_string then
    begin
      Result := PAnsiChar(TAnyRecord(Parameter)._value^);
    end
    else
    begin
      Result := 'NameExtractionFailureTypeCodeKind' + IntToStr(Integer(Parameter_Kind));
    end;
  end
  else
  begin
    Result := 'NameExtractionFailureParamCount0';
  end;
end;

function TSOMIRImporter.ExtractSubTC(TC: TypeCode; Index: LongInt): TypeCode;
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= Index + 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, Index);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_TypeCode then
    begin
      Result := TypeCode(TAnyRecord(Parameter)._value^);
    end
    else
    begin
      Result := TC_null;
    end;
  end
  else
  begin
    Result := TC_null;
  end;
end;

function TSOMIRImporter.ExtractInteger(TC: TypeCode; Index: LongInt): LongInt;
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= Index + 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, Index);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_long then
    begin
      Result := LongInt(TAnyRecord(Parameter)._value^);
    end
    else
    begin
      Result := -1;
    end;
  end
  else
  begin
    Result := -1;
  end;
end;

function TSOMIRImporter.TCToImportedType(TC: TypeCode; const CurrentNamespace: string): string;
var
  Kind: TCKind;
  TC2: TypeCode;
begin
  Kind := TypeCode_kind(TC, ev);
  case Kind of
  TypeCode_tk_null: Result := '{unknown type with TypeCode_kind = TypeCode_tk_null}';
  TypeCode_tk_void: Result := '{unknown type with TypeCode_kind = TypeCode_tk_void}';
  TypeCode_tk_short: Result := 'SmallInt';
  TypeCode_tk_long: Result := 'LongInt';
  TypeCode_tk_ushort: Result := 'Word';
  TypeCode_tk_ulong: Result := 'LongWord';
  TypeCode_tk_float: Result := 'Single';
  TypeCode_tk_double: Result := 'Double';
  TypeCode_tk_boolean: Result := 'CORBABoolean';
  TypeCode_tk_char: Result := 'ShortInt';
  TypeCode_tk_octet: Result := 'Byte';
  TypeCode_tk_any: Result := 'any';
  TypeCode_tk_TypeCode: Result := 'TypeCode';
  TypeCode_tk_Principal: Result := '{unknown type with TypeCode_kind = TypeCode_tk_Principal}';
  TypeCode_tk_objref: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  TypeCode_tk_struct: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  TypeCode_tk_union: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  TypeCode_tk_enum: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  TypeCode_tk_string: Result := 'CORBAString';
  TypeCode_tk_sequence: Result := '_IDL_Sequence_' + TCToImportedType(ExtractSubTC(TC, 0), CurrentNamespace);
  TypeCode_tk_array: Result := '_IDL_Array' + IntToStr(ExtractInteger(TC, 1)) + 'Of_' + TCToImportedType(ExtractSubTC(TC, 0), CurrentNamespace);
                       
  TypeCode_tk_pointer:
  begin
    TC2 := ExtractSubTC(TC, 0);
    if TypeCode_kind(TC2, ev) = TypeCode_tk_void then
    begin
      Result := 'Pointer';
    end
    else
    begin
      Result := 'P' + TCToImportedType(TC2, CurrentNamespace);
    end;
  end;
  TypeCode_tk_self: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  TypeCode_tk_foreign: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  else Result := '{unknown type with TypeCode_kind = ' + IntToStr(Integer(Kind)) + '}';
  end;
end;

procedure TSOMIRImporter.WriteMethodArguments(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  Mode: ParameterDef_ParameterMode;
  WasArgument: Boolean;
  TC: TypeCode;
  Kind: TCKind;
  Name: string;
  Index: Integer;
  OriginalClassId, OriginalClass: string;
  QL: TSOMIRQuickLookupForClass;
begin
  if Pass = wtpTypeDef then Exit;
  Contents := Container_contents(Definition, ev, 'all', False);
  if (Contents._length > 0) or (Pass = wtpLowLevelImplementation) then
  begin
    WasArgument := False;

    if Pass > wtpOnDemand then
    begin
      Write(F, '(');
    end;

    if Pass = wtpLowLevelImplementation then
    begin
      WasArgument := True;
      OriginalClassId := Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2);
      OriginalClass := IdToImportedType(OriginalClassId, CurrentNamespace);
      if OriginalClass = 'SOMObject' then
      begin
        Write(F, 'somSelf: SOMObjectBase');
      end
      else
      begin
        Write(F, 'somSelf: SOMObjectBase{', OriginalClass, '}');
      end;
      QL := nil;
      if not FExistingTypeIds.Find(OriginalClassId, Index) then
      begin
        Write(F, '; Quick lookup failed!!!');
      end
      else
      begin
        QL := FExistingTypeIds.Objects[Index] as TSOMIRQuickLookupForClass;
      end;
      if not QL.OIDL then
      begin
        Write(F, '; ev: PEnvironment');
      end;
    end;

    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if SOMObject_somIsA(Item, _SOMCLASS_ParameterDef) then
      begin
        Mode := ParameterDef__get_mode(Item, ev);
        TC := ParameterDef__get_type(Item, ev);
        Kind := TypeCode_kind(TC, ev);
        if Pass > wtpOnDemand then
        begin
          if not WasArgument then
          begin
            WasArgument := True
          end
          else
          begin
            Write(F, '; ');
          end;
          case Mode of
          ParameterDef_IN: if (Kind = tk_struct) or (Kind = tk_union) or (Kind = tk_self) or (Kind = tk_any) or (Kind = tk_sequence) or (Kind = tk_array) then Write(F, 'const ');
          ParameterDef_OUT: Write(F, 'out ');
          ParameterDef_INOUT: Write(F, 'var ');
          else Write(F, '{unknown mode ', LongWord(Mode), '}');
          end;

          Write(F, UnreserveIdentifier(Contained__get_name(Item, ev)));
        end;

        if Mode = ParameterDef_IN then
        begin
          if Pass > wtpOnDemand then
          begin
            Write(F, ': ');
          end;
          WriteType(CurrentNamespace, Pass, TC);
        end
        else if Kind <> TypeCode_tk_foreign then
        begin
          if Pass > wtpOnDemand then
          begin
            Write(F, ': ');
          end;
          WriteType(CurrentNamespace, Pass, TC);
        end
        else
        begin
          Name := TCToImportedType(TC, CurrentNamespace);
          if FGeneratedOnDemand.Find(Name, Index) then
          begin
            // tried to avoid this foreign type, but failed
            if Pass > wtpOnDemand then
            begin
              Write(F, ': ', Name);
            end;
          end
          else
          begin
            // managed to avoid this foreign type by writing "var X" and "out X" arguments
            if Pass > wtpOnDemand then
            begin
              Write(F, '{: opaque ', Name, '}');
            end;
          end;
        end;
      end
      else
      begin
        if Pass > wtpOnDemand then
        begin
          Write(F, '{ Found item: ', Contained__get_name(Item, ev), ' }');
        end;
      end;

      SOMFreeAndNil(Item);
    end;

    if Pass > wtpOnDemand then
    begin
      Write(F, ')');
    end;
    SOMFree(Contents._buffer);
  end;
end;

procedure TSOMIRImporter.WriteMethodDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
var
  Result_TC: TypeCode;
  Result_Kind: TCKind;
  OriginalNamespace: string;
  OriginalClass, OriginalClassId: string;
  MethodName: string;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  QL: TSOMIRQuickLookupForClass;
  Index: Integer;
begin
  if Pass = wtpTypeDef then Exit;

  OriginalNamespace := Contained__get_defined_in(Definition, ev);
  if Length(OriginalNamespace) > 2 then
  begin
    OriginalNamespace := OriginalNamespace + '::';
  end;

  if Pass >= wtpImplementation then
  begin
    WriteLn(F);
  end;
  Result_TC := OperationDef__get_result(Definition, ev);
  Result_Kind := TypeCode_kind(Result_TC, ev);
  MethodName := UnreserveIdentifier(Contained__get_name(Definition, ev));
  if Pass > wtpOnDemand then
  begin
    if Pass < wtpImplementation then
    begin
      Write(F, '    ');
    end
    else if Pass = wtpLowLevelImplementation then
    begin
      OriginalClass := IdToImportedType(Copy(OriginalNamespace, 1, Length(OriginalNamespace) - 2), OriginalNamespace);
      WriteLn(F, '(*');
      WriteLn(F, ' * New Method: ', MethodName);
      WriteLn(F, ' *)');
      WriteLn(F, 'type');
      Write(F, '  somTD_', OriginalClass, '_', MethodName, ' = ');
    end;
  end;

  if Result_Kind = TypeCode_tk_void then
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, 'procedure ');
      if Pass < wtpLowLevelImplementation then
      begin
        if Pass >= wtpImplementation then
        begin
          // IdToImportedType(Contained__get_defined_in(Definition, ev)
          Write(F, IdToImportedType(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), CurrentNamespace), '.');
        end;
        Write(F, MethodName);
      end;
    end;
    WriteMethodArguments(OriginalNamespace, Pass, Definition);
  end
  else
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, 'function ');
      if Pass < wtpLowLevelImplementation then
      begin
        if Pass >= wtpImplementation then
        begin
          Write(F, IdToImportedType(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), CurrentNamespace), '.');
        end;
        Write(F, MethodName);
      end;
    end;
    WriteMethodArguments(OriginalNamespace, Pass, Definition);
    if Pass > wtpOnDemand then
    begin
      Write(F, ': ');
    end;
    if (Pass = wtpLowLevelImplementation) and (Result_Kind = tk_any) then
    begin
      Write(F, 'TAnyResult');
    end
    else
    begin
      WriteType(OriginalNamespace, Pass, Result_TC);
    end;
  end;

  if Pass > wtpOnDemand then
  begin
    if Pass = wtpLowLevelImplementation then
    begin
      WriteLn(F, '; stdcall;');
    end
    else
    begin
      WriteLn(F, '; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    end;
  end;

  if Pass = wtpImplementation then
  begin
    OriginalClassId := Copy(OriginalNamespace, 1, Length(OriginalNamespace) - 2);
    OriginalClass := IdToImportedType(OriginalClassId, OriginalNamespace);
    WriteLn(F, 'var');
    WriteLn(F, '  cd: P', OriginalClass, 'ClassDataStructure;');
    QL := nil;
    if not FExistingTypeIds.Find(OriginalClassId, Index) then
    begin
      Write(F, ', Quick lookup failed!!!');
    end
    else
    begin
      QL := FExistingTypeIds.Objects[Index] as TSOMIRQuickLookupForClass;
    end;
    if not QL.OIDL then
    begin
      WriteLn(F, '  LocalEnv: Environment;');
    end;
    WriteLn(F, 'begin');
    WriteLn(F, '  cd := ', OriginalClass, 'ClassData;');

    if not QL.OIDL then
    begin
      WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    end;

    if Result_Kind = TypeCode_tk_any then
    begin
      WriteLn(F, '  Result := any(');
    end
    else if Result_Kind <> TypeCode_tk_void then
    begin
      WriteLn(F, '  Result :=');
    end;
    WriteLn(F, '  somTD_', OriginalClass, '_', MethodName);
    WriteLn(F, '   (SOM_Resolve(Self, cd.classObject, cd.', MethodName, '))');
    Write(F, '     (Self');
    if not QL.OIDL then
    begin
      Write(F, ', @LocalEnv');
    end;

    Contents := Container_contents(Definition, ev, 'all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        if SOMObject_somIsA(Item, _SOMCLASS_ParameterDef) then
        begin
          Write(F, ', ', UnreserveIdentifier(Contained__get_name(Item, ev)));
        end;
        SOMFreeAndNil(Item);
      end;
      SOMFree(Contents._buffer);
    end;

    Write(F, ')');
    if Result_Kind = TypeCode_tk_any then
    begin
      Write(F, ')');
    end;
    WriteLn(F, ';');

    // TODO check exception

    if not QL.OIDL then
    begin
      WriteLn(F, '  SOM_UninitEnvironment(@LocalEnv);');
    end
    else
    begin
      WriteLn(F, '  somExceptionFree(somGetGlobalEnvironment);');
    end;

    WriteLn(F, 'end;');
  end;
end;

procedure TSOMIRImporter.WriteClassDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: InterfaceDef);
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  Name: Identifier;
  NameS: AnsiString;
  WasPrivate: Boolean;
  OriginalNamespace: string;
  ImportedType: string;
begin
  Contents := Container_contents(Definition, ev, 'all', Pass <= wtpOnDemand);
  if Contents._length > 0 then
  begin
    WasPrivate := False;

    // First pass: property setters and getters
    for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if SOMObject_somIsA(Item, _SOMCLASS_OperationDef) then
      begin
        NameS := Contained__get_name(Item, ev);
        if Length(NameS) > 5 then
        begin
          NameS := Copy(NameS, 1, 5);
          if (NameS = '_get_') or (NameS = '_set_') then
          begin
            if not WasPrivate then
            begin
              if (Pass > wtpOnDemand) and (Pass < wtpImplementation) then
              begin
                WriteLn(F, '  private');
              end;
              WasPrivate := True;
            end;
            if Pass = wtpImplementation then
            begin
              if Contained__get_defined_in(Item, ev) + '::' = CurrentNamespace then
              begin
                WriteMethodDefinition(CurrentNamespace, wtpLowLevelImplementation, Item);
              end;
            end;
            WriteMethodDefinition(CurrentNamespace, Pass, Item);
          end;
        end;
      end;
    end;

    if (Pass > wtpOnDemand) then
    begin
      ImportedType := IdToImportedType(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), CurrentNamespace);

      if Pass < wtpImplementation then
      begin
        WriteLn(F, '  public');
        WriteLn(F, '    class function Create: ', ImportedType, ';');
      end
      else
      begin
        ImportedType := IdToImportedType(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), CurrentNamespace);
        WriteLn(F);
        WriteLn(F, 'class function ', ImportedType, '.Create: ', ImportedType, ';');
        WriteLn(F, 'var');
        WriteLn(F, '  cls: SOMClass;');
        WriteLn(F, 'begin');
        WriteLn(F, '  cls := ClassObject;');
        WriteLn(F, '  if not Assigned(cls) then cls := SOMClass(', ImportedType, 'NewClass);');
        WriteLn(F, '  Result := ', ImportedType, '(cls.somNew);');
        WriteLn(F, 'end;');
      end;
    end;

    // Second pass: public methods except for getters/setters
    for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if SOMObject_somIsA(Item, _SOMCLASS_OperationDef) then
      begin
        NameS := Contained__get_name(Item, ev);
        if Length(NameS) > 5 then
        begin
          NameS := Copy(NameS, 1, 5);
          if (NameS <> '_get_') and (NameS <> '_set_') then
          begin
            if Pass = wtpImplementation then
            begin
              if Contained__get_defined_in(Item, ev) + '::' = CurrentNamespace then
              begin
                WriteMethodDefinition(CurrentNamespace, wtpLowLevelImplementation, Item);
              end;
            end;
            WriteMethodDefinition(CurrentNamespace, Pass, Item);
          end;
        end
        else
        begin
          if Pass = wtpImplementation then
          begin
            if Contained__get_defined_in(Item, ev) + '::' = CurrentNamespace then
            begin
              WriteMethodDefinition(CurrentNamespace, wtpLowLevelImplementation, Item);
            end;
          end;
          WriteMethodDefinition(CurrentNamespace, Pass, Item);
        end;
      end;
    end;

    if (Pass > wtpOnDemand) then
    begin
      if Pass < wtpImplementation then
      begin
        // TODO metaclass modifier should alter result type
        WriteLn(F, '    class function ClassObject: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // may be nil before class is created');
      end
      else
      begin
        WriteLn(F);
        WriteLn(F, 'class function ', ImportedType, '.ClassObject: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
        WriteLn(F, 'begin');
        WriteLn(F, '  if Self = ', ImportedType, ' then { invoked on class name literal }');
        WriteLn(F, '  begin');
        WriteLn(F, '    Result := SOMClass(', ImportedType, 'ClassData.classObject);');
        WriteLn(F, '  end');
        WriteLn(F, '  else { invoked on SOM object }');
        WriteLn(F, '  begin');
        WriteLn(F, '    Result := SOMClass(PPointer(Self)^);');
        WriteLn(F, '  end');
        WriteLn(F, 'end;');
      end;
    end;

    // Third pass: properties
    for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if Pass < wtpImplementation then
      begin
        if SOMObject_somIsA(Item, _SOMCLASS_AttributeDef) then
        begin
          Name := Contained__get_name(Item, ev);
          if (Pass > wtpOnDemand) and (Pass < wtpImplementation) then
          begin
            Write(F, '    property ', UnreserveIdentifier(Name), ': ');
          end;

          OriginalNamespace := Contained__get_defined_in(Item, ev);
          if Length(OriginalNamespace) > 2 then
          begin
            OriginalNamespace := OriginalNamespace + '::';
          end;

          WriteType(OriginalNamespace, Pass, AttributeDef__get_type(Item, ev));
          if (Pass > wtpOnDemand) and (Pass < wtpImplementation) then
          begin
            if AttributeDef__get_mode(Item, ev) = AttributeDef_READONLY then
            begin
              WriteLn(F, ' read _get_', Name, ';');
            end
            else
            begin
              WriteLn(F, ' read _get_', Name, ' write _set_', Name, ';');
            end;
          end;
          Name := nil;
        end;
      end;

      SOMFreeAndNil(Item);
    end;
    SOMFree(Contents._buffer);
  end;
end;

procedure TSOMIRImporter.WriteRepositoryFirstPass(Item: Contained; const CurrentNamespace: string; var WasForwardType: Boolean);
var
  Name: PAnsiChar;
  Recurse: Boolean;
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  OriginalNamespace: string;
  NewNamespace: string;
  QL: TSOMIRQuickLookupForClass;
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
  begin
    if not WasForwardType then
    begin
      WriteLn(F, '  { Forward definitions }');
      WasForwardType := True;
    end;
    Name := Contained__get_name(Item, ev);
    QL := TSOMIRQuickLookupForClass.Create(Item);
    FExistingTypeIds.AddObject(CurrentNamespace + Name, QL);
    FResolutionAid.Values[Name] := CurrentNamespace + Name;
    WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = class;');
    Recurse := True;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
  begin
    Name := Contained__get_name(Item, ev);
    FExistingTypeIds.Add(CurrentNamespace + Name);

    OriginalNamespace := Contained__get_defined_in(Item, ev);
    if Length(OriginalNamespace) > 2 then
    begin
      OriginalNamespace := OriginalNamespace + '::';
    end;

    if CurrentNamespace = OriginalNamespace then
    begin
      FOriginalTypeIds.Add(CurrentNamespace + Name);
      FResolutionAid.Values[Name] := CurrentNamespace + Name;
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ExceptionDef) then
  begin
    Name := Contained__get_name(Item, ev);
    FExistingTypeIds.Add(CurrentNamespace + Name);

    OriginalNamespace := Contained__get_defined_in(Item, ev);
    if Length(OriginalNamespace) > 2 then
    begin
      OriginalNamespace := OriginalNamespace + '::';
    end;

    if CurrentNamespace = OriginalNamespace then
    begin
      FOriginalTypeIds.Add(CurrentNamespace + Name);
      FResolutionAid.Values[Name] := CurrentNamespace + Name;
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ModuleDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end;

  if Recurse then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := Container_contents(Item, ev, 'all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositoryFirstPass(SubItem, NewNamespace, WasForwardType);
        SOMFreeAndNil(SubItem);
      end;
      SOMFree(Contents._buffer);
    end;
  end;
end;

procedure TSOMIRImporter.WriteRepositorySecondPass(Item: Contained; const CurrentNamespace: string);
var
  TC: TypeCode;
  Name: PAnsiChar;
  Recurse: Boolean;
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  NewNamespace: string;
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
  begin
    TC := TypeDef__get_type(Item, ev);
    if TypeCode_kind(TC, ev) <> TypeCode_tk_foreign then
    begin
      WriteType(CurrentNamespace, wtpOnDemandForeignOnly, TC);
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ExceptionDef) then
  begin
    TC := ExceptionDef__get_type(Item, ev);
    if TypeCode_kind(TC, ev) <> TypeCode_tk_foreign then
    begin
      WriteType(CurrentNamespace, wtpOnDemandForeignOnly, TC);
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
  begin
    Name := Contained__get_name(Item, ev);
    WriteClassDefinition(CurrentNamespace + Name + '::' {CurrentNamespace}, wtpOnDemandForeignOnly, Item);
    Recurse := True;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ModuleDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end;

  if Recurse then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := Container_contents(Item, ev, 'all', True);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositorySecondPass(SubItem, NewNamespace);
        SOMFreeAndNil(SubItem);
      end;
      SOMFree(Contents._buffer);
    end;
  end;
end;

procedure TSOMIRImporter.WriteRepositoryThirdPass(Item: Contained; const CurrentNamespace: string);
var
  TC: TypeCode;
  Kind: TCKind;
  Name: PAnsiChar;
  Recurse: Boolean;
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  OriginalNamespace: string;
  NewNamespace: string;
  Index: Integer;
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
  begin
    TC := TypeDef__get_type(Item, ev);
    Kind := TypeCode_kind(TC, ev);
    if (Kind <> TypeCode_tk_foreign) and (Kind <> TypeCode_tk_struct) then
    begin
      OriginalNamespace := Contained__get_defined_in(Item, ev);
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if OriginalNamespace <> CurrentNamespace then
      begin
        Name := Contained__get_name(Item, ev);
        if not FOriginalTypeIds.Find(CurrentNamespace + Name, Index) then // if inherited type was not replaced by new one
        begin
          WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
        end;
      end
      else
      begin
        WriteType(CurrentNamespace, wtpOnDemandBeforeTypeDef, TC);
        Write(F, '  ', IdToImportedType(CurrentNamespace + Contained__get_name(Item, ev), CurrentNamespace), ' = ');
        WriteType(CurrentNamespace, wtpTypeDef, TC);
        WriteLn(F, ';');
      end;
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ExceptionDef) then
  begin
    TC := ExceptionDef__get_type(Item, ev);
    Kind := TypeCode_kind(TC, ev);
    if (Kind <> TypeCode_tk_foreign) and (Kind <> TypeCode_tk_null) and (Kind <> TypeCode_tk_struct) then
    begin
      OriginalNamespace := Contained__get_defined_in(Item, ev);
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if OriginalNamespace <> CurrentNamespace then
      begin
        Name := Contained__get_name(Item, ev);
        if not FOriginalTypeIds.Find(CurrentNamespace + Name, Index) then // if inherited type was not replaced by new one
        begin
          WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited exception } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
        end;
      end
      else
      begin
        WriteType(CurrentNamespace, wtpOnDemandBeforeTypeDef, TC);
        Write(F, '  ', IdToImportedType(CurrentNamespace + Contained__get_name(Item, ev), CurrentNamespace), ' = { exception } ');
        WriteType(CurrentNamespace, wtpTypeDef, TC);
        WriteLn(F, ';');
      end;
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ModuleDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end;

  if Recurse then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := Container_contents(Item, ev, 'all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositoryThirdPass(SubItem, NewNamespace);
        SOMFreeAndNil(SubItem);
      end;
      SOMFree(Contents._buffer);
    end;
  end;
end;

procedure TSOMIRImporter.WriteRepositoryFourthPass(Item: Contained; const CurrentNamespace: string);
var
  TC: TypeCode;
  Name: PAnsiChar;
  Recurse: Boolean;
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  OriginalNamespace: string;
  NewNamespace: string;
  Index: Integer;
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
  begin
    TC := TypeDef__get_type(Item, ev);
    if TypeCode_kind(TC, ev) = TypeCode_tk_struct then
    begin
      OriginalNamespace := Contained__get_defined_in(Item, ev);
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      Name := Contained__get_name(Item, ev);
      if OriginalNamespace <> CurrentNamespace then
      begin
        if not FOriginalTypeIds.Find(CurrentNamespace + Name, Index) then // if inherited type was not replaced by new one
        begin
          WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
        end;
      end
      else if (CurrentNamespace <> '::') or (Name <> 'Environment') then // suppress Environment record definition
      begin
        WriteType(CurrentNamespace, wtpOnDemandBeforeTypeDef, TC);
        Write(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = ');
        WriteType(CurrentNamespace, wtpTypeDef, TC);
        WriteLn(F, ';');
      end;
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ExceptionDef) then
  begin
    TC := ExceptionDef__get_type(Item, ev);
    if TypeCode_kind(TC, ev) = TypeCode_tk_struct then
    begin
      OriginalNamespace := Contained__get_defined_in(Item, ev);
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if OriginalNamespace <> CurrentNamespace then
      begin
        Name := Contained__get_name(Item, ev);
        if not FOriginalTypeIds.Find(CurrentNamespace + Name, Index) then // if inherited type was not replaced by new one
        begin
          WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited exception } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
        end;
      end
      else
      begin
        WriteType(CurrentNamespace, wtpOnDemandBeforeTypeDef, TC);
        Write(F, '  ', IdToImportedType(CurrentNamespace + Contained__get_name(Item, ev), CurrentNamespace), ' = { exception } ');
        WriteType(CurrentNamespace, wtpTypeDef, TC);
        WriteLn(F, ';');
      end;
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ModuleDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end;

  if Recurse then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := Container_contents(Item, ev, 'all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositoryFourthPass(SubItem, NewNamespace);
        SOMFreeAndNil(SubItem);
      end;
      SOMFree(Contents._buffer);
    end;
  end;
end;

procedure TSOMIRImporter.WriteRepositoryFifthPass(Item: Contained; const CurrentNamespace: string);
var
  Name: PAnsiChar;
  Recurse: Boolean;
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  NewNamespace: string;
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
  begin
    WriteLn(F);
    Name := Contained__get_name(Item, ev);
    WriteClassDefinition(CurrentNamespace + Name + '::', wtpOnDemand, Item);
    WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = class(SOMObjectBase)');
    WriteClassDefinition(CurrentNamespace + Name + '::', wtpFinal, Item);
    WriteLn(F, '  end;');
    // there can be no sub-interfaces or modules inside of interface
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ModuleDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end;

  if Recurse then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := Container_contents(Item, ev, 'all', True);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositoryFifthPass(SubItem, NewNamespace);
        SOMFreeAndNil(SubItem);
      end;
      SOMFree(Contents._buffer);
    end;
  end;
end;

procedure TSOMIRImporter.WriteRepositorySeventhPass(Item: Contained; const CurrentNamespace: string);
var
  TC: TypeCode;
  Name: PAnsiChar;
  Recurse: Boolean;
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  OriginalNamespace, NewNamespace: string;
  ImportedType, EnumElementName: string;
  ParamCount: LongInt;
  ConstantValue: any;
  ConstantStringValue: string;
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
  begin
    TC := TypeDef__get_type(Item, ev);
    if TypeCode_kind(TC, ev) = TypeCode_tk_enum then
    begin
      ParamCount := TypeCode_param_count(TC, ev);

      if ParamCount > 1 then
      begin
        Name := Contained__get_name(Item, ev);
        ImportedType := IdToImportedType(CurrentNamespace + Name, CurrentNamespace);
        OriginalNamespace := Contained__get_defined_in(Item, ev);
        if Length(OriginalNamespace) > 2 then
        begin
          OriginalNamespace := OriginalNamespace + '::';
        end;

        if not FWasConst then
        begin
          WriteLn(F);
          WriteLn(F, 'const');
          FWasConst := True;
        end;

        if CurrentNamespace = OriginalNamespace then
        begin
          if (CurrentNamespace = '::') and (Name = 'TCKind') then
          begin
            for I := 1 to ParamCount - 1 do
            begin
              EnumElementName := ExtractName(TC, I);
              Write(F, '  ', IdToImportedType(CurrentNamespace + EnumElementName, CurrentNamespace), ' = ', ImportedType, '(');
              if EnumElementName = 'tk_pointer' then
              begin
                Write(F, '101');
              end
              else if EnumElementName = 'tk_self' then
              begin
                Write(F, '102');
              end
              else if EnumElementName = 'tk_foreign' then
              begin
                Write(F, '103');
              end
              else
              begin
                Write(F, I - 1);
              end;
              WriteLn(F, ');');
            end;
          end
          else
          begin
            for I := 1 to ParamCount - 1 do
            begin
              WriteLn(F, '  ', IdToImportedType(CurrentNamespace + ExtractName(TC, I), CurrentNamespace), ' = ', ImportedType, '(', I - 1, ');');
            end;
          end;
        end
        else
        begin
          for I := 1 to ParamCount - 1 do
          begin
            EnumElementName := ExtractName(TC, I);
            WriteLn(F, '  ', IdToImportedType(CurrentNamespace + EnumElementName, CurrentNamespace), ' = ', IdToImportedType(OriginalNamespace + EnumElementName, OriginalNamespace), ';');
          end;
        end;
      end;
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ConstantDef) then
  begin
    Name := Contained__get_name(Item, ev);
    ImportedType := IdToImportedType(CurrentNamespace + Name, CurrentNamespace);

    ConstantValue := ConstantDef__get_value(Item, ev);
    if TypeCode_kind(TAnyRecord(ConstantValue)._type, ev) <> tk_string then
    begin
      if not FWasConst then
      begin
        WriteLn(F);
        WriteLn(F, 'const');
        FWasConst := True;
      end;
      WriteLn(F, '  ', ImportedType, ' = Bad TypeCode_kind in ConstantDef;');
    end
    else
    begin
      OriginalNamespace := Contained__get_defined_in(Item, ev);
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if not FWasConst then
      begin
        WriteLn(F);
        WriteLn(F, 'const');
        FWasConst := True;
      end;
      if CurrentNamespace = OriginalNamespace then
      begin
        // TODO better parsing of integer and string literals
        ConstantStringValue := PAnsiChar(TAnyRecord(ConstantValue)._value^);
        if Length(ConstantStringValue) >= 2 then
        begin
          if (ConstantStringValue[1] = '"') and (ConstantStringValue[Length(ConstantStringValue)] = '"') then
          begin
            ConstantStringValue := '''' + Copy(ConstantStringValue, 2, Length(ConstantStringValue) - 2) + '''';
          end;
        end;
        WriteLn(F, '  ', ImportedType, ' = ', ConstantStringValue, ';');
      end
      else
      begin
        WriteLn(F, '  ', ImportedType, ' = ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace));
      end;
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ExceptionDef) then
  begin
    Name := Contained__get_name(Item, ev);

    OriginalNamespace := Contained__get_defined_in(Item, ev);
    if Length(OriginalNamespace) > 2 then
    begin
      OriginalNamespace := OriginalNamespace + '::';
    end;

    if not FWasConst then
    begin
      WriteLn(F);
      WriteLn(F, 'const');
      FWasConst := True;
    end;
    if CurrentNamespace = OriginalNamespace then
    begin
      WriteLn(F, '  ex_', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = ''', CurrentNamespace + Name, ''';');
    end
    else
    begin
      WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace));
    end;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ModuleDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end;

  if Recurse then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := Container_contents(Item, ev, 'all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositorySeventhPass(SubItem, NewNamespace);
        SOMFreeAndNil(SubItem);
      end;
      SOMFree(Contents._buffer);
    end;
  end;
end;

procedure TSOMIRImporter.WriteRepositoryEighthPass(Item: Contained; const CurrentNamespace: string);
var
  Name, MajorVersion, MinorVersion, DllName: PAnsiChar;
  Recurse: Boolean;
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Index: Integer;
  ImportedType, NewNamespace, DllName_Id, ReleaseOrder: string;
  Modifiers: _IDL_SEQUENCE_somModifier;
  Modifier: somModifier;
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
  begin
    Name := Contained__get_name(Item, ev);
    ImportedType := IdToImportedType(CurrentNamespace + Name, CurrentNamespace);
    // TODO name should not be unreserved in dll entry names

    MajorVersion := '0';
    MinorVersion := '0';
    ReleaseOrder := '';
    DllName := '';
    Modifiers := Contained__get_somModifiers(Item, ev);
    if Modifiers._length > 0 then
    begin
      for I := 0 to Modifiers._length - 1 do
      begin
        Modifier := PsomModifier(PAnsiChar(Modifiers._buffer) + I * SizeOf(somModifier))^;
        if Modifier.name = 'releaseorder' then
        begin
          ReleaseOrder := Modifier.value;
        end
        else if Modifier.name = 'majorversion' then
        begin
          MajorVersion := Modifier.value;
        end
        else if Modifier.name = 'minorversion' then
        begin
          MinorVersion := Modifier.value;
        end
        else if Modifier.name = 'dllname' then
        begin
          DllName := Modifier.value;
        end;
      end;
    end;

    if (Length(DllName) = 0) and (CurrentNamespace = '::') then
    begin
      if (Name = 'SOMEEvent') or (Name = 'SOMEClientEvent') or (Name = 'SOMEEMan') or
        (Name = 'SOMEEMRegisterData') or (Name = 'SOMETimerEvent') or (Name = 'SOMEWorkProcEvent') or
        (Name = 'SOMESinkEvent') then
      begin
        DllName := 'somem.dll';
      end
      else if (Name = 'SOMTEntryC') or (Name = 'SOMTAttributeEntryC') or (Name = 'SOMTBaseClassEntryC') or
        (Name = 'SOMTClassEntryC') or (Name = 'SOMTCommonEntryC') or (Name = 'SOMTConstEntryC') or
        (Name = 'SOMTDataEntryC') or (Name = 'SOMTEmitC') or (Name = 'SOMTEnumEntryC') or
        (Name = 'SOMTEnumNameEntryC') or (Name = 'SOMTMetaClassEntryC') or (Name = 'SOMTMethodEntryC') or
        (Name = 'SOMTModuleEntryC') or (Name = 'SOMTParameterEntryC') or (Name = 'SOMTPassthruEntryC') or
        (Name = 'SOMTSequenceEntryC') or (Name = 'SOMTStringEntryC') or (Name = 'SOMTStructEntryC') or
        (Name = 'SOMTTypedefEntryC') or (Name = 'SOMTTemplateOutputC') or (Name = 'SOMTUnionEntryC') or
        (Name = 'SOMTUserDefinedTypeEntryC') or (Name = 'SOMStringTableC') then
      begin
        DllName := 'some.dll';
      end
      else if (Name = 'SOMMSingleInstance') or (Name = 'SOMMBeforeAfter') or (Name = 'SOMMTraced') or
        (Name = 'SOMUTId') then
      begin
        DllName := 'some.dll';
      end
      else if (Name = 'SOMDMetaproxy') then
      begin
        DllName := 'some.dll';
      end
      else if (Name = 'Sockets') then
      begin
        DllName := 'soms.dll';
      end
      else if (Name = 'ModuleDef') then
      begin
        DllName := 'somir.dll';
      end
      else
      begin
        Write(' no dllname for ', Name, '!'); // lazy guys
      end;
    end;

    DllName_Id := UpperCase(DllName);
    for I := 1 to Length(DllName_Id) do
    begin
      if DllName_Id[I] = '.' then
      begin
        DllName_Id[I] := '_';
      end;
    end;

    if not FDLLs.Find(dllname, Index) then
    begin
      WriteLn(F);
      WriteLn(F, 'const');
      WriteLn(F, '  ', DllName_Id, '_Name = ''', dllname, ''';');
      WriteLn(F);
      WriteLn(F, 'var');
      WriteLn(F, '  ', DllName_Id, ': System.HMODULE = 0;');
      WriteLn(F, '');
      WriteLn(F, 'procedure ', DllName_Id, '_Load_Variable(var V_Pointer; const Var_Name: AnsiString);');
      WriteLn(F, 'begin');
      WriteLn(F, '  if ', DllName_Id, ' = 0 then');
      WriteLn(F, '  begin');
      WriteLn(F, '    Windows.EnterCriticalSection(DLLLoad_CriticalSection);');
      WriteLn(F, '    if ', DllName_Id, ' = 0 then');
      WriteLn(F, '      ', DllName_Id, ' := Windows.LoadLibraryW(', DllName_Id, '_Name);');
      WriteLn(F, '    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);');
      WriteLn(F, '  end;');
      WriteLn(F, '  if ', DllName_Id, ' <> 0 then');
      WriteLn(F, '    Pointer(V_Pointer) := Windows.GetProcAddress(', DllName_Id, ', PAnsiChar(Var_Name));');
      WriteLn(F, 'end;');
      FDLLs.Add(dllname);
    end;

    WriteLn(F);
    WriteLn(F, 'const');
    WriteLn(F, '  ', ImportedType, '_MajorVersion = ', MajorVersion, ';');
    WriteLn(F, '  ', ImportedType, '_MinorVersion = ', MinorVersion, ';');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' * Declare the class creation procedure');
    WriteLn(F, ' *)');
    WriteLn(F, 'function ', ImportedType, 'NewClass(');
    WriteLn(F, '  somtmajorVersion: integer4 = ', ImportedType, '_MajorVersion;');
    WriteLn(F, '  somtminorVersion: integer4 = ', ImportedType, '_MinorVersion):');
    WriteLn(F, '  SOMClass; stdcall; external ', DllName_Id, '_Name name ''', ImportedType, 'NewClass'';');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' * Declare the ABI 2 ClassData structure');
    WriteLn(F, ' *)');
    WriteLn(F, 'type');
    WriteLn(F, '  ', ImportedType, 'ClassDataStructure = record');
    WriteLn(F, '    classObject: SOMClass;');
    while Length(ReleaseOrder) > 0 do
    begin
      Index := Pos(',', ReleaseOrder);
      if Index <= 0 then
      begin
        WriteLn(F, '    ', UnreserveIdentifier(ReleaseOrder), ': somMToken;');
        ReleaseOrder := '';
      end
      else
      begin
        WriteLn(F, '    ', UnreserveIdentifier(Copy(ReleaseOrder, 1, Index - 1)), ',');
        ReleaseOrder := Copy(ReleaseOrder, Index + 1, Length(ReleaseOrder) - Index);
      end;
    end;
    WriteLn(F, '  end;');
    WriteLn(F, '  P', ImportedType, 'ClassDataStructure = ^', ImportedType, 'ClassDataStructure;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  ', DllName_Id, '_', ImportedType, 'ClassData: P', ImportedType, 'ClassDataStructure = nil;');
    WriteLn(F);
    WriteLn(F, 'function ', ImportedType, 'ClassData: P', ImportedType, 'ClassDataStructure;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(', DllName_Id, '_', ImportedType, 'ClassData) then');
    WriteLn(F, '    Result := ', DllName_Id, '_', ImportedType, 'ClassData');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    ', DllName_Id, '_Load_Variable(', DllName_Id, '_', ImportedType, 'ClassData, ''', ImportedType, 'ClassData'');');
    WriteLn(F, '    Result := ', DllName_Id, '_', ImportedType, 'ClassData;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' * Declare the ABI 2 CClassData structure');
    WriteLn(F, ' *)');
    WriteLn(F, 'type');
    WriteLn(F, '  ', ImportedType, 'CClassDataStructure = record');
    WriteLn(F, '    parentMtab: somMethodTabs;');
    WriteLn(F, '    instanceDataToken: somDToken;');
    WriteLn(F, '  end;');
    WriteLn(F, '  P', ImportedType, 'CClassDataStructure = ^', ImportedType, 'CClassDataStructure;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  ', DllName_Id, '_', ImportedType, 'CClassData: P', ImportedType, 'CClassDataStructure = nil;');
    WriteLn(F);
    WriteLn(F, 'function ', ImportedType, 'CClassData: P', ImportedType, 'CClassDataStructure;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(', DllName_Id, '_', ImportedType, 'CClassData) then');
    WriteLn(F, '    Result := ', DllName_Id, '_', ImportedType, 'CClassData');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    ', DllName_Id, '_Load_Variable(', DllName_Id, '_', ImportedType, 'CClassData, ''', ImportedType, 'CClassData'');');
    WriteLn(F, '    Result := ', DllName_Id, '_', ImportedType, 'CClassData;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' * Class Object and Method Token Macros');
    WriteLn(F, ' *)');
    (*
    WriteLn(F, 'function _SOMCLASS_', ImportedType, ': SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := ', ImportedType, 'ClassData.classObject;');
    WriteLn(F, 'end;');
    *)

    WriteClassDefinition(CurrentNamespace + Name + '::', wtpImplementation, Item);
    // there can be no sub-interfaces or modules inside of interface
  end
  else if SOMObject_somIsA(Item, _SOMCLASS_ModuleDef) then
  begin
    Name := Contained__get_name(Item, ev);
    Recurse := True;
  end;

  if Recurse then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := Container_contents(Item, ev, 'all', True);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositoryEighthPass(SubItem, NewNamespace);
        SOMFreeAndNil(SubItem);
      end;
      SOMFree(Contents._buffer);
    end;
  end;
end;

procedure TSOMIRImporter.WriteRepository;
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  WasForwardType: Boolean;
  Name: string;
begin
  Assign(F, RootNamespace + '.pas');
  Rewrite(F);
  try
    Write('Writing ', RootNamespace, '.pas...');
    WriteLn(F, 'unit ', RootNamespace, ';');
    WriteLn(F);
    WriteLn(F, '{$WARN UNSAFE_TYPE OFF}');
    WriteLn(F);
    WriteLn(F, '{$IF CompilerVersion >= 17.0}');
    WriteLn(F, '  {$DEFINE DELPHI_HAS_INLINE}');
    WriteLn(F, '{$IFEND}');
    WriteLn(F);
    WriteLn(F, '{$IF CompilerVersion >= 23.0}');
    WriteLn(F, '  {$DEFINE DELPHI_HAS_INTPTR}');
    WriteLn(F, '{$IFEND}');
    WriteLn(F);
    WriteLn(F, 'interface');
    WriteLn(F);
    WriteLn(F, 'uses');
    WriteLn(F, '  SysUtils;');
    WriteLn(F);
    WriteLn(F, 'type');
    WriteLn(F, '  { Hardwired definitions }');
    WriteLn(F, '  CORBAString = PAnsiChar;');
    WriteLn(F, '  CORBABoolean = ByteBool;');
    WriteLn(F, '  TypeCode = Pointer;'); // TODO convert to object
    WriteLn(F, '  any = record');
    WriteLn(F, '    _type: TypeCode;');
    WriteLn(F, '    _value: Pointer;');
    WriteLn(F, '  end;');
    WriteLn(F, '  TAnyResult = type Int64; { returned in edx:eax by vanilla IBM SOM, but passed via hidden pointer by Delphi when record }');
    WriteLn(F, '  PEnvironment = ^Environment;');
    WriteLn(F, '  {$IFNDEF DELPHI_HAS_INTPTR}');
    WriteLn(F, '  IntPtr = type LongInt;');
    WriteLn(F, '  UIntPtr = type LongWord;');
    WriteLn(F, '  {$ENDIF}');
    WriteLn(F);

    Contents := Container_contents(Repo, ev, 'all', False);
    // WriteLn(F, '{ Amount of items: ', Contents._length, ' }');
    
    WasForwardType := False;

    // First pass: write forward type references, populate existing types for resolution,
    // fetch quick lookup data
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      WriteRepositoryFirstPass(Item, '::', WasForwardType);
    end;
    FExistingTypeIds.Sorted := True;
    FOriginalTypeIds.Sorted := True;
    Write(' 1');
    WriteLn(F);
    WriteLn(F, '  { Foreign types }');

    // Second pass: find foreign types that can't go into opaque pointers
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      WriteRepositorySecondPass(Item, '::');
    end;
    Write(' 2');
    WriteLn(F);
    WriteLn(F, '  { Data types }');

    // Third pass: build non-class types
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      WriteRepositoryThirdPass(Item, '::');
    end;
    Write(' 3');
    WriteLn(F);
    WriteLn(F, '  { Records }');
    // Fourth pass: build non-class types (deferred records)
    WriteLn(F, '  Environment = record'); // fixup for Environment
    WriteLn(F, '    _major: exception_type;');
    WriteLn(F, '    exception_exception_name: PAnsiChar;');
    WriteLn(F, '    exception_params: Pointer;');
    WriteLn(F, '    _somdAnchor: Pointer;');
    WriteLn(F, '  end;');
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      WriteRepositoryFourthPass(Item, '::');
    end;
    Write(' 4');
    WriteLn(F);
    WriteLn(F, '  { Classes }');
    WriteLn(F, '  SOMObjectBase = class');
    WriteLn(F, '  private');
    WriteLn(F, '    { hide TObject methods }');
    WriteLn(F, '    procedure Create; reintroduce;');
    WriteLn(F, '    procedure Destroy; reintroduce;');
    WriteLn(F, '  public');
    WriteLn(F, '    function As_SOMObject: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, '  end;');

    // Fifth pass: satisfy forward type references with classes
    if WasForwardType then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositoryFifthPass(Item, '::');
      end;
    end;
    Write(' 5');
    WriteLn(F);
    WriteLn(F, '  { Arrays }');

    // Sixth pass: print deferred arrays (for sequences)
    if Contents._length > 0 then for I := 0 to FPostponedArrayNames.Count - 1 do
    begin
      Name := FPostponedArrayNames[I];
      WriteLn(F, '  _IDL_ArrayOf_', Name, ' = array[0 .. (MaxLongInt div (Abs(SizeOf(', Name,') - 1) + 1)) - 1] of ', Name, ';');
    end;
    Write(' 6');
    WriteLn(F);
    WriteLn(F, '{ Constants }');

    // Seventh pass: constants from TypeDef tk_enum, ConstDef and ExceptionDef
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      WriteRepositorySeventhPass(Item, '::');
    end;
    Write(' 7');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' *  Method and Data Resolution macros');
    WriteLn(F, ' *)');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' * Default definition of somresolve_ to call the procedure, somResolve.');
    WriteLn(F, ' * This may be be changed by emitters on systems for which method');
    WriteLn(F, ' * tokens are thunks.');
    WriteLn(F, ' *)');
    WriteLn(F, 'function somresolve_(obj: SOMObjectBase; mToken: somMToken): somMethodProc; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' *  Method Resolution. Methods are invoked on an object o of some');
    WriteLn(F, ' *  object class oc, where oc has immediate ancestor classes');
    WriteLn(F, ' *  called parent classes. Macro arguments include method names');
    WriteLn(F, ' *  (e.g., mn), object class and parent class names (e.g., ocn, pcn)');
    WriteLn(F, ' *  and parent class positions (e.g., pcp), expressed in terms of the');
    WriteLn(F, ' *  left-to-right ordering (beginning with 1, for the first parent)');
    WriteLn(F, ' *  used when declaring oc''s parents. The choice of resolution');
    WriteLn(F, ' *  macro determines the method table from which methods are selected.');
    WriteLn(F, ' *');
    WriteLn(F, ' *  Macros are available to select a method from ...');
    WriteLn(F, ' *)');
    WriteLn(F);
    WriteLn(F, '(* from oc''s mtbl, with verification of o *)');
    WriteLn(F, '   (*  call somresolve_ but test that the object is well formed and an');
    WriteLn(F, '       instance of the specified class or a class derived from that class *)');
    WriteLn(F);
    WriteLn(F, 'function SOM_Resolve(o: SOMObjectBase; oc: SOMObjectBase{SOMClass}; m: somMToken;');
    WriteLn(F, '  fileName: PAnsiChar = nil; lineNum: Integer = 0): somMethodProc; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F);
    WriteLn(F, '(* from oc''s mtbl, without verification of o *)');
    WriteLn(F, 'function SOM_ResolveNoCheck(o: SOMObjectBase; oc: SOMObjectBase{SOMClass}; m: somMToken): somMethodProc; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F);
    WriteLn(F, '(* Check the validity of method resolution using the specified target  *)');
    WriteLn(F, '(* object.  Note: this macro makes programs bigger and slower.  After  *)');
    WriteLn(F, '(* you are confident that your program is running correctly you should *)');
    WriteLn(F, '(* turn off this macro by defining SOM_NoTest, or adding -DSOM_NoTest  *)');
    WriteLn(F, '(* to your makefile.                                                   *)');
    WriteLn(F);
    WriteLn(F, 'function SOM_TestCls(obj: SOMObjectBase; cls: SOMObjectBase{SOMClass};');
    WriteLn(F, '  fileName: PAnsiChar = nil; lineNum: Integer = 0): SOMObjectBase; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F);
    WriteLn(F, 'function somExceptionId(ev: PEnvironment): PAnsiChar; stdcall;');
    WriteLn(F, 'function somExceptionValue(ev: PEnvironment): Pointer; stdcall;');
    WriteLn(F, 'procedure somExceptionFree(ev: PEnvironment); stdcall;');
    WriteLn(F, 'procedure somSetException(ev: PEnvironment;');
    WriteLn(F, '    major: exception_type; exception_name: PAnsiChar; params: Pointer); stdcall;');
    WriteLn(F, 'function somGetGlobalEnvironment: PEnvironment; stdcall;');
    WriteLn(F);
    WriteLn(F, '(* Exception function names per CORBA 5.19, p.99 *)');
    WriteLn(F, 'function exception_id(ev: PEnvironment): PAnsiChar; stdcall;');
    WriteLn(F, 'function exception_value(ev: PEnvironment): Pointer; stdcall;');
    WriteLn(F, 'procedure exception_free(ev: PEnvironment); stdcall;');
    WriteLn(F);
    WriteLn(F, '(*  Convenience macros for manipulating environment structures');
    WriteLn(F, ' *');
    WriteLn(F, ' *  SOM_CreateLocalEnvironment returns a pointer to an Environment.');
    WriteLn(F, ' *  The other 3 macros all expect a single argument that is also');
    WriteLn(F, ' *  a pointer to an Environment.  Use the create/destroy forms for');
    WriteLn(F, ' *  a dynamic local environment and the init/uninit forms for a stack-based');
    WriteLn(F, ' *  local environment.');
    WriteLn(F, ' *');
    WriteLn(F, ' *  For example');
    WriteLn(F, ' *');
    WriteLn(F, ' *      Environment *ev;');
    WriteLn(F, ' *      ev = SOM_CreateLocalEnvironment ();');
    WriteLn(F, ' *      ... Use ev in methods');
    WriteLn(F, ' *      SOM_DestroyLocalEnvironment (ev);');
    WriteLn(F, ' *');
    WriteLn(F, ' *  or');
    WriteLn(F, ' *');
    WriteLn(F, ' *      Environment ev;');
    WriteLn(F, ' *      SOM_InitEnvironment (&ev);');
    WriteLn(F, ' *      ... Use &ev in methods');
    WriteLn(F, ' *      SOM_UninitEnvironment (&ev);');
    WriteLn(F, ' *)');
    WriteLn(F, 'function SOM_CreateLocalEnvironment: PEnvironment; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'procedure SOM_DestroyLocalEnvironment(ev: PEnvironment); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'procedure SOM_InitEnvironment(ev: PEnvironment); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'procedure SOM_UninitEnvironment(ev: PEnvironment); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F);
    WriteLn(F, 'type');
    WriteLn(F, '  somTD_SOMMalloc = function(nbytes: UIntPtr): somToken; stdcall;');
    WriteLn(F, '  PsomTD_SOMMalloc = ^somTD_SOMMalloc;');
    WriteLn(F, '  somTD_SOMCalloc = function(');
    WriteLn(F, '    element_count: UIntPtr;');
    WriteLn(F, '    element_size: UIntPtr): somToken; stdcall;');
    WriteLn(F, '  PsomTD_SOMCalloc = ^somTD_SOMCalloc;');
    WriteLn(F, '  somTD_SOMRealloc = function(');
    WriteLn(F, '    memory: somToken;');
    WriteLn(F, '    nbytes: UIntPtr): somToken; stdcall;');
    WriteLn(F, '  PsomTD_SOMRealloc = ^somTD_SOMRealloc;');
    WriteLn(F, '  somTD_SOMFree = procedure(memory: somToken); stdcall;');
    WriteLn(F, '  PsomTD_SOMFree = ^somTD_SOMFree;');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' *  Replaceable SOM Memory Management Interfaces');
    WriteLn(F, ' *');
    WriteLn(F, ' *  External procedure variables SOMCalloc, SOMFree, SOMMalloc, SOMRealloc');
    WriteLn(F, ' *  have the same interface as their standard C-library analogs.');
    WriteLn(F, ' *)');
    WriteLn(F, 'function Replaceable_SOMCalloc: PsomTD_SOMCalloc;');
    WriteLn(F, 'function SOMCalloc(element_count, element_size: UIntPtr): somToken; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'function Replaceable_SOMFree: PsomTD_SOMFree;');
    WriteLn(F, 'procedure SOMFree(memory: somToken); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'function Replaceable_SOMMalloc: PsomTD_SOMMalloc;');
    WriteLn(F, 'function SOMMalloc(nbytes: UIntPtr): somToken; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'function Replaceable_SOMRealloc: PsomTD_SOMRealloc;');
    WriteLn(F, 'function SOMRealloc(memory: somToken; nbytes: UIntPtr): somToken; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' * Verifies that the passed object is a valid instance of the passed');
    WriteLn(F, ' * class.  A detected failure generates an error message and causes');
    WriteLn(F, ' * program termination.  This call is automatically employed as part');
    WriteLn(F, ' * of the C method resolution macros if the preprocessor variable');
    WriteLn(F, ' * SOM_TestOn is defined.');
    WriteLn(F, ' *)');
    WriteLn(F, 'function somTestCls(');
    WriteLn(F, '    obj: SOMObjectBase;');
    WriteLn(F, '    classObj: SOMObjectBase{SOMClass};');
    WriteLn(F, '    fileName: CORBAString;');
    WriteLn(F, '    lineNumber: Integer): SOMObjectBase; stdcall;');
    WriteLn(F);
    WriteLn(F, 'implementation');
    WriteLn(F);
    WriteLn(F, 'uses');
    WriteLn(F, '  Windows;');
    WriteLn(F);
    WriteLn(F, 'const');
    WriteLn(F, '  Unknown_Source = ''<unknown>.pas''; // no __FILE__ and __LINE__ macros in Delphi');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  DLLLoad_CriticalSection : Windows.TRTLCriticalSection;');
    WriteLn(F);
    WriteLn(F, 'procedure SOMObjectBase.Create;');
    WriteLn(F, 'begin');
    WriteLn(F, '  { hide this method }');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure SOMObjectBase.Destroy;');
    WriteLn(F, 'begin');
    WriteLn(F, '  { hide this method }');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOMObjectBase.As_SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := SOMObject(Self); { upcast }');
    WriteLn(F, 'end;');

    // Eighth pass: class and method implementation
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      WriteRepositoryEighthPass(Item, '::');

      SOMFreeAndNil(Item);
    end;

    if Contents._length > 0 then
    begin
      SOMFree(Contents._buffer);
    end;

    WriteLn(F);
    WriteLn(F, 'function somresolve_(obj: SOMObjectBase; mToken: somMToken): somMethodProc; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := somMethodProc(mToken);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOM_Resolve(o: SOMObjectBase; oc: SOMObjectBase{SOMClass}; m: somMToken;');
    WriteLn(F, '  fileName: PAnsiChar = nil; lineNum: Integer = 0): somMethodProc; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  if not Assigned(fileName) then fileName := Unknown_Source;');
    WriteLn(F, '  SOM_TestCls(o, oc, fileName, lineNum);');
    WriteLn(F, '  Result := m;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOM_ResolveNoCheck(o: SOMObjectBase; oc: SOMObjectBase{SOMClass}; m: somMToken): somMethodProc; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := m;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOM_TestCls(obj: SOMObjectBase; cls: SOMObjectBase{SOMClass};');
    WriteLn(F, '  fileName: PAnsiChar = nil; lineNum: Integer = 0): SOMObjectBase; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  if not Assigned(fileName) then fileName := Unknown_Source;');
    WriteLn(F, '  Result := somTestCls(obj, cls, fileName, lineNum);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function somExceptionId; external SOM_DLL_Name;');
    WriteLn(F, 'function somExceptionValue; external SOM_DLL_Name;');
    WriteLn(F, 'procedure somExceptionFree; external SOM_DLL_Name;');
    WriteLn(F, 'procedure somSetException; external SOM_DLL_Name;');
    WriteLn(F, 'function somGetGlobalEnvironment; external SOM_DLL_Name;');
    WriteLn(F, 'function exception_id; external SOM_DLL_Name name ''somExceptionId'';');
    WriteLn(F, 'function exception_value; external SOM_DLL_Name name ''somExceptionValue'';');
    WriteLn(F, 'procedure exception_free; external SOM_DLL_Name name ''somExceptionFree'';');
    WriteLn(F);
    WriteLn(F, 'function SOM_CreateLocalEnvironment: PEnvironment; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := PEnvironment(SOMCalloc(1, SizeOf(Environment)));');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure SOM_DestroyLocalEnvironment(ev: PEnvironment); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  somExceptionFree(ev);');
    WriteLn(F, '  if somGetGlobalEnvironment <> ev then');
    WriteLn(F, '    SOMFree(ev);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure SOM_InitEnvironment(ev: PEnvironment); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  if somGetGlobalEnvironment <> ev then');
    WriteLn(F, '  begin');
    WriteLn(F, '    FillChar(ev^, SizeOf(Environment), 0);');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure SOM_UninitEnvironment(ev: PEnvironment); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  somExceptionFree(ev);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOM_DLL_SOMCalloc: PsomTD_SOMCalloc = nil;');
    WriteLn(F);
    WriteLn(F, 'function Replaceable_SOMCalloc: PsomTD_SOMCalloc;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOM_DLL_SOMCalloc) then');
    WriteLn(F, '    Result := SOM_DLL_SOMCalloc');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOM_DLL_Load_Variable(SOM_DLL_SOMCalloc, ''SOMCalloc'');');
    WriteLn(F, '    Result := SOM_DLL_SOMCalloc;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOMCalloc(element_count, element_size: UIntPtr): somToken; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := Replaceable_SOMCalloc^(element_count, element_size);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOM_DLL_SOMFree: PsomTD_SOMFree = nil;');
    WriteLn(F);
    WriteLn(F, 'function Replaceable_SOMFree: PsomTD_SOMFree;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOM_DLL_SOMFree) then');
    WriteLn(F, '    Result := SOM_DLL_SOMFree');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOM_DLL_Load_Variable(SOM_DLL_SOMFree, ''SOMFree'');');
    WriteLn(F, '    Result := SOM_DLL_SOMFree;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure SOMFree(memory: somToken); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Replaceable_SOMFree^(memory);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOM_DLL_SOMMalloc: PsomTD_SOMMalloc = nil;');
    WriteLn(F);
    WriteLn(F, 'function Replaceable_SOMMalloc: PsomTD_SOMMalloc;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOM_DLL_SOMMalloc) then');
    WriteLn(F, '    Result := SOM_DLL_SOMMalloc');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOM_DLL_Load_Variable(SOM_DLL_SOMMalloc, ''SOMMalloc'');');
    WriteLn(F, '    Result := SOM_DLL_SOMMalloc;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOMMalloc(nbytes: UIntPtr): somToken; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := Replaceable_SOMMalloc^(nbytes);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOM_DLL_SOMRealloc: PsomTD_SOMRealloc = nil;');
    WriteLn(F);
    WriteLn(F, 'function Replaceable_SOMRealloc: PsomTD_SOMRealloc;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOM_DLL_SOMRealloc) then');
    WriteLn(F, '    Result := SOM_DLL_SOMRealloc');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOM_DLL_Load_Variable(SOM_DLL_SOMRealloc, ''SOMRealloc'');');
    WriteLn(F, '    Result := SOM_DLL_SOMRealloc;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOMRealloc(memory: somToken; nbytes: UIntPtr): somToken; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := Replaceable_SOMRealloc^(memory, nbytes);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function somTestCls; external SOM_DLL_Name;');
    WriteLn(F);
    WriteLn(F, 'initialization');
    WriteLn(F, '  Windows.InitializeCriticalSection(DLLLoad_CriticalSection);');
    WriteLn(F, 'finalization');
    WriteLn(F, '  Windows.DeleteCriticalSection(DLLLoad_CriticalSection);');
    WriteLn(F, 'end.');
  finally
    Close(F);
    WriteLn(' done!');
  end;
end;

procedure TestSOM_IR;
var
  repo: Repository;
  exname: CORBAString;
  oep: PRepository_irOpenError;
  imp: TSOMIRImporter;
begin
  repo := RepositoryNew;
  try
    if not Assigned(repo) then
    begin
      exname := somExceptionId(ev);
      oep := PRepository_irOpenError(somExceptionValue(ev));
      if (ev._major = USER_EXCEPTION) and Assigned(exname) and Assigned(oep) and (ex_Repository_irOpenError = exname) then
      begin
        WriteLn(ErrOutput, 'IR file "', oep.fileName, '" open failed: ', getErrorType(oep.errorCode));
        somExceptionFree(ev);
      end
      else
      begin
        WriteLn(ErrOutput, 'Unable to access IR');
      end;

      Exit;
    end;

    WriteLn('IR opened');
    imp := TSOMIRImporter.Create('SOMIRTest.DumpOut', repo);
    try
      imp.WriteRepository;
    finally
      FreeAndNil(imp);
    end;
  finally
    SOMFreeAndNil(repo);
  end;
end;

begin
  try
    WriteLn('Testing SOMObject v', SOM_MajorVersion, '.', SOM_MinorVersion);
    SOM_MainProgram;
    ev := somGetGlobalEnvironment;
    // SOMObjectNewClass;
    // TestSOM_Basic;
    // TestSOM_Renew;
    TestSOM_IR;
  except
    on e: Exception do
      WriteLn(GetTypeData(e.ClassInfo).UnitName + '.' + e.ClassName + ':' + e.Message);
  end;
end.
