{$R-}

unit SOM.Thin;

interface

uses
  SOM.DelphiFeatures; //, Corba;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

type
  va_list = type Pointer;

// #include <somplatf.h>

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
  SOMObject = type SOMAny;
  PSOMObject = ^SOMObject;
  SOMClass = type SOMObject;
  PSOMClass = ^SOMClass;
  SOMClassMgr = type SOMClass;
  PSOMClassMgr = ^SOMClassMgr;
  PPSOMClassMgr = ^PSOMClassMgr;

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
  SOMERROR_MustOverride = SOM_EB + 18 * 10 + SOM_Fatal;

// #include <somcorba.h>

(* CORBA 5.7, p.89 *)
type
  octet = Byte;
  CORBAString = PAnsiChar;
  CORBABoolean = ByteBool;



(* CORBA 7.5.1, p. 129 *)
  Identifier = CORBAString;

(* CORBA 4.13, p. 80 *)
(*
 * Generated SOM usage bindings for IDL enums start at 1, but
 * somcorba.h is not generated, and the original SOM 2.0 somcorba.h
 * used C enum typedefs to define the exception_type and
 * completion_status enumerations.  As a result, to maintain backwards
 * binary compatibility, the mapping for these enums starts at 0
 * (which is also the mapping specified by CORBA 2.0).
 *
 * The additional value enum_name_MAX is needed to ensure that all
 * compilers will allocate 4 bytes for these enums.  This technique
 * for representing IDL enums is used in the CORBA 2.0 * C++ mappings.
 *)
  exception_type = type LongInt;          (* ensure mapped as 4 bytes *)
const
  NO_EXCEPTION     = exception_type(0);
  USER_EXCEPTION   = exception_type(1);
  SYSTEM_EXCEPTION = exception_type(2);
type
  completion_status = type LongInt;       (* ensure mapped as 4 bytes *)
const
  YES   = completion_status(0);
  NO    = completion_status(1);
  MAYBE = completion_status(2);

type
  StExcep = record
    minor: LongWord;
    completed: completion_status;
  end;

  Environment = record
    _major: exception_type;
    exception_exception_name: PAnsiChar;
    exception_params: Pointer;
    _somdAnchor: Pointer;
  end;
  PEnvironment = ^Environment;

(* CORBA 7.6.1, p.139 plus 5.7, p.89 enum Data Type Mapping *)
  TCKind = type LongWord;
const
  TypeCode_tk_null      = TCKind(1);
  TypeCode_tk_void      = TCKind(2);
  TypeCode_tk_short     = TCKind(3);
  TypeCode_tk_long      = TCKind(4);
  TypeCode_tk_ushort    = TCKind(5);
  TypeCode_tk_ulong     = TCKind(6);
  TypeCode_tk_float     = TCKind(7);
  TypeCode_tk_double    = TCKind(8);
  TypeCode_tk_boolean   = TCKind(9);
  TypeCode_tk_char      = TCKind(10);
  TypeCode_tk_octet     = TCKind(11);
  TypeCode_tk_any       = TCKind(12);
  TypeCode_tk_TypeCode  = TCKind(13);
  TypeCode_tk_Principal = TCKind(14);
  TypeCode_tk_objref    = TCKind(15);
  TypeCode_tk_struct    = TCKind(16);
  TypeCode_tk_union     = TCKind(17);
  TypeCode_tk_enum      = TCKind(18);
  TypeCode_tk_string    = TCKind(19);
  TypeCode_tk_sequence  = TCKind(20);
  TypeCode_tk_array     = TCKind(21);

  TypeCode_tk_pointer   = TCKind(101); (* SOM extension *)
  TypeCode_tk_self      = TCKind(102); (* SOM extension *)
  TypeCode_tk_foreign   = TCKind(103); (* SOM extension *)

(* Short forms of tk_<x> enumerators *)

  tk_null      = TypeCode_tk_null;
  tk_void      = TypeCode_tk_void;
  tk_short     = TypeCode_tk_short;
  tk_long      = TypeCode_tk_long;
  tk_ushort    = TypeCode_tk_ushort;
  tk_ulong     = TypeCode_tk_ulong;
  tk_float     = TypeCode_tk_float;
  tk_double    = TypeCode_tk_double;
  tk_boolean   = TypeCode_tk_boolean;
  tk_char      = TypeCode_tk_char;
  tk_octet     = TypeCode_tk_octet;
  tk_any       = TypeCode_tk_any;
  tk_TypeCode  = TypeCode_tk_TypeCode;
  tk_Principal = TypeCode_tk_Principal;
  tk_objref    = TypeCode_tk_objref;
  tk_struct    = TypeCode_tk_struct;
  tk_union     = TypeCode_tk_union;
  tk_enum      = TypeCode_tk_enum;
  tk_string    = TypeCode_tk_string;
  tk_sequence  = TypeCode_tk_sequence;
  tk_array     = TypeCode_tk_array;
  tk_pointer   = TypeCode_tk_pointer;
  tk_self      = TypeCode_tk_self;
  tk_foreign   = TypeCode_tk_foreign;

type
  TypeCode = Pointer;

(* CORBA 5.7, p.89 *)
  any = record
    _type: TypeCode;
    _value: Pointer;
  end;

function somExceptionId(ev: PEnvironment): PAnsiChar; stdcall;
function somExceptionValue(ev: PEnvironment): Pointer; stdcall;
procedure somExceptionFree(ev: PEnvironment); stdcall;
procedure somSetException(ev: PEnvironment;
    major: exception_type; exception_name: PAnsiChar; params: Pointer); stdcall;
function somGetGlobalEnvironment: PEnvironment; stdcall;

// #include <somapi.h>

(*  SOM Version Numbers  *)
function SOM_MajorVersion: LongInt; stdcall;
function SOM_MinorVersion: LongInt; stdcall;

(*  SOM Thread Support  *)
function SOM_MaxThreads: LongInt; stdcall;

(*----------------------------------------
 * Typedefs for pointers to functions
 *----------------------------------------*)

type
  somTD_SOMOutCharRoutine = function(C: AnsiChar): Integer; stdcall;
  PsomTD_SOMOutCharRoutine = ^somTD_SOMOutCharRoutine;
  somTD_SOMLoadModule = function(
    className: PAnsiChar;
    fileName: PAnsiChar;
    functionName: PAnsiChar;
    majorVersion: LongInt;
    minorVersion: LongInt;
    out modHandle: somToken): Integer; stdcall;
  PsomTD_SOMLoadModule = ^somTD_SOMLoadModule;
  somTD_SOMDeleteModule = function(modHandle: somToken): Integer; stdcall;
  PsomTD_SOMDeleteModule = ^somTD_SOMDeleteModule;
  somTD_SOMClassInitFuncName = function: PAnsiChar; stdcall;
  PsomTD_SOMClassInitFuncName = ^somTD_SOMClassInitFuncName;
  somTD_SOMMalloc = function(nbytes: UIntPtr): somToken; stdcall;
  PsomTD_SOMMalloc = ^somTD_SOMMalloc;
  somTD_SOMCalloc = function(
    element_count: UIntPtr;
    element_size: UIntPtr): somToken; stdcall;
  PsomTD_SOMCalloc = ^somTD_SOMCalloc;
  somTD_SOMRealloc = function(
    memory: somToken;
    nbytes: UIntPtr): somToken; stdcall;
  PsomTD_SOMRealloc = ^somTD_SOMRealloc;
  somTD_SOMFree = procedure(memory: somToken); stdcall;
  PsomTD_SOMFree = ^somTD_SOMFree;
  somTD_SOMError = procedure(
    code: Integer;
    fileName: PAnsiChar;
    lineNum: Integer); stdcall;
  PsomTD_SOMError = ^somTD_SOMError;


  somTD_SOMCreateMutexSem = function(out sem: somToken): LongWord; stdcall;
  PsomTD_SOMCreateMutexSem = ^somTD_SOMCreateMutexSem;
  somTD_SOMRequestMutexSem = function(sem: somToken): LongWord; stdcall;
  PsomTD_SOMRequestMutexSem = ^somTD_SOMRequestMutexSem;
  somTD_SOMReleaseMutexSem = function(sem: somToken): LongWord; stdcall;
  PsomTD_SOMReleaseMutexSem = ^somTD_SOMReleaseMutexSem;
  somTD_SOMDestroyMutexSem = function(sem: somToken): LongWord; stdcall;
  PsomTD_SOMDestroyMutexSem = ^somTD_SOMDestroyMutexSem;
  somTD_SOMGetThreadId = function: LongWord; stdcall;
  PsomTD_SOMGetThreadId = ^somTD_SOMGetThreadId;


(*----------------------------------------------------------------------
 * SOM Environment Initialization Section
 *---------------------------------------------------------------------*)

(*
 *  Create and initialize the SOM environment.
 *
 *  This function is idempotent (may be invoked redundantly)
 *
 *  Will be called automatically when first object (including a class
 *  object) is created, if it has not already been done.
 *
 *  Returns the SOMClassMgrObject
 *)
function somEnvironmentNew: PSOMClassMgr; stdcall;

procedure somEnvironmentEnd; stdcall;
function somMainProgram: PSOMClassMgr; stdcall;
function somAbnormalEnd: ByteBool; stdcall;

(*
 *  Replaceable SOM Memory Management Interfaces
 *
 *  External procedure variables SOMCalloc, SOMFree, SOMMalloc, SOMRealloc
 *  have the same interface as their standard C-library analogs.
 *)
function SOMCalloc: PsomTD_SOMCalloc;
function SOMFree: PsomTD_SOMFree;
function SOMMalloc: PsomTD_SOMMalloc;
function SOMRealloc: PsomTD_SOMRealloc;

(*
 *  Replaceable SOM Error handler
 *)
function SOMError: PsomTD_SOMError;

(*
 *  Replaceable SOM Semaphore Operations
 *
 *  These operations are used by the SOM Kernel to make thread-safe
 *  state changes to internal resources and for synchronization between
 *  the SOM services process and client SOM processes.
 *)
function SOMCreateMutexSem: PsomTD_SOMCreateMutexSem;
function SOMRequestMutexSem: PsomTD_SOMRequestMutexSem;
function SOMReleaseMutexSem: PsomTD_SOMReleaseMutexSem;
function SOMDestroyMutexSem: PsomTD_SOMDestroyMutexSem;

(*
 * 18260 -- other thread-related routines used by the kernel were
 * moved to somkp.h, to keep them local to the kernel.
 *)

(*
 *  Replaceable SOM Thread Identifier Operation
 *
 *  This operation is used by the SOM Kernel to index data unique to the
 *  currently executing thread.  It must return a small integer that
 *  uniquely represents the current thread within the current process.
 *)
function SOMGetThreadId: PsomTD_SOMGetThreadId;


(*----------------------------------------------------------------------
 * SOM Class Manager Section
 *---------------------------------------------------------------------*)

(*
 * Global class manager object
 *)
function SOMClassMgrObject: PPSOMClassMgr;

(*
 * The somRegisterClassLibrary function is provided for use in SOM class
 * libraries on platforms that have loader-invoked entry points
 * associated with shared libraries (DLLs).
 *
 * This function registers a SOM Class Library with the SOM Kernel.
 * The library is identified by its file name and a pointer to its
 * initialization routine.  Since this call may occur prior to the
 * invocation of somEnvironmentNew, its actions are deferred until the
 * SOM environment has been initialized.  At that time, the
 * SOMClassMgrObject is informed of all pending library initializations
 * via the _somRegisterClassLibrary method.  The actual invocation of
 * the library's initialization routine will occur during the execution
 * of the SOM_MainProgram macro (for statically linked libraries), or
 * during the _somFindClass method (for libraries that are dynamically
 * loaded).
 *)
procedure somRegisterClassLibrary(
    libraryName: PAnsiChar;
    libraryInitRtn: somMethodProc); stdcall;
procedure somUnregisterClassLibrary(libraryName: PAnsiChar); stdcall;

(*
 * Pointers to routines used to do dynamic code loading and deleting
 *)
function SOMLoadModule: PsomTD_SOMLoadModule;
function SOMDeleteModule: PsomTD_SOMDeleteModule;
function SOMClassInitFuncName: PsomTD_SOMClassInitFuncName;


(*----------------------------------------------------------------------
 * SOM Stream Output Section
 *---------------------------------------------------------------------*)

(*
 * Uses <SOMOutCharRoutine> to output its arguments under control of the
 * ANSI C style format.  Returns the number of characters output.
 *)

function somPrintf(fmt: PAnsiChar): Integer; cdecl; varargs;

(*
 * vprint form of somPrintf
 *)
function somVprintf(fmt: PAnsiChar; ap: va_list): Integer; stdcall;

(*
 * Outputs (via somPrintf) blanks to prefix a line at the indicated level
 *)
procedure somPrefixLevel(level: LongInt); stdcall;

(*
 * Combines somPrefixLevel and somPrintf
 *)
function somLPrintf(level: Integer; fmt: PAnsiChar): Integer; cdecl; varargs;

(*
 * Specify a thread-specific user-defined SOMOutCharRoutine
 *)
procedure somSetOutChar(outch: somTD_SOMOutCharRoutine); stdcall;

(*
 *  Replaceable character output handler.
 *  Points to the character output routine to be used in development
 *  support.  Initialized to <somOutChar>, but may be reset at anytime.
 *  Should return 0 (false) if an error occurs and 1 (true) otherwise.
 *)
function SOMOutCharRoutine: PsomTD_SOMOutCharRoutine;


(*--------------
 * Initializers
 *--------------*)

(*
 * C++-style constructors are called initializers in SOM. Initializers
 * are methods that receive a pointer to a somCtrlStruct as an argument.
 * Language bindings hide details associated with manipulating the following
 * data structures.
 *)

type
  somInitInfo = record
    cls: PSOMClass;     (* class whose introduced data is to be initialized *)
    defaultInit: somMethodProc;
    defaultCopyInit: somMethodProc;
    defaultConstCopyInit: somMethodProc;
    defaultNCArgCopyInit: somMethodProc;
    dataOffset: LongInt;
    legacyInit: somMethodProc;
  end;
  PsomInitInfo = ^somInitInfo;

  somDestructInfo = record
    cls: PSOMClass;     (* class whose introduced data is to be destroyed *)
    defaultDestruct: somMethodProc;
    dataOffset: LongInt;
    legacyUninit: somMethodProc;
  end;
  PsomDestructInfo = ^somDestructInfo;

  somAssignInfo = record
    cls: PSOMClass;     (* class whose introduced data is to be assigned *)
    defaultAssign: somMethodProc;
    defaultConstAssign: somMethodProc;
    defaultNCArgAssign: somMethodProc;
    udaAssign: somMethodProc;
    udaConstAssign: somMethodProc;
    dataOffset: LongInt;
  end;
  PsomAssignInfo = ^somAssignInfo;

  somBooleanVector = PByte;
  somCtrlInfo = type somToken;

  somInitCtrl = record
    mask: somBooleanVector; (* an array of booleans to control ancestor calls *)
    info: PsomInitInfo;     (* an array of structs *)
    infoSize: Integer;      (* increment for info access *)
    ctrlInfo: somCtrlInfo;
  end;
  somInitCtrlStruct = somInitCtrl;
  som3InitCtrl = somInitCtrl;

  somDestructCtrl = record
    mask: somBooleanVector; (* an array of booleans to control ancestor calls *)
    info: PsomDestructInfo; (* an array of structs *)
    infoSize: Integer;      (* increment for info access *)
    ctrlInfo: somCtrlInfo;
  end;
  somDestructCtrlStruct = somDestructCtrl;
  som3DestructCtrl = somDestructCtrl;

  somAssignCtrl = record
    mask: somBooleanVector; (* an array of booleans to control ancestor calls *)
    info: PsomAssignInfo;   (* an array of structs *)
    infoSize: Integer;      (* increment for info access *)
    ctrlInfo: somCtrlInfo;
  end;
  somAssignCtrlStruct = somAssignCtrl;
  som3AssignCtrl = somAssignCtrl;








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

procedure SOM_Load_Variable(var V_Pointer; const Var_Name: AnsiString);
begin
  if SOM_DLL = 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    if SOM_DLL = 0 then
      SOM_DLL := Windows.LoadLibraryW(SOM_DLL_Name);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  if SOM_DLL <> 0 then
    Pointer(V_Pointer) := Windows.GetProcAddress(SOM_DLL, PAnsiChar(Var_Name));
end;

// #include <somcdev.h>
var
  SOM_DLL_SOM_TraceLevel: PInteger;

function SOM_TraceLevel: PInteger;
begin
  if Assigned(SOM_DLL_SOM_TraceLevel) then
    Result := SOM_DLL_SOM_TraceLevel
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOM_TraceLevel, 'SOM_TraceLevel');
    Result := SOM_DLL_SOM_TraceLevel;
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
    SOM_Load_Variable(SOM_DLL_SOM_WarnLevel, 'SOM_WarnLevel');
    Result := SOM_DLL_SOM_WarnLevel;
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
    SOM_Load_Variable(SOM_DLL_SOM_AssertLevel, 'SOM_AssertLevel');
    Result := SOM_DLL_SOM_AssertLevel;
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

function somExceptionId; external SOM_DLL_Name;
function somExceptionValue; external SOM_DLL_Name;
procedure somExceptionFree; external SOM_DLL_Name;
procedure somSetException; external SOM_DLL_Name;
function somGetGlobalEnvironment; external SOM_DLL_Name;

// #include <somapi.h>

function SOM_MajorVersion; external SOM_DLL_Name;
function SOM_MinorVersion; external SOM_DLL_Name;
function SOM_MaxThreads; external SOM_DLL_Name;
function somEnvironmentNew; external SOM_DLL_Name;
procedure somEnvironmentEnd; external SOM_DLL_Name;
function somMainProgram; external SOM_DLL_Name;
function somAbnormalEnd; external SOM_DLL_Name;

var
  SOM_DLL_SOMCalloc: PsomTD_SOMCalloc;

function SOMCalloc: PsomTD_SOMCalloc;
begin
  if Assigned(SOM_DLL_SOMCalloc) then
    Result := SOM_DLL_SOMCalloc
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMCalloc, 'SOMCalloc');
    Result := SOM_DLL_SOMCalloc;
  end;
end;

var
  SOM_DLL_SOMFree: PsomTD_SOMFree;

function SOMFree: PsomTD_SOMFree;
begin
  if Assigned(SOM_DLL_SOMFree) then
    Result := SOM_DLL_SOMFree
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMFree, 'SOMFree');
    Result := SOM_DLL_SOMFree;
  end;
end;

var
  SOM_DLL_SOMMalloc: PsomTD_SOMMalloc;

function SOMMalloc: PsomTD_SOMMalloc;
begin
  if Assigned(SOM_DLL_SOMMalloc) then
    Result := SOM_DLL_SOMMalloc
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMMalloc, 'SOMMalloc');
    Result := SOM_DLL_SOMMalloc;
  end;
end;

var
  SOM_DLL_SOMRealloc: PsomTD_SOMRealloc;

function SOMRealloc: PsomTD_SOMRealloc;
begin
  if Assigned(SOM_DLL_SOMRealloc) then
    Result := SOM_DLL_SOMRealloc
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMRealloc, 'SOMRealloc');
    Result := SOM_DLL_SOMRealloc;
  end;
end;

var
  SOM_DLL_SOMError: PsomTD_SOMError;

function SOMError: PsomTD_SOMError;
begin
  if Assigned(SOM_DLL_SOMError) then
    Result := SOM_DLL_SOMError
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMError, 'SOMError');
    Result := SOM_DLL_SOMError;
  end;
end;

var
  SOM_DLL_SOMCreateMutexSem: PsomTD_SOMCreateMutexSem;

function SOMCreateMutexSem: PsomTD_SOMCreateMutexSem;
begin
  if Assigned(SOM_DLL_SOMCreateMutexSem) then
    Result := SOM_DLL_SOMCreateMutexSem
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMCreateMutexSem, 'SOMCreateMutexSem');
    Result := SOM_DLL_SOMCreateMutexSem;
  end;
end;

var
  SOM_DLL_SOMRequestMutexSem: PsomTD_SOMRequestMutexSem;

function SOMRequestMutexSem: PsomTD_SOMRequestMutexSem;
begin
  if Assigned(SOM_DLL_SOMRequestMutexSem) then
    Result := SOM_DLL_SOMRequestMutexSem
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMRequestMutexSem, 'SOMRequestMutexSem');
    Result := SOM_DLL_SOMRequestMutexSem;
  end;
end;

var
  SOM_DLL_SOMReleaseMutexSem: PsomTD_SOMReleaseMutexSem;

function SOMReleaseMutexSem: PsomTD_SOMReleaseMutexSem;
begin
  if Assigned(SOM_DLL_SOMReleaseMutexSem) then
    Result := SOM_DLL_SOMReleaseMutexSem
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMReleaseMutexSem, 'SOMReleaseMutexSem');
    Result := SOM_DLL_SOMReleaseMutexSem;
  end;
end;

var
  SOM_DLL_SOMDestroyMutexSem: PsomTD_SOMDestroyMutexSem;

function SOMDestroyMutexSem: PsomTD_SOMDestroyMutexSem;
begin
  if Assigned(SOM_DLL_SOMDestroyMutexSem) then
    Result := SOM_DLL_SOMDestroyMutexSem
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMDestroyMutexSem, 'SOMDestroyMutexSem');
    Result := SOM_DLL_SOMDestroyMutexSem;
  end;
end;

var
  SOM_DLL_SOMGetThreadId: PsomTD_SOMGetThreadId;

function SOMGetThreadId: PsomTD_SOMGetThreadId;
begin
  if Assigned(SOM_DLL_SOMGetThreadId) then
    Result := SOM_DLL_SOMGetThreadId
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMGetThreadId, 'SOMGetThreadId');
    Result := SOM_DLL_SOMGetThreadId;
  end;
end;

var
  SOM_DLL_SOMClassMgrObject: PPSOMClassMgr;

function SOMClassMgrObject: PPSOMClassMgr;
begin
  if Assigned(SOM_DLL_SOMClassMgrObject) then
    Result := SOM_DLL_SOMClassMgrObject
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMClassMgrObject, 'SOMClassMgrObject');
    Result := SOM_DLL_SOMClassMgrObject;
  end;
end;

procedure somRegisterClassLibrary; external SOM_DLL_Name;
procedure somUnregisterClassLibrary; external SOM_DLL_Name;

var
  SOM_DLL_SOMLoadModule: PsomTD_SOMLoadModule;

function SOMLoadModule: PsomTD_SOMLoadModule;
begin
  if Assigned(SOM_DLL_SOMLoadModule) then
    Result := SOM_DLL_SOMLoadModule
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMLoadModule, 'SOMLoadModule');
    Result := SOM_DLL_SOMLoadModule;
  end;
end;

var
  SOM_DLL_SOMDeleteModule: PsomTD_SOMDeleteModule;

function SOMDeleteModule: PsomTD_SOMDeleteModule;
begin
  if Assigned(SOM_DLL_SOMDeleteModule) then
    Result := SOM_DLL_SOMDeleteModule
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMDeleteModule, 'SOMDeleteModule');
    Result := SOM_DLL_SOMDeleteModule;
  end;
end;

var
  SOM_DLL_SOMClassInitFuncName: PsomTD_SOMClassInitFuncName;

function SOMClassInitFuncName: PsomTD_SOMClassInitFuncName;
begin
  if Assigned(SOM_DLL_SOMClassInitFuncName) then
    Result := SOM_DLL_SOMClassInitFuncName
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMClassInitFuncName, 'SOMClassInitFuncName');
    Result := SOM_DLL_SOMClassInitFuncName;
  end;
end;

function somPrintf; external SOM_DLL_Name;
function somVprintf; external SOM_DLL_Name;
procedure somPrefixLevel; external SOM_DLL_Name;
function somLPrintf; external SOM_DLL_Name;
procedure somSetOutChar; external SOM_DLL_Name;

var
  SOM_DLL_SOMOutCharRoutine: PsomTD_SOMOutCharRoutine;

function SOMOutCharRoutine: PsomTD_SOMOutCharRoutine;
begin
  if Assigned(SOM_DLL_SOMOutCharRoutine) then
    Result := SOM_DLL_SOMOutCharRoutine
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMOutCharRoutine, 'SOMOutCharRoutine');
    Result := SOM_DLL_SOMOutCharRoutine;
  end;
end;

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
