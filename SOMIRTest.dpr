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

procedure WriteMethodDefinition(var F: Text; Definition: OperationDef);
begin
   if tcEqual(OperationDef__get_result(Definition, ev), ev, TC_void) then
   begin
     WriteLn(F, '    procedure ', Contained__get_name(Definition, ev), '( { ... } );');
   end
   else
   begin
     WriteLn(F, '    function ', Contained__get_name(Definition, ev), '( { ... } ): { ... };');
   end;
end;

procedure WriteClassDefinition(var F: Text; Definition: InterfaceDef);
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
            WriteMethodDefinition(F, Item);
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
            WriteMethodDefinition(F, Item);
          end;
        end
        else
        begin
          if not WasPublic then
          begin
            WriteLn(F, '  public');
            WasPublic := True;
          end;
          WriteMethodDefinition(F, Item);
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
        WriteLn(F, '    property ', Name, ': { ... } read _get_', Name, ' write _set_', Name, ';'); // can be read-only or write-only
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
            WriteClassDefinition(F, Item);
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
