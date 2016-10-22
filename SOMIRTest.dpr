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
  TWriteTypePass = (wtpOnDemandForeignOnly, wtpOnDemandBeforeTypeDef, wtpOnDemand, wtpTypeDef, wtpFinal);
  // wtpOnDemandForeignOnly: the write position is at the beginning of line, and if required, importer can write xxx = yyy lines
  //                         only foreign types can be output at this moment (this is to make as much opaque pointers as possible)
  // wtpOnDemandBeforeTypeDef: the write position is at the beginning of line, and if required, importer can write xxx = yyy lines
  //                           however, the next action would be to output this type, so it does not make sense to output it sometimes
  // wtpOnDemand: the write position is at the beginning of line, and if required, importer can write xxx = yyy lines
  // wtpTypeDef: '  xxx = ' is already written, and it's time to output something that is appropriate for type definition
  // wtpFinal: it's too late to define anything now, it's time to output identifier that should be defined previously

  // wtpFinal is not used for WriteRecordType; TCToImportedType should return string instead

  TSOMIRImporter = class
  private
    FRootNamespace: string;
    F: Text;
    FRepo: Repository;
    FWasType: Boolean;
    FExistingTypeIds: TStringList; // '::TypeName', '::ModuleName::TypeName'
    FReservedWords: TStringList; // 'file', 'type', 'result', ...
    FGeneratedOnDemand: TStringList; // '_IDL_Sequence_Byte', '^SOM_FILE', ...
    FResolutionAid: TStringList; // 'Binding=::CosNaming::Binding', ...
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
    procedure WriteSequenceType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);

    function ExtractName(TC: TypeCode): string;
    function ExtractSubTC(TC: TypeCode; Index: LongInt): TypeCode;
    function TCToImportedType(TC: TypeCode; const CurrentNamespace: string): string;

    procedure WriteMethodArguments(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
    procedure WriteMethodDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
    procedure WriteClassDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: InterfaceDef);

    procedure WriteRepositoryFirstPass(Item: Contained; const CurrentNamespace: string; var WasForwardType: Boolean);
    procedure WriteRepositorySecondPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepositoryThirdPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepositoryFourthPass(Item: Contained; const CurrentNamespace: string);
    procedure WriteRepository;

    property RootNamespace: string read FRootNamespace;
    property Repo: Repository read FRepo;
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
  FReservedWords.Add('file');
  FReservedWords.Add('function');
  FReservedWords.Add('mod');
  FReservedWords.Add('object');
  FReservedWords.Add('result');
  FReservedWords.Add('type');
  FReservedWords.Sorted := True;

  // from System
  FGeneratedOnDemand.Add('PByte');
  FGeneratedOnDemand.Add('PDouble');
  FGeneratedOnDemand.Add('PLongInt');
  FGeneratedOnDemand.Add('PLongWord');
  FGeneratedOnDemand.Add('PPointer');
  FGeneratedOnDemand.Add('PSingle');
  FGeneratedOnDemand.Add('PShortInt');
  FGeneratedOnDemand.Add('PSmallInt');
  FGeneratedOnDemand.Add('PWord');
  FGeneratedOnDemand.Sorted := True;
end;

destructor TSOMIRImporter.Destroy;
begin
  // Close(F);
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
begin
  if Pass > wtpOnDemand then
  begin
    Write(F, IdToImportedType(ExtractName(TC), CurrentNamespace));
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
      if not FWasType then
      begin
        WriteLn(F, 'type');
        FWasType := True;
      end;
      WriteLn(F, '  ', Name, ' = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };');
      FGeneratedOnDemand.Add(Name);
    end;
  end;
end;

// TODO consider inherited context
// function describe: Description; in ExceptionDef
// should be Contained_Description instead
procedure TSOMIRImporter.WriteRecordType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_string then
    begin
      if Pass > wtpOnDemand then
      begin
        WriteLn(F, 'record');
        WriteLn(F, '    { ... }');
      end;

      { TODO record fields }

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
          if not FWasType then
          begin
            WriteLn(F, 'type');
            FWasType := True;
          end;
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
          FGeneratedOnDemand.Add('P' + Name);
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
      if not FWasType then
      begin
        WriteLn(F, 'type');
        FWasType := True;
      end;
      if not FGeneratedOnDemand.Find('P' + Name, Index) then
      begin
        WriteType(CurrentNamespace, wtpOnDemand, TC2);
        WriteLn(F, '  P', Name, ' = ^', Name, ';');
        FGeneratedOnDemand.Add('P' + Name);
      end;

      WriteLn(F, '  _IDL_Sequence_', Name, ' = record');
      WriteLn(F, '    _maximum: LongWord;');
      WriteLn(F, '    _length: LongWord;');
      WriteLn(F, '    _buffer: P', Name,';');
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
  if Pass = wtpFinal then
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
  TypeCode_tk_array: if Pass > wtpOnDemand then Write(F, 'array [0 .. {...}] of {...}');
                       
  TypeCode_tk_pointer: WritePointerType(CurrentNamespace, Pass, TC);
  TypeCode_tk_self: if Pass > wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_self}');
  TypeCode_tk_foreign: WriteForeignType(CurrentNamespace, Pass, TC);
  else if Pass <> wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = ', LongWord(Kind), '}');
  end;
end;

function TSOMIRImporter.ExtractName(TC: TypeCode): string;
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
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
  TypeCode_tk_array: Result := 'array[0 .. {...}] of {...}';
                       
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
  TypeCode_tk_self: Result := '{unknown type with TypeCode_kind = TypeCode_tk_self}';
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
  Name: string;
  Index: Integer;
begin
  if Pass = wtpTypeDef then Exit;
  Contents := Container_contents(Definition, ev, 'all', False);
  if Contents._length > 0 then
  begin
    WasArgument := False;

    if Pass > wtpOnDemand then
    begin
      Write(F, '(');
    end;
    for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if SOMObject_somIsA(Item, _SOMCLASS_ParameterDef) then
      begin
        Mode := ParameterDef__get_mode(Item, ev);
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
          ParameterDef_IN: ;
          ParameterDef_OUT: Write(F, 'out ');
          ParameterDef_INOUT: Write(F, 'var ');
          else Write(F, '{unknown mode ', LongWord(Mode), '}');
          end;

          Write(F, UnreserveIdentifier(Contained__get_name(Item, ev)));
        end;

        TC := ParameterDef__get_type(Item, ev);
        if Mode = ParameterDef_IN then
        begin
          if Pass > wtpOnDemand then
          begin
            Write(F, ': ');
          end;
          WriteType(CurrentNamespace, Pass, TC);
        end
        else if TypeCode_kind(TC, ev) <> TypeCode_tk_foreign then
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
  OriginalNamespace: string;
begin
  if Pass = wtpTypeDef then Exit;

  OriginalNamespace := Contained__get_defined_in(Definition, ev);
  if Length(OriginalNamespace) > 2 then
  begin
    OriginalNamespace := OriginalNamespace + '::';
  end;

  Result_TC := OperationDef__get_result(Definition, ev);
  if TypeCode_kind(Result_TC, ev) = TypeCode_tk_void then
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, '    procedure ', UnreserveIdentifier(Contained__get_name(Definition, ev)));
    end;
    WriteMethodArguments(OriginalNamespace, Pass, Definition);
    if Pass > wtpOnDemand then
    begin
      WriteLn(F, ';');
    end;
  end
  else
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, '    function ', UnreserveIdentifier(Contained__get_name(Definition, ev)));
    end;
    WriteMethodArguments(OriginalNamespace, Pass, Definition);
    if Pass > wtpOnDemand then
    begin
      Write(F, ': ');
    end;
    WriteType(OriginalNamespace, Pass, Result_TC);
    if Pass > wtpOnDemand then
    begin
      WriteLn(F, ';');
    end;
  end;
end;

procedure TSOMIRImporter.WriteClassDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: InterfaceDef);
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  Name: Identifier;
  NameS: AnsiString;
  WasPrivate, WasPublic: Boolean;
  OriginalNamespace: string;
begin
  Contents := Container_contents(Definition, ev, 'all', Pass <= wtpOnDemand);
  if Contents._length > 0 then
  begin
    WasPrivate := False;
    WasPublic := False;

    // First pass: unknown stuff
    for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if SOMObject_somIsA(Item, _SOMCLASS_OperationDef) then begin end
      else if SOMObject_somIsA(Item, _SOMCLASS_AttributeDef) then begin end
      else if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then begin end
      else if SOMObject_somIsA(Item, _SOMCLASS_ExceptionDef) then begin end
      else
      begin
        if Pass > wtpOnDemand then
        begin
          WriteLn(F, '    { Found item: ', Contained__get_name(Item, ev), ' }');
        end;
      end;
    end;

    // Second pass: property setters and getters
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
              if Pass > wtpOnDemand then
              begin
                WriteLn(F, '  private');
              end;
              WasPrivate := True;
            end;
            WriteMethodDefinition(CurrentNamespace, Pass, Item);
          end;
        end;
      end;
    end;

    // Third pass: public methods except for getters/setters
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
            if not WasPublic then
            begin
              if Pass > wtpOnDemand then
              begin
                WriteLn(F, '  public');
              end;
              WasPublic := True;
            end;
            WriteMethodDefinition(CurrentNamespace, Pass, Item);
          end;
        end
        else
        begin
          if not WasPublic then
          begin
            if Pass > wtpOnDemand then
            begin
              WriteLn(F, '  public');
            end;
            WasPublic := True;
          end;
          WriteMethodDefinition(CurrentNamespace, Pass, Item);
        end;
      end;
    end;

    // Fourth pass: properties
    for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if SOMObject_somIsA(Item, _SOMCLASS_AttributeDef) then
      begin
        if not WasPublic then
        begin
          if Pass > wtpOnDemand then
          begin
            WriteLn(F, '  public');
          end;
          WasPublic := True;
        end;
        Name := Contained__get_name(Item, ev);
        if Pass > wtpOnDemand then
        begin
          Write(F, '    property ', UnreserveIdentifier(Name), ': ');
        end;

        OriginalNamespace := Contained__get_defined_in(Item, ev);
        if Length(OriginalNamespace) > 2 then
        begin
          OriginalNamespace := OriginalNamespace + '::';
        end;

        WriteType(OriginalNamespace, Pass, AttributeDef__get_type(Item, ev));
        if Pass > wtpOnDemand then
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
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
  begin
    if not WasForwardType then
    begin
      WriteLn(F, 'type');
      WriteLn(F, '  { Forward definitions }');
      WasForwardType := True;
      FWasType := True;
    end;
    Name := Contained__get_name(Item, ev);
    FExistingTypeIds.Add(CurrentNamespace + Name);
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
begin
  Recurse := False;
  if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
  begin
    TC := TypeDef__get_type(Item, ev);
    if TypeCode_kind(TC, ev) <> TypeCode_tk_foreign then
    begin
      if not FWasType then
      begin
        WriteLn(F, 'type');
        FWasType := True;
      end;

      OriginalNamespace := Contained__get_defined_in(Item, ev);
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if OriginalNamespace <> CurrentNamespace then
      begin
        Name := Contained__get_name(Item, ev);
        WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
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
    if (Kind <> TypeCode_tk_foreign) and (Kind <> TypeCode_tk_null) then
    begin
      if not FWasType then
      begin
        WriteLn(F, 'type');
        FWasType := True;
      end;

      OriginalNamespace := Contained__get_defined_in(Item, ev);
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if OriginalNamespace <> CurrentNamespace then
      begin
        Name := Contained__get_name(Item, ev);
        WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited exception } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
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
    WriteClassDefinition(CurrentNamespace + Name + '::' {CurrentNamespace}, wtpOnDemand, Item);
    WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = class');
    WriteClassDefinition(CurrentNamespace + Name + '::' {CurrentNamespace}, wtpFinal, Item);
    // TODO more tricky resolution for inherited methods
    // TODO types in methods should be resolved against class introduced them
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

procedure TSOMIRImporter.WriteRepository;
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  WasForwardType: Boolean;
begin
  Assign(F, RootNamespace + '.pas');
  Rewrite(F);
  try
    Write('Writing ', RootNamespace, '.pas...');
    WriteLn(F, '{$WARN UNSAFE_TYPE OFF}');
    WriteLn(F);
    WriteLn(F, 'unit ', RootNamespace, ';');
    WriteLn(F);
    WriteLn(F, 'interface');
    WriteLn(F, 'uses');
    WriteLn(F, '  SOM.DelphiFeatures, SOM.Thin;');
    WriteLn(F);
    WriteLn(F, '{$INCLUDE ''SOM.DelphiFeatures.inc''}');
    WriteLn(F);

    Contents := Container_contents(Repo, ev, 'all', False);
    // WriteLn(F, '{ Amount of items: ', Contents._length, ' }');
    if Contents._length > 0 then
    begin
      WasForwardType := False;

      // First pass: write forward type references, populate existing types for resolution
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositoryFirstPass(Item, '::', WasForwardType);
      end;
      FExistingTypeIds.Sorted := True;
      Write(' 1');

      // Second pass: find foreign types that can't go into opaque pointers
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositorySecondPass(Item, '::');
      end;
      Write(' 2');

      // TODO Forward pointer types?

      // Third pass: build non-class types
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteRepositoryThirdPass(Item, '::');
      end;
      Write(' 3');

      // Fourth pass: satisfy forward type references with classes
      if WasForwardType then
      begin
        for I := 0 to Contents._length - 1 do
        begin
          Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
          WriteRepositoryFourthPass(Item, '::');
        end;
      end;
      Write(' 4');

      // Last pass: others
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
        else if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
        else if SOMObject_somIsA(Item, _SOMCLASS_ModuleDef) then
        else
        begin
          // TODO ExceptionDef
          WriteLn(F);
          WriteLn(F, '{ Found item: ', Contained__get_name(Item, ev), ' }');
        end;

        SOMFreeAndNil(Item);
      end;
      SOMFree(Contents._buffer);
    end;

    WriteLn(F);
    WriteLn(F, 'implementation');
    WriteLn(F);
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
