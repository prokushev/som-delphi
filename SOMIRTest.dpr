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
  ReadLn;
end.
