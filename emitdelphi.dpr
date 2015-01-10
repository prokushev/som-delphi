library emitdelphi;

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

uses
  SysUtils,
  SOM in 'SOM.pas',
  SOM.Thin in 'SOM.Thin.pas',
  SOM.DelphiFeatures in 'SOM.DelphiFeatures.pas',
  SOM.Thin.Emitter in 'SOM.Thin.Emitter.pas',
  SOM.Thin.DLL in 'SOM.Thin.DLL.pas',
  SOM.Thin.RTL in 'SOM.Thin.RTL.pas',
  SOM.Thin.TypeCodes in 'SOM.Thin.TypeCodes.pas',
  emitdelphi.DelphiEmitter in 'emitdelphi.DelphiEmitter.pas',
  SOM.Thin.Impl in 'SOM.Thin.Impl.pas';

{$INCLUDE 'SOM.DelphiFeatures.inc'}

{$R *.res}

begin
end.
