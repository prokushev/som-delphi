program SOMIRTest;

{$APPTYPE CONSOLE}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

uses
  SysUtils,
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

{ 
procedure TestSOM_Basic;
var
  o: SOMObject;
  s: CORBAString;
begin
  o := SOMObjectNew;
  s := SOMObject_somGetClassName(o);
  WriteLn('Object''s class name is ', s);
  SOMFree(s);
  SOMObject_somFree(o);
end;

procedure TestSOM_Renew;
var
  a: array of Byte;
  Size: LongInt;
  o: SOMObject;
  s: CORBAString;
begin
  Size := SOMClass_somGetInstanceSize(_SOMCLASS_SOMObject);
  WriteLn('SOMObject''s size is ', Size);
  SetLength(a, Size);
  o := SOMObjectRenew(@(a[0]));
  s := SOMObject_somGetClassName(o);
  WriteLn('Object''s class name is ', s);
  SOMFree(s);
  SOMObject_somUninit(o);
end;
}

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
  TWriteTypePass = (wtpOnDemand, wtpTypeDef, wtpFinal);
  // wtpOnDemand: the write position is at the beginning of line, and if required, importer can write xxx = yyy lines
  // wtpTypeDef: '  xxx = ' is already written, and it's time to output something that is appropriate for type definition
  // wtpFinal: it's too late to define anything now, it's time to output identifier that should be defined previously

  TSOMIRImporter = class
  private
    FRootNamespace: string;
    F: Text;
    FRepo: Repository;
    FWasType: Boolean;
  public
    constructor Create(const ARootNamespace: string; ARepo: Repository);
    destructor Destroy; override;
    function IdToImportedType(const Id, CurrentNamespace: string): string;
    procedure WriteObjRefType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteForeignType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteRecordType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteEnumType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WritePointerType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteSequenceType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
    procedure WriteMethodArguments(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
    procedure WriteMethodDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
    procedure WriteClassDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: InterfaceDef);
    procedure WriteRepository;

    property RootNamespace: string read FRootNamespace;
    property Repo: Repository read FRepo;
  end;

constructor TSOMIRImporter.Create(const ARootNamespace: string; ARepo: Repository);
begin
  inherited Create;
  FRootNamespace := ARootNamespace;
  FRepo := ARepo;
end;

destructor TSOMIRImporter.Destroy;
begin
  // Close(F);
  inherited Destroy;
end;

function TSOMIRImporter.IdToImportedType(const Id, CurrentNamespace: string): string;
begin
  // TODO better resolution
  if CurrentNamespace = '::' then
  begin
    if Length(Id) >= 2 then
    begin
      if Copy(Id, 1, 2) = '::' then
      begin
        Result := Copy(Id, 3, Length(Id) - 2);
      end
      else
      begin
        Result := Id;
      end;
    end
    else
    begin
      Result := Id;
    end;
  end
  else
  begin
    Result := RootNamespace + '.' + Id;
  end;
end;

procedure TSOMIRImporter.WriteObjRefType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  if Pass = wtpOnDemand then Exit; // TODO
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount = 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_string then
    begin
      Write(F, IdToImportedType(PAnsiChar(TAnyRecord(Parameter)._value^), CurrentNamespace));
    end
    else
    begin
      Write(F, '{reference to object with parameter kind ', Parameter_Kind, '}');
    end;
  end
  else
  begin
    Write(F, '{reference to object with TypeCode_param_count = ', ParamCount, '}');
  end;
end;

procedure TSOMIRImporter.WriteForeignType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  if Pass = wtpOnDemand then Exit;
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_string then
    begin
      if Pass = wtpTypeDef then
      begin
        Write(F, 'Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) }');
      end
      else
      begin
        Write(F, PAnsiChar(TAnyRecord(Parameter)._value^));
      end;
    end
    else
    begin
      Write(F, '{foreign type with parameter kind ', Parameter_Kind, '}');
    end;
  end
  else
  begin
    Write(F, '{foreign type with TypeCode_param_count = ', ParamCount, '}');
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
      if Pass = wtpFinal then
      begin
        Write(F, PAnsiChar(TAnyRecord(Parameter)._value^));
      end
      else
      begin
        if Pass <> wtpOnDemand then
        begin
          WriteLn(F, 'record');
          WriteLn(F, '    { ... }');
        end;

        { TODO record fields }

        if Pass <> wtpOnDemand then
        begin
          Write(F, '  end');
        end;
      end;
    end
    else
    begin
      if Pass <> wtpOnDemand then
      begin
        Write(F, 'record { TypeCode_kind = ', Parameter_Kind, '} end');
      end;
    end;
  end
  else
  begin
    if Pass <> wtpOnDemand then
    begin
      Write(F, 'record { TypeCode_param_count = ', ParamCount, '} end');
    end;
  end;
end;

procedure TSOMIRImporter.WriteEnumType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  if Pass = wtpOnDemand then Exit;
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_string then
    begin
      if Pass = wtpTypeDef then
      begin
        Write(F, 'type LongWord');
      end
      else
      begin
        Write(F, PAnsiChar(TAnyRecord(Parameter)._value^));
      end;
    end
    else
    begin
      Write(F, 'type LongWord {enum with TypeCode_kind = ', Parameter_Kind, '}');
    end;
  end
  else
  begin
    Write(F, 'type LongWord {enum with TypeCode_param_count = ', ParamCount, '}');
  end;
end;

procedure TSOMIRImporter.WritePointerType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
  TC2: TypeCode;
  Kind: TCKind;
begin
  if Pass = wtpOnDemand then Exit; // TODO
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_TypeCode then
    begin
      TC2 := TypeCode(TAnyRecord(Parameter)._value^);
      Kind := TypeCode_kind(TC2, ev);
      if Kind = TypeCode_tk_struct then
      begin
        ParamCount := TypeCode_param_count(TC2, ev);
        if ParamCount >= 1 then
        begin
          Parameter := TypeCode_parameter(TC2, ev, 0);
          Parameter_TC := TAnyRecord(Parameter)._type;
          Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
          if Parameter_Kind = TypeCode_tk_string then
          begin
            Write(F, 'P', PAnsiChar(TAnyRecord(Parameter)._value^));
          end
          else
          begin
            Write(F, '^record { TypeCode_kind = ', Parameter_Kind, '} end');
          end;
        end
        else
        begin
          Write(F, '^record { TypeCode_param_count = ', ParamCount, '} end');
        end;
      end
      else if Kind = TypeCode_tk_foreign then
      begin
        ParamCount := TypeCode_param_count(TC2, ev);
        if ParamCount >= 1 then
        begin
          Parameter := TypeCode_parameter(TC2, ev, 0);
          Parameter_TC := TAnyRecord(Parameter)._type;
          Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
          if Parameter_Kind = TypeCode_tk_string then
          begin
            Write(F, 'P', PAnsiChar(TAnyRecord(Parameter)._value^));
          end
          else
          begin
            Write(F, '^{foreign type with TypeCode_kind = ', Parameter_Kind, '}');
          end;
        end
        else
        begin
          Write(F, '^{foreign type with TypeCode_param_count = ', ParamCount, '}');
        end;
      end
      else if Kind = TypeCode_tk_void then
      begin
        Write(F, 'Pointer');
      end
      else if Kind = TypeCode_tk_pointer then
      begin
        ParamCount := TypeCode_param_count(TC2, ev);
        if ParamCount >= 1 then
        begin
          Parameter := TypeCode_parameter(TC2, ev, 0);
          Parameter_TC := TAnyRecord(Parameter)._type;
          Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
          if Parameter_Kind = TypeCode_tk_TypeCode then
          begin
            TC2 := TypeCode(TAnyRecord(Parameter)._value^);
            Kind := TypeCode_kind(TC2, ev);
            if Kind = TypeCode_tk_void then
            begin
              Write(F, 'PPointer');
            end
            else
            begin
              Write(F, '^^');
              WriteType(CurrentNamespace, Pass, TC2);
            end;
          end
          else
          begin
            Write(F, '^^{ TypeCode_kind = ', Parameter_Kind, '}');
          end;
        end
        else
        begin
          Write(F, '^^{ TypeCode_param_count = ', ParamCount, '}');
        end;
      end
      else
      begin
        Write(F, '^');
        WriteType(CurrentNamespace, Pass, TC2);
      end;
    end
    else
    begin
      Write(F, '^{ TypeCode_kind = ', Parameter_Kind, '}');
    end;
  end
  else
  begin
    Write(F, '^{ TypeCode_param_count = ', ParamCount, '}');
  end;
end;

procedure TSOMIRImporter.WriteSequenceType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
  TC2: TypeCode;
  Kind: TCKind;
begin
  if Pass = wtpOnDemand then Exit; // TODO
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount >= 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_TypeCode then
    begin
      TC2 := TypeCode(TAnyRecord(Parameter)._value^);
      Kind := TypeCode_kind(TC2, ev);
      if Kind = TypeCode_tk_struct then
      begin
        ParamCount := TypeCode_param_count(TC2, ev);
        if ParamCount >= 1 then
        begin
          Parameter := TypeCode_parameter(TC2, ev, 0);
          Parameter_TC := TAnyRecord(Parameter)._type;
          Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
          if Parameter_Kind = TypeCode_tk_string then
          begin
            Write(F, '_IDL_Sequence_', PAnsiChar(TAnyRecord(Parameter)._value^));
          end
          else
          begin
            Write(F, '_IDL_Sequence_record { TypeCode_kind = ', Parameter_Kind, '} end');
          end;
        end
        else
        begin
          Write(F, '_IDL_Sequence_record { TypeCode_param_count = ', ParamCount, '} end');
        end;
      end
      else if Kind = TypeCode_tk_objref then
      begin
        ParamCount := TypeCode_param_count(TC2, ev);
        if ParamCount >= 1 then
        begin
          Parameter := TypeCode_parameter(TC2, ev, 0);
          Parameter_TC := TAnyRecord(Parameter)._type;
          Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
          if Parameter_Kind = TypeCode_tk_string then
          begin
            Write(F, '_IDL_Sequence_', IdToImportedType(PAnsiChar(TAnyRecord(Parameter)._value^), CurrentNamespace));
          end
          else
          begin
            Write(F, '_IDL_Sequence_{object reference with TypeCode_kind = ', Parameter_Kind, '} end');
          end;
        end
        else
        begin
          Write(F, '_IDL_Sequence_{object reference with TypeCode_param_count = ', ParamCount, '} end');
        end;
      end
      else if Kind = TypeCode_tk_void then
      begin
        Write(F, '_IDL_Sequence_void');
      end
      else
      begin
        Write(F, '_IDL_Sequence_');
        WriteType(CurrentNamespace, Pass, TC2);
      end;
    end
    else
    begin
      Write(F, '_IDL_Sequence_{ TypeCode_kind = ', Parameter_Kind, '}');
    end;
  end
  else
  begin
    Write(F, '_IDL_Sequence_{ TypeCode_param_count = ', ParamCount, '}');
  end;
end;

procedure TSOMIRImporter.WriteType(const CurrentNamespace: string; Pass: TWriteTypePass; TC: TypeCode);
var
  Kind: TCKind;
begin
  Kind := TypeCode_kind(TC, ev);
  case Kind of
  TypeCode_tk_null: if Pass <> wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_null}');
  TypeCode_tk_void: if Pass <> wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_void}');
  TypeCode_tk_short: if Pass <> wtpOnDemand then Write(F, 'SmallInt');
  TypeCode_tk_long: if Pass <> wtpOnDemand then Write(F, 'LongInt');
  TypeCode_tk_ushort: if Pass <> wtpOnDemand then Write(F, 'Word');
  TypeCode_tk_ulong: if Pass <> wtpOnDemand then Write(F, 'LongWord');
  TypeCode_tk_float: if Pass <> wtpOnDemand then Write(F, 'Single');
  TypeCode_tk_double: if Pass <> wtpOnDemand then Write(F, 'Double');
  TypeCode_tk_boolean: if Pass <> wtpOnDemand then Write(F, 'CORBABoolean');
  TypeCode_tk_char: if Pass <> wtpOnDemand then Write(F, 'ShortInt');
  TypeCode_tk_octet: if Pass <> wtpOnDemand then Write(F, 'Byte');
  TypeCode_tk_any: if Pass <> wtpOnDemand then Write(F, 'any');
  TypeCode_tk_TypeCode: if Pass <> wtpOnDemand then Write(F, 'TypeCode');
  TypeCode_tk_Principal: if Pass <> wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_Principal}');
  TypeCode_tk_objref: WriteObjRefType(CurrentNamespace, Pass, TC);
  TypeCode_tk_struct: WriteRecordType(CurrentNamespace, Pass, TC);
  TypeCode_tk_union: if Pass <> wtpOnDemand then Write(F, 'record case Integer of {...} end');
  TypeCode_tk_enum: WriteEnumType(CurrentNamespace, Pass, TC);
  TypeCode_tk_string: if Pass <> wtpOnDemand then Write(F, 'CORBAString'); // TODO string[255]
  TypeCode_tk_sequence: WriteSequenceType(CurrentNamespace, Pass, TC); // TODO sequence[]
  TypeCode_tk_array: if Pass <> wtpOnDemand then Write(F, 'array [0 .. {...}] of {...}');
                       
  TypeCode_tk_pointer: WritePointerType(CurrentNamespace, Pass, TC);
  TypeCode_tk_self: if Pass <> wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_self}');
  TypeCode_tk_foreign: WriteForeignType(CurrentNamespace, Pass, TC);
  else if Pass <> wtpOnDemand then Write(F, '{unknown type with TypeCode_kind = ', LongWord(Kind), '}');
  end;
end;

procedure TSOMIRImporter.WriteMethodArguments(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  Mode: ParameterDef_ParameterMode;
  WasArgument: Boolean;
begin
  if Pass = wtpTypeDef then Exit;
  Contents := Container_contents(Definition, ev, 'all', False);
  if Contents._length > 0 then
  begin
    WasArgument := False;

    if Pass <> wtpOnDemand then
    begin
      Write(F, '(');
    end;
    for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if SOMObject_somIsA(Item, _SOMCLASS_ParameterDef) then
      begin
        if Pass <> wtpOnDemand then
        begin
          if not WasArgument then
          begin
            WasArgument := True
          end
          else
          begin
            Write(F, '; ');
          end;
          Mode := ParameterDef__get_mode(Item, ev);
          case Mode of
          ParameterDef_IN: ;
          ParameterDef_OUT: Write(F, 'out ');
          ParameterDef_INOUT: Write(F, 'var ');
          else Write(F, '{unknown mode ', LongWord(Mode), '}');
          end;

          Write(F, Contained__get_name(Item, ev), ': ');
        end;
        WriteType(CurrentNamespace, Pass, ParameterDef__get_type(Item, ev));
      end
      else
      begin
        if Pass <> wtpOnDemand then
        begin
          Write(F, '{ Found item: ', Contained__get_name(Item, ev), ' }');
        end;
      end;

      SOMFreeAndNil(Item);
    end;

    if Pass <> wtpOnDemand then
    begin
      Write(F, ')');
    end;
    SOMFree(Contents._buffer);
  end;
end;

procedure TSOMIRImporter.WriteMethodDefinition(const CurrentNamespace: string; Pass: TWriteTypePass; Definition: OperationDef);
var
  Result_TC: TypeCode;
begin
  if Pass = wtpTypeDef then Exit;
  Result_TC := OperationDef__get_result(Definition, ev);
  if TypeCode_kind(Result_TC, ev) = TypeCode_tk_void then
  begin
    if Pass <> wtpOnDemand then
    begin
      Write(F, '    procedure ', Contained__get_name(Definition, ev));
    end;
    WriteMethodArguments(CurrentNamespace, Pass, Definition);
    if Pass <> wtpOnDemand then
    begin
      WriteLn(F, ';');
    end;
  end
  else
  begin
    if Pass <> wtpOnDemand then
    begin
      Write(F, '    function ', Contained__get_name(Definition, ev));
    end;
    WriteMethodArguments(CurrentNamespace, Pass, Definition);
    if Pass <> wtpOnDemand then
    begin
      Write(F, ': ');
    end;
    WriteType(CurrentNamespace, Pass, Result_TC);
    if Pass <> wtpOnDemand then
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
begin
  if Pass = wtpOnDemand then Exit; // TODO
  Contents := Container_contents(Definition, ev, 'all', False);
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
      else
      begin
        WriteLn(F, '    { Found item: ', Contained__get_name(Item, ev), ' }');
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
              WriteLn(F, '  private');
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
              WriteLn(F, '  public');
              WasPublic := True;
            end;
            WriteMethodDefinition(CurrentNamespace, Pass, Item);
          end;
        end
        else
        begin
          if not WasPublic then
          begin
            WriteLn(F, '  public');
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
          WriteLn(F, '  public');
          WasPublic := True;
        end;
        Name := Contained__get_name(Item, ev);
        Write(F, '    property ', Name, ': ');
        WriteType(CurrentNamespace, Pass, AttributeDef__get_type(Item, ev));
        WriteLn(F, ' read _get_', Name, ' write _set_', Name, ';'); // TODO: can be read-only or write-only
        Name := nil;
      end;

      SOMFreeAndNil(Item);
    end;
    SOMFree(Contents._buffer);
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
    WriteLn(F, '{ Amount of items: ', Contents._length, ' }');
    if Contents._length > 0 then
    begin
      WasForwardType := False;

      // First pass: forward type references
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
        begin
          if not WasForwardType then
          begin
            WriteLn(F, 'type');
            WriteLn(F, '  { Forward definitions }');
            WasForwardType := True;
            FWasType := True;
          end;
          WriteLn(F, '  ', Contained__get_name(Item, ev), ' = class;');
        end;
      end;
      Write(' 1');

      // TODO Forward pointer types

      // Second pass: build non-class types
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
        begin
          if not FWasType then
          begin
            WriteLn(F, 'type');
            FWasType := True;
          end;
          // Write(' ', Contained__get_name(Item, ev), '-ondemand');
          WriteType('::', wtpOnDemand, TypeDef__get_type(Item, ev));
          // Write(' ', Contained__get_name(Item, ev), '-typedef');
          Write(F, '  ', Contained__get_name(Item, ev), ' = ');
          WriteType('::', wtpTypeDef, TypeDef__get_type(Item, ev));
          WriteLn(F, ';');
        end;
      end;
      Write(' 2');

      // Third pass: satisfy forward type references
      if WasForwardType then
      begin
        for I := 0 to Contents._length - 1 do
        begin
          Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
          if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
          begin
            WriteLn(F);
            WriteClassDefinition('::', wtpOnDemand, Item);
            WriteLn(F, '  ', Contained__get_name(Item, ev), ' = class');
            WriteClassDefinition('::', wtpFinal, Item);
            WriteLn(F, '  end;');
          end;
        end;
      end;
      Write(' 3');

      // Last pass: others
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
        else if SOMObject_somIsA(Item, _SOMCLASS_TypeDef) then
        else
        begin
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
