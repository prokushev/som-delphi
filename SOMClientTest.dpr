program SOMClientTest;

{$APPTYPE CONSOLE}
{$WARN UNSAFE_TYPE OFF}

uses
  SysUtils, TypInfo,
  SOM in 'SOM.pas',
  SOM.Thin in 'SOM.Thin.pas',
  SOM.DelphiFeatures in 'SOM.DelphiFeatures.pas';

procedure TestSOM_Basic;
var
  ev: PEnvironment;
  o: SOMObject;
  s: CORBAString;
begin
  WriteLn('Testing SOM v', SOM_MajorVersion^, '.', SOM_MinorVersion^);
  ev := somGetGlobalEnvironment;

  SOMObjectNewClass(SOMObject_MajorVersion, SOMObject_MinorVersion);
  o := SOMObjectNew;
  s := SOMObject_somGetClassName(o);
  WriteLn('Object''s class name is ', s);
  SOMFree^(s);
  SOMObject_somFree(o);
end;

begin
  { TODO -oUser -cConsole Main : Insert code here }
  try
    TestSOM_Basic;
  except
    on e: Exception do
      WriteLn(GetTypeData(e.ClassInfo).UnitName + '.' + e.ClassName + ':' + e.Message);
  end;
  ReadLn;
end.
