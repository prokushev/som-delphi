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

// #include "emitdelphi.c"

(* @(#) somc/gen_emit.efs 2.9 6/7/96 16:14:29 [12/22/96 21:11:24] *)

(*
 *   COMPONENT_NAME: some
 *
 *   ORIGINS: 27
 *
 *
 *   10H9767, 10H9769  (C) COPYRIGHT International Business Machines Corp. 1992,1994
 *   All Rights Reserved
 *   Licensed Materials - Property of IBM
 *   US Government Users Restricted Rights - Use, duplication or
 *   disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 *)

(*
 *         File:    emitdelphi.c
 *       Author:    SOMObjects Emitter Framework
 *     Contents:    Generic framework emitter for DelphiEmitter.
 *         Date:    Sun Jan 11 00:51:12 2015.
 *)

const SYMBOLS_FILE = 'delphi.efw';

function emitSL(fileName: PAnsiChar; cls: PEntry; stab: PStab): PFILE; stdcall;
var
  fp, deffile: PFILE;
  oCls: SOMTClassEntryC;
  mdl: SOMTModuleEntryC;
  emitter: DelphiEmitter;
  t: SOMTTemplateOutputC;
begin

  (* if this is a class, rather than a module: *)
  (* if cls.somttype = SOMTClassE then
  begin
    oCls := SOMTClassEntryC(somtGetObjectWrapper(cls));
    fp := somtopenEmitFileSL(fileName, 'pas');
    emitter := DelphiEmitterNew;
    SOMTEmitC__set_somtTargetFile(emitter, fp);
    SOMTEmitC__set_somtTargetClass(emitter, oCls);
    SOMTEmitC__set_somtEmitterName(emitter, 'delphi');
    t := SOMTEmitC__get_somtTemplate(emitter);
    SOMTTemplateOutputC__set_somtCommentStyle(t, somtCPPE);
    deffile := SOMTEmitC_somtOpenSymbolsFile(emitter, SYMBOLS_FILE, 'r');
    if Assigned(deffile) then
    begin
      SOMTTemplateOutputC_somtReadSectionDefinitions(t, deffile);
      somtfcloseSL(deffile);
    end
    else begin
      WriteLn(ErrOutput, 'Cannot open Symbols file "' + SYMBOLS_FILE + '".');
      Halt(1);
    end;
    SOMTEmitC_somtGenerateSections(emitter);
    SOMObject_somFree(emitter);
    SOMObject_somFree(oCls);

    Result := fp;
  end
  else if cls.somttype = SOMTModuleE then
  begin

    fp := somtopenEmitFileSL(fileName, 'pas');
    mdl := SOMTModuleEntryC(somtGetObjectWrapper(cls));
    emitter := DelphiEmitterNew;
    SOMTEmitC__set_somtTargetFile(emitter, fp);
    SOMTEmitC__set_somtTargetModule(emitter, mdl);
    t := SOMTEmitC__get_somtTemplate(emitter);
    SOMTTemplateOutputC__set_somtCommentStyle(t, somtCPPE);
    deffile := SOMTEmitC_somtOpenSymbolsFile(emitter, SYMBOLS_FILE, 'r');
    if Assigned(deffile) then
    begin
      SOMTTemplateOutputC_somtReadSectionDefinitions(t, deffile);
      somtfcloseSL(deffile);
    end
    else begin
      WriteLn(ErrOutput, 'Cannot open Symbols file "' + SYMBOLS_FILE + '".');
      Halt(1);
    end;
    SOMTEmitC_somtGenerateSections(emitter);
    SOMObject_somFree(emitter);
    SOMObject_somFree(mdl);

    Result := fp;
  end
  else *)
  begin
    WriteLn(fileName, ' / ', cls.somttype);
    Result := nil;
  end;
end;

exports
  emitSL;

begin

end.
