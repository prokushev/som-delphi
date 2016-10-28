program SOMIRTest.IRTestOut;

(********************************************************************
 Comparison of COM and SOM workflows

 First use case:

 COM:
 Step 1)   MIDL.exe
           - or -
           GenTLB.exe
             compile IDLs to binary TLB
 Step 2)   TLIBIMP.EXE
             open TLB and produce PAS

 SOM:
 Step 1)   SC.exe -sir
           that is, SOM compiler with IR emitter
             compile IDLs, create or update SOM.IR binary database 
 Step 2)   SOMIRIMP.exe
             open SOM.IR and produce PAS

 Second use case:

 COM:
 Step 1)   GenTLB.exe -C
             compile IDL to C++ language binding file
             in a single command (MIDL.exe probably also has something)

 SOM:
 Step 1)   SC.EXE -sxh
           that is, SOM compiler with XH emitter
             compile IDL to C++ bindings
             in a single command

 The symmetry can't be complete, these are very different models, but
 the general idea is like this. Originally the aim was to write custom 
 emitter (second use case) using Emitter Framework, and emitdelphi.dpr
 was about this, but it was hard to make convenient bindings using limited 
 information available to emitters. For instance, it is higly desirable to 
 have sequence<string> mapped to the same Delphi type for all classes, but 
 the complete information is required for this. C and C++ emitters produce 
 tons of macros to make it work and offload the job to preprocessor this way.
 
 The first idea was to make emitter gather all information in one place and 
 then produce bindings. But there is already one emitter doing this: IR 
 emitter. It creates or updates SOM.IR database. This database can then be 
 opened using Interface Repository Framework. EF and IRF have a lot in common, 
 the comparison is here:

 https://bitbucket.org/OCTAGRAM/som-delphi/wiki/Emitter%20Framework%20vs.%20Interface%20Repository%20Framework

 So convenient bindings are being created with first use case only, and second 
 use case is not covered in this project. Alternative approach can be found 
 here (OS/2 only, while this project is currently Windows-only):

 http://svn.code.sf.net/p/osfree/code/trunk/OS2/SOM/Frameworks/Emitter/Emitters/Pas/

********************************************************************)

{$APPTYPE CONSOLE}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

uses
  SysUtils,
  Classes,
  TypInfo,
  SOMIRIMP.SOM in 'SOMIRIMP.SOM.pas';

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
  TSOMIRImporter = class;
  TSOMIRQuickLookupForClass = class
  protected
    FOIDL: Boolean;
    FId: string; // "::Module::Class"
    FMetaclass: string; // "SOMMSingleInstance" before SaturateAndResolve, then "::SOMMSingleInstance"
    FParents: TStringList; // "::SOMClass", "::SOMObject", ...
    FAncestors: TStringList; // "::SOMClass", "::SOMObject", ... (saturated)
    FSaturated: Boolean;
  public
    constructor Create(Definition: InterfaceDef);
    destructor Destroy; override;
    procedure SaturateAndResolve(Importer: TSOMIRImporter);
    property OIDL: Boolean read FOIDL;
    property Id: string read FId;
    property Metaclass: string read FMetaclass;
    property Parents: TStringList read FParents;
    property Ancestors: TStringList read FAncestors;
    property Saturated: Boolean read FSaturated;
  end;

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

    procedure WriteMethodArguments(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef; const OverrideFromObj: string = '');
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
    property ExistingTypeIds: TStringList read FExistingTypeIds;
  end;

constructor TSOMIRQuickLookupForClass.Create(Definition: InterfaceDef);
var
  I: LongWord;
  Modifiers: _IDL_SEQUENCE_somModifier;
  Modifier: somModifier;
  Parents: _IDL_SEQUENCE_CORBAString;
  Parent: string;
  Index: Integer;
begin
  inherited Create;
  FAncestors := TStringList.Create;
  FParents := TStringList.Create;
  FAncestors.Sorted := True;
  FParents.Sorted := True;

  FId := Definition.id;

  Modifiers := Definition.somModifiers;
  if Modifiers._length > 0 then
  begin
    for I := 0 to Modifiers._length - 1 do
    begin
      Modifier := Modifiers._buffer[I];
      if Modifier.name = 'callstyle' then
      begin
        FOIDL := Modifier.value = 'oidl';
      end
      else if Modifier.name = 'metaclass' then
      begin
        FMetaclass := Modifier.value;
      end;
    end;
  end;

  Parents := Definition.base_interfaces;
  if Parents._length > 0 then
  begin
    for I := 0 to Parents._length - 1 do
    begin
      Parent := Parents._buffer[I];
      if not FParents.Find(Parent, Index) then
      begin
        FParents.Add(Parent);
      end;
    end;
  end;
end;

procedure TSOMIRQuickLookupForClass.SaturateAndResolve(Importer: TSOMIRImporter);
var
  I, J, Index: Integer;
  ParentId, AncestorId: string;
  QLOfParent: TSOMIRQuickLookupForClass;
  AncestorsOfParent: TStringList;
begin
  if FSaturated then Exit;
  if Length(Metaclass) > 0 then
  begin
    FMetaclass := Importer.ResolveTypeId(FMetaclass, FId + '::');
  end
  else
  begin
    FMetaclass := '::SOMClass';
  end;
  for I := 0 to FParents.Count - 1 do
  begin
    ParentId := FParents[I];

    if Importer.ExistingTypeIds.Find(ParentId, Index) then
    begin
      QLOfParent := Importer.ExistingTypeIds.Objects[Index] as TSOMIRQuickLookupForClass;
      if Assigned(QLOfParent) then
      begin
        QLOfParent.SaturateAndResolve(Importer);
        AncestorsOfParent := QLOfParent.Ancestors;
        for J := 0 to AncestorsOfParent.Count - 1 do
        begin
          AncestorId := AncestorsOfParent[J];
          if not FAncestors.Find(AncestorId, Index) then
          begin
            FAncestors.Add(AncestorId);
          end;
        end;
      end;
    end;

    if not FAncestors.Find(ParentId, Index) then
    begin
      FAncestors.Add(ParentId);
    end;
  end;
  FSaturated := True;
end;

destructor TSOMIRQuickLookupForClass.Destroy;
begin
  FreeAndNil(FAncestors);
  FreeAndNil(FParents);
  inherited;
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
  FReservedWords.Add('classobject');
  FReservedWords.Add('create');
  FReservedWords.Add('destroy');
  FReservedWords.Add('file');
  FReservedWords.Add('function');
  FReservedWords.Add('label');
  FReservedWords.Add('mod');
  FReservedWords.Add('newclass');
  FReservedWords.Add('object');
  FReservedWords.Add('result');
  FReservedWords.Add('supports');
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
  ParamCount := TC.ParamCount;
  if ParamCount >= 1 then
  begin
    Parameter := TC[0];
    Parameter_TC := Parameter._type;
    Parameter_Kind := Parameter_TC.Kind;
    if Parameter_Kind = tk_string then
    begin
      Name := TCToImportedType(TC, CurrentNamespace);
      if Pass > wtpOnDemand then
      begin
        WriteLn(F, 'packed record');
      end;

      for I := 1 to ParamCount div 2 do
      begin
        if Pass > wtpOnDemand then
        begin
          Write(F, '    ');
        end;
        Parameter := TC[I * 2 - 1];
        Parameter_TC := Parameter._type;
        Parameter_Kind := Parameter_TC.Kind;
        if Pass > wtpOnDemand then
        begin
          if Parameter_Kind = tk_string then
          begin
            Write(F, UnreserveIdentifier(PAnsiChar(Parameter._value^)), ': ');
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
        Write(F, 'packed record { TypeCode_kind = ', Parameter_Kind, '} end');
      end;
    end;
  end
  else
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, 'packed record { TypeCode_param_count = ', ParamCount, '} end');
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
  Parameter_Kind := TC2.Kind;
  if Parameter_Kind = tk_void then
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
        if Parameter_Kind <> tk_foreign then
        begin
          WriteType(CurrentNamespace, wtpOnDemandForeignOnly, TC2);
        end;
      end
      else
      if Pass = wtpOnDemandBeforeTypedef then
      begin
        if Parameter_Kind <> tk_foreign then
        begin
          WriteType(CurrentNamespace, wtpOnDemand, TC2);
        end;
      end
      else
      begin
        if not FGeneratedOnDemand.Find('P' + Name, Index) then
        begin
          FGeneratedOnDemand.Add('P' + Name); // support self-referential types
          if Parameter_Kind <> tk_foreign then
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
      if Parameter_Kind <> tk_foreign then
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

      WriteLn(F, '  _IDL_Sequence_', Name, ' = packed record');
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

  Kind := TC.Kind;
  case Kind of
  tk_null: if Pass > wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = tk_null}');
  tk_void: if Pass > wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = tk_void}');
  tk_short: if Pass > wtpOnDemand then Write(F, 'SmallInt');
  tk_long: if Pass > wtpOnDemand then Write(F, 'LongInt');
  tk_ushort: if Pass > wtpOnDemand then Write(F, 'Word');
  tk_ulong: if Pass > wtpOnDemand then Write(F, 'LongWord');
  tk_float: if Pass > wtpOnDemand then Write(F, 'Single');
  tk_double: if Pass > wtpOnDemand then Write(F, 'Double');
  tk_boolean: if Pass > wtpOnDemand then Write(F, 'CORBABoolean');
  tk_char: if Pass > wtpOnDemand then Write(F, 'ShortInt');
  tk_octet: if Pass > wtpOnDemand then Write(F, 'Byte');
  tk_any: if Pass > wtpOnDemand then Write(F, 'any');
  tk_TypeCode: if Pass > wtpOnDemand then Write(F, 'TypeCode');
  tk_Principal: if Pass > wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = tk_Principal}');
  tk_objref: WriteObjRefType(CurrentNamespace, Pass, TC);
  tk_struct: WriteRecordType(CurrentNamespace, Pass, TC);
  tk_union: if Pass > wtpOnDemand then Write(F, 'packed record case Integer of {...} end');
  tk_enum: WriteEnumType(CurrentNamespace, Pass, TC);
  tk_string: if Pass > wtpOnDemand then Write(F, 'CORBAString');
  tk_sequence: WriteSequenceType(CurrentNamespace, Pass, TC);
  tk_array: WriteArrayType(CurrentNamespace, Pass, TC);
                       
  tk_pointer: WritePointerType(CurrentNamespace, Pass, TC);
  tk_self: if Pass > wtpOnDemand then Write(F, IdToImportedType(ExtractName(TC), CurrentNamespace));
  tk_foreign: WriteForeignType(CurrentNamespace, Pass, TC);
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
  ParamCount := TC.ParamCount;
  if ParamCount >= Index + 1 then
  begin
    Parameter := TC[Index];
    Parameter_TC := Parameter._type;
    Parameter_Kind := Parameter_TC.Kind;
    if Parameter_Kind = tk_string then
    begin
      Result := PAnsiChar(Parameter._value^);
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
  ParamCount := TC.ParamCount;
  if ParamCount >= Index + 1 then
  begin
    Parameter := TC[Index];
    Parameter_TC := Parameter._type;
    Parameter_Kind := Parameter_TC.Kind;
    if Parameter_Kind = tk_TypeCode then
    begin
      Result := TypeCode(Parameter._value^);
    end
    else
    begin
      Result := TypeCode.TC_null;
    end;
  end
  else
  begin
    Result := TypeCode.TC_null;
  end;
end;

function TSOMIRImporter.ExtractInteger(TC: TypeCode; Index: LongInt): LongInt;
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  ParamCount := TC.ParamCount;
  if ParamCount >= Index + 1 then
  begin
    Parameter := TC[Index];
    Parameter_TC := Parameter._type;
    Parameter_Kind := Parameter_TC.Kind;
    if Parameter_Kind = tk_long then
    begin
      Result := LongInt(Parameter._value^);
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
  Kind := TC.Kind;
  case Kind of
  tk_null: Result := '{unknown type with TypeCode_kind = tk_null}';
  tk_void: Result := '{unknown type with TypeCode_kind = tk_void}';
  tk_short: Result := 'SmallInt';
  tk_long: Result := 'LongInt';
  tk_ushort: Result := 'Word';
  tk_ulong: Result := 'LongWord';
  tk_float: Result := 'Single';
  tk_double: Result := 'Double';
  tk_boolean: Result := 'CORBABoolean';
  tk_char: Result := 'ShortInt';
  tk_octet: Result := 'Byte';
  tk_any: Result := 'any';
  tk_TypeCode: Result := 'TypeCode';
  tk_Principal: Result := '{unknown type with TypeCode_kind = tk_Principal}';
  tk_objref: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  tk_struct: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  tk_union: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  tk_enum: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  tk_string: Result := 'CORBAString';
  tk_sequence: Result := '_IDL_Sequence_' + TCToImportedType(ExtractSubTC(TC, 0), CurrentNamespace);
  tk_array: Result := '_IDL_Array' + IntToStr(ExtractInteger(TC, 1)) + 'Of_' + TCToImportedType(ExtractSubTC(TC, 0), CurrentNamespace);
                       
  tk_pointer:
  begin
    TC2 := ExtractSubTC(TC, 0);
    if TC2.Kind = tk_void then
    begin
      Result := 'Pointer';
    end
    else
    begin
      Result := 'P' + TCToImportedType(TC2, CurrentNamespace);
    end;
  end;
  tk_self: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  tk_foreign: Result := IdToImportedType(ExtractName(TC), CurrentNamespace);
  else Result := '{unknown type with TypeCode_kind = ' + IntToStr(Integer(Kind)) + '}';
  end;
end;

procedure TSOMIRImporter.WriteMethodArguments(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef; const OverrideFromObj: string = '');
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  ItemPD: ParameterDef;
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
  Contents := Definition.contents('all', False);
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
      Item := Contents._buffer[I];
      if ParameterDef.Supports(Item, ItemPD) then
      begin
        Mode := ItemPD.mode;
        TC := ItemPD.SOM_type;
        Kind := TC.Kind;
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

          Name := ItemPD.name;
          Write(F, UnreserveIdentifier(Name));
        end;

        if (OverrideFromObj <> '') and (Name = 'fromObj') then
        begin
          if Pass > wtpOnDemand then
          begin
            Write(F, ': ', OverrideFromObj);
          end;
        end
        else if Mode = ParameterDef_IN then
        begin
          if Pass > wtpOnDemand then
          begin
            Write(F, ': ');
          end;
          WriteType(CurrentNamespace, Pass, TC);
        end
        else if Kind <> tk_foreign then
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
          Write(F, '{ Found item: ', Item.name, ' }');
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
  OriginalClass, OriginalClassId, OverrideResult, OverrideFromObj: string;
  MethodName, SourceMethodName: string;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  QL: TSOMIRQuickLookupForClass;
  Index: Integer;
begin
  if Pass = wtpTypeDef then Exit;

  OriginalNamespace := Definition.defined_in;
  if Length(OriginalNamespace) > 2 then
  begin
    OriginalNamespace := OriginalNamespace + '::';
  end;

  if Pass >= wtpImplementation then
  begin
    WriteLn(F);
  end;
  Result_TC := Definition.SOM_result;
  Result_Kind := Result_TC.Kind;
  SourceMethodName := Definition.name;
  MethodName := UnreserveIdentifier(SourceMethodName);
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

  if Result_Kind = tk_void then
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, 'procedure');
      if Pass < wtpLowLevelImplementation then
      begin
        Write(F, ' ');
        if Pass >= wtpImplementation then
        begin
          // IdToImportedType(Definition.defined_in
          Write(F, IdToImportedType(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), CurrentNamespace), '.');
        end;
        Write(F, MethodName);
      end;

      if (OriginalNamespace = '::SOMObject::') and
        ((SourceMethodName = 'somDefaultCopyInit') or (SourceMethodName = 'somDefaultConstCopyInit') or
         (SourceMethodName = 'somDefaultVCopyInit') or (SourceMethodName = 'somDefaultConstVCopyInit')) then
      begin
        if Pass < wtpLowLevelImplementation then
        begin
          OverrideFromObj := IdToImportedType(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), CurrentNamespace);
        end
        else
        begin
          OverrideFromObj := 'SOMObjectBase';
        end;
      end;
    end;
    WriteMethodArguments(OriginalNamespace, Pass, Definition, OverrideFromObj);
  end
  else
  begin
    if Pass > wtpOnDemand then
    begin
      Write(F, 'function');
      if Pass < wtpLowLevelImplementation then
      begin
        Write(F, ' ');
        if Pass >= wtpImplementation then
        begin
          Write(F, IdToImportedType(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), CurrentNamespace), '.');
        end;
        Write(F, MethodName);
      end;

      if (OriginalNamespace = '::SOMObject::') and
        ((SourceMethodName = 'somDefaultAssign') or (SourceMethodName = 'somDefaultConstAssign') or
         (SourceMethodName = 'somDefaultVAssign') or (SourceMethodName = 'somDefaultConstVAssign') or
         (SourceMethodName = 'somPrintSelf')) then
      begin
        OverrideResult := IdToImportedType(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), CurrentNamespace);
        if Pass < wtpLowLevelImplementation then
        begin
          OverrideFromObj := OverrideResult;
        end
        else
        begin
          OverrideFromObj := 'SOMObjectBase';
        end;
      end;
    end;
    WriteMethodArguments(OriginalNamespace, Pass, Definition, OverrideFromObj);
    if Pass > wtpOnDemand then
    begin
      Write(F, ': ');
    end;
    if (Pass = wtpLowLevelImplementation) and (Result_Kind = tk_any) then
    begin
      Write(F, 'TAnyResult');
    end
    else if (Pass > wtpOnDemand) and (OriginalNamespace = '::SOMObject::') and (SourceMethodName = 'somGetClass') then
    begin
      QL := nil; // QL for current class, not for original one
      if not FExistingTypeIds.Find(Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2), Index) then
      begin
        Write(F, ', Quick lookup failed!!!');
      end
      else
      begin
        QL := FExistingTypeIds.Objects[Index] as TSOMIRQuickLookupForClass;
      end;
      OverrideResult := IdToImportedType(QL.Metaclass, QL.Metaclass + '::');
      Write(F, OverrideResult);
    end
    else if (Pass > wtpOnDemand) and (OverrideResult <> '') then
    begin
      Write(F, OverrideResult);
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
    QL := nil; // QL for original class, not current one
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

    if Result_Kind = tk_any then
    begin
      WriteLn(F, '  Result := any(');
    end
    else if OverrideResult <> '' then
    begin
      WriteLn(F, '  Result := ', OverrideResult, '(');
    end
    else if Result_Kind <> tk_void then
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

    Contents := Definition.contents('all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        Item := Contents._buffer[I];
        if ParameterDef.Supports(Item) then
        begin
          Write(F, ', ', UnreserveIdentifier(Item.name));
        end;
        SOMFreeAndNil(Item);
      end;
      SOMFree(Contents._buffer);
    end;

    Write(F, ')');
    if (Result_Kind = tk_any) or (OverrideResult <> '') then
    begin
      Write(F, ')');
    end;
    WriteLn(F, ';');

    // TODO check exception!!!!!!!!!!

    if not QL.OIDL then
    begin
      WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    end
    else
    begin
      WriteLn(F, '  SOM_UninitEnvironmentOrRaise(somGetGlobalEnvironment);');
    end;

    WriteLn(F, 'end;');
  end;
end;

procedure TSOMIRImporter.WriteClassDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: InterfaceDef);
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  ItemOD: OperationDef;
  ItemAD: AttributeDef;
  Name: Identifier;
  NameS: string;
  WasPrivate: Boolean;
  OriginalNamespace: string;
  ClassId, ImportedType: string;
  QL: TSOMIRQuickLookupForClass;
  Index: Integer;
begin
  Contents := Definition.contents('all', Pass <= wtpOnDemand);
  QL := nil;
  if Contents._length > 0 then
  begin
    WasPrivate := False;

    // First pass: property setters and getters
    for I := 0 to Contents._length - 1 do
    begin
      Item := Contents._buffer[I];
      if OperationDef.Supports(Item, ItemOD) then
      begin
        NameS := ItemOD.name;
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
              if Item.defined_in + '::' = CurrentNamespace then
              begin
                WriteMethodDefinition(CurrentNamespace, wtpLowLevelImplementation, ItemOD);
              end;
            end;
            WriteMethodDefinition(CurrentNamespace, Pass, ItemOD);
          end;
        end;
      end;
    end;

    if (Pass > wtpOnDemand) then
    begin
      ClassId := Copy(CurrentNamespace, 1, Length(CurrentNamespace) - 2);
      ImportedType := IdToImportedType(ClassId, CurrentNamespace);

      QL := nil;
      if not FExistingTypeIds.Find(ClassId, Index) then
      begin
        WriteLn(F, '{ Quick lookup failed!!! }');
      end
      else
      begin
        QL := FExistingTypeIds.Objects[Index] as TSOMIRQuickLookupForClass;
      end;

      if Pass < wtpImplementation then
      begin
        WriteLn(F, '  public');
        WriteLn(F, '    class function Create: ', ImportedType, ';');
      end
      else
      begin
        WriteLn(F);
        WriteLn(F, 'class function ', ImportedType, '.Create: ', ImportedType, ';');
        WriteLn(F, 'begin');
        WriteLn(F, '  Result := ', ImportedType, '(SOMClass(NewClass).somNew);');
        WriteLn(F, 'end;');
      end;
    end;

    // Second pass: public methods except for getters/setters
    for I := 0 to Contents._length - 1 do
    begin
      Item := Contents._buffer[I];
      if OperationDef.Supports(Item, ItemOD) then
      begin
        NameS := ItemOD.name;
        if Length(NameS) > 5 then
        begin
          NameS := Copy(NameS, 1, 5);
          if (NameS <> '_get_') and (NameS <> '_set_') then
          begin
            if Pass = wtpImplementation then
            begin
              if Item.defined_in + '::' = CurrentNamespace then
              begin
                WriteMethodDefinition(CurrentNamespace, wtpLowLevelImplementation, ItemOD);
              end;
            end;
            WriteMethodDefinition(CurrentNamespace, Pass, ItemOD);
          end;
        end
        else
        begin
          if Pass = wtpImplementation then
          begin
            if Item.defined_in + '::' = CurrentNamespace then
            begin
              WriteMethodDefinition(CurrentNamespace, wtpLowLevelImplementation, ItemOD);
            end;
          end;
          WriteMethodDefinition(CurrentNamespace, Pass, ItemOD);
        end;
      end;
    end;

    if (Pass > wtpOnDemand) then
    begin
      NameS := QL.Metaclass;
      NameS := IdToImportedType(NameS, NameS + '::');

      if Pass < wtpImplementation then
      begin
        WriteLn(F);
        WriteLn(F, '    { Class object access and initialization }');
        WriteLn(F, '    class function ClassObject: ', NameS, '; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // may be nil before class is created');
      end
      else
      begin
        WriteLn(F);
        WriteLn(F, 'class function ', ImportedType, '.ClassObject: ', NameS, '; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
        WriteLn(F, 'begin');
        WriteLn(F, '  if Self = ', ImportedType, ' then { invoked on class name literal }');
        WriteLn(F, '  begin');
        WriteLn(F, '    Result := ', NameS, '(', ImportedType, 'ClassData.classObject);');
        WriteLn(F, '  end');
        WriteLn(F, '  else { invoked on SOM object }');
        WriteLn(F, '  begin');
        WriteLn(F, '    Result := ', NameS, '(PPointer(Self)^);');
        WriteLn(F, '  end');
        WriteLn(F, 'end;');
      end;

      if Pass < wtpImplementation then
      begin
        WriteLn(F, '    class function NewClass: ', NameS, '; // (not really new every time, but autocreated)');
        WriteLn(F);
        WriteLn(F, '    { Upcasting }');
      end
      else
      begin
        WriteLn(F);
        WriteLn(F, 'class function ', ImportedType, '.NewClass: ', NameS, ';');
        WriteLn(F, 'begin');
        WriteLn(F, '  if Self = ', ImportedType, ' then { invoked on class name literal }');
        WriteLn(F, '  begin');
        WriteLn(F, '    Result := ', NameS, '(', ImportedType, 'ClassData.classObject);');
        WriteLn(F, '    if not Assigned(Result) then Result := ', NameS, '(', ImportedType, 'NewClass);');
        WriteLn(F, '  end');
        WriteLn(F, '  else { invoked on SOM object }');
        WriteLn(F, '  begin');
        WriteLn(F, '    Result := ', NameS, '(PPointer(Self)^);');
        WriteLn(F, '  end');
        WriteLn(F, 'end;');
      end;

      if QL.Ancestors.Count > 0 then for I := 0 to QL.Ancestors.Count - 1 do
      begin
        NameS := QL.Ancestors[I];
        if NameS <> '::SOMObject' then // already present in SOMObjectBase
        begin
          NameS := IdToImportedType(NameS, NameS + '::');

          if Pass < wtpImplementation then
          begin
            WriteLn(F, '    function As_', NameS, ': ', NameS, '; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
          end
          else
          begin
            WriteLn(F);
            WriteLn(F, 'function ', ImportedType, '.As_', NameS, ': ', NameS, '; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
            WriteLn(F, 'begin');
            WriteLn(F, '  Result := ', NameS, '(Self);');
            WriteLn(F, 'end;');
          end;
        end;
      end;

      if ClassId <> '::SOMObject' then // already present in SOMObjectBase
      begin // prevent the stupid situation where we can write As_ClassName for ancestors, but not for the class itself
        if Pass < wtpImplementation then
        begin
          WriteLn(F, '    function As_', ImportedType, ': ', ImportedType, '; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
        end
        else
        begin
          WriteLn(F);
          WriteLn(F, 'function ', ImportedType, '.As_', ImportedType, ': ', ImportedType, '; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
          WriteLn(F, 'begin');
          WriteLn(F, '  Result := Self;');
          WriteLn(F, 'end;');
        end;
      end;

      if Pass < wtpImplementation then
      begin
        WriteLn(F);
        WriteLn(F, '    { Downcasting }');
        WriteLn(F, '    class function Supports(Instance: SOMObjectBase): Boolean; overload;');
      end
      else
      begin
        WriteLn(F);
        WriteLn(F, 'class function ', ImportedType, '.Supports(Instance: SOMObjectBase): Boolean;');
        WriteLn(F, 'var');
        WriteLn(F, '  cls: SOMClass;');
        WriteLn(F, 'begin');
        WriteLn(F, '  if not Assigned(Instance) then');
        WriteLn(F, '  begin');
        WriteLn(F, '    Result := False;');
        WriteLn(F, '  end');
        WriteLn(F, '  else');
        WriteLn(F, '  begin');
        WriteLn(F, '    cls := SOMClass(ClassObject);');
        WriteLn(F, '    if not Assigned(cls) then');
        WriteLn(F, '    begin');
        WriteLn(F, '      Result := False;');
        WriteLn(F, '    end');
        WriteLn(F, '    else');
        WriteLn(F, '    begin');
        WriteLn(F, '      Result := SOMObject(Instance).somIsA(cls);');
        WriteLn(F, '    end;');
        WriteLn(F, '  end;');
        WriteLn(F, 'end;');
      end;

      if Pass < wtpImplementation then
      begin
        WriteLn(F, '    class function Supports(Instance: SOMObjectBase; out Obj: ', ImportedType, '): Boolean; overload;');
        WriteLn(F);
      end
      else
      begin
        WriteLn(F);
        WriteLn(F, 'class function ', ImportedType, '.Supports(Instance: SOMObjectBase; out Obj: ', ImportedType, '): Boolean;');
        WriteLn(F, 'var');
        WriteLn(F, '  cls: SOMClass;');
        WriteLn(F, 'begin');
        WriteLn(F, '  if not Assigned(Instance) then');
        WriteLn(F, '  begin');
        WriteLn(F, '    Result := False;');
        WriteLn(F, '    Obj := nil;');
        WriteLn(F, '  end');
        WriteLn(F, '  else');
        WriteLn(F, '  begin');
        WriteLn(F, '    cls := SOMClass(ClassObject);');
        WriteLn(F, '    if not Assigned(cls) then');
        WriteLn(F, '    begin');
        WriteLn(F, '      Result := False;');
        WriteLn(F, '      Obj := nil;');
        WriteLn(F, '    end');
        WriteLn(F, '    else if SOMObject(Instance).somIsA(cls) then');
        WriteLn(F, '    begin');
        WriteLn(F, '      Result := True;');
        WriteLn(F, '      Obj := ', ImportedType, '(Instance);');
        WriteLn(F, '    end');
        WriteLn(F, '    else');
        WriteLn(F, '    begin');
        WriteLn(F, '      Result := False;');
        WriteLn(F, '      Obj := nil;');
        WriteLn(F, '    end;');
        WriteLn(F, '  end;');
        WriteLn(F, 'end;');
      end;
    end;

    // Third pass: properties
    for I := 0 to Contents._length - 1 do
    begin
      Item := Contents._buffer[I];
      if Pass < wtpImplementation then
      begin
        if AttributeDef.Supports(Item, ItemAD) then
        begin
          Name := ItemAD.name;
          if (Pass > wtpOnDemand) and (Pass < wtpImplementation) then
          begin
            Write(F, '    property ', UnreserveIdentifier(Name), ': ');
          end;

          OriginalNamespace := ItemAD.defined_in;
          if Length(OriginalNamespace) > 2 then
          begin
            OriginalNamespace := OriginalNamespace + '::';
          end;

          WriteType(OriginalNamespace, Pass, ItemAD.SOM_type);
          if (Pass > wtpOnDemand) and (Pass < wtpImplementation) then
          begin
            if ItemAD.mode = AttributeDef_READONLY then
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
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  OriginalNamespace: string;
  NewNamespace: string;
  QL: TSOMIRQuickLookupForClass;
  ItemID: InterfaceDef;
  ItemMD: ModuleDef;
  ItemCr: Container; // recurse if assigned
begin
  ItemCr := nil;
  if InterfaceDef.Supports(Item, ItemID) then
  begin
    if not WasForwardType then
    begin
      WriteLn(F, '  { Forward definitions }');
      WasForwardType := True;
    end;
    Name := ItemID.name;
    QL := TSOMIRQuickLookupForClass.Create(ItemID);
    FExistingTypeIds.AddObject(CurrentNamespace + Name, QL);
    FResolutionAid.Values[Name] := CurrentNamespace + Name;
    WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = class;');
    ItemCr := ItemID.As_Container;
  end
  else if TypeDef.Supports(Item) then
  begin
    Name := Item.name;
    FExistingTypeIds.Add(CurrentNamespace + Name);

    OriginalNamespace := Item.defined_in;
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
  else if ExceptionDef.Supports(Item) then
  begin
    Name := Item.name;
    FExistingTypeIds.Add(CurrentNamespace + Name);

    OriginalNamespace := Item.defined_in;
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
  else if ModuleDef.Supports(Item, ItemMD) then
  begin
    Name := ItemMD.name;
    ItemCr := ItemMD.As_Container;
  end;

  if Assigned(ItemCr) then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := ItemCr.contents('all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := Contents._buffer[I];
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
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  NewNamespace: string;
  ItemTD: TypeDef;
  ItemED: ExceptionDef;
  ItemID: InterfaceDef;
  ItemMD: ModuleDef;
  ItemCr: Container; // recurse if assigned
begin
  ItemCr := nil;
  if TypeDef.Supports(Item, ItemTD) then
  begin
    TC := ItemTD.SOM_type;
    if TC.Kind <> tk_foreign then
    begin
      WriteType(CurrentNamespace, wtpOnDemandForeignOnly, TC);
    end;
  end
  else if ExceptionDef.Supports(Item, ItemED) then
  begin
    TC := ItemED.SOM_type;
    if TC.Kind <> tk_foreign then
    begin
      WriteType(CurrentNamespace, wtpOnDemandForeignOnly, TC);
    end;
  end
  else if InterfaceDef.Supports(Item, ItemID) then
  begin
    Name := ItemID.name;
    WriteClassDefinition(CurrentNamespace + Name + '::' {CurrentNamespace}, wtpOnDemandForeignOnly, ItemID);
    ItemCr := ItemID.As_Container;
  end
  else if ModuleDef.Supports(Item, ItemMD) then
  begin
    Name := ItemMD.name;
    ItemCr := ItemMD.As_Container;
  end;

  if Assigned(ItemCr) then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := ItemCr.contents('all', True);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := Contents._buffer[I];
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
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Index: Integer;
  OriginalNamespace: string;
  NewNamespace: string;
  ItemTD: TypeDef;
  ItemED: ExceptionDef;
  ItemID: InterfaceDef;
  ItemMD: ModuleDef;
  ItemCr: Container; // recurse if assigned
begin
  ItemCr := nil;
  if TypeDef.Supports(Item, ItemTD) then
  begin
    TC := ItemTD.SOM_type;
    Kind := TC.Kind;
    if (Kind <> tk_foreign) and (Kind <> tk_struct) then
    begin
      OriginalNamespace := ItemTD.defined_in;
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if OriginalNamespace <> CurrentNamespace then
      begin
        Name := ItemTD.name;
        if not FOriginalTypeIds.Find(CurrentNamespace + Name, Index) then // if inherited type was not replaced by new one
        begin
          WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
        end;
      end
      else
      begin
        WriteType(CurrentNamespace, wtpOnDemandBeforeTypeDef, TC);
        Write(F, '  ', IdToImportedType(CurrentNamespace + ItemTD.name, CurrentNamespace), ' = ');
        WriteType(CurrentNamespace, wtpTypeDef, TC);
        WriteLn(F, ';');
      end;
    end;
  end
  else if ExceptionDef.Supports(Item, ItemED) then
  begin
    TC := ItemED.SOM_type;
    Kind := TC.Kind;
    if (Kind <> tk_foreign) and (Kind <> tk_null) and (Kind <> tk_struct) then
    begin
      OriginalNamespace := ItemED.defined_in;
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if OriginalNamespace <> CurrentNamespace then
      begin
        Name := ItemED.name;
        if not FOriginalTypeIds.Find(CurrentNamespace + Name, Index) then // if inherited type was not replaced by new one
        begin
          WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited exception } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
        end;
      end
      else
      begin
        WriteType(CurrentNamespace, wtpOnDemandBeforeTypeDef, TC);
        Write(F, '  ', IdToImportedType(CurrentNamespace + ItemED.name, CurrentNamespace), ' = { exception } ');
        WriteType(CurrentNamespace, wtpTypeDef, TC);
        WriteLn(F, ';');
      end;
    end;
  end
  else if InterfaceDef.Supports(Item, ItemID) then
  begin
    Name := ItemID.name;
    ItemCr := ItemID.As_Container;
  end
  else if ModuleDef.Supports(Item, ItemMD) then
  begin
    Name := ItemMD.name;
    ItemCr := ItemMD.As_Container;
  end;

  if Assigned(ItemCr) then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := ItemCr.contents('all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := Contents._buffer[I];
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
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  OriginalNamespace: string;
  NewNamespace: string;
  Index: Integer;
  ItemTD: TypeDef;
  ItemED: ExceptionDef;
  ItemID: InterfaceDef;
  ItemMD: ModuleDef;
  ItemCr: Container; // recurse if assigned
begin
  ItemCr := nil;
  if TypeDef.Supports(Item, ItemTD) then
  begin
    TC := ItemTD.SOM_type;
    if TC.Kind = tk_struct then
    begin
      OriginalNamespace := ItemTD.defined_in;
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      Name := ItemTD.name;
      if OriginalNamespace <> CurrentNamespace then
      begin
        if not FOriginalTypeIds.Find(CurrentNamespace + Name, Index) then // if inherited type was not replaced by new one
        begin
          WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
        end;
      end
      else if (CurrentNamespace <> '::') or (Name <> 'Environment') then // suppress Environment record definition
      begin
        WriteLn(F);
        WriteType(CurrentNamespace, wtpOnDemandBeforeTypeDef, TC);
        Write(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = ');
        WriteType(CurrentNamespace, wtpTypeDef, TC);
        WriteLn(F, ';');
      end;
    end;
  end
  else if ExceptionDef.Supports(Item, ItemED) then
  begin
    TC := ItemED.SOM_type;
    if TC.Kind = tk_struct then
    begin
      OriginalNamespace := ItemED.defined_in;
      if Length(OriginalNamespace) > 2 then
      begin
        OriginalNamespace := OriginalNamespace + '::';
      end;

      if OriginalNamespace <> CurrentNamespace then
      begin
        Name := ItemED.name;
        if not FOriginalTypeIds.Find(CurrentNamespace + Name, Index) then // if inherited type was not replaced by new one
        begin
          WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = { inherited user exception } ', IdToImportedType(OriginalNamespace + Name, OriginalNamespace), ';');
        end;
      end
      else
      if CurrentNamespace = '::StExcep::' then
      begin
        WriteLn(F, '  ', IdToImportedType(CurrentNamespace + ItemED.name, CurrentNamespace), ' = { system exception } StExcep;');
      end
      else
      begin
        WriteLn(F);
        WriteType(CurrentNamespace, wtpOnDemandBeforeTypeDef, TC);
        Write(F, '  ', IdToImportedType(CurrentNamespace + ItemED.name, CurrentNamespace), ' = { user exception } ');
        WriteType(CurrentNamespace, wtpTypeDef, TC);
        WriteLn(F, ';');
      end;
    end;
  end
  else if InterfaceDef.Supports(Item, ItemID) then
  begin
    Name := ItemID.name;
    ItemCr := ItemID.As_Container;
  end
  else if ModuleDef.Supports(Item, ItemMD) then
  begin
    Name := ItemMD.name;
    ItemCr := ItemMD.As_Container;
  end;

  if Assigned(ItemCr) then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := ItemCr.contents('all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := Contents._buffer[I];
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
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  NewNamespace: string;
  ItemID: InterfaceDef;
  ItemMD: ModuleDef;
  ItemCr: Container; // recurse if assigned
begin
  ItemCr := nil;
  if InterfaceDef.Supports(Item, ItemID) then
  begin
    WriteLn(F);
    Name := ItemID.name;
    WriteClassDefinition(CurrentNamespace + Name + '::', wtpOnDemand, ItemID);
    WriteLn(F, '  ', IdToImportedType(CurrentNamespace + Name, CurrentNamespace), ' = class(SOMObjectBase)');
    WriteClassDefinition(CurrentNamespace + Name + '::', wtpFinal, ItemID);
    WriteLn(F, '  end;');
    // there can be no sub-interfaces or modules inside of interface, thus no recursion
  end
  else if ModuleDef.Supports(Item, ItemMD) then
  begin
    Name := ItemMD.name;
    ItemCr := ItemMD.As_Container;
  end;

  if Assigned(ItemCr) then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := ItemCr.contents('all', True);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := Contents._buffer[I];
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
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  OriginalNamespace, NewNamespace: string;
  ImportedType, EnumElementName: string;
  ParamCount: LongInt;
  ConstantValue: any;
  ConstantStringValue: string;
  ItemTD: TypeDef;
  ItemCD: ConstantDef;
  ItemED: ExceptionDef;
  ItemID: InterfaceDef;
  ItemMD: ModuleDef;
  ItemCr: Container; // recurse if assigned
begin
  ItemCr := nil;
  if TypeDef.Supports(Item, ItemTD) then
  begin
    TC := ItemTD.SOM_type;
    if TC.Kind = tk_enum then
    begin
      ParamCount := TC.ParamCount;

      if ParamCount > 1 then
      begin
        Name := ItemTD.name;
        ImportedType := IdToImportedType(CurrentNamespace + Name, CurrentNamespace);
        OriginalNamespace := ItemTD.defined_in;
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
                Write(F, I);
              end;
              WriteLn(F, ');');
            end;
          end
          else if (CurrentNamespace = '::') and ((Name = 'exception_type') or (Name = 'completion_status') or
            (Name = 'SOMTTargetTypeT') or (Name = 'somtVisibilityT') or (Name = 'somtCommentStyleT') or
            (Name = 'somtParameterDirectionT')) then
          begin
            for I := 1 to ParamCount - 1 do
            begin
              WriteLn(F, '  ', IdToImportedType(CurrentNamespace + ExtractName(TC, I), CurrentNamespace), ' = ', ImportedType, '(', I - 1, ');');
            end;
          end // TODO also check emitter framework enums!!!!!!!!!!!!!!! they are 0-based and byte (not LongWord) sometimes
          else
          begin
            for I := 1 to ParamCount - 1 do
            begin
              WriteLn(F, '  ', IdToImportedType(CurrentNamespace + ExtractName(TC, I), CurrentNamespace), ' = ', ImportedType, '(', I, ');');
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
  else if ConstantDef.Supports(Item, ItemCD) then
  begin
    Name := ItemCD.name;
    ImportedType := IdToImportedType(CurrentNamespace + Name, CurrentNamespace);

    ConstantValue := ItemCD.value;
    if ConstantValue._type.Kind <> tk_string then
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
      OriginalNamespace := ItemCD.defined_in;
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
        ConstantStringValue := PAnsiChar(ConstantValue._value^);
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
  else if ExceptionDef.Supports(Item, ItemED) then
  begin
    Name := ItemED.name;

    OriginalNamespace := ItemED.defined_in;
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
  else if InterfaceDef.Supports(Item, ItemID) then
  begin
    Name := ItemID.name;
    ItemCr := ItemID.As_Container;
  end
  else if ModuleDef.Supports(Item, ItemMD) then
  begin
    Name := ItemMD.name;
    ItemCr := ItemMD.As_Container;
  end;

  if Assigned(ItemCr) then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := ItemCr.contents('all', False);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := Contents._buffer[I];
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
  SubItem: Contained;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Index: Integer;
  ImportedType, NewNamespace, DllName_Id, ReleaseOrder: string;
  Modifiers: _IDL_SEQUENCE_somModifier;
  Modifier: somModifier;
  ItemID: InterfaceDef;
  ItemMD: ModuleDef;
  ItemCr: Container; // recurse if assigned
begin
  ItemCr := nil;
  if InterfaceDef.Supports(Item, ItemID) then
  begin
    Name := ItemID.name;
    ImportedType := IdToImportedType(CurrentNamespace + Name, CurrentNamespace);
    // TODO name should not be unreserved in dll entry names

    MajorVersion := '0';
    MinorVersion := '0';
    ReleaseOrder := '';
    DllName := '';
    Modifiers := ItemID.somModifiers;
    if Modifiers._length > 0 then
    begin
      for I := 0 to Modifiers._length - 1 do
      begin
        Modifier := Modifiers._buffer[I];
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
    WriteLn(F, '  ', ImportedType, 'ClassDataStructure = packed record');
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
    WriteLn(F, '  ', ImportedType, 'CClassDataStructure = packed record');
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

    WriteClassDefinition(CurrentNamespace + Name + '::', wtpImplementation, ItemID);
    // there can be no sub-interfaces or modules inside of interface, so no recursion
  end
  else if ModuleDef.Supports(Item, ItemMD) then
  begin
    Name := ItemMD.name;
    ItemCr := ItemMD.As_Container;
  end;

  if Assigned(ItemCr) then
  begin
    NewNamespace := CurrentNamespace + Name + '::';
    Contents := ItemCr.contents('all', True);
    if Contents._length > 0 then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        SubItem := Contents._buffer[I];
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
  J: Integer;
  Item: Contained;
  WasForwardType: Boolean;
  Name: string;
  QL: TSOMIRQuickLookupForClass;
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
    WriteLn(F, '  TypeCode = class;');
    WriteLn(F, '  any = packed record');
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

    Contents := Repo.contents('all', False);
    // WriteLn(F, '{ Amount of items: ', Contents._length, ' }');
    
    WasForwardType := False;

    // First pass: write forward type references, populate existing types for resolution,
    // fetch quick lookup data
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := Contents._buffer[I];
      WriteRepositoryFirstPass(Item, '::', WasForwardType);
    end;
    FExistingTypeIds.Sorted := True;
    FOriginalTypeIds.Sorted := True;
    if FExistingTypeIds.Count > 0 then for I := 0 to FExistingTypeIds.Count - 1 do
    begin
      QL := FExistingTypeIds.Objects[I] as TSOMIRQuickLookupForClass;
      if Assigned(QL) then
      begin
        QL.SaturateAndResolve(Self);
      end;
    end;
    Write(' 1');
    WriteLn(F);
    WriteLn(F, '  { Foreign types }');

    // Second pass: find foreign types that can't go into opaque pointers
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := Contents._buffer[I];
      WriteRepositorySecondPass(Item, '::');
    end;
    Write(' 2');
    WriteLn(F);
    WriteLn(F, '  { Data types }');

    // Third pass: build non-class types
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := Contents._buffer[I];
      WriteRepositoryThirdPass(Item, '::');
    end;
    Write(' 3');
    WriteLn(F);
    WriteLn(F, '  { Records }');
    // Fourth pass: build non-class types (deferred records)
    WriteLn(F, '  StExcep = packed record');
    WriteLn(F, '    minor: LongWord;');
    WriteLn(F, '    completed: completion_status;');
    WriteLn(F, '  end;');
    WriteLn(F, '  PStExcep = ^StExcep;');
    WriteLn(F);
    WriteLn(F, '  Environment = packed record'); // fixup for Environment
    WriteLn(F, '    _major: exception_type;');
    WriteLn(F, '    exception_exception_name: PAnsiChar;');
    WriteLn(F, '    exception_params: Pointer;');
    WriteLn(F, '    _somdAnchor: Pointer;');
    WriteLn(F, '  end;');
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := Contents._buffer[I];
      WriteRepositoryFourthPass(Item, '::');
    end;
    Write(' 4');
    WriteLn(F);
    WriteLn(F, '  { Classes }');
    WriteLn(F, '  SOMObjectBase = class');
    WriteLn(F, '  private');
    WriteLn(F, '    { hide TObject methods }');
    WriteLn(F, '    procedure Create; reintroduce;');
    WriteLn(F, '    procedure Destroy; reintroduce;'); // TODO hide others
    WriteLn(F, '  public');
    WriteLn(F, '    function As_SOMObject: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, '  end;');
    WriteLn(F);
    WriteLn(F, '  TypeCode = class');
    WriteLn(F, '  private');
    WriteLn(F, '    { hide TObject methods }');
    WriteLn(F, '    procedure Destroy; reintroduce;'); // TODO hide others
    WriteLn(F, '  protected');
    WriteLn(F, '    function GetKind: TCKind;');
    WriteLn(F, '    function GetParamCount: LongInt;');
    WriteLn(F, '    function GetParameter(Index: LongInt): any;');
    WriteLn(F, '    function GetAlignment: SmallInt;');
    WriteLn(F, '    procedure SetAlignment(a: SmallInt);');
    WriteLn(F, '    function GetSize: LongInt;');
    WriteLn(F, '  public');
    WriteLn(F, '    class function TC_null: TypeCode;');
    WriteLn(F, '    class function TC_void: TypeCode;');
    WriteLn(F, '    class function TC_short: TypeCode;');
    WriteLn(F, '    class function TC_long: TypeCode;');
    WriteLn(F, '    class function TC_ushort: TypeCode;');
    WriteLn(F, '    class function TC_ulong: TypeCode;');
    WriteLn(F, '    class function TC_float: TypeCode;');
    WriteLn(F, '    class function TC_double: TypeCode;');
    WriteLn(F, '    class function TC_boolean: TypeCode;');
    WriteLn(F, '    class function TC_char: TypeCode;');
    WriteLn(F, '    class function TC_octet: TypeCode;');
    WriteLn(F, '    class function TC_any: TypeCode;');
    WriteLn(F, '    class function TC_TypeCode: TypeCode;');
    WriteLn(F, '    class function TC_Principal: TypeCode;');
    WriteLn(F, '    class function TC_Object: TypeCode;');
    WriteLn(F, '    class function TC_string: TypeCode;');
    WriteLn(F, '    class function TC_NamedValue: TypeCode;');
    WriteLn(F, '    class function TC_InterfaceDescription: TypeCode;');
    WriteLn(F, '    class function TC_OperationDescription: TypeCode;');
    WriteLn(F, '    class function TC_AttributeDescription: TypeCode;');
    WriteLn(F, '    class function TC_ParameterDescription: TypeCode;');
    WriteLn(F, '    class function TC_RepositoryDescription: TypeCode;');
    WriteLn(F, '    class function TC_ModuleDescription: TypeCode;');
    WriteLn(F, '    class function TC_ConstDescription: TypeCode;');
    WriteLn(F, '    class function TC_ConstantDescription: TypeCode;');
    WriteLn(F, '    class function TC_ExceptionDescription: TypeCode;');
    WriteLn(F, '    class function TC_TypeDescription: TypeCode;');
    WriteLn(F, '    class function TC_FullInterfaceDescription: TypeCode;');
    WriteLn(F, '    function Equal(y: TypeCode): CORBABoolean;');
    WriteLn(F, '    function Copy: TypeCode;');
    WriteLn(F, '    procedure Free;');
    WriteLn(F, '    procedure Print;');
    WriteLn(F, '    class function Create(tag: TCKind; ap: va_list): TypeCode;');
    WriteLn(F, '    property Kind: TCKind read GetKind;');
    WriteLn(F, '    property ParamCount: LongInt read GetParamCount;');
    WriteLn(F, '    property Parameter[Index: LongInt]: any read GetParameter; default;');
    WriteLn(F, '    property Alignment: SmallInt read GetAlignment write SetAlignment;');
    WriteLn(F, '    property Size: LongInt read GetSize;');
    WriteLn(F, '  end;');
    WriteLn(F);
    WriteLn(F, '  ESOMException = class(Exception)');
    WriteLn(F, '  protected');
    WriteLn(F, '    FMajor: exception_type;');
    WriteLn(F, '    FExceptionId: string;');
    WriteLn(F, '    FExceptionValue: Pointer;');
    WriteLn(F, '    FNestedEnvironment: Environment;');
    WriteLn(F, '    function GetNestedEnvironment: PEnvironment; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, '  public');
    WriteLn(F, '    constructor Create(ev: PEnvironment); overload; // copies ev inside and clears ev argument');
    WriteLn(F, '    constructor Create(AMajor: exception_type; const AExceptionId: string; AExceptionValue: Pointer); overload; // from user code');
    WriteLn(F, '    destructor Destroy; override;');
    WriteLn(F, '    procedure ResetNestedEnvironment; // clears the internal env and thus won''t destroy it');
    WriteLn(F, '    property Major: exception_type read FMajor;');
    WriteLn(F, '    property ExceptionId: string read FExceptionId;');
    WriteLn(F, '    property ExceptionValue: Pointer read FExceptionValue;');
    WriteLn(F, '    property NestedEnvironment: PEnvironment read GetNestedEnvironment;');
    WriteLn(F, '  end;');

    // Fifth pass: satisfy forward type references with classes
    if WasForwardType then
    begin
      for I := 0 to Contents._length - 1 do
      begin
        Item := Contents._buffer[I];
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
      Item := Contents._buffer[I];
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
    WriteLn(F, '  (*');
    WriteLn(F, '   * Main programs should register for SOM cleanup at exit');
    WriteLn(F, '   *)');
    WriteLn(F);
    WriteLn(F, 'function SOM_MainProgram: SOMClassMgr; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
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
    WriteLn(F, '// #include <somapi.h>');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' *  SOMAPI.H');
    WriteLn(F, ' *');
    WriteLn(F, ' *  This file documents the public data structures and functions');
    WriteLn(F, ' *  of the SOM API (Application Programming Interface). Primitive data');
    WriteLn(F, ' *  types are defined in sombtype.h, and the public methods provided by');
    WriteLn(F, ' *  the SOM kernel are declared in somobj.idl, somcls.idl and somcm.idl.');
    WriteLn(F, ' *  An important header file for language bindings is somdefs.h, which');
    WriteLn(F, ' *  defines the SOMLINK symbol used in various emitter outputs.');
    WriteLn(F, ' *');
    WriteLn(F, ' *  Note: typedefs & prototypes in this file explicitly show pointers');
    WriteLn(F, ' *  to objects that support an interface described by IDL. These are');
    WriteLn(F, ' *  C/C++ typedefs that reflect the implementation of object references');
    WriteLn(F, ' *  in SOM as pointers to structures in memory.');
    WriteLn(F, ' *)');
    WriteLn(F);
    WriteLn(F, ' (*');
    WriteLn(F, '  * HISTORY [04/19/96] #21264 nsk Temproary ADD WIN32 Code');
    WriteLn(F, '  *)');
    WriteLn(F);
    WriteLn(F, '(*  SOM Version Numbers  *)');
    WriteLn(F, 'function Replaceable_SOM_MajorVersion: PLongInt;');
    WriteLn(F, 'function SOM_MajorVersion: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'function Replaceable_SOM_MinorVersion: PLongInt;');
    WriteLn(F, 'function SOM_MinorVersion: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F);
    WriteLn(F, '(*  SOM Thread Support  *)');
    WriteLn(F, 'function Replaceable_SOM_MaxThreads: PLongInt;');
    WriteLn(F, 'function SOM_MaxThreads: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F);
    WriteLn(F, '(*----------------------------------------');
    WriteLn(F, ' * Typedefs for pointers to functions');
    WriteLn(F, ' *----------------------------------------*)');
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
    WriteLn(F, '(*----------------------------------------------------------------------');
    WriteLn(F, ' * SOM Environment Initialization Section');
    WriteLn(F, ' *---------------------------------------------------------------------*)');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' *  Create and initialize the SOM environment.');
    WriteLn(F, ' *');
    WriteLn(F, ' *  This function is idempotent (may be invoked redundantly)');
    WriteLn(F, ' *');
    WriteLn(F, ' *  Will be called automatically when first object (including a class');
    WriteLn(F, ' *  object) is created, if it has not already been done.');
    WriteLn(F, ' *');
    WriteLn(F, ' *  Returns the SOMClassMgrObject');
    WriteLn(F, ' *)');
    WriteLn(F, 'function somEnvironmentNew: SOMClassMgr; stdcall;');
    WriteLn(F);
    WriteLn(F, 'procedure somEnvironmentEnd; stdcall;');
    WriteLn(F, 'function somMainProgram: SOMClassMgr; stdcall;');
    WriteLn(F, 'function somAbnormalEnd: ByteBool; stdcall;');
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
    WriteLn(F, '// #include <somtc.h>');
    WriteLn(F);
    WriteLn(F, '(*');
    WriteLn(F, ' *  Following constants used with tcNew to create union TypeCodes.');
    WriteLn(F, ' *  See calling sequences above.');
    WriteLn(F, ' *)');
    WriteLn(F, 'const');
    WriteLn(F, '  TCREGULAR_CASE = LongInt(1);');
    WriteLn(F, '  TCDEFAULT_CASE = LongInt(2);');
    WriteLn(F);
    WriteLn(F, '// not in SOM headers');
    WriteLn(F);
    WriteLn(F, 'procedure SOM_UninitEnvironmentOrRaise(ev: PEnvironment); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'procedure SOMFreeAndNil(var Obj);');
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
    WriteLn(F);
    WriteLn(F, 'const');
    WriteLn(F, '  SOMTC_DLL_Name = ''somtc.dll'';');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL: System.HMODULE = 0;');
    WriteLn(F);
    WriteLn(F, 'procedure SOMTC_DLL_Load_Variable(var V_Pointer; const Var_Name: AnsiString);');
    WriteLn(F, 'begin');
    WriteLn(F, '  if SOMTC_DLL = 0 then');
    WriteLn(F, '  begin');
    WriteLn(F, '    Windows.EnterCriticalSection(DLLLoad_CriticalSection);');
    WriteLn(F, '    if SOMTC_DLL = 0 then');
    WriteLn(F, '      SOMTC_DLL := Windows.LoadLibraryW(SOMTC_DLL_Name);');
    WriteLn(F, '    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);');
    WriteLn(F, '  end;');
    WriteLn(F, '  if SOMTC_DLL <> 0 then');
    WriteLn(F, '    Pointer(V_Pointer) := Windows.GetProcAddress(SOMTC_DLL, PAnsiChar(Var_Name));');
    WriteLn(F, 'end;');
    FDLLs.Add('somtc.dll');
    WriteLn(F);
    WriteLn(F, 'procedure TypeCode.Destroy;');
    WriteLn(F, 'begin');
    WriteLn(F, '  { hide this method }'); // TODO free?
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function TypeCode_kind(t: TypeCode; ev: PEnvironment): TCKind; stdcall; external SOMTC_DLL_Name name ''tcKind'';');
    WriteLn(F);
    WriteLn(F, 'function TypeCode.GetKind: TCKind;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  Result := TypeCode_kind(Self, @LocalEnv);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function TypeCode_param_count(t: TypeCode; ev: PEnvironment): LongInt; stdcall; external SOMTC_DLL_Name name ''tcParmCount'';');
    WriteLn(F);
    WriteLn(F, 'function TypeCode.GetParamCount: LongInt;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  Result := TypeCode_param_count(Self, @LocalEnv);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function TypeCode_parameter(t: TypeCode; ev: PEnvironment; index: LongInt): TAnyResult; stdcall; external SOMTC_DLL_Name name ''tcParameter'';');
    WriteLn(F);
    WriteLn(F, 'function TypeCode.GetParameter(index: LongInt): any;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  Result := any(TypeCode_parameter(Self, @LocalEnv, index));');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function TypeCode_alignment(t: TypeCode; ev: PEnvironment): SmallInt; stdcall; external SOMTC_DLL_Name name ''tcAlignment'';');
    WriteLn(F);
    WriteLn(F, 'function TypeCode.GetAlignment: SmallInt;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  Result := TypeCode_alignment(Self, @LocalEnv);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure TypeCode_setAlignment(t: TypeCode; ev: PEnvironment; a: SmallInt); stdcall; external SOMTC_DLL_Name name ''tcSetAlignment'';');
    WriteLn(F);
    WriteLn(F, 'procedure TypeCode.SetAlignment(a: SmallInt);');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  TypeCode_setAlignment(Self, @LocalEnv, a);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function TypeCode_size(t: TypeCode; ev: PEnvironment): LongInt; stdcall; external SOMTC_DLL_Name name ''tcSize'';');
    WriteLn(F);
    WriteLn(F, 'function TypeCode.GetSize: LongInt;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  Result := TypeCode_size(Self, @LocalEnv);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__null: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_null: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__null) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__null');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__null, ''TC__null'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__null;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__void: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_void: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__void) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__void');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__void, ''TC__void'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__void;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__short: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_short: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__short) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__short');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__short, ''TC__short'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__short;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__long: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_long: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__long) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__long');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__long, ''TC__long'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__long;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__ushort: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_ushort: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__ushort) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ushort');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__ushort, ''TC__ushort'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ushort;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__ulong: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_ulong: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__ulong) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ulong');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__ulong, ''TC__ulong'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ulong;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__float: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_float: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__float) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__float');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__float, ''TC__float'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__float;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__double: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_double: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__double) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__double');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__double, ''TC__double'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__double;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__boolean: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_boolean: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__boolean) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__boolean');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__boolean, ''TC__boolean'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__boolean;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__char: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_char: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__char) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__char');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__char, ''TC__char'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__char;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__octet: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_octet: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__octet) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__octet');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__octet, ''TC__octet'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__octet;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__any: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_any: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__any) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__any');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__any, ''TC__any'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__any;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__TypeCode: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_TypeCode: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__TypeCode) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__TypeCode');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__TypeCode, ''TC__TypeCode'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__TypeCode;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__Principal: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_Principal: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__Principal) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__Principal');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__Principal, ''TC__Principal'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__Principal;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__Object: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_Object: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__Object) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__Object');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__Object, ''TC__Object'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__Object;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__string: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_string: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__string) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__string');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__string, ''TC__string'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__string;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__NamedValue: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_NamedValue: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__NamedValue) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__NamedValue');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__NamedValue, ''TC__NamedValue'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__NamedValue;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__InterfaceDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_InterfaceDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__InterfaceDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__InterfaceDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__InterfaceDescription, ''TC__InterfaceDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__InterfaceDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__OperationDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_OperationDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__OperationDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__OperationDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__OperationDescription, ''TC__OperationDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__OperationDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__AttributeDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_AttributeDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__AttributeDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__AttributeDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__AttributeDescription, ''TC__AttributeDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__AttributeDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__ParameterDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_ParameterDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__ParameterDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ParameterDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__ParameterDescription, ''TC__ParameterDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ParameterDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__RepositoryDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_RepositoryDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__RepositoryDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__RepositoryDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__RepositoryDescription, ''TC__RepositoryDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__RepositoryDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__ModuleDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_ModuleDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__ModuleDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ModuleDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__ModuleDescription, ''TC__ModuleDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ModuleDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__ConstDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_ConstDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__ConstDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ConstDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__ConstDescription, ''TC__ConstDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ConstDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__ConstantDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_ConstantDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__ConstantDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ConstantDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__ConstantDescription, ''TC__ConstantDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ConstantDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__ExceptionDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_ExceptionDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__ExceptionDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ExceptionDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__ExceptionDescription, ''TC__ExceptionDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__ExceptionDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__TypeDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_TypeDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__TypeDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__TypeDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__TypeDescription, ''TC__TypeDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__TypeDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOMTC_DLL_TC__FullInterfaceDescription: TypeCode = TypeCode(nil);');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.TC_FullInterfaceDescription: TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMTC_DLL_TC__FullInterfaceDescription) then');
    WriteLn(F, '    Result := SOMTC_DLL_TC__FullInterfaceDescription');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMTC_DLL_Load_Variable(SOMTC_DLL_TC__FullInterfaceDescription, ''TC__FullInterfaceDescription'');');
    WriteLn(F, '    Result := SOMTC_DLL_TC__FullInterfaceDescription;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function TypeCode_equal(x: TypeCode; ev: PEnvironment; y: TypeCode): CORBABoolean; stdcall; external SOMTC_DLL_Name name ''tcEqual'';');
    WriteLn(F);
    WriteLn(F, 'function TypeCode.Equal(y: TypeCode): CORBABoolean;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  Result := TypeCode_equal(Self, @LocalEnv, y);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function TypeCode_copy(t: TypeCode; ev: PEnvironment): TypeCode; stdcall; external SOMTC_DLL_Name name ''tcCopy'';');
    WriteLn(F);
    WriteLn(F, 'function TypeCode.Copy: TypeCode;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  Result := TypeCode_copy(Self, @LocalEnv);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure TypeCode_free(t: TypeCode; ev: PEnvironment); stdcall; external SOMTC_DLL_Name name ''tcFree'';');
    WriteLn(F);
    WriteLn(F, 'procedure TypeCode.Free;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  TypeCode_free(Self, @LocalEnv);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure TypeCode_print(t: TypeCode; ev: PEnvironment); stdcall; external SOMTC_DLL_Name name ''tcPrint'';');
    WriteLn(F);
    WriteLn(F, 'procedure TypeCode.Print;');
    WriteLn(F, 'var');
    WriteLn(F, '  LocalEnv: Environment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_InitEnvironment(@LocalEnv);');
    WriteLn(F, '  TypeCode_print(Self, @LocalEnv);');
    WriteLn(F, '  SOM_UninitEnvironmentOrRaise(@LocalEnv);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function TypeCodeNewVL(tag: TCKind; ap: va_list): TypeCode; stdcall; external SOMTC_DLL_Name name ''tcNewVL'';');
    WriteLn(F);
    WriteLn(F, 'class function TypeCode.Create(tag: TCKind; ap: va_list): TypeCode;');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := TypeCodeNewVL(tag, ap);');
    WriteLn(F, '  // if not Assigned(Result) then raise something;');  // TODO raise something
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function ESOMException.GetNestedEnvironment: PEnvironment; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := @FNestedEnvironment;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'constructor ESOMException.Create(ev: PEnvironment); // clears ev');
    WriteLn(F, 'var');
    WriteLn(F, '  Msg: string;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if ev <> @FNestedEnvironment then // not from parent constructor');
    WriteLn(F, '  begin');
    WriteLn(F, '    Move(ev^, FNestedEnvironment, SizeOf(Environment));');
    WriteLn(F, '    FillChar(ev^, SizeOf(Environment), 0);');
    WriteLn(F, '  end;');
    WriteLn(F, '  FMajor := FNestedEnvironment._major;');
    WriteLn(F, '  case FMajor of');
    WriteLn(F, '    SYSTEM_EXCEPTION: begin');
    WriteLn(F, '      FExceptionId := somExceptionId(@FNestedEnvironment);');
    WriteLn(F, '      FExceptionValue := somExceptionValue(@FNestedEnvironment);');
    WriteLn(F, '      Msg := ''Error occured; exception string: '' + FExceptionId + ''; '' +');
    WriteLn(F, '        ''minor error code: '' + IntToStr(PStExcep(FExceptionValue).minor) + ''; '' +');
    WriteLn(F, '        ''completion code: '';');
    WriteLn(F, '      case PStExcep(FExceptionValue).completed of');
    WriteLn(F, '        YES: Msg := Msg + ''YES'';');
    WriteLn(F, '        NO: Msg := Msg + ''YES'';');
    WriteLn(F, '      else Msg := Msg + ''MAYBE'';');
    WriteLn(F, '      end;');
    WriteLn(F, '    end;');
    WriteLn(F, '    USER_EXCEPTION: begin');
    WriteLn(F, '      FExceptionId := somExceptionId(@FNestedEnvironment);');
    WriteLn(F, '      FExceptionValue := somExceptionValue(@FNestedEnvironment);');
    WriteLn(F, '      Msg := ''Error occured; exception string: '' + FExceptionId;');
    WriteLn(F, '    end;');
    WriteLn(F, '  else Msg := ''Exception created from empty environment'';');
    WriteLn(F, '  end;');
    WriteLn(F, '  inherited Create(Msg);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'constructor ESOMException.Create(AMajor: exception_type; const AExceptionId: string; AExceptionValue: Pointer); // from user code');
    WriteLn(F, 'var');
    WriteLn(F, '  S: AnsiString;');
    WriteLn(F, 'begin');
    WriteLn(F, '  S := AExceptionId;');
    WriteLn(F, '  somSetException(@FNestedEnvironment, AMajor, PAnsiChar(S), AExceptionValue);');
    WriteLn(F, '  Create(@FNestedEnvironment);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'destructor ESOMException.Destroy;');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_UninitEnvironment(@FNestedEnvironment);');
    WriteLn(F, '  inherited;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure ESOMException.ResetNestedEnvironment;');
    WriteLn(F, 'begin');
    WriteLn(F, '  FillChar(FNestedEnvironment, SizeOf(Environment), 0);');
    WriteLn(F, 'end;');

    // Eighth pass: class and method implementation
    if Contents._length > 0 then for I := 0 to Contents._length - 1 do
    begin
      Item := Contents._buffer[I];
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
    WriteLn(F, 'var');
    WriteLn(F, '  SOM_MainProgram_Invoked : Boolean = False;');
    WriteLn(F);
    WriteLn(F, 'function SOM_MainProgram: SOMClassMgr; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  SOM_MainProgram_Invoked := True;');
    WriteLn(F, '  Result := somMainProgram;');
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
    WriteLn(F, '// #include <somapi.h>');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOM_DLL_SOM_MajorVersion: PLongInt = nil;');
    WriteLn(F);
    WriteLn(F, 'function Replaceable_SOM_MajorVersion: PLongInt;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOM_DLL_SOM_MajorVersion) then');
    WriteLn(F, '    Result := SOM_DLL_SOM_MajorVersion');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOM_DLL_Load_Variable(SOM_DLL_SOM_MajorVersion, ''SOM_MajorVersion'');');
    WriteLn(F, '    Result := SOM_DLL_SOM_MajorVersion;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOM_MajorVersion: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := Replaceable_SOM_MajorVersion^;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOM_DLL_SOM_MinorVersion: PLongInt = nil;');
    WriteLn(F);
    WriteLn(F, 'function Replaceable_SOM_MinorVersion: PLongInt;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOM_DLL_SOM_MinorVersion) then');
    WriteLn(F, '    Result := SOM_DLL_SOM_MinorVersion');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOM_DLL_Load_Variable(SOM_DLL_SOM_MinorVersion, ''SOM_MinorVersion'');');
    WriteLn(F, '    Result := SOM_DLL_SOM_MinorVersion;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOM_MinorVersion: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := Replaceable_SOM_MinorVersion^;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'var');
    WriteLn(F, '  SOM_DLL_SOM_MaxThreads: PLongInt = nil;');
    WriteLn(F);
    WriteLn(F, 'function Replaceable_SOM_MaxThreads: PLongInt;');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOM_DLL_SOM_MaxThreads) then');
    WriteLn(F, '    Result := SOM_DLL_SOM_MaxThreads');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOM_DLL_Load_Variable(SOM_DLL_SOM_MaxThreads, ''SOM_MaxThreads'');');
    WriteLn(F, '    Result := SOM_DLL_SOM_MaxThreads;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function SOM_MaxThreads: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  Result := Replaceable_SOM_MaxThreads^;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'function somEnvironmentNew; external SOM_DLL_Name;');
    WriteLn(F, 'procedure somEnvironmentEnd; external SOM_DLL_Name;');
    WriteLn(F, 'function somMainProgram; external SOM_DLL_Name name ''somEnvironmentNew''; // SOM 3.0 Windows DLL has somMainProgram, SOM 2.1 from VAC 3.5.9 has not');
    WriteLn(F, 'function somAbnormalEnd; external SOM_DLL_Name;');
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
    WriteLn(F, '// not in SOM headers');
    WriteLn(F);
    WriteLn(F, 'procedure SOM_RaiseEnvironment(ev: PEnvironment);');
    WriteLn(F, 'begin');
    WriteLn(F, '  // TODO raise proper Delphi exception using info from ev'); // TODO
    WriteLn(F, '  ESOMException.Create(ev);');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure SOM_UninitEnvironmentOrRaise(ev: PEnvironment); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}');
    WriteLn(F, 'begin');
    WriteLn(F, '  if ev._major <> NO_EXCEPTION then');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOM_RaiseEnvironment(ev);');
    WriteLn(F, '  end');
    WriteLn(F, '  else');
    WriteLn(F, '  begin');
    WriteLn(F, '    somExceptionFree(ev);');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'procedure SOMFreeAndNil(var Obj);');
    WriteLn(F, 'begin');
    WriteLn(F, '  if Assigned(SOMObject(Obj)) then');
    WriteLn(F, '  begin');
    WriteLn(F, '    SOMObject(Obj).somFree;');
    WriteLn(F, '    SOMObject(Obj) := nil;');
    WriteLn(F, '  end;');
    WriteLn(F, 'end;');
    WriteLn(F);
    WriteLn(F, 'initialization');
    WriteLn(F, '  Windows.InitializeCriticalSection(DLLLoad_CriticalSection);');
    WriteLn(F, 'finalization');

    if FDLLs.Count > 0 then for I := 0 to FDLLs.Count - 1 do
    begin
      Name := UpperCase(FDLLs[I]);
      for J := 1 to Length(Name) do
      begin
        if Name[J] = '.' then
        begin
          Name[J] := '_';
        end;
      end;
      WriteLn(F, '  if ', Name, ' <> 0 then');
      WriteLn(F, '  begin');
      WriteLn(F, '    Windows.EnterCriticalSection(DLLLoad_CriticalSection);');
      WriteLn(F, '    if ', Name, ' <> 0 then');
      WriteLn(F, '    begin');
      WriteLn(F, '      FreeLibrary(', Name, ');');
      WriteLn(F, '    end;');
      WriteLn(F, '    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);');
      WriteLn(F, '  end;');
    end;

    WriteLn(F, '  if SOM_MainProgram_Invoked then');
    WriteLn(F, '  begin');
    WriteLn(F, '    somEnvironmentEnd;');
    WriteLn(F, '  end;');
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
//  exname: CORBAString;
//  oep: PRepository_irOpenError;
  imp: TSOMIRImporter;
begin
  repo := Repository.Create;
  try
    // TODO different exception handling
    { if not Assigned(repo) then
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
    end; }

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
    TestSOM_IR;
  except
    on e: Exception do
      WriteLn(GetTypeData(e.ClassInfo).UnitName + '.' + e.ClassName + ':' + e.Message);
  end;
end.
