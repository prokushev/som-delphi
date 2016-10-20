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

function IdToImportedType(const Id, RootNamespace, CurrentNamespace: string): string;
begin
  // TODO better resolution
  if CurrentNamespace = RootNamespace then
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

procedure WriteType(var F: Text; const RootNamespace, CurrentNamespace: string; TC: TypeCode); forward;

procedure WriteObjRefType(var F: Text; const RootNamespace, CurrentNamespace: string; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
begin
  ParamCount := TypeCode_param_count(TC, ev);
  if ParamCount = 1 then
  begin
    Parameter := TypeCode_parameter(TC, ev, 0);
    Parameter_TC := TAnyRecord(Parameter)._type;
    Parameter_Kind := TypeCode_kind(Parameter_TC, ev);
    if Parameter_Kind = TypeCode_tk_string then
    begin
      Write(F, IdToImportedType(PAnsiChar(TAnyRecord(Parameter)._value^), RootNamespace, CurrentNamespace));
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

procedure WriteForeignType(var F: Text; const RootNamespace, CurrentNamespace: string; TC: TypeCode);
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
      Write(F, PAnsiChar(TAnyRecord(Parameter)._value^));
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

// TODO consider inhertied context
// function describe: Description; in ExceptionDef
// should be Contained_Description instead
procedure WriteRecordType(var F: Text; const RootNamespace, CurrentNamespace: string; TC: TypeCode);
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
      Write(F, PAnsiChar(TAnyRecord(Parameter)._value^));
    end
    else
    begin
      Write(F, 'record { TypeCode_kind = ', Parameter_Kind, '} end');
    end;
  end
  else
  begin
    Write(F, 'record { TypeCode_param_count = ', ParamCount, '} end');
  end;
end;

procedure WriteEnumType(var F: Text; const RootNamespace, CurrentNamespace: string; TC: TypeCode);
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
      Write(F, PAnsiChar(TAnyRecord(Parameter)._value^));
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

procedure WritePointerType(var F: Text; const RootNamespace, CurrentNamespace: string; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
  TC2: TypeCode;
  Kind: TCKind;
begin
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
              WriteType(F, RootNamespace, CurrentNamespace, TC2);
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
        WriteType(F, RootNamespace, CurrentNamespace, TC2);
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

procedure WriteSequenceType(var F: Text; const RootNamespace, CurrentNamespace: string; TC: TypeCode);
var
  ParamCount: LongInt;
  Parameter: any;
  Parameter_TC: TypeCode;
  Parameter_Kind: TCKind;
  TC2: TypeCode;
  Kind: TCKind;
begin
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
            Write(F, '_IDL_Sequence_', IdToImportedType(PAnsiChar(TAnyRecord(Parameter)._value^), RootNamespace, CurrentNamespace));
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
        WriteType(F, RootNamespace, CurrentNamespace, TC2);
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

procedure WriteType(var F: Text; const RootNamespace, CurrentNamespace: string; TC: TypeCode);
var
  Kind: TCKind;
begin
  Kind := TypeCode_kind(TC, ev);
  case Kind of
  TypeCode_tk_null: Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_null}');
  TypeCode_tk_void: Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_void}');
  TypeCode_tk_short: Write(F, 'SmallInt');
  TypeCode_tk_long: Write(F, 'LongInt');
  TypeCode_tk_ushort: Write(F, 'Word');
  TypeCode_tk_ulong: Write(F, 'LongWord');
  TypeCode_tk_float: Write(F, 'Single');
  TypeCode_tk_double: Write(F, 'Double');
  TypeCode_tk_boolean: Write(F, 'CORBABoolean');
  TypeCode_tk_char: Write(F, 'AnsiChar');
  TypeCode_tk_octet: Write(F, 'Byte');
  TypeCode_tk_any: Write(F, 'any');
  TypeCode_tk_TypeCode: Write(F, 'TypeCode');
  TypeCode_tk_Principal: Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_Principal}');
  TypeCode_tk_objref: WriteObjRefType(F, RootNamespace, CurrentNamespace, TC);
  TypeCode_tk_struct: WriteRecordType(F, RootNamespace, CurrentNamespace, TC);
  TypeCode_tk_union: Write(F, 'record case Integer of {...} end');
  TypeCode_tk_enum: WriteEnumType(F, RootNamespace, CurrentNamespace, TC);
  TypeCode_tk_string: Write(F, 'CORBAString'); // TODO string[255]
  TypeCode_tk_sequence: WriteSequenceType(F, RootNamespace, CurrentNamespace, TC);
  TypeCode_tk_array: Write(F, 'array [0 .. {...}] of {...}');
                       
  TypeCode_tk_pointer: WritePointerType(F, RootNamespace, CurrentNamespace, TC);
  TypeCode_tk_self: Write(F, '{unknown type with TypeCode_kind = TypeCode_tk_self}');
  TypeCode_tk_foreign: WriteForeignType(F, RootNamespace, CurrentNamespace, TC);
  else Write(F, '{unknown type with TypeCode_kind = ', LongWord(Kind), '}');
  end;
end;

procedure WriteMethodArguments(var F: Text; const RootNamespace, CurrentNamespace: string; Definition: OperationDef);
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  Mode: ParameterDef_ParameterMode;
  WasArgument: Boolean;
begin
  Contents := Container_contents(Definition, ev, 'all', False);
  if Contents._length > 0 then
  begin
    WasArgument := False;

    Write(F, '(');
    for I := 0 to Contents._length - 1 do
    begin
      Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
      if SOMObject_somIsA(Item, _SOMCLASS_ParameterDef) then
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
        WriteType(F, RootNamespace, CurrentNamespace, ParameterDef__get_type(Item, ev));
      end
      else
      begin
        Write(F, '{ Found item: ', Contained__get_name(Item, ev), ' }');
      end;

      SOMFreeAndNil(Item);
    end;
    Write(F, ')');
    SOMFree(Contents._buffer);
  end;
end;

procedure WriteMethodDefinition(var F: Text; const RootNamespace, CurrentNamespace: string; Definition: OperationDef);
var
  Result_TC: TypeCode;
begin
  Result_TC := OperationDef__get_result(Definition, ev);
  if TypeCode_kind(Result_TC, ev) = TypeCode_tk_void then // tcEqual(OperationDef__get_result(Definition, ev), ev, TC_void) then
  begin
    Write(F, '    procedure ', Contained__get_name(Definition, ev));
    WriteMethodArguments(F, RootNamespace, CurrentNamespace, Definition);
    WriteLn(F, ';');
  end
  else
  begin
    Write(F, '    function ', Contained__get_name(Definition, ev));
    WriteMethodArguments(F, RootNamespace, CurrentNamespace, Definition);
    Write(F, ': ');
    WriteType(F, RootNamespace, CurrentNamespace, Result_TC);
    WriteLn(F, ';');
  end;
end;

procedure WriteClassDefinition(var F: Text; const RootNamespace, CurrentNamespace: string; Definition: InterfaceDef);
var
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  Name: Identifier;
  NameS: AnsiString;
  WasPrivate, WasPublic: Boolean;
begin
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
            WriteMethodDefinition(F, RootNamespace, CurrentNamespace, Item);
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
            WriteMethodDefinition(F, RootNamespace, CurrentNamespace, Item);
          end;
        end
        else
        begin
          if not WasPublic then
          begin
            WriteLn(F, '  public');
            WasPublic := True;
          end;
          WriteMethodDefinition(F, RootNamespace, CurrentNamespace, Item);
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
        WriteType(F, RootNamespace, CurrentNamespace, AttributeDef__get_type(Item, ev));
        WriteLn(F, ' read _get_', Name, ' write _set_', Name, ';'); // TODO: can be read-only or write-only
        Name := nil;
      end;

      SOMFreeAndNil(Item);
    end;
    SOMFree(Contents._buffer);
  end;
end;

procedure WriteNamespaceToUnit(RepositoryOrModule: Container; const RootNamespace, CurrentNamespace: string);
var
  F: Text;
  Contents: _IDL_SEQUENCE_Contained;
  I: LongWord;
  Item: Contained;
  WasForwardType: Boolean;
begin
  Assign(F, CurrentNamespace + '.pas');
  Rewrite(F);
  try
    Write('Writing ', CurrentNamespace, '.pas...');
    WriteLn(F, '{$WARN UNSAFE_TYPE OFF}');
    WriteLn(F);
    WriteLn(F, 'unit ', CurrentNamespace, ';');
    WriteLn(F);
    WriteLn(F, 'interface');
    WriteLn(F, 'uses');
    WriteLn(F, '  SOM.DelphiFeatures, SOM.Thin;');
    WriteLn(F);
    WriteLn(F, '{$INCLUDE ''SOM.DelphiFeatures.inc''}');
    WriteLn(F);

    Contents := Container_contents(RepositoryOrModule, ev, 'all', False);
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
          end;
          WriteLn(F, '  ', Contained__get_name(Item, ev), ' = class;');
        end;
      end;

      // Second pass: build other types

      // Third pass: satisfy forward type references
      if WasForwardType then
      begin
        for I := 0 to Contents._length - 1 do
        begin
          Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
          if SOMObject_somIsA(Item, _SOMCLASS_InterfaceDef) then
          begin
            WriteLn(F);
            WriteLn(F, '  ', Contained__get_name(Item, ev), ' = class');
            WriteClassDefinition(F, RootNamespace, CurrentNamespace, Item);
            WriteLn(F, '  end;');
          end;
        end;
      end;

      // Last pass: others
      for I := 0 to Contents._length - 1 do
      begin
        Item := PContained(PAnsiChar(Contents._buffer) + I * SizeOf(Contained))^;
        WriteLn(F);
        WriteLn(F, '{ Found item: ', Contained__get_name(Item, ev), ' }');

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
    WriteNamespaceToUnit(repo, 'SOMIRTest.DumpOut', 'SOMIRTest.DumpOut');

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
