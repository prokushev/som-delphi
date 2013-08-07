{$R-}

unit SOM.Thin;

interface

uses
  SOM.DelphiFeatures; //, Corba;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

// #include <somplatf.h>

type
  somLibraryHandle = System.HMODULE;

// #include <sombtype.h>

  somMethodProc = function(var somSelf): Pointer; cdecl;
  somMethodPtr = somMethodProc;
  somTP_somClassInitFunc = procedure(var somSelf);

  integer1 = Byte;                     (* char is unsigned by default in VisualAge C++ *)
  integer2 = SmallInt;
  uinteger2 = Word;
  integer4 = LongInt;
  uinteger4 = LongWord;
  float4 = Single;
  float8 = Double;
  zString = PAnsiChar;                 (* NULL terminated string *)
  fString = PAnsiChar;                 (* non-terminated string  *)
  somId = ^PAnsiChar;
  somToken = Pointer;                  (* Uninterpretted value   *)
  signed_char = ShortInt;

// #include <somtypes.h>

  somMethodTabStruct = record end;
  SOMAny = record
    mtab: ^somMethodTabStruct;
    body: array[0 .. 0] of integer4;
  end;
  SOMAny_struct = SOMAny;

(* SOM Primitive Classes *)
// #define SOMObject SOMAny
// #define SOMClass SOMAny
// #define SOMClassMgr SOMAny

// #include <somcdev.h>

(* Control the printing of method and procedure entry messages, *)
(* 0-none, 1-user, 2-core&user *)
function SOM_TraceLevel: PInteger;

(* Control the printing of warning messages, 0-none, 1-all *)
function SOM_WarnLevel: PInteger;

(* Control the printing of successful assertions, 0-none, 1-user, *)
(* 2-core&user *)
function SOM_AssertLevel: PInteger;

(*
 *  Scans argv looking for flags -somt, -somtc, -soma -somac -somw setting
 *  SOM_TraceLevel, SOM_AssertLevel and SOM_WarnLevel as appropriate.
 *  argv is not modified
 *)
procedure somCheckArgs(argc: Integer; argv: PPAnsiChar); stdcall;


(*----------------------------------------------------------------------
 * SOM Implementation Section
 *---------------------------------------------------------------------*)

(*
 * Externals used in the implementation of SOM_Test and SOM_Assert,
 * but not part of the SOM API.
 *)
procedure somTest (
    condition: Integer;
    severity: Integer;
    fileName: PAnsiChar;
    lineNum: Integer;
    msg: PAnsiChar); stdcall;

procedure somAssert (
    condition: Integer;
    ecode: Integer;
    fileName: PAnsiChar;
    lineNum: Integer;
    msg: PAnsiChar); stdcall;

(*
 *  Error severity codes, these are added to the base error number to
 *  produce the full error code
 *)

const
  SOM_Ok            = $0;
  SOM_Warn          = $1;
  SOM_Ignore        = $2; (* don't do anything *)
  SOM_Fatal         = $9; (* terminate the program *)
  SOM_Template      = $5; (* use to identify msg templates *)

  SOM_EB = 20000;
function SOM_FatalCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
function SOM_WarnCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
function SOM_IgnoreCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
function SOM_OkCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
function SOM_TemplateCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
function SOM_MsgCode(ecode: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

const
  SOMERROR_MustOverride = SOM_EB + 18 * 10 + SOM_Fatal

// #include <somcorba.h>
// #include <somapi.h>

// #include <somobj.h>
// #include <somcls.h>
// #include <somcm.h>

implementation

uses
  Windows;

const
  SOM_DLL_Name = 'som.dll';
var
  SOM_DLL: System.HMODULE = 0;
  DLLLoad_CriticalSection : Windows.TRTLCriticalSection;

// #include <somcdev.h>
var
  SOM_DLL_SOM_TraceLevel: PInteger;

function SOM_TraceLevel: PInteger;
begin
  if Assigned(SOM_DLL_SOM_TraceLevel) then
    Result := SOM_DLL_SOM_TraceLevel
  else
  begin
    if SOM_DLL = 0 then
    begin
      Windows.EnterCriticalSection(DLLLoad_CriticalSection);
      if SOM_DLL = 0 then
        SOM_DLL := Windows.LoadLibrary(SOM_DLL_Name);
      Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
    end;
    if SOM_DLL = 0 then
      Result := nil
    else
    begin
      SOM_DLL_SOM_TraceLevel := Windows.GetProcAddress(SOM_DLL, 'SOM_TraceLevel');
      Result := SOM_DLL_SOM_TraceLevel;
    end;
  end;
end;

var
  SOM_DLL_SOM_WarnLevel: PInteger;

function SOM_WarnLevel: PInteger;
begin
  if Assigned(SOM_DLL_SOM_WarnLevel) then
    Result := SOM_DLL_SOM_WarnLevel
  else
  begin
    if SOM_DLL = 0 then
    begin
      Windows.EnterCriticalSection(DLLLoad_CriticalSection);
      if SOM_DLL = 0 then
        SOM_DLL := Windows.LoadLibrary(SOM_DLL_Name);
      Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
    end;
    if SOM_DLL = 0 then
      Result := nil
    else
    begin
      SOM_DLL_SOM_WarnLevel := Windows.GetProcAddress(SOM_DLL, 'SOM_WarnLevel');
      Result := SOM_DLL_SOM_WarnLevel;
    end;
  end;
end;

var
  SOM_DLL_SOM_AssertLevel: PInteger;

function SOM_AssertLevel: PInteger;
begin
  if Assigned(SOM_DLL_SOM_AssertLevel) then
    Result := SOM_DLL_SOM_AssertLevel
  else
  begin
    if SOM_DLL = 0 then
    begin
      Windows.EnterCriticalSection(DLLLoad_CriticalSection);
      if SOM_DLL = 0 then
        SOM_DLL := Windows.LoadLibrary(SOM_DLL_Name);
      Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
    end;
    if SOM_DLL = 0 then
      Result := nil
    else
    begin
      SOM_DLL_SOM_AssertLevel := Windows.GetProcAddress(SOM_DLL, 'SOM_AssertLevel');
      Result := SOM_DLL_SOM_AssertLevel;
    end;
  end;
end;

procedure somCheckArgs; external SOM_DLL_Name;
procedure somTest; external SOM_DLL_Name;
procedure somAssert; external SOM_DLL_Name;

function SOM_FatalCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOM_EB + code * 10 + SOM_Fatal;
end;
function SOM_WarnCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOM_EB + code * 10 + SOM_Warn;
end;
function SOM_IgnoreCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOM_EB + code * 10 + SOM_Ignore;
end;
function SOM_OkCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOM_EB + code * 10 + SOM_Ok;
end;
function SOM_TemplateCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOM_EB + code * 10 + SOM_Template;
end;
function SOM_MsgCode(ecode: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := (ecode - SOM_EB) div 10;
end;

// #include <somcorba.h>
// #include <somapi.h>

// #include <somobj.h>
// #include <somcls.h>
// #include <somcm.h>

initialization
  Windows.InitializeCriticalSection(DLLLoad_CriticalSection);

finalization
  if SOM_DLL <> 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    FreeLibrary(SOM_DLL);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  Windows.DeleteCriticalSection(DLLLoad_CriticalSection);
end.
