{$R-}
{$WARN UNSAFE_TYPE OFF}

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

  somMethodProc = function(var somSelf): Pointer; stdcall;
  somMethodPtr = somMethodProc;
  somMethodPtrPtr = ^somMethodPtr;
  somTP_somClassInitFunc = procedure(var somSelf); stdcall;

  integer1 = Byte;                     (* char is unsigned by default in VisualAge C++ *)
  integer2 = SmallInt;
  uinteger2 = Word;
  integer4 = LongInt;
  uinteger4 = LongWord;
  float4 = Single;
  float8 = Double;
  zString = PAnsiChar;                 (* NULL terminated string *)
  fString = PAnsiChar;                 (* non-terminated string  *)
  somId = type PPAnsiChar;
  somIdPtr = ^somId;
  somToken = type Pointer;             (* Uninterpretted value   *)
  somTokenPtr = ^somToken;
  signed_char = ShortInt;

// #include <somtypes.h>

  somMethodTabPtr = ^somMethodTab;
  SOMAnyStruct = record
    mtab: somMethodTabPtr;
    body: array[0 .. 0] of integer4;
  end;
  SOMAny_struct = SOMAnyStruct;

(* SOM Primitive Classes *)
  SOMObject = ^SOMAnyStruct;
  PSOMObject = ^SOMObject;
  PPSOMObject = ^PSOMObject;
  SOMClass = SOMObject;
  PSOMClass = ^SOMClass;
  PPSOMClass = ^PSOMClass;
  SOMClassMgr = SOMObject;
  PSOMClassMgr = ^SOMClassMgr;
  PPSOMClassMgr = ^PSOMClassMgr;

// #include <somcdev.h>

(*
 *  Method and Data Resolution macros
 *)

(*
 *  Method Resolution. Methods are invoked on an object o of some
 *  object class oc, where oc has immediate ancestor classes
 *  called parent classes. Macro arguments include method names
 *  (e.g., mn), object class and parent class names (e.g., ocn, pcn)
 *  and parent class positions (e.g., pcp), expressed in terms of the
 *  left-to-right ordering (beginning with 1, for the first parent)
 *  used when declaring oc's parents. The choice of resolution
 *  macro determines the method table from which methods are selected.
 *
 *  Macros are available to select a method from ...
 *)

(* from oc's mtbl, with verification of o *)
   (*  call somresolve_ but test that the object is well formed and an
       instance of the specified class or a class derived from that class *)

// function SOM_Resolve(o: SOMObject; oc: SOMClass; m: somMToken;
//   fileName: PAnsiChar = ''; lineNum: Integer = 0): somMethodProc; // (moved down)

(* from oc's mtbl, without verification of o *)
// function SOM_ResolveNoCheck(o: SOMObject; oc: SOMClass; m: somMToken): somMethodProc; // (moved down)

  (*
   * Main programs should register for SOM cleanup at exit
   *)

// function SOM_MainProgram: SOMClassMgr; // (moved down)

(*
 * Macro to get class object
 *)
// function SOM_GetClass(obj: SOMObject): SOMClass; // (moved down)

(*
 * This macro is used throughout the generated source
 * to prevent compiler warnings for unreferenced variables
 *)
// procedure SOM_IgnoreWarning(var v); // (moved down)

(* Check the validity of method resolution using the specified target  *)
(* object.  Note: this macro makes programs bigger and slower.	After  *)
(* you are confident that your program is running correctly you should *)
(* turn off this macro by defining SOM_NoTest, or adding -DSOM_NoTest  *)
(* to your makefile.						       *)

// function SOM_TestCls(obj: SOMObject; cls: SOMClass;
//   fileName: PAnsiChar = ''; lineNum: Integer = 0): SOMObject; // (moved down)

(* Control the printing of method and procedure entry messages, *)
(* 0-none, 1-user, 2-core&user *)
// function SOM_TraceLevel: PInteger; // (moved down)

(* Control the printing of warning messages, 0-none, 1-all *)
// function SOM_WarnLevel: PInteger; // (moved down)

(* Control the printing of successful assertions, 0-none, 1-user, *)
(* 2-core&user *)
// function SOM_AssertLevel: PInteger; // (moved down)

(*
 *  Scans argv looking for flags -somt, -somtc, -soma -somac -somw setting
 *  SOM_TraceLevel, SOM_AssertLevel and SOM_WarnLevel as appropriate.
 *  argv is not modified
 *)
// procedure somCheckArgs(argc: Integer; argv: PPAnsiChar); stdcall;


(*----------------------------------------------------------------------
 * SOM Implementation Section
 *---------------------------------------------------------------------*)

(*
 * Externals used in the implementation of SOM_Test and SOM_Assert,
 * but not part of the SOM API.
 *)
// procedure somTest(
//     condition: Integer;
//     severity: Integer;
//     fileName: PAnsiChar;
//     lineNum: Integer;
//     msg: PAnsiChar); stdcall; // (moved down)

// procedure somAssert(
//     condition: Integer;
//     ecode: Integer;
//     fileName: PAnsiChar;
//     lineNum: Integer;
//     msg: PAnsiChar); stdcall; // (moved down)

(*
 *  Error severity codes, these are added to the base error number to
 *  produce the full error code
 *)

// const
//   SOM_Ok            = $0;
//   SOM_Warn          = $1;
//   SOM_Ignore        = $2; (* don't do anything *)
//   SOM_Fatal         = $9; (* terminate the program *)
//   SOM_Template      = $5; (* use to identify msg templates *)
//
//   SOM_EB = 20000; // (moved down)
// function SOM_FatalCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)
// function SOM_WarnCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)
// function SOM_IgnoreCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)
// function SOM_OkCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)
// function SOM_TemplateCode(code: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)
// function SOM_MsgCode(ecode: Integer): Integer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)
//
// const
//   SOMERROR_MustOverride = SOM_EB + 18 * 10 + SOM_Fatal; // (moved down)

// #include <somcorba.h>

(* CORBA 5.7, p.89 *)
  octet = Byte;
  Poctet = PByte;
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
// const
//   NO_EXCEPTION     = exception_type(0);
//   USER_EXCEPTION   = exception_type(1);
//   SYSTEM_EXCEPTION = exception_type(2); // (moved down)
  completion_status = type LongInt;       (* ensure mapped as 4 bytes *)
// const
//   YES   = completion_status(0);
//   NO    = completion_status(1);
//   MAYBE = completion_status(2); // (moved down)

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
// const
//   TypeCode_tk_null      = TCKind(1);
//   TypeCode_tk_void      = TCKind(2);
//   TypeCode_tk_short     = TCKind(3);
//   TypeCode_tk_long      = TCKind(4);
//   TypeCode_tk_ushort    = TCKind(5);
//   TypeCode_tk_ulong     = TCKind(6);
//   TypeCode_tk_float     = TCKind(7);
//   TypeCode_tk_double    = TCKind(8);
//   TypeCode_tk_boolean   = TCKind(9);
//   TypeCode_tk_char      = TCKind(10);
//   TypeCode_tk_octet     = TCKind(11);
//   TypeCode_tk_any       = TCKind(12);
//   TypeCode_tk_TypeCode  = TCKind(13);
//   TypeCode_tk_Principal = TCKind(14);
//   TypeCode_tk_objref    = TCKind(15);
//   TypeCode_tk_struct    = TCKind(16);
//   TypeCode_tk_union     = TCKind(17);
//   TypeCode_tk_enum      = TCKind(18);
//   TypeCode_tk_string    = TCKind(19);
//   TypeCode_tk_sequence  = TCKind(20);
//   TypeCode_tk_array     = TCKind(21);
//
//   TypeCode_tk_pointer   = TCKind(101); (* SOM extension *)
//   TypeCode_tk_self      = TCKind(102); (* SOM extension *)
//   TypeCode_tk_foreign   = TCKind(103); (* SOM extension *)
//
// (* Short forms of tk_<x> enumerators *)
//
//   tk_null      = TypeCode_tk_null;
//   tk_void      = TypeCode_tk_void;
//   tk_short     = TypeCode_tk_short;
//   tk_long      = TypeCode_tk_long;
//   tk_ushort    = TypeCode_tk_ushort;
//   tk_ulong     = TypeCode_tk_ulong;
//   tk_float     = TypeCode_tk_float;
//   tk_double    = TypeCode_tk_double;
//   tk_boolean   = TypeCode_tk_boolean;
//   tk_char      = TypeCode_tk_char;
//   tk_octet     = TypeCode_tk_octet;
//   tk_any       = TypeCode_tk_any;
//   tk_TypeCode  = TypeCode_tk_TypeCode;
//   tk_Principal = TypeCode_tk_Principal;
//   tk_objref    = TypeCode_tk_objref;
//   tk_struct    = TypeCode_tk_struct;
//   tk_union     = TypeCode_tk_union;
//   tk_enum      = TypeCode_tk_enum;
//   tk_string    = TypeCode_tk_string;
//   tk_sequence  = TypeCode_tk_sequence;
//   tk_array     = TypeCode_tk_array;
//   tk_pointer   = TypeCode_tk_pointer;
//   tk_self      = TypeCode_tk_self;
//   tk_foreign   = TypeCode_tk_foreign; // (moved down)

  TypeCode = Pointer;

(* CORBA 5.7, p.89 *)
  any = record
    _type: TypeCode;
    _value: Pointer;
  end;

// function somExceptionId(ev: PEnvironment): PAnsiChar; stdcall; // (moved down)
// function somExceptionValue(ev: PEnvironment): Pointer; stdcall; // (moved down)
// procedure somExceptionFree(ev: PEnvironment); stdcall; // (moved down)
// procedure somSetException(ev: PEnvironment;
//     major: exception_type; exception_name: PAnsiChar; params: Pointer); stdcall; // (moved down)
// function somGetGlobalEnvironment: PEnvironment; stdcall; // (moved down)

(* Exception function names per CORBA 5.19, p.99 *)
// function exception_id(ev: PEnvironment): PAnsiChar; stdcall; // (moved down)
// function exception_value(ev: PEnvironment): Pointer; stdcall; // (moved down)
// procedure exception_free(ev: PEnvironment); stdcall; // (moved down)

{ #define SOM_InterfaceRepository\
    (__get_somInterfaceRepository(SOMClassMgrObject)) }

(*  Convenience macros for manipulating environment structures
 *
 *  SOM_CreateLocalEnvironment returns a pointer to an Environment.
 *  The other 3 macros all expect a single argument that is also
 *  a pointer to an Environment.  Use the create/destroy forms for
 *  a dynamic local environment and the init/uninit forms for a stack-based
 *  local environment.
 *
 *  For example
 *
 *      Environment *ev;
 *      ev = SOM_CreateLocalEnvironment ();
 *      ... Use ev in methods
 *      SOM_DestroyLocalEnvironment (ev);
 *
 *  or
 *
 *      Environment ev;
 *      SOM_InitEnvironment (&ev);
 *      ... Use &ev in methods
 *      SOM_UninitEnvironment (&ev);
 *)
// function SOM_CreateLocalEnvironment: PEnvironment; // (moved down)
// procedure SOM_DestroyLocalEnvironment(ev: PEnvironment); // (moved down)
// procedure SOM_InitEnvironment(ev: PEnvironment); // (moved down)
// procedure SOM_UninitEnvironment(ev: PEnvironment); // (moved down)

// #include <somapi.h>

(*  SOM Version Numbers  *)
// function Replaceable_SOM_MajorVersion: PLongInt; // (moved down)
// function SOM_MajorVersion: LongInt; // (moved down)
// function Replaceable_SOM_MinorVersion: PLongInt; // (moved down)
// function SOM_MinorVersion: LongInt; // (moved down)

(*  SOM Thread Support  *)
// function Replaceable_SOM_MaxThreads: PLongInt; // (moved down)
// function SOM_MaxThreads: LongInt; // (moved down)

(*----------------------------------------
 * Typedefs for pointers to functions
 *----------------------------------------*)

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
// function somEnvironmentNew: SOMClassMgr; stdcall; // (moved down)

// procedure somEnvironmentEnd; stdcall; // (moved down)
// function somMainProgram: SOMClassMgr; stdcall; // (moved down)
// function somAbnormalEnd: ByteBool; stdcall; // (moved down)

(*
 *  Replaceable SOM Memory Management Interfaces
 *
 *  External procedure variables SOMCalloc, SOMFree, SOMMalloc, SOMRealloc
 *  have the same interface as their standard C-library analogs.
 *)
// function Replaceable_SOMCalloc: PsomTD_SOMCalloc; // (moved down)
// function SOMCalloc(element_count, element_size: UIntPtr): somToken; // (moved down)
// function Replaceable_SOMFree: PsomTD_SOMFree; // (moved down)
// procedure SOMFree(memory: somToken); // (moved down)
// function Replaceable_SOMMalloc: PsomTD_SOMMalloc; // (moved down)
// function SOMMalloc(nbytes: UIntPtr): somToken; // (moved down)
// function Replaceable_SOMRealloc: PsomTD_SOMRealloc; // (moved down)
// function SOMRealloc(memory: somToken; nbytes: UIntPtr): somToken; // (moved down)

(*
 *  Replaceable SOM Error handler
 *)
// function Replaceable_SOMError: PsomTD_SOMError; // (moved down)
// procedure SOMError(
//     code: Integer;
//     fileName: PAnsiChar;
//     lineNum: Integer); // (moved down)

(*
 *  Replaceable SOM Semaphore Operations
 *
 *  These operations are used by the SOM Kernel to make thread-safe
 *  state changes to internal resources and for synchronization between
 *  the SOM services process and client SOM processes.
 *)
// function Replaceable_SOMCreateMutexSem: PsomTD_SOMCreateMutexSem; // (moved down)
// function SOMCreateMutexSem(out sem: somToken): LongWord; // (moved down)
// function Replaceable_SOMRequestMutexSem: PsomTD_SOMRequestMutexSem; // (moved down)
// function SOMRequestMutexSem(sem: somToken): LongWord; // (moved down)
// function Replaceable_SOMReleaseMutexSem: PsomTD_SOMReleaseMutexSem; // (moved down)
// function SOMReleaseMutexSem(sem: somToken): LongWord; // (moved down)
// function Replaceable_SOMDestroyMutexSem: PsomTD_SOMDestroyMutexSem; // (moved down)
// function SOMDestroyMutexSem(sem: somToken): LongWord; // (moved down)

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
// function Replaceable_SOMGetThreadId: PsomTD_SOMGetThreadId; // (moved down)
// function SOMGetThreadId: LongWord; // (moved down)


(*----------------------------------------------------------------------
 * SOM Class Manager Section
 *---------------------------------------------------------------------*)

(*
 * Global class manager object
 *)
// function Replaceable_SOMClassMgrObject: PSOMClassMgr; // (moved down)
// function SOMClassMgrObject: SOMClassMgr; // (moved down)

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
// procedure somRegisterClassLibrary(
//     libraryName: PAnsiChar;
//     libraryInitRtn: somMethodProc); stdcall; // (moved down)
// procedure somUnregisterClassLibrary(libraryName: PAnsiChar); stdcall; // (moved down)

(*
 * Pointers to routines used to do dynamic code loading and deleting
 *)
// function Replaceable_SOMLoadModule: PsomTD_SOMLoadModule; // (moved down)
// function SOMLoadModule(
//     className: PAnsiChar;
//     fileName: PAnsiChar;
//     functionName: PAnsiChar;
//     majorVersion: LongInt;
//     minorVersion: LongInt;
//     out modHandle: somToken): Integer; // (moved down)
// function Replaceable_SOMDeleteModule: PsomTD_SOMDeleteModule; // (moved down)
// function SOMDeleteModule(modHandle: somToken): Integer; // (moved down)
// function Replaceable_SOMClassInitFuncName: PsomTD_SOMClassInitFuncName; // (moved down)
// function SOMClassInitFuncName: PAnsiChar; // (moved down)


(*----------------------------------------------------------------------
 * SOM Stream Output Section
 *---------------------------------------------------------------------*)

(*
 * Uses <SOMOutCharRoutine> to output its arguments under control of the
 * ANSI C style format.  Returns the number of characters output.
 *)

// function somPrintf(fmt: PAnsiChar): Integer; cdecl; varargs; // (moved down)

(*
 * vprint form of somPrintf
 *)
// function somVprintf(fmt: PAnsiChar; ap: va_list): Integer; stdcall; // (moved down)

(*
 * Outputs (via somPrintf) blanks to prefix a line at the indicated level
 *)
// procedure somPrefixLevel(level: LongInt); stdcall; // (moved down)

(*
 * Combines somPrefixLevel and somPrintf
 *)
// function somLPrintf(level: Integer; fmt: PAnsiChar): Integer; cdecl; varargs; // (moved down)

(*
 * Specify a thread-specific user-defined SOMOutCharRoutine
 *)
// procedure somSetOutChar(outch: somTD_SOMOutCharRoutine); stdcall; // (moved down)

(*
 *  Replaceable character output handler.
 *  Points to the character output routine to be used in development
 *  support.  Initialized to <somOutChar>, but may be reset at anytime.
 *  Should return 0 (false) if an error occurs and 1 (true) otherwise.
 *)
// function Replaceable_SOMOutCharRoutine: PsomTD_SOMOutCharRoutine; // (moved down)
// function SOMOutCharRoutine(C: AnsiChar): Integer; // (moved down)


(*--------------
 * Initializers
 *--------------*)

(*
 * C++-style constructors are called initializers in SOM. Initializers
 * are methods that receive a pointer to a somCtrlStruct as an argument.
 * Language bindings hide details associated with manipulating the following
 * data structures.
 *)

  somInitInfo = record
    cls: SOMClass;     (* class whose introduced data is to be initialized *)
    defaultInit: somMethodProc;
    defaultCopyInit: somMethodProc;
    defaultConstCopyInit: somMethodProc;
    defaultNCArgCopyInit: somMethodProc;
    dataOffset: LongInt;
    legacyInit: somMethodProc;
  end;
  PsomInitInfo = ^somInitInfo;

  somDestructInfo = record
    cls: SOMClass;     (* class whose introduced data is to be destroyed *)
    defaultDestruct: somMethodProc;
    dataOffset: LongInt;
    legacyUninit: somMethodProc;
  end;
  PsomDestructInfo = ^somDestructInfo;

  somAssignInfo = record
    cls: SOMClass;     (* class whose introduced data is to be assigned *)
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
  som3InitCtrlPtr = ^somInitCtrl;

  somDestructCtrl = record
    mask: somBooleanVector; (* an array of booleans to control ancestor calls *)
    info: PsomDestructInfo; (* an array of structs *)
    infoSize: Integer;      (* increment for info access *)
    ctrlInfo: somCtrlInfo;
  end;
  somDestructCtrlStruct = somDestructCtrl;
  som3DestructCtrl = somDestructCtrl;
  som3DestructCtrlPtr = ^somDestructCtrl;

  somAssignCtrl = record
    mask: somBooleanVector; (* an array of booleans to control ancestor calls *)
    info: PsomAssignInfo;   (* an array of structs *)
    infoSize: Integer;      (* increment for info access *)
    ctrlInfo: somCtrlInfo;
  end;
  somAssignCtrlStruct = somAssignCtrl;
  som3AssignCtrl = somAssignCtrl;
  som3AssignCtrlPtr = ^somAssignCtrl;

(*-----------------------------------------------
 * Common Typedefs & Data Structures for SOM
 *----------------------------------------------*)

(*
 *  The Method Table Structure
 *)
(* -- to specify an embedded object (or array of objects). *)
  somEmbeddedObjStruct = record
    copp: PSOMClass;    (* address of class object ptr *)
    cnt: LongInt;        (* object count *)
    offset: LongInt;     (* Offset to pointer (to embedded objs) *)
  end;
  somEmbeddedObjStructPtr = ^somEmbeddedObjStruct;

  somClassInfo = type somToken;
  somClassInfoPtr = ^somClassInfo;

(* -- Method/Data Tokens -- For locating methods and data members. *)
  somMToken = type somToken;
  somMTokenPtr = ^somMToken;
  somDToken = type somToken;
  somDTokenPtr = ^somDToken;

  somMethodTab = record
    classObject: SOMClass;
    classInfo: somClassInfoPtr;
    className: PAnsiChar;
    instanceSize: LongInt; (* free *)
    dataAlignment: LongInt;
    mtabSize: LongInt; (* free *)
    protectedDataOffset: LongInt; (* from class's introduced data *)
    protectedDataToken: somDToken;
    embeddedObjs: somEmbeddedObjStructPtr;
    (* remaining structure is opaque *)
    entries: array[0 .. 0] of somMethodProc;
  end;
  somMethodTabStruct = somMethodTab;
  somMethodTabPtrPtr = ^somMethodTabPtr;

(* -- For building lists of class objects *)
  somClasses = ^somClassList;
  somClassList = record
    cls: SOMClass;
    next: somClasses;
  end;


(* -- For building lists of objects *)
  somObjects = ^somObjectList;
  somObjectList = record
    obj: SOMObject;
    next: somObjects;
  end;

(*
 * The Class Data Structures -- these are used to implement static
 * method and data interfaces to SOM objects.
 *)
(* -- (Generic) Class data Structure *)
  somClassDataStructure = record
    classObject: SOMClass; (* changed by shadowing *)
    tokens: array[0 .. 0] of somToken;    (* method tokens, etc. *)
  end;
  somClassDataStruct = somClassDataStructure;
  somClassDataStructurePtr = ^somClassDataStructure;


(*
 * A special info access structure pointed to by
 * the parentMtab entry of somCClassDataStructure.
 *)
  somTP_somRenewNoInitNoZeroThunk = procedure(var somSelf); stdcall;
  somTD_somRenewNoInitNoZeroThunk = somTP_somRenewNoInitNoZeroThunk;
  SOM_CIBPtr = ^SOM_CIB;
  som3ClassDetails = record
    mtab: somMethodTabPtr; (* this class' mtab -- changed by shadowing *)
    next: somMethodTabPtrPtr; (* parentMtabs array *)
    cib: SOM_CIBPtr;
    somRenewNoInitNoZeroThunk: somTD_somRenewNoInitNoZeroThunk; (* changed by shadowing *)
    instanceSize: LongInt;   (* changed by shadowing *)
    resolvedInits: somMethodPtrPtr;(* resolved initializers in releaseorder *)
    resolvedMTokens: somClassDataStructurePtr;   (* resolved methods for ABI2 *)
    initCtrl: somInitCtrl;
    destructCtrl: somDestructCtrl;
    assignCtrl: somAssignCtrl;
    layoutVersion: LongInt;
    extension: Pointer;
    publicDataToken: somDToken;
    protectedDataToken: somDToken;
    instanceAlignment: LongInt;
  end;
  som3ClassDetailsStruct = som3ClassDetails;
  som3ClassDetailsPtr = ^som3ClassDetails;
  somMethodTabs = som3ClassDetailsPtr;
  somParentMtabStructPtr = som3ClassDetailsPtr; (* 22552 *)

  som3ClassInfoStruct = record
    classObject: SOMClass;
    classDetails: som3ClassDetailsPtr;
  end;
  som3ClassInfoStructPtr = ^som3ClassInfoStruct;
  som3ClassInfoStructPtrPtr = ^som3ClassInfoStructPtr;


(*
 * (Generic) Auxiliary Class Data Structure
 *)
  somCClassDataStructure = record
    parentMtab: som3ClassDetailsPtr; (* so named for historical reasons *)
    instanceDataToken: somDToken;
    wrappers: array[0 .. 0] of somMethodProc; (* for valist methods *)
  end;
  somCClassDataStruct = somCClassDataStructure;
  somCClassDataStructurePtr = ^somCClassDataStructure;


(*---------------------------------
 * Method & Data Resolution
 *--------------------------------*)

(*
 * Offset-based method resolution functions
 *)
// function somResolve(obj: PSOMObject;
//                     mdata: somMToken): somMethodProc; stdcall; // (moved down)
// function somPCallResolve(obj: PSOMObject;
//                          callingCls: PSOMClass;
//                          method: somMToken): somMethodProc; stdcall; // (moved down)
// function somParentResolve(parentMtabs: somMethodTabs;
//                           mToken: somMToken): somMethodProc; stdcall; // (moved down)
// function somParentNumResolve(parentMtabs: somMethodTabs;
//                              parentNum: Integer;
//                              mToken: somMToken): somMethodProc; stdcall; // (moved down)
// function somClassResolve(cls: PSOMClass;
//                          mdata: somMToken): somMethodProc; stdcall; // (moved down)
// function somResolveTerminal(cls: PSOMClass;
//                             mdata: somMToken): somMethodProc; stdcall; // (moved down)
// function somAncestorResolve(obj: PSOMObject;(* the object *)
//                             ccds: somCClassDataStructurePtr; (* id the ancestor *)
//                             mToken: somMToken): somMethodProc; stdcall; // (moved down)
// function somResolveByName(obj: PSOMObject,
//                           methodName: PAnsiChar): somMethodProc; stdcall; // (moved down)

(*
 * Offset-based data resolution functions
 *)
// function somDataResolve(
//     obj: PSOMObject;
//     dataId: somDToken): somToken; stdcall; // (moved down)
// function somDataResolveChk(
//     obj: PSOMObject;
//     dataId: somDToken): somToken; stdcall; // (moved down)


(*-----------------------------------
 * Method Stubs -- Signature Support
 *-----------------------------------*)

(*
 * Moved from somplatf.h - was here originally
 *
 * This section defines the structures used to pass method signature
 * info to the runtime. This supports selection of generic apply stubs
 * and runtime generation of redispatchstubs when these are needed. The
 * information is registered with the runtime when methods are defined.
 *
 * When calling somAddStaticMethod, if the redispatchStub is -1, then a
 * pointer to a struct of type somApRdInfo is passed as the applyStub.
 * Otherwise, the passed redispatchstub and applystub are taken as given.
 * When calling somAddDynamicMethod, an actual apply stub must be passed.
 * Redispatch stubs for dynamic methods are not available, nor is
 * automated support for dynamic method apply stubs. The following
 * atructures only appropriate in relation to static methods.
 *
 * In SOMr2, somAddStaticMethod can be called with an actual redispatchstub
 * and applystub *ONLY* if the method doesn't return a structure. Recall
 * that no SOMr1 methods returned structures, so SOMr1 binaries obey this
 * restriction. The reason for this rule is that SOMr2 *may* use thunks,
 * and thunks need to know if a structure is returned. We therefore assume
 * that if no signature information is provided for a method through the
 * somAddStaticMethod interface, then the method returns a scalar.
 *
 * If a structure is returned, then a -1 *must* be passed to
 * somAddStaticMethod as a redispatchstub. In any case, if a -1 is passed,
 * then this means that the applystub actually points to a structure of type
 * somApRdInfo. This structure is used to hold and access signature
 * information encoded as follows.
 *
 * If the somApRdInfo pointer is NULL, then, if the runtime was built with
 * SOM_METHOD_STUBS defined, a default signature is assumed (no more than
 * a specified number of arguments, and no structure returned -- see below);
 * otherwise, the stubs are taken as somDefaultMethod (which produces a
 * runtime error when used) if dynamic stubs are not available.
 *
 * If the somApRdInfo pointer is not NULL, then the structure it points to can
 * either include (non-null) redispatch and applystubs (the method is then
 * assumed to return a structure), or null stubs followed by information needed
 * to generate necessary stubs dynamically.
 *)

  somRdAppType = type LongWord; (* method signature code -- see def below *)
  somFloatMap = array[0 .. 12] of LongWord; (* float map -- see def below *)
  somFloatMapPtr = ^somFloatMap;
  somMethodInfo = record
    callType: somRdAppType;
    va_listSize: LongInt;
    float_map: somFloatMapPtr;
  end;
  somMethodInfoStruct = somMethodInfo;
  somMethodInfoPtr = ^somMethodInfo;

  somApRdInfo = record
    rdStub: somMethodProc;
    apStub: somMethodProc;
    stubInfo: somMethodInfoPtr;
  end;
  somApRdInfoStruct = somApRdInfo;

(*
 * Values for somRdAppType are generated by summing one from column A
 * and one from column B of the following constants:
 *)

(* Column A: return type *)
// const
//   SOMRdRetsimple = somRdAppType(0);          (* Return type is a non-float fullword *)
//   SOMRdRetfloat = somRdAppType(2);           (* Return type is (single) float *)
//   SOMRdRetdouble = somRdAppType(4);          (* Return type is double *)
//   SOMRdRetlongdouble = somRdAppType(6);      (* Return type is long double *)
//   SOMRdRetaggregate = somRdAppType(8);       (* Return type is struct or union *)
//   SOMRdRetbyte = somRdAppType(10);           (* Return type is a byte *)
//   SOMRdRethalf = somRdAppType(12);           (* Return type is a (2 byte) halfword *)
//   SOMRdRetsmallaggregate = somRdAppType(14); (* Return type is a small struct or union *)

(* Column B: are there any floating point scalar arguments? *)
//   SOMRdNoFloatArgs = somRdAppType(0);
//   SOMRdFloatArgs = somRdAppType(1); // (moved down)

(*
 * The float map is an array of offsets for up to the first 13 floating point
 * arguments.  If there are fewer than 13 floating point arguments, then there
 * will be zero entries following the non-zero entries which represent the
 * float args.  A non-zero entry signals either a single- or a double-precision
 * floating point argument.  For a double-precision argument, the entry is the
 * stack frame offset.  For a single-precision argument the entry is the stack
 * frame offset + 1.  For the final floating point argument, add 2 to the
 * code that would otherwise be used.
 *)
//   SOMFMSingle = 1;           (* add to indicate single-precision *)
//   SOMFMLast = 2;             (* add to indicate last floating point arg *) // (moved down)



(*----------
 * somApply
 *----------*)

(*
 * somApply replaces direct use of applyStubs in SOM 1.0. The reason
 * for the replacement is that the SOM 1.0 style of applyStub is not
 * generally available in SOM 2.0, which uses a fixed set of applyStubs
 * according to method information in the somMethodData. In particular,
 * neither the redispatch stub nor the apply stub found in the method
 * data structure are necessarily useful as such. The method somGetRdStub
 * is now the way to get a redispatch stub, and somApply is now the
 * way to call an apply stub. If an appropriate apply stub for the
 * method indicated by md is available, then this is invoked and TRUE is
 * returned; otherwise FALSE is returned.
 *
 * The va_list passed to somApply *must* include the target object (often
 * named somSelf) as its first entry, and any single precision floating point
 * arguments being passed to the the method procedure must be represented on
 * the va_list using double precision values (i.e. ANSI standard widening
 * must have been done). retVal cannot be NULL even for methods that return void.
 *)

  somSharedMethodData = type somToken;
  somSharedMethodDataPtr = ^somSharedMethodData;

  somMethodData = record
    id: somId;
    md_type: LongWord;             (* see method types below *)
    descriptor: somId;             (* for use with IR interfaces *)
    mToken: somMToken;             (* NULL for dynamic methods *)
    method: somMethodPtr;          (* depends on resolution context *)
    shared: somSharedMethodDataPtr;(* opaque pointer *)
  end;
  somMethodDataStruct = somMethodData;
  somMethodDataPtr = ^somMethodData;

// function somApply(
//     somSelf: PSOMObject;
//     var retVal: somToken;
//     mdPtr: somMethodDataPtr;
//     ap: va_list): CORBABoolean; stdcall; // (moved down)
(*
 * The somMethodData structure is used to specify a method to somApply, or
 * simply to provide information to a user about a method. The class methods
 * somGetMethodData and somGetNthMethodData load a somMethodData structure
 * pointed to by an "out" paramter.
 *
 * Here is a discussion of the different types of method in SOM. To aid
 * understanding, we compare with C++.
 *
 *       SOM                      C++                       Comments
 *       ~~~                      ~~~                       ~~~~~~~~
 *  dynamic method          < not available >           Dynamically Resolved (1)
 *  static method           virtual member function     Dynamically Resolved (2)
 *  nonstatic method        nonstatic member function   Statically Resolved  (3)
 *  direct call procedure   static member function      Statically Resolved  (4)
 *
 * (1) Dynamic methods are resolved using name lookup -- by searching all
 *     ancestors of a class in postorder -- to locate an implementation.
 * (2) Static methods are resolved through the instance method table of a class
 *     using a method token. The token for a static method may be located statically
 *     based on the introducing class, or by using name lookup. A static method can
 *     have only one entry in a method table, and only its introducing class can
 *     provide a method token to select this entry.
 * (3) Nonstatic methods are resolved through the instance method table of a
 *     class using a method token. The method token can be located statically based
 *     on the "closest" class that provides a token for the method, or name lookup
 *     can be used. In general, a nonstatic method will have multiple entries in a
 *     method table. Different method tokens select different entries (with
 *     different implementations). In IDL, "reintroduce" is used to provide a new
 *     token for the method. In DTS C++, the class implementor reintroduces a
 *     nonstatic member function.
 * (4) Direct call procedures are resolved statically by using a static symbol
 *     provided by the "closest" class that provides the procedure. In IDL,
 *     "reintroduce" is used to provide a new implementation for the procedure; in
 *     DTS C++, the class implementation reintroduces a static member function.
 *
 * Direct call procedures are not registered with SOM classes, so only the
 * first three categories are provided in somMethodData. Bit 0 of the type
 * field is set if and only if the method is dynamic. For non-dynamic methods,
 * bit 1 is set if and only if the method is nonstatic.
 *
 *)
// function SOM_IsDynamicMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)
// function SOM_IsNonstaticMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)
// function SOM_IsStaticMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF} // (moved down)

(*-----------------------
 * Utility Functions
 *----------------------*)

(*
 * Test whether <obj> is a valid SOM object.  This test is based solely
 * on the fact that (on this architecture) the first word of a SOM
 * object is a pointer to its method table.  The test is therefore most
 * correctly understood as returning true if and only if <obj> is a
 * pointer to a pointer to a valid SOM method table.  If so, then
 * methods can be invoked on <obj>.
 *)
// function somIsObj(obj: somToken): CORBABoolean; stdcall; // (moved down)

(*
 * Verifies that the passed object is a valid instance of the passed
 * class.  A detected failure generates an error message and causes
 * program termination.  This call is automatically employed as part
 * of the C method resolution macros if the preprocessor variable
 * SOM_TestOn is defined.
 *)
// function somTestCls(
//     obj: SOMObject;
//     classObj: SOMClass;
//     fileName: CORBAString;
//     lineNumber: Integer): SOMObject; stdcall; // (moved down)

(*
 * Return the class that introduced the method represented by a given
 * method token.
 *)
// function somGetClassFromMToken(mToken: somMToken): PSOMClass; stdcall; // (moved down)


(*----------------------------------------------------------------------
 *  SOM Id Manager Section
 *---------------------------------------------------------------------*)

(*
 * typedef char* somId; // the "public" somId type (in sombtype.h)
 *
 * This above definition prevents users from building assumptions about
 * how somIds are implemented into their programs. However, a little more
 * information is useful to understand the different alternatives for
 * creating somIds.
 *
 * All somIds point to something called an idKey. The content of the
 * idKey for a somId depends on whether the somId has been registered.
 *
 * The idKey for an unregistered somId is a char* that points to a
 * null-terminated array of chars that is called the id name.
 *
 * When a somId is registered, the idKey it points to is changed to
 * point to a special structure whose representation is not made public.
 * Among other things, of course, this structure contains the address of
 * the id name. Normally the id name for a registered somId will be a copy
 * of the originally indicated name, but copying strings is expensive
 * because it requires dynamic memory allocation. As an alternative, to
 * speed up creation of somIds and minimize memory use, you can use
 * somBeginPersistentIds and somEndPersistentIds to bracket registration
 * of somIds. If you do this, you must use somRelocateIds before the
 * names for any of the "persistent" somIds that you create are changed
 * (or perhaps destroyed as a result of program termination).
 *
 * There are basically two different ways to create registered somIds:
 * from unregistered somIds, or from id names. To create registered
 * somIds from unregistered somIds, you pass the address of an idKey
 * to either somRegisterId or somCheckId; or, to register multiple
 * somIds in one step, you can pass the address of an array of idKeys
 * to somRegisterIds. To create registered somIds from id names, you
 * pass the address of the id name to either somIdFromString or
 * somIdFromStringNoFree. These routines are declared below.
 *)

(*
 * Register a somId. Returns 1 (true) if the id is a new one, and
 * 0 (false) otherwise. An id is new if no previously-registered id
 * has the same name (where name comparison is case-insensitive).
 *)
// function somRegisterId(id: somId): Integer; stdcall; // (moved down)

(*
 * Like somRegisterId, but it returns the somId as its result.
 *)
// function somCheckId(id: somId): somId; stdcall; // (moved down)

(*
 * Tell the id manager to register ids for an array of idKeys.
 * The id argument points to an idKey array of length idCount.
 * If idCount is zero, then the array is assumed to be terminated
 * by a null pointer.
 *)
// procedure somRegisterIds(idKeys: somId; idCount: LongInt); stdcall; // (moved down)

(*
 * Return a somId that must be freed (using SOMFree) when the user
 * has finished with it.
 *)
// function somIdFromString(aString: CORBAString): somId; stdcall; // (moved down)

(*
 * Return a somId that must *not* be freed when the user
 * has finished with it. This function is more efficient
 * than the previous one.
 *)
// function somIdFromStringNoFree(aString: CORBAString): somId; stdcall; // (moved down)

(*
 * Return a string that must never be freed or modified.
 *)
// function somStringFromId(id: somId): CORBAString; stdcall; // (moved down)

(*
 * Returns true (1) if the two ids are equal, else false (0).
 *)
// function somCompareIds(id1, id2: somId): Integer; stdcall; // (moved down)

(*
 * Return the total number of ids that have been registered so far, you
 * can use this to advise the SOM runtime concerning expected number of
 * ids in later executions of your program, via a call to
 * somSetExpectedIds defined below
 *)
// function somTotalRegIds: LongWord; stdcall; // (moved down)

(*
 * Tell the SOM runtime how many unique ids you expect to use during
 * the execution of your program, this can improve space and time
 * utilization slightly, this routine must be called before the SOM
 * environment is created to have any effect
 *)
// procedure somSetExpectedIds(numIds: LongWord); stdcall; // (moved down)

(*
 * Return the unique key for this id. This is the key used for
 * comparing somIds.
 *)
// function somUniqueKey(id: somId): LongWord; stdcall; // (moved down)

(*
 * Signal the beginning of an interval during which the id manager
 * need not copy strings when registering new ids (because the caller
 * knows that these strings will not be destroyed or modified without
 * first calling somRelocateIds for each "persistent" id registered
 * during the interval).
 *)
// procedure somBeginPersistentIds; stdcall; // (moved down)

(*
 * End the interval started with somBeginPersistentIds. Tells the
 * id manager that strings for any new ids subsequently registered
 * may be freed or otherwise modified without first calling somRelocateIds.
 * Therefore the id manager must copy the strings remember the name of an
 * id.
 *)
// procedure somEndPersistentIds; stdcall; // (moved down)

(*
 * Tell the id manager to replace the names for the specified registered
 * ids with dynamically allocated copies. The id argument points to an
 * array of char* variables of length idCount. If idCount is zero,
 * then the array is assumed to be terminated by a null pointer.
 *)
// procedure somRelocateIds(id: somId; idCount: LongInt); stdcall; // (moved down)


(*----------------------------------------------------------------------
 * SOM Class Construction Section

 -- somBuildClass  introduced by SOM 2.0, SCI augmented for SOM 2.1
 -- somBuildClass2 introduced by SOM 3.0

 *---------------------------------------------------------------------*)

(* -- somBuildClass
 *
 * somBuildClass automates construction of a new class object. A variety of
 * special structures are used to allow language bindings to statically define
 * the information necessary to specify a class. Pointers to these static
 * structures are accumulated into an overall "static class information"
 * structure or SCI, passed to somBuildClass. The SCI has evolved over time.
 * The current version is defined here.
 *
 * The arguments to somBuildClass are as follows:
 *
 *   inherit_vars: a bit mask used to control inheritance of
 *                 implementation. Implementation is inherited from
 *                 parent i iff the bit 1<<i is on, or i>=32.
 *
 *   sci:          the somStaticClassInfo defined below.
 *
 *   majorVersion, minorVersion: the version of the class implementation.
 *)

(* to specify a new static method *)
  somStaticMethodStruct = record
    classData: somMTokenPtr;
    methodId: somIdPtr;   (* this must be a simple name (no colons) *)
    methodDescriptor: somIdPtr;
    method: somMethodProc;
    redispatchStub: somMethodProc;
    applyStub: somMethodProc;
  end;
  somStaticMethod_t = somStaticMethodStruct;
  somStaticMethodStructPtr = ^somStaticMethodStruct;

(* to specify an overridden method *)
  somOverideMethodStruct = record
    methodId: somIdPtr;   (* this can be a method descriptor *)
    method: somMethodProc;
  end;
  somOverrideMethod_t = somOverideMethodStruct;
  somOverideMethodStructPtr = ^somOverideMethodStruct;

(* to inherit a specific parent's method implementation *)
  somInheritedMethodStruct = record
    methodId: somIdPtr;   (* identify the method *)
    parentNum: LongInt;   (* identify the parent *)
    mToken: somMTokenPtr; (* for parentNumresolve *)
  end;
  somInheritedMethod_t = somInheritedMethodStruct;
  somInheritedMethodStructPtr = ^somInheritedMethodStruct;

(* to register a method that has been moved from this *)
(* class <cls> upwards in the class hierachy to class <dest> *)
  somMigratedMethodStruct = record
    clsMToken: somMTokenPtr;  (* points into the <cls> classdata structure *)
                              (* the method token in <dest> will copied here *)
    destMToken: somMTokenPtr; (* points into the <dest> classdata structure *)
                              (* the method token here will be copied to <cls> *)
  end;
  somMigratedMethod_t = somMigratedMethodStruct;
  somMigratedMethodStructPtr = ^somMigratedMethodStruct;

(* to specify non-internal data *)
  somNonInternalDataStruct = record
    classData: somDTokenPtr;
    basisForDataOffset: PAnsiChar;
  end;
  somNonInternalData_t = somNonInternalDataStruct;
  somNonInternalDataStructPtr = ^somNonInternalDataStruct;

(* to specify a "procedure" or "staticdata" *)
  somProcMethodsStruct = record
    classData: somMethodPtrPtr;
    pEntry: somMethodProc;
  end;
  somProcMethods_t = somProcMethodsStruct;
  somProcMethodsStructPtr = ^somProcMethodsStruct;

(*
 * to specify a general method "action" using somMethodStruct. The
 * type of action is specified in the type field of somMethodStruct.
 *
 * action (in type & 0xFF)
 *  0: static -- (i.e., virtual) uses somAddStaticMethod
 *  1: dynamic -- uses somAddDynamicMethod (classData==0)
 *  2: nonstatic -- (i.e., nonvirtual) uses somAddMethod
 *  3: udaAssign -- registers a method as the udaAssign
 *                  (but doesn't add the method)
 *  4: udaConstAssign -- like 3, this doesn't add the method
 *  5: somClassResolve Override (using the class pointed to by *classData)
 *  6: somMToken Override (using the method token pointed to by methodId)
 *                        (note: classData==0 for this)
 *  7: classAllocate -- indicates the default heap allocator for this class.
 *                 If classData == 0, then method is the code address (or NULL)
 *                 If classData != 0, then *classData is the code address.
 *                 No other info required (or used)
 *  8: classDeallocate -- like 7, but indicates the default heap deallocator.
 *  9: classAllocator -- indicates a non default heap allocator for this class.
 *                       like 7, but a methodDescriptor can be given.
 *
 *)

  somMethodStruct = record
    md_type: LongWord;
    classData: somMTokenPtr;
    methodId: somIdPtr;
    methodDescriptor: somIdPtr;
    method: somMethodProc;
    redispatchStub: somMethodProc;
    applyStub: somMethodProc;
  end;
  somMethods_t = somMethodStruct;
  somMethodStructPtr = ^somMethodStruct;

(* to specify a varargs function *)
  somVarargsFuncsStruct = record
    classData: somMethodPtrPtr;
    vEntry: somMethodProc;
  end;
  somVarargsFuncs_t = somVarargsFuncsStruct;
  somVarargsFuncsStructPtr = ^somVarargsFuncsStruct;

(* to specify dynamically computed information (incl. embbeded objs) *)
  somDynamicSCI = record
    version: Integer;                      (* 1 for now *)
    instanceDataSize: LongInt;             (* true size (incl. embedded objs) *)
    dataAlignment: LongInt;                (* true alignment *)
    embeddedObjs: somEmbeddedObjStructPtr; (* array end == null copp *)
  end;
  somDynamicSCIPtr = ^somDynamicSCI;

(*
 * to specify a DTS class, use the somDTSClass entry in the following
 * data structure. This entry is a bit vector interpreted as follows:
 *
 * (somDTSClass & 0x0001) == the class is a DTS C++ class
 *)

(*
 *  The Static Class Info Structure passed to somBuildClass
 *)
  somStaticClassInfo = record
    layoutVersion: LongWord;  (* 3 *)
    numStaticMethods: LongWord;       (* count of smt entries *)
    numStaticOverrides: LongWord;     (* count of omt entries *)
    numNonInternalData: LongWord;     (* count of nit entries *)
    numProcMethods: LongWord;         (* count of pmt entries *)
    numVarargsFuncs: LongWord;        (* count of vft entries *)
    majorVersion: LongWord;
    minorVersion: LongWord;
    instanceDataSize: LongWord;       (* instance data introduced by this class *)
    maxMethods: LongWord;             (* count numStaticMethods and numMethods *)
    numParents: LongWord;
    classId: somId;
    explicitMetaId: somId;
    implicitParentMeta: LongInt;
    parents: somIdPtr;
    cds: somClassDataStructurePtr;
    ccds: somCClassDataStructurePtr;
    smt: somStaticMethodStructPtr;    (* basic "static" methods for mtab *)
    omt: somOverideMethodStructPtr;   (* overrides for mtab *)
    nitReferenceBase: PAnsiChar;
    nit: somNonInternalDataStructPtr; (* datatokens for instance data *)
    pmt: somProcMethodsStructPtr;     (* Arbitrary ClassData members *)
    vft: somVarargsFuncsStructPtr; (* varargs stubs *)
    cif: somTP_somClassInitFunc; (* class init function *)
    (* end of layout version 1 *)

    (* begin layout version 2 extensions *)
    dataAlignment: LongInt; (* the desired byte alignment for instance data *)
    (* end of layout version 2 *)

// const
//   SOMSCIVERSION = 1; // (moved down)

    (* begin layout version 3 extensions *)
    numDirectInitClasses: LongInt;
    directInitClasses: somIdPtr;
    numMethods: LongWord; (* general (including nonstatic) methods for mtab *)
    mt: somMethodStructPtr;
    protectedDataOffset: LongWord; (* access = resolve(instanceDataToken) + offset *)
    somSCIVersion: LongWord;  (* used during development. currently = 1 *)
    numInheritedMethods: LongWord;
    imt: somInheritedMethodStructPtr; (* inherited method implementations *)
    numClassDataEntries: LongWord; (* should always be filled in *)
    classDataEntryNames: somIdPtr; (* either NULL or ptr to an array of somIds *)
    numMigratedMethods: LongWord;
    mmt: somMigratedMethodStructPtr; (* migrated method implementations *)
    numInitializers: LongWord; (* the initializers for this class *)
    initializers: somIdPtr;     (* in order of release *)
    somDTSClass: LongWord; (* used to identify a DirectToSOM class *)
    dsci: somDynamicSCIPtr;  (* used to register dynamically computed info *)
    (* end of layout version 3 *)

  end;
  somStaticClassInfoStruct = somStaticClassInfo;
  somStaticClassInfoPtr = ^somStaticClassInfo;

// function somBuildClass(inherit_vars: LongInt;
//                        sci: somStaticClassInfoPtr;
//                        majorVersion, minorVersion: LongInt): PSOMClass; stdcall; // (moved down)


(*
 * -- somBuildClass2
 *
 * somBuildClass2 was added in SOM 3.0 to allow reuse of static class
 * information to hold a class's instance variables. This speeds class
 * creation, and reduces the need for dynamically allocated memory. The
 * static class information structures are accumulated into a CIB (class
 * initialization block) instead of the SCI structure used with
 * somBuildClass.
 *)

(*
 * to register a method that has been moved from this
 * class <orig> upwards in the class hierachy to class <dest>
 *)
  somMigratedMethod_t2 = record
    methodId: somId;            (* id of the method being migrated *)
    abi2TokenAddr: somMTokenPtr; (* if abi2, this class's classData field addr *)
    abi3SymbolAddr: somTokenPtr;  (* if abi3, this class's method symbol addr *)
  end;
  somMigratedMethodStruct_t2 = somMigratedMethod_t2;
  somMigratedMethodPtr_t2 = ^somMigratedMethod_t2;

(*
 * to select a specific ancestor's implementation for an inherited method
 *)
  somInheritedMethod_t2 = record
    methodId: somId;
    parentNum: LongInt;
    ancestorClass: PSOMClass;
  end;
  somInheritedMethodStruct_t2 = somInheritedMethod_t2;
  somInheritedMethodPtr_t2 = ^somInheritedMethod_t2;

(*
 * to register a normal method override
 *)
  somOverrideMethod_t2 = record
    methodId: somId;
    pcall: somMethodPtrPtr;
    pcallResolve: somMethodPtr;
    methodProc: somMethodPtr;
  end;
  somOverideMethodStruct_t2 = somOverrideMethod_t2;
  somOverrideMethodPtr_t2 = ^somOverrideMethod_t2;

  somRedispatchInfo = record
    md: somMethodData;
    dispatchFcn: somMethodProc;
    (* ... arbitrary remaining structure known to dispatchFcn *)
  end;
  somRedispatchInfoPtr = ^somRedispatchInfo;

(*
 * to register information for a new method
 *)
  somMethodDefn = record
    md_type: LongWord;
    descriptor: somId;
    mToken: somMToken; (* address of method symbol if one exists *)
    method: somMethodPtr; (* address of method proc *)
    redispatchStub: somMethodPtr;    (* either these 2 *)
    applyStub: somMethodPtr;
    methodInfo: somMethodInfoPtr;    (* or this 1 *)
    tokenLoc: somMTokenPtr;          (* address of ClassData field *)
    redispatchInfo: somRedispatchInfoPtr; (* rdstub desired (we'll fill in md) *)
    layoutVersion: LongInt;
  end;
  somMethodDefnPtr = ^somMethodDefn;


(*
 * class variables that don't change after class intialization
 *)
  somClassVars1 = record
    layoutVersion: LongInt; (* 1 *)
    extension: Pointer;
    dataSize: LongInt;
    dataAlignment: LongInt;
    classAllocate: somMethodProc;
    classDeallocate: somMethodProc;
  end;
  somClassVars1Struct = somClassVars1;
  somClassVars1Ptr = ^somClassVars1;


(*
 * storage addressed by a method symbol
 *)
  somMethodSymbol = record
    content: array[0 .. 3] of AnsiChar;
  end;
  somMethodSymbolBindingStruct = somMethodSymbol;
  somMethodSymbolBinding = ^somMethodSymbol;

(*
 * Overrides for SOMObject Specials
 *)
  somSpecialOverrides = record
    ctorThunk: somMethodSymbolBinding;
    resolvedThunk: somMethodSymbolBinding; (* #13082 *)
    methodProc: somMethodPtr;
  end;
  somSpecialOverridesStruct = somSpecialOverrides;
  somSpecialOverridesPtr = ^somSpecialOverrides;

(*
 * (non-SOMObject) initializer symbols (#13082)
 *)
  somInitSymbols = record
    methodId: somId;
    ctorThunk: somMethodSymbolBinding;
    resolvedThunk: somMethodSymbolBinding;
  end;
  somInitSymbolsStruct = somInitSymbols;
  somInitSymbolsPtr = ^somInitSymbols;


(*
 * CIB
 *)

  SOM_CIB = record
    layoutVersion:          LongInt;
    classVars1:             somClassVars1Ptr;
    unsharedVars:           PPointer;
    majorVersion:           LongInt;
    minorVersion:           LongInt;
    constFlags:             LongWord;
    inheritVars:            LongWord;
    classMeta:              PSOMClass;
    classInit:              somMethodPtr;
    classUninit:            somMethodPtr;
    legacyInit:             somMethodPtr;
    legacyUninit:           somMethodPtr;
    udaAssign:              somMethodPtr;
    udaConstAssign:         somMethodPtr;
    protectedDataOffset:    LongInt;
    numEmbeddedObjs:        LongInt;
    embeddedObjs:           somEmbeddedObjStructPtr;
    numRegIds:              LongInt;
    regIds:                 PPAnsiChar;
    numClassDataEntries:    LongInt;
    somClassData:           somClassDataStructurePtr;
    somCClassData:          somCClassDataStructurePtr;
    som3ClassInfo:          som3ClassInfoStructPtr;
    numParents:             LongInt;
    parents:                PPSOMClass;
    numDirectInitClasses:   LongInt;
    directInitClasses:      PPSOMClass;
    numNewInitializers:     LongInt;
    newInitializerSymbols:  somInitSymbolsPtr;
    numOvInitializers:      LongInt;
    ovInitializerSymbols:   somInitSymbolsPtr;
    specialOverrides:       somSpecialOverridesPtr;
    maxNDMethods:           LongInt;
    newNDMethods:           somMethodDefnPtr;
    numOverrides:           LongInt;
    overrides:              somOverrideMethodPtr_t2;
    numInheritedSelections: LongInt;
    inheritedSelections:    somInheritedMethodPtr_t2;
    numMigratedMethods:     LongInt;
    migratedMethods:        somMigratedMethodPtr_t2;
  end;


// function somBuildClass2(cib: SOM_CIBPtr,
//                         requestedMajorVersion,
//                         requestedMinorVersion: LongInt): PSOMClass; stdcall; // (moved down)

(*
 *  Used by old single-inheritance emitters to make class creation
 *  an atomic operation. Kept for backwards compatability only.
 *)
  somTD_classInitRoutine = procedure(
    parent_class,
    metaclass: SOMClass); stdcall;
// procedure somConstructClass(
//     classInitRoutine: somTD_classInitRoutine;
//     parentClass,
//     metaClass: PSOMClass;
//     cds: somClassDataStructurePtr); stdcall; // (moved down)

(*
 * somRegisterLibraryClasses - the parameters are defined as follows:
 * 1. libHandle is the operating system-dependent library handle that
 *    is returned by the operating system's "load library" function.
 *    See somplatf.h for the definition of the somLibraryHandle type.
 * 2. numClasses is the number of SOM classes in the library.
 * 3. classInfoStructs is a pointer to an array of pointers to
 *    som3ClassInfoStruct (one for each class in the library).
 *    The array must be a static variable, so the pointer to this
 *    array will be valid after the call has completed.
 * 4. userInitRoutine may either be NULL or the address of an
 *    initialization function to be called.
 *)
  userInitTermProc = procedure(libHandle: somLibraryHandle; num: LongWord); stdcall;

// function somRegisterLibraryClasses(
//                           libHandle: somLibraryHandle;
//                           numClasses: LongInt;
//                           classInfoStructs: som3ClassInfoStructPtrPtr;
//                           userInitTermRoutine: userInitTermProc): LongInt; stdcall; // (moved down)
// function somUnregisterLibraryClasses(libHandle: somLibraryHandle): LongInt; stdcall; // (moved down)



// !---- constants and functions -------------------------------------------!



// SOM API has forward type definitions across different headers
// Starting from SOMAny, every type has to be defined in a single
// type block to make it valid in Delphi.
// Procedures and constants were commented and moved here to make
// type block contiguous

// #include <somtypes.h>

//   somMethodTabPtr = ^somMethodTab;
//   SOMAny = record
//     mtab: somMethodTabPtr;
//     body: array[0 .. 0] of integer4;
//   end;
//   SOMAny_struct = SOMAny;

(* SOM Primitive Classes *)
//   SOMObject = type SOMAny;
//   PSOMObject = ^SOMObject;
//   PPSOMObject = ^PSOMObject;
//   PPPSOMObject = ^PPSOMObject;
//   SOMClass = SOMObject;
//   PSOMClass = ^SOMClass;
//   PPSOMClass = ^PSOMClass;
//   PPPSOMClass = ^PPSOMClass;
//   SOMClassMgr = SOMClass;
//   PSOMClassMgr = ^SOMClassMgr;
//   PPSOMClassMgr = ^PSOMClassMgr;
//   PPPSOMClassMgr = ^PPSOMClassMgr;

// #include <somcdev.h>

(*
 *  Method and Data Resolution macros
 *)

(*
 *  Method Resolution. Methods are invoked on an object o of some
 *  object class oc, where oc has immediate ancestor classes
 *  called parent classes. Macro arguments include method names
 *  (e.g., mn), object class and parent class names (e.g., ocn, pcn)
 *  and parent class positions (e.g., pcp), expressed in terms of the
 *  left-to-right ordering (beginning with 1, for the first parent)
 *  used when declaring oc's parents. The choice of resolution
 *  macro determines the method table from which methods are selected.
 *
 *  Macros are available to select a method from ...
 *)

(* from oc's mtbl, with verification of o *)
   (*  call somresolve_ but test that the object is well formed and an
       instance of the specified class or a class derived from that class *)

function SOM_Resolve(o: SOMObject; oc: SOMClass; m: somMToken;
  fileName: PAnsiChar = nil; lineNum: Integer = 0): somMethodProc;

(* from oc's mtbl, without verification of o *)
function SOM_ResolveNoCheck(o: SOMObject; oc: SOMClass; m: somMToken): somMethodProc;

  (*
   * Main programs should register for SOM cleanup at exit
   *)

function SOM_MainProgram: SOMClassMgr;

(*
 * Macro to get class object
 *)
function SOM_GetClass(obj: SOMObject): SOMClass;

(*
 * This macro is used throughout the generated source
 * to prevent compiler warnings for unreferenced variables
 *)
procedure SOM_IgnoreWarning(var v);

(* Check the validity of method resolution using the specified target  *)
(* object.  Note: this macro makes programs bigger and slower.	After  *)
(* you are confident that your program is running correctly you should *)
(* turn off this macro by defining SOM_NoTest, or adding -DSOM_NoTest  *)
(* to your makefile.						       *)

function SOM_TestCls(obj: SOMObject; cls: SOMClass;
  fileName: PAnsiChar = nil; lineNum: Integer = 0): SOMObject;

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
procedure somTest(
    condition: Integer;
    severity: Integer;
    fileName: PAnsiChar;
    lineNum: Integer;
    msg: PAnsiChar); stdcall;

procedure somAssert(
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
//   octet = Byte;
//   Poctet = PByte;
//   CORBAString = PAnsiChar;
//   CORBABoolean = ByteBool;



(* CORBA 7.5.1, p. 129 *)
//   Identifier = CORBAString;

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
//   exception_type = type LongInt;          (* ensure mapped as 4 bytes *)
const
  NO_EXCEPTION     = exception_type(0);
  USER_EXCEPTION   = exception_type(1);
  SYSTEM_EXCEPTION = exception_type(2);
//   completion_status = type LongInt;       (* ensure mapped as 4 bytes *)
const
  YES   = completion_status(0);
  NO    = completion_status(1);
  MAYBE = completion_status(2);

//   StExcep = record
//     minor: LongWord;
//     completed: completion_status;
//   end;

//   Environment = record
//     _major: exception_type;
//     exception_exception_name: PAnsiChar;
//     exception_params: Pointer;
//     _somdAnchor: Pointer;
//   end;
//   PEnvironment = ^Environment;

(* CORBA 7.6.1, p.139 plus 5.7, p.89 enum Data Type Mapping *)
//   TCKind = type LongWord;
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

//   TypeCode = Pointer;

(* CORBA 5.7, p.89 *)
//   any = record
//     _type: TypeCode;
//     _value: Pointer;
//   end;

function somExceptionId(ev: PEnvironment): PAnsiChar; stdcall;
function somExceptionValue(ev: PEnvironment): Pointer; stdcall;
procedure somExceptionFree(ev: PEnvironment); stdcall;
procedure somSetException(ev: PEnvironment;
    major: exception_type; exception_name: PAnsiChar; params: Pointer); stdcall;
function somGetGlobalEnvironment: PEnvironment; stdcall;

(* Exception function names per CORBA 5.19, p.99 *)
function exception_id(ev: PEnvironment): PAnsiChar; stdcall;
function exception_value(ev: PEnvironment): Pointer; stdcall;
procedure exception_free(ev: PEnvironment); stdcall;

{ #define SOM_InterfaceRepository\
    (__get_somInterfaceRepository(SOMClassMgrObject)) }

(*  Convenience macros for manipulating environment structures
 *
 *  SOM_CreateLocalEnvironment returns a pointer to an Environment.
 *  The other 3 macros all expect a single argument that is also
 *  a pointer to an Environment.  Use the create/destroy forms for
 *  a dynamic local environment and the init/uninit forms for a stack-based
 *  local environment.
 *
 *  For example
 *
 *      Environment *ev;
 *      ev = SOM_CreateLocalEnvironment ();
 *      ... Use ev in methods
 *      SOM_DestroyLocalEnvironment (ev);
 *
 *  or
 *
 *      Environment ev;
 *      SOM_InitEnvironment (&ev);
 *      ... Use &ev in methods
 *      SOM_UninitEnvironment (&ev);
 *)
function SOM_CreateLocalEnvironment: PEnvironment;
procedure SOM_DestroyLocalEnvironment(ev: PEnvironment);
procedure SOM_InitEnvironment(ev: PEnvironment);
procedure SOM_UninitEnvironment(ev: PEnvironment);

// #include <somapi.h>

(*  SOM Version Numbers  *)
function Replaceable_SOM_MajorVersion: PLongInt;
function SOM_MajorVersion: LongInt;
function Replaceable_SOM_MinorVersion: PLongInt;
function SOM_MinorVersion: LongInt;

(*  SOM Thread Support  *)
function Replaceable_SOM_MaxThreads: PLongInt;
function SOM_MaxThreads: LongInt;

(*----------------------------------------
 * Typedefs for pointers to functions
 *----------------------------------------*)

//   somTD_SOMOutCharRoutine = function(C: AnsiChar): Integer; stdcall;
//   PsomTD_SOMOutCharRoutine = ^somTD_SOMOutCharRoutine;
//   somTD_SOMLoadModule = function(
//     className: PAnsiChar;
//     fileName: PAnsiChar;
//     functionName: PAnsiChar;
//     majorVersion: LongInt;
//     minorVersion: LongInt;
//     out modHandle: somToken): Integer; stdcall;
//   PsomTD_SOMLoadModule = ^somTD_SOMLoadModule;
//   somTD_SOMDeleteModule = function(modHandle: somToken): Integer; stdcall;
//   PsomTD_SOMDeleteModule = ^somTD_SOMDeleteModule;
//   somTD_SOMClassInitFuncName = function: PAnsiChar; stdcall;
//   PsomTD_SOMClassInitFuncName = ^somTD_SOMClassInitFuncName;
//   somTD_SOMMalloc = function(nbytes: UIntPtr): somToken; stdcall;
//   PsomTD_SOMMalloc = ^somTD_SOMMalloc;
//   somTD_SOMCalloc = function(
//     element_count: UIntPtr;
//     element_size: UIntPtr): somToken; stdcall;
//   PsomTD_SOMCalloc = ^somTD_SOMCalloc;
//   somTD_SOMRealloc = function(
//     memory: somToken;
//     nbytes: UIntPtr): somToken; stdcall;
//   PsomTD_SOMRealloc = ^somTD_SOMRealloc;
//   somTD_SOMFree = procedure(memory: somToken); stdcall;
//   PsomTD_SOMFree = ^somTD_SOMFree;
//   somTD_SOMError = procedure(
//     code: Integer;
//     fileName: PAnsiChar;
//     lineNum: Integer); stdcall;
//   PsomTD_SOMError = ^somTD_SOMError;


//   somTD_SOMCreateMutexSem = function(out sem: somToken): LongWord; stdcall;
//   PsomTD_SOMCreateMutexSem = ^somTD_SOMCreateMutexSem;
//   somTD_SOMRequestMutexSem = function(sem: somToken): LongWord; stdcall;
//   PsomTD_SOMRequestMutexSem = ^somTD_SOMRequestMutexSem;
//   somTD_SOMReleaseMutexSem = function(sem: somToken): LongWord; stdcall;
//   PsomTD_SOMReleaseMutexSem = ^somTD_SOMReleaseMutexSem;
//   somTD_SOMDestroyMutexSem = function(sem: somToken): LongWord; stdcall;
//   PsomTD_SOMDestroyMutexSem = ^somTD_SOMDestroyMutexSem;
//   somTD_SOMGetThreadId = function: LongWord; stdcall;
//   PsomTD_SOMGetThreadId = ^somTD_SOMGetThreadId;


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
function somEnvironmentNew: SOMClassMgr; stdcall;

procedure somEnvironmentEnd; stdcall;
function somMainProgram: SOMClassMgr; stdcall;
function somAbnormalEnd: ByteBool; stdcall;

(*
 *  Replaceable SOM Memory Management Interfaces
 *
 *  External procedure variables SOMCalloc, SOMFree, SOMMalloc, SOMRealloc
 *  have the same interface as their standard C-library analogs.
 *)
function Replaceable_SOMCalloc: PsomTD_SOMCalloc;
function SOMCalloc(element_count, element_size: UIntPtr): somToken;
function Replaceable_SOMFree: PsomTD_SOMFree;
procedure SOMFree(memory: somToken);
function Replaceable_SOMMalloc: PsomTD_SOMMalloc;
function SOMMalloc(nbytes: UIntPtr): somToken;
function Replaceable_SOMRealloc: PsomTD_SOMRealloc;
function SOMRealloc(memory: somToken; nbytes: UIntPtr): somToken;

(*
 *  Replaceable SOM Error handler
 *)
function Replaceable_SOMError: PsomTD_SOMError;
procedure SOMError(
    code: Integer;
    fileName: PAnsiChar;
    lineNum: Integer);

(*
 *  Replaceable SOM Semaphore Operations
 *
 *  These operations are used by the SOM Kernel to make thread-safe
 *  state changes to internal resources and for synchronization between
 *  the SOM services process and client SOM processes.
 *)
function Replaceable_SOMCreateMutexSem: PsomTD_SOMCreateMutexSem;
function SOMCreateMutexSem(out sem: somToken): LongWord;
function Replaceable_SOMRequestMutexSem: PsomTD_SOMRequestMutexSem;
function SOMRequestMutexSem(sem: somToken): LongWord;
function Replaceable_SOMReleaseMutexSem: PsomTD_SOMReleaseMutexSem;
function SOMReleaseMutexSem(sem: somToken): LongWord;
function Replaceable_SOMDestroyMutexSem: PsomTD_SOMDestroyMutexSem;
function SOMDestroyMutexSem(sem: somToken): LongWord;

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
function Replaceable_SOMGetThreadId: PsomTD_SOMGetThreadId;
function SOMGetThreadId: LongWord;


(*----------------------------------------------------------------------
 * SOM Class Manager Section
 *---------------------------------------------------------------------*)

(*
 * Global class manager object
 *)
function Replaceable_SOMClassMgrObject: PSOMClassMgr;
function SOMClassMgrObject: SOMClassMgr;

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
function Replaceable_SOMLoadModule: PsomTD_SOMLoadModule;
function SOMLoadModule(
    className: PAnsiChar;
    fileName: PAnsiChar;
    functionName: PAnsiChar;
    majorVersion: LongInt;
    minorVersion: LongInt;
    out modHandle: somToken): Integer;
function Replaceable_SOMDeleteModule: PsomTD_SOMDeleteModule;
function SOMDeleteModule(modHandle: somToken): Integer;
function Replaceable_SOMClassInitFuncName: PsomTD_SOMClassInitFuncName;
function SOMClassInitFuncName: PAnsiChar;


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
function Replaceable_SOMOutCharRoutine: PsomTD_SOMOutCharRoutine;
function SOMOutCharRoutine(C: AnsiChar): Integer;


(*--------------
 * Initializers
 *--------------*)

(*
 * C++-style constructors are called initializers in SOM. Initializers
 * are methods that receive a pointer to a somCtrlStruct as an argument.
 * Language bindings hide details associated with manipulating the following
 * data structures.
 *)

//   somInitInfo = record
//     cls: PSOMClass;     (* class whose introduced data is to be initialized *)
//     defaultInit: somMethodProc;
//     defaultCopyInit: somMethodProc;
//     defaultConstCopyInit: somMethodProc;
//     defaultNCArgCopyInit: somMethodProc;
//     dataOffset: LongInt;
//     legacyInit: somMethodProc;
//   end;
//   PsomInitInfo = ^somInitInfo;

//   somDestructInfo = record
//     cls: PSOMClass;     (* class whose introduced data is to be destroyed *)
//     defaultDestruct: somMethodProc;
//     dataOffset: LongInt;
//     legacyUninit: somMethodProc;
//   end;
//   PsomDestructInfo = ^somDestructInfo;

//   somAssignInfo = record
//     cls: PSOMClass;     (* class whose introduced data is to be assigned *)
//     defaultAssign: somMethodProc;
//     defaultConstAssign: somMethodProc;
//     defaultNCArgAssign: somMethodProc;
//     udaAssign: somMethodProc;
//     udaConstAssign: somMethodProc;
//     dataOffset: LongInt;
//   end;
//   PsomAssignInfo = ^somAssignInfo;

//   somBooleanVector = PByte;
//   somCtrlInfo = type somToken;

//   somInitCtrl = record
//     mask: somBooleanVector; (* an array of booleans to control ancestor calls *)
//     info: PsomInitInfo;     (* an array of structs *)
//     infoSize: Integer;      (* increment for info access *)
//     ctrlInfo: somCtrlInfo;
//   end;
//   somInitCtrlStruct = somInitCtrl;
//   som3InitCtrl = somInitCtrl;

//   somDestructCtrl = record
//     mask: somBooleanVector; (* an array of booleans to control ancestor calls *)
//     info: PsomDestructInfo; (* an array of structs *)
//     infoSize: Integer;      (* increment for info access *)
//     ctrlInfo: somCtrlInfo;
//   end;
//   somDestructCtrlStruct = somDestructCtrl;
//   som3DestructCtrl = somDestructCtrl;

//   somAssignCtrl = record
//     mask: somBooleanVector; (* an array of booleans to control ancestor calls *)
//     info: PsomAssignInfo;   (* an array of structs *)
//     infoSize: Integer;      (* increment for info access *)
//     ctrlInfo: somCtrlInfo;
//   end;
//   somAssignCtrlStruct = somAssignCtrl;
//   som3AssignCtrl = somAssignCtrl;

(*-----------------------------------------------
 * Common Typedefs & Data Structures for SOM
 *----------------------------------------------*)

(*
 *  The Method Table Structure
 *)
(* -- to specify an embedded object (or array of objects). *)
//   somEmbeddedObjStruct = record
//     copp: PPSOMClass;    (* address of class object ptr *)
//     cnt: LongInt;        (* object count *)
//     offset: LongInt;     (* Offset to pointer (to embedded objs) *)
//   end;
//   somEmbeddedObjStructPtr = ^somEmbeddedObjStruct;

//   somClassInfo = type somToken;
//   somClassInfoPtr = ^somClassInfo;

(* -- Method/Data Tokens -- For locating methods and data members. *)
//   somMToken = type somToken;
//   somMTokenPtr = ^somMToken;
//   somDToken = type somToken;
//   somDTokenPtr = ^somDToken;

//   somMethodTab = record
//     classObject: PSOMClass;
//     classInfo: somClassInfoPtr;
//     className: PAnsiChar;
//     instanceSize: LongInt; (* free *)
//     dataAlignment: LongInt;
//     mtabSize: LongInt; (* free *)
//     protectedDataOffset: LongInt; (* from class's introduced data *)
//     protectedDataToken: somDToken;
//     embeddedObjs: somEmbeddedObjStructPtr;
//     (* remaining structure is opaque *)
//     entries: array[0 .. 0] of somMethodProc;
//   end;
//   somMethodTabStruct = somMethodTab;
//   somMethodTabPtrPtr = ^somMethodTabPtr;

(* -- For building lists of class objects *)
//   somClasses = ^somClassList;
//   somClassList = record
//     cls: PSOMClass;
//     next: somClasses;
//   end;


(* -- For building lists of objects *)
//   somObjects = ^somObjectList;
//   somObjectList = record
//     obj: PSOMObject;
//     next: somObjects;
//   end;

(*
 * The Class Data Structures -- these are used to implement static
 * method and data interfaces to SOM objects.
 *)
(* -- (Generic) Class data Structure *)
//   somClassDataStructure = record
//     classObject: PSOMClass; (* changed by shadowing *)
//     tokens: array[0 .. 0] of somToken;    (* method tokens, etc. *)
//   end;
//   somClassDataStruct = somClassDataStructure;
//   somClassDataStructurePtr = ^somClassDataStructure;


(*
 * A special info access structure pointed to by
 * the parentMtab entry of somCClassDataStructure.
 *)
//   somTP_somRenewNoInitNoZeroThunk = procedure(var somSelf); stdcall;
//   somTD_somRenewNoInitNoZeroThunk = somTP_somRenewNoInitNoZeroThunk;
//   SOM_CIBPtr = ^SOM_CIB;
//   som3ClassDetails = record
//     mtab: somMethodTabPtr; (* this class' mtab -- changed by shadowing *)
//     next: somMethodTabPtrPtr; (* parentMtabs array *)
//     cib: SOM_CIBPtr;
//     somRenewNoInitNoZeroThunk: somTD_somRenewNoInitNoZeroThunk; (* changed by shadowing *)
//     instanceSize: LongInt;   (* changed by shadowing *)
//     resolvedInits: somMethodPtrPtr;(* resolved initializers in releaseorder *)
//     resolvedMTokens: somClassDataStructurePtr;   (* resolved methods for ABI2 *)
//     initCtrl: somInitCtrl;
//     destructCtrl: somDestructCtrl;
//     assignCtrl: somAssignCtrl;
//     layoutVersion: LongInt;
//     extension: Pointer;
//     publicDataToken: somDToken;
//     protectedDataToken: somDToken;
//     instanceAlignment: LongInt;
//   end;
//   som3ClassDetailsStruct = som3ClassDetails;
//   som3ClassDetailsPtr = ^som3ClassDetails;
//   somMethodTabs = som3ClassDetailsPtr;
//   somParentMtabStructPtr = som3ClassDetailsPtr; (* 22552 *)

//   som3ClassInfoStruct = record
//     classObject: PSOMClass;
//     classDetails: som3ClassDetailsPtr;
//   end;
//   som3ClassInfoStructPtr = ^som3ClassInfoStruct;
//   som3ClassInfoStructPtrPtr = ^som3ClassInfoStructPtr;


(*
 * (Generic) Auxiliary Class Data Structure
 *)
//   somCClassDataStructure = record
//     parentMtab: som3ClassDetailsPtr; (* so named for historical reasons *)
//     instanceDataToken: somDToken;
//     wrappers: array[0 .. 0] of somMethodProc; (* for valist methods *)
//   end;
//   somCClassDataStruct = somCClassDataStructure;
//   somCClassDataStructurePtr = ^somCClassDataStructure;


(*---------------------------------
 * Method & Data Resolution
 *--------------------------------*)

(*
 * Offset-based method resolution functions
 *)
function somResolve(obj: SOMObject;
                    mdata: somMToken): somMethodProc; stdcall;
function somPCallResolve(obj: SOMObject;
                         callingCls: SOMClass;
                         method: somMToken): somMethodProc; stdcall;
function somParentResolve(parentMtabs: somMethodTabs;
                          mToken: somMToken): somMethodProc; stdcall;
function somParentNumResolve(parentMtabs: somMethodTabs;
                             parentNum: Integer;
                             mToken: somMToken): somMethodProc; stdcall;
function somClassResolve(cls: SOMClass;
                         mdata: somMToken): somMethodProc; stdcall;
function somResolveTerminal(cls: SOMClass;
                            mdata: somMToken): somMethodProc; stdcall;
function somAncestorResolve(obj: SOMObject;(* the object *)
                            ccds: somCClassDataStructurePtr; (* id the ancestor *)
                            mToken: somMToken): somMethodProc; stdcall;
function somResolveByName(obj: SOMObject;
                          methodName: PAnsiChar): somMethodProc; stdcall;

(*
 * Offset-based data resolution functions
 *)
function somDataResolve(
    obj: SOMObject;
    dataId: somDToken): somToken; stdcall;
function somDataResolveChk(
    obj: SOMObject;
    dataId: somDToken): somToken; stdcall;


(*-----------------------------------
 * Method Stubs -- Signature Support
 *-----------------------------------*)

(*
 * Moved from somplatf.h - was here originally
 *
 * This section defines the structures used to pass method signature
 * info to the runtime. This supports selection of generic apply stubs
 * and runtime generation of redispatchstubs when these are needed. The
 * information is registered with the runtime when methods are defined.
 *
 * When calling somAddStaticMethod, if the redispatchStub is -1, then a
 * pointer to a struct of type somApRdInfo is passed as the applyStub.
 * Otherwise, the passed redispatchstub and applystub are taken as given.
 * When calling somAddDynamicMethod, an actual apply stub must be passed.
 * Redispatch stubs for dynamic methods are not available, nor is
 * automated support for dynamic method apply stubs. The following
 * atructures only appropriate in relation to static methods.
 *
 * In SOMr2, somAddStaticMethod can be called with an actual redispatchstub
 * and applystub *ONLY* if the method doesn't return a structure. Recall
 * that no SOMr1 methods returned structures, so SOMr1 binaries obey this
 * restriction. The reason for this rule is that SOMr2 *may* use thunks,
 * and thunks need to know if a structure is returned. We therefore assume
 * that if no signature information is provided for a method through the
 * somAddStaticMethod interface, then the method returns a scalar.
 *
 * If a structure is returned, then a -1 *must* be passed to
 * somAddStaticMethod as a redispatchstub. In any case, if a -1 is passed,
 * then this means that the applystub actually points to a structure of type
 * somApRdInfo. This structure is used to hold and access signature
 * information encoded as follows.
 *
 * If the somApRdInfo pointer is NULL, then, if the runtime was built with
 * SOM_METHOD_STUBS defined, a default signature is assumed (no more than
 * a specified number of arguments, and no structure returned -- see below);
 * otherwise, the stubs are taken as somDefaultMethod (which produces a
 * runtime error when used) if dynamic stubs are not available.
 *
 * If the somApRdInfo pointer is not NULL, then the structure it points to can
 * either include (non-null) redispatch and applystubs (the method is then
 * assumed to return a structure), or null stubs followed by information needed
 * to generate necessary stubs dynamically.
 *)

//   somRdAppType = type LongWord; (* method signature code -- see def below *)
//   somFloatMap = array[0 .. 12] of LongWord; (* float map -- see def below *)
//   somFloatMapPtr = ^somFloatMap;
//   somMethodInfo = record
//     callType: somRdAppType;
//     va_listSize: LongInt;
//     float_map: somFloatMapPtr;
//   end;
//   somMethodInfoStruct = somMethodInfo;
//   somMethodInfoPtr = ^somMethodInfo;

//   somApRdInfo = record
//     rdStub: somMethodProc;
//     apStub: somMethodProc;
//     stubInfo: somMethodInfoPtr;
//   end;
//   somApRdInfoStruct = somApRdInfo;

(*
 * Values for somRdAppType are generated by summing one from column A
 * and one from column B of the following constants:
 *)

(* Column A: return type *)
const
  SOMRdRetsimple = somRdAppType(0);          (* Return type is a non-float fullword *)
  SOMRdRetfloat = somRdAppType(2);           (* Return type is (single) float *)
  SOMRdRetdouble = somRdAppType(4);          (* Return type is double *)
  SOMRdRetlongdouble = somRdAppType(6);      (* Return type is long double *)
  SOMRdRetaggregate = somRdAppType(8);       (* Return type is struct or union *)
  SOMRdRetbyte = somRdAppType(10);           (* Return type is a byte *)
  SOMRdRethalf = somRdAppType(12);           (* Return type is a (2 byte) halfword *)
  SOMRdRetsmallaggregate = somRdAppType(14); (* Return type is a small struct or union *)

(* Column B: are there any floating point scalar arguments? *)
  SOMRdNoFloatArgs = somRdAppType(0);
  SOMRdFloatArgs = somRdAppType(1);

(*
 * The float map is an array of offsets for up to the first 13 floating point
 * arguments.  If there are fewer than 13 floating point arguments, then there
 * will be zero entries following the non-zero entries which represent the
 * float args.  A non-zero entry signals either a single- or a double-precision
 * floating point argument.  For a double-precision argument, the entry is the
 * stack frame offset.  For a single-precision argument the entry is the stack
 * frame offset + 1.  For the final floating point argument, add 2 to the
 * code that would otherwise be used.
 *)
  SOMFMSingle = 1;           (* add to indicate single-precision *)
  SOMFMLast = 2;             (* add to indicate last floating point arg *)



(*----------
 * somApply
 *----------*)

(*
 * somApply replaces direct use of applyStubs in SOM 1.0. The reason
 * for the replacement is that the SOM 1.0 style of applyStub is not
 * generally available in SOM 2.0, which uses a fixed set of applyStubs
 * according to method information in the somMethodData. In particular,
 * neither the redispatch stub nor the apply stub found in the method
 * data structure are necessarily useful as such. The method somGetRdStub
 * is now the way to get a redispatch stub, and somApply is now the
 * way to call an apply stub. If an appropriate apply stub for the
 * method indicated by md is available, then this is invoked and TRUE is
 * returned; otherwise FALSE is returned.
 *
 * The va_list passed to somApply *must* include the target object (often
 * named somSelf) as its first entry, and any single precision floating point
 * arguments being passed to the the method procedure must be represented on
 * the va_list using double precision values (i.e. ANSI standard widening
 * must have been done). retVal cannot be NULL even for methods that return void.
 *)

//   somSharedMethodData = type somToken;
//   somSharedMethodDataPtr = ^somSharedMethodData;

//   somMethodData = record
//     id: somId;
//     md_type: LongWord;             (* see method types below *)
//     descriptor: somId;             (* for use with IR interfaces *)
//     mToken: somMToken;             (* NULL for dynamic methods *)
//     method: somMethodPtr;          (* depends on resolution context *)
//     shared: somSharedMethodDataPtr;(* opaque pointer *)
//   end;
//   somMethodDataStruct = somMethodData;
//   somMethodDataPtr = ^somMethodData;

function somApply(
    somSelf: SOMObject;
    var retVal: somToken;
    mdPtr: somMethodDataPtr;
    ap: va_list): CORBABoolean; stdcall;
(*
 * The somMethodData structure is used to specify a method to somApply, or
 * simply to provide information to a user about a method. The class methods
 * somGetMethodData and somGetNthMethodData load a somMethodData structure
 * pointed to by an "out" paramter.
 *
 * Here is a discussion of the different types of method in SOM. To aid
 * understanding, we compare with C++.
 *
 *       SOM                      C++                       Comments
 *       ~~~                      ~~~                       ~~~~~~~~
 *  dynamic method          < not available >           Dynamically Resolved (1)
 *  static method           virtual member function     Dynamically Resolved (2)
 *  nonstatic method        nonstatic member function   Statically Resolved  (3)
 *  direct call procedure   static member function      Statically Resolved  (4)
 *
 * (1) Dynamic methods are resolved using name lookup -- by searching all
 *     ancestors of a class in postorder -- to locate an implementation.
 * (2) Static methods are resolved through the instance method table of a class
 *     using a method token. The token for a static method may be located statically
 *     based on the introducing class, or by using name lookup. A static method can
 *     have only one entry in a method table, and only its introducing class can
 *     provide a method token to select this entry.
 * (3) Nonstatic methods are resolved through the instance method table of a
 *     class using a method token. The method token can be located statically based
 *     on the "closest" class that provides a token for the method, or name lookup
 *     can be used. In general, a nonstatic method will have multiple entries in a
 *     method table. Different method tokens select different entries (with
 *     different implementations). In IDL, "reintroduce" is used to provide a new
 *     token for the method. In DTS C++, the class implementor reintroduces a
 *     nonstatic member function.
 * (4) Direct call procedures are resolved statically by using a static symbol
 *     provided by the "closest" class that provides the procedure. In IDL,
 *     "reintroduce" is used to provide a new implementation for the procedure; in
 *     DTS C++, the class implementation reintroduces a static member function.
 *
 * Direct call procedures are not registered with SOM classes, so only the
 * first three categories are provided in somMethodData. Bit 0 of the type
 * field is set if and only if the method is dynamic. For non-dynamic methods,
 * bit 1 is set if and only if the method is nonstatic.
 *
 *)
function SOM_IsDynamicMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
function SOM_IsNonstaticMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
function SOM_IsStaticMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*-----------------------
 * Utility Functions
 *----------------------*)

(*
 * Test whether <obj> is a valid SOM object.  This test is based solely
 * on the fact that (on this architecture) the first word of a SOM
 * object is a pointer to its method table.  The test is therefore most
 * correctly understood as returning true if and only if <obj> is a
 * pointer to a pointer to a valid SOM method table.  If so, then
 * methods can be invoked on <obj>.
 *)
function somIsObj(obj: somToken): CORBABoolean; stdcall;

(*
 * Verifies that the passed object is a valid instance of the passed
 * class.  A detected failure generates an error message and causes
 * program termination.  This call is automatically employed as part
 * of the C method resolution macros if the preprocessor variable
 * SOM_TestOn is defined.
 *)
function somTestCls(
    obj: SOMObject;
    classObj: SOMClass;
    fileName: CORBAString;
    lineNumber: Integer): SOMObject; stdcall;

(*
 * Return the class that introduced the method represented by a given
 * method token.
 *)
function somGetClassFromMToken(mToken: somMToken): SOMClass; stdcall;


(*----------------------------------------------------------------------
 *  SOM Id Manager Section
 *---------------------------------------------------------------------*)

(*
 * typedef char* somId; // the "public" somId type (in sombtype.h)
 *
 * This above definition prevents users from building assumptions about
 * how somIds are implemented into their programs. However, a little more
 * information is useful to understand the different alternatives for
 * creating somIds.
 *
 * All somIds point to something called an idKey. The content of the
 * idKey for a somId depends on whether the somId has been registered.
 *
 * The idKey for an unregistered somId is a char* that points to a
 * null-terminated array of chars that is called the id name.
 *
 * When a somId is registered, the idKey it points to is changed to
 * point to a special structure whose representation is not made public.
 * Among other things, of course, this structure contains the address of
 * the id name. Normally the id name for a registered somId will be a copy
 * of the originally indicated name, but copying strings is expensive
 * because it requires dynamic memory allocation. As an alternative, to
 * speed up creation of somIds and minimize memory use, you can use
 * somBeginPersistentIds and somEndPersistentIds to bracket registration
 * of somIds. If you do this, you must use somRelocateIds before the
 * names for any of the "persistent" somIds that you create are changed
 * (or perhaps destroyed as a result of program termination).
 *
 * There are basically two different ways to create registered somIds:
 * from unregistered somIds, or from id names. To create registered
 * somIds from unregistered somIds, you pass the address of an idKey
 * to either somRegisterId or somCheckId; or, to register multiple
 * somIds in one step, you can pass the address of an array of idKeys
 * to somRegisterIds. To create registered somIds from id names, you
 * pass the address of the id name to either somIdFromString or
 * somIdFromStringNoFree. These routines are declared below.
 *)

(*
 * Register a somId. Returns 1 (true) if the id is a new one, and
 * 0 (false) otherwise. An id is new if no previously-registered id
 * has the same name (where name comparison is case-insensitive).
 *)
function somRegisterId(id: somId): Integer; stdcall;

(*
 * Like somRegisterId, but it returns the somId as its result.
 *)
function somCheckId(id: somId): somId; stdcall;

(*
 * Tell the id manager to register ids for an array of idKeys.
 * The id argument points to an idKey array of length idCount.
 * If idCount is zero, then the array is assumed to be terminated
 * by a null pointer.
 *)
procedure somRegisterIds(idKeys: somId; idCount: LongInt); stdcall;

(*
 * Return a somId that must be freed (using SOMFree) when the user
 * has finished with it.
 *)
function somIdFromString(aString: CORBAString): somId; stdcall;

(*
 * Return a somId that must *not* be freed when the user
 * has finished with it. This function is more efficient
 * than the previous one.
 *)
function somIdFromStringNoFree(aString: CORBAString): somId; stdcall;

(*
 * Return a string that must never be freed or modified.
 *)
function somStringFromId(id: somId): CORBAString; stdcall;

(*
 * Returns true (1) if the two ids are equal, else false (0).
 *)
function somCompareIds(id1, id2: somId): Integer; stdcall;

(*
 * Return the total number of ids that have been registered so far, you
 * can use this to advise the SOM runtime concerning expected number of
 * ids in later executions of your program, via a call to
 * somSetExpectedIds defined below
 *)
function somTotalRegIds: LongWord; stdcall;

(*
 * Tell the SOM runtime how many unique ids you expect to use during
 * the execution of your program, this can improve space and time
 * utilization slightly, this routine must be called before the SOM
 * environment is created to have any effect
 *)
procedure somSetExpectedIds(numIds: LongWord); stdcall;

(*
 * Return the unique key for this id. This is the key used for
 * comparing somIds.
 *)
function somUniqueKey(id: somId): LongWord; stdcall;

(*
 * Signal the beginning of an interval during which the id manager
 * need not copy strings when registering new ids (because the caller
 * knows that these strings will not be destroyed or modified without
 * first calling somRelocateIds for each "persistent" id registered
 * during the interval).
 *)
procedure somBeginPersistentIds; stdcall;

(*
 * End the interval started with somBeginPersistentIds. Tells the
 * id manager that strings for any new ids subsequently registered
 * may be freed or otherwise modified without first calling somRelocateIds.
 * Therefore the id manager must copy the strings remember the name of an
 * id.
 *)
procedure somEndPersistentIds; stdcall;

(*
 * Tell the id manager to replace the names for the specified registered
 * ids with dynamically allocated copies. The id argument points to an
 * array of char* variables of length idCount. If idCount is zero,
 * then the array is assumed to be terminated by a null pointer.
 *)
procedure somRelocateIds(id: somId; idCount: LongInt); stdcall;


(*----------------------------------------------------------------------
 * SOM Class Construction Section

 -- somBuildClass  introduced by SOM 2.0, SCI augmented for SOM 2.1
 -- somBuildClass2 introduced by SOM 3.0

 *---------------------------------------------------------------------*)

(* -- somBuildClass
 *
 * somBuildClass automates construction of a new class object. A variety of
 * special structures are used to allow language bindings to statically define
 * the information necessary to specify a class. Pointers to these static
 * structures are accumulated into an overall "static class information"
 * structure or SCI, passed to somBuildClass. The SCI has evolved over time.
 * The current version is defined here.
 *
 * The arguments to somBuildClass are as follows:
 *
 *   inherit_vars: a bit mask used to control inheritance of
 *                 implementation. Implementation is inherited from
 *                 parent i iff the bit 1<<i is on, or i>=32.
 *
 *   sci:          the somStaticClassInfo defined below.
 *
 *   majorVersion, minorVersion: the version of the class implementation.
 *)

(* to specify a new static method *)
//   somStaticMethodStruct = record
//     classData: somMTokenPtr;
//     methodId: somIdPtr;   (* this must be a simple name (no colons) *)
//     methodDescriptor: somIdPtr;
//     method: somMethodProc;
//     redispatchStub: somMethodProc;
//     applyStub: somMethodProc;
//   end;
//   somStaticMethod_t = somStaticMethodStruct;
//   somStaticMethodStructPtr = ^somStaticMethodStruct;

(* to specify an overridden method *)
//   somOverideMethodStruct = record
//     methodId: somIdPtr;   (* this can be a method descriptor *)
//     method: somMethodProc;
//   end;
//   somOverrideMethod_t = somOverideMethodStruct;
//   somOverideMethodStructPtr = ^somOverideMethodStruct;

(* to inherit a specific parent's method implementation *)
//   somInheritedMethodStruct = record
//     methodId: somIdPtr;   (* identify the method *)
//     parentNum: LongInt;   (* identify the parent *)
//     mToken: somMTokenPtr; (* for parentNumresolve *)
//   end;
//   somInheritedMethod_t = somInheritedMethodStruct;
//   somInheritedMethodStructPtr = ^somInheritedMethodStruct;

(* to register a method that has been moved from this *)
(* class <cls> upwards in the class hierachy to class <dest> *)
//   somMigratedMethodStruct = record
//     clsMToken: somMTokenPtr;  (* points into the <cls> classdata structure *)
//                               (* the method token in <dest> will copied here *)
//     destMToken: somMTokenPtr; (* points into the <dest> classdata structure *)
//                               (* the method token here will be copied to <cls> *)
//   end;
//   somMigratedMethod_t = somMigratedMethodStruct;
//   somMigratedMethodStructPtr = ^somMigratedMethodStruct;

(* to specify non-internal data *)
//   somNonInternalDataStruct = record
//     classData: somDTokenPtr;
//     basisForDataOffset: PAnsiChar;
//   end;
//   somNonInternalData_t = somNonInternalDataStruct;
//   somNonInternalDataStructPtr = ^somNonInternalDataStruct;

(* to specify a "procedure" or "staticdata" *)
//   somProcMethodsStruct = record
//     classData: somMethodPtrPtr;
//     pEntry: somMethodProc;
//   end;
//   somProcMethods_t = somProcMethodsStruct;
//   somProcMethodsStructPtr = ^somProcMethodsStruct;

(*
 * to specify a general method "action" using somMethodStruct. The
 * type of action is specified in the type field of somMethodStruct.
 *
 * action (in type & 0xFF)
 *  0: static -- (i.e., virtual) uses somAddStaticMethod
 *  1: dynamic -- uses somAddDynamicMethod (classData==0)
 *  2: nonstatic -- (i.e., nonvirtual) uses somAddMethod
 *  3: udaAssign -- registers a method as the udaAssign
 *                  (but doesn't add the method)
 *  4: udaConstAssign -- like 3, this doesn't add the method
 *  5: somClassResolve Override (using the class pointed to by *classData)
 *  6: somMToken Override (using the method token pointed to by methodId)
 *                        (note: classData==0 for this)
 *  7: classAllocate -- indicates the default heap allocator for this class.
 *                 If classData == 0, then method is the code address (or NULL)
 *                 If classData != 0, then *classData is the code address.
 *                 No other info required (or used)
 *  8: classDeallocate -- like 7, but indicates the default heap deallocator.
 *  9: classAllocator -- indicates a non default heap allocator for this class.
 *                       like 7, but a methodDescriptor can be given.
 *
 *)

//   somMethodStruct = record
//     md_type: LongWord;
//     classData: somMTokenPtr;
//     methodId: somIdPtr;
//     methodDescriptor: somIdPtr;
//     method: somMethodProc;
//     redispatchStub: somMethodProc;
//     applyStub: somMethodProc;
//   end;
//   somMethods_t = somMethodStruct;
//   somMethodStructPtr = ^somMethodStruct;

(* to specify a varargs function *)
//   somVarargsFuncsStruct = record
//     classData: somMethodPtrPtr;
//     vEntry: somMethodProc;
//   end;
//   somVarargsFuncs_t = somVarargsFuncsStruct;
//   somVarargsFuncsStructPtr = ^somVarargsFuncsStruct;

(* to specify dynamically computed information (incl. embbeded objs) *)
//   somDynamicSCI = record
//     version: Integer;                      (* 1 for now *)
//     instanceDataSize: LongInt;             (* true size (incl. embedded objs) *)
//     dataAlignment: LongInt;                (* true alignment *)
//     embeddedObjs: somEmbeddedObjStructPtr; (* array end == null copp *)
//   end;
//   somDynamicSCIPtr = ^somDynamicSCI;

(*
 * to specify a DTS class, use the somDTSClass entry in the following
 * data structure. This entry is a bit vector interpreted as follows:
 *
 * (somDTSClass & 0x0001) == the class is a DTS C++ class
 *)

(*
 *  The Static Class Info Structure passed to somBuildClass
 *)
//   somStaticClassInfo = record
//     layoutVersion: LongWord;  (* 3 *)
//     numStaticMethods: LongWord;       (* count of smt entries *)
//     numStaticOverrides: LongWord;     (* count of omt entries *)
//     numNonInternalData: LongWord;     (* count of nit entries *)
//     numProcMethods: LongWord;         (* count of pmt entries *)
//     numVarargsFuncs: LongWord;        (* count of vft entries *)
//     majorVersion: LongWord;
//     minorVersion: LongWord;
//     instanceDataSize: LongWord;       (* instance data introduced by this class *)
//     maxMethods: LongWord;             (* count numStaticMethods and numMethods *)
//     numParents: LongWord;
//     classId: somId;
//     explicitMetaId: somId;
//     implicitParentMeta: LongInt;
//     parents: somIdPtr;
//     cds: somClassDataStructurePtr;
//     ccds: somCClassDataStructurePtr;
//     smt: somStaticMethodStructPtr;    (* basic "static" methods for mtab *)
//     omt: somOverideMethodStructPtr;   (* overrides for mtab *)
//     nitReferenceBase: PAnsiChar;
//     nit: somNonInternalDataStructPtr; (* datatokens for instance data *)
//     pmt: somProcMethodsStructPtr;     (* Arbitrary ClassData members *)
//     vft: somVarargsFuncsStructPtr; (* varargs stubs *)
//     cif: somTP_somClassInitFunc; (* class init function *)
//     (* end of layout version 1 *)
//
//     (* begin layout version 2 extensions *)
//     dataAlignment: LongInt; (* the desired byte alignment for instance data *)
//     (* end of layout version 2 *)
//
const
  SOMSCIVERSION = 1;
//
//     (* begin layout version 3 extensions *)
//     numDirectInitClasses: LongInt;
//     directInitClasses: somIdPtr;
//     numMethods: LongWord; (* general (including nonstatic) methods for mtab *)
//     mt: somMethodStructPtr;
//     protectedDataOffset: LongWord; (* access = resolve(instanceDataToken) + offset *)
//     somSCIVersion: LongWord;  (* used during development. currently = 1 *)
//     numInheritedMethods: LongWord;
//     imt: somInheritedMethodStructPtr; (* inherited method implementations *)
//     numClassDataEntries: LongWord; (* should always be filled in *)
//     classDataEntryNames: somIdPtr; (* either NULL or ptr to an array of somIds *)
//     numMigratedMethods: LongWord;
//     mmt: somMigratedMethodStructPtr; (* migrated method implementations *)
//     numInitializers: LongWord; (* the initializers for this class *)
//     initializers: somIdPtr;     (* in order of release *)
//     somDTSClass: LongWord; (* used to identify a DirectToSOM class *)
//     dsci: somDynamicSCIPtr;  (* used to register dynamically computed info *)
//     (* end of layout version 3 *)
//
//   end;
//   somStaticClassInfoStruct = somStaticClassInfo;
//   somStaticClassInfoPtr = ^somStaticClassInfo;

function somBuildClass(inherit_vars: LongInt;
                       sci: somStaticClassInfoPtr;
                       majorVersion, minorVersion: LongInt): SOMClass; stdcall;


(*
 * -- somBuildClass2
 *
 * somBuildClass2 was added in SOM 3.0 to allow reuse of static class
 * information to hold a class's instance variables. This speeds class
 * creation, and reduces the need for dynamically allocated memory. The
 * static class information structures are accumulated into a CIB (class
 * initialization block) instead of the SCI structure used with
 * somBuildClass.
 *)

(*
 * to register a method that has been moved from this
 * class <orig> upwards in the class hierachy to class <dest>
 *)
//   somMigratedMethod_t2 = record
//     methodId: somId;            (* id of the method being migrated *)
//     abi2TokenAddr: somMTokenPtr; (* if abi2, this class's classData field addr *)
//     abi3SymbolAddr: somTokenPtr;  (* if abi3, this class's method symbol addr *)
//   end;
//   somMigratedMethodStruct_t2 = somMigratedMethod_t2;
//   somMigratedMethodPtr_t2 = ^somMigratedMethod_t2;

(*
 * to select a specific ancestor's implementation for an inherited method
 *)
//   somInheritedMethod_t2 = record
//     methodId: somId;
//     parentNum: LongInt;
//     ancestorClass: PPSOMClass;
//   end;
//   somInheritedMethodStruct_t2 = somInheritedMethod_t2;
//   somInheritedMethodPtr_t2 = ^somInheritedMethod_t2;

(*
 * to register a normal method override
 *)
//   somOverrideMethod_t2 = record
//     methodId: somId;
//     pcall: somMethodPtrPtr;
//     pcallResolve: somMethodPtr;
//     methodProc: somMethodPtr;
//   end;
//   somOverideMethodStruct_t2 = somOverrideMethod_t2;
//   somOverrideMethodPtr_t2 = ^somOverrideMethod_t2;

//   somRedispatchInfo = record
//     md: somMethodData;
//     dispatchFcn: somMethodProc;
//     (* ... arbitrary remaining structure known to dispatchFcn *)
//   end;
//   somRedispatchInfoPtr = ^somRedispatchInfo;

(*
 * to register information for a new method
 *)
//   somMethodDefn = record
//     md_type: LongWord;
//     descriptor: somId;
//     mToken: somMToken; (* address of method symbol if one exists *)
//     method: somMethodPtr; (* address of method proc *)
//     redispatchStub: somMethodPtr;    (* either these 2 *)
//     applyStub: somMethodPtr;
//     methodInfo: somMethodInfoPtr;    (* or this 1 *)
//     tokenLoc: somMTokenPtr;          (* address of ClassData field *)
//     redispatchInfo: somRedispatchInfoPtr; (* rdstub desired (we'll fill in md) *)
//     layoutVersion: LongInt;
//   end;
//   somMethodDefnPtr = ^somMethodDefn;


(*
 * class variables that don't change after class intialization
 *)
//   somClassVars1 = record
//     layoutVersion: LongInt; (* 1 *)
//     extension: Pointer;
//     dataSize: LongInt;
//     dataAlignment: LongInt;
//     classAllocate: somMethodProc;
//     classDeallocate: somMethodProc;
//   end;
//   somClassVars1Struct = somClassVars1;
//   somClassVars1Ptr = ^somClassVars1;


(*
 * storage addressed by a method symbol
 *)
//   somMethodSymbol = record
//     content: array[0 .. 3] of AnsiChar;
//   end;
//   somMethodSymbolBindingStruct = somMethodSymbol;
//   somMethodSymbolBinding = ^somMethodSymbol;

(*
 * Overrides for SOMObject Specials
 *)
//   somSpecialOverrides = record
//     ctorThunk: somMethodSymbolBinding;
//     resolvedThunk: somMethodSymbolBinding; (* #13082 *)
//     methodProc: somMethodPtr;
//   end;
//   somSpecialOverridesStruct = somSpecialOverrides;
//   somSpecialOverridesPtr = ^somSpecialOverrides;

(*
 * (non-SOMObject) initializer symbols (#13082)
 *)
//   somInitSymbols = record
//     methodId: somId;
//     ctorThunk: somMethodSymbolBinding;
//     resolvedThunk: somMethodSymbolBinding;
//   end;
//   somInitSymbolsStruct = somInitSymbols;
//   somInitSymbolsPtr = ^somInitSymbols;


(*
 * CIB
 *)

//   SOM_CIB = record
//     layoutVersion:          LongInt;
//     classVars1:             somClassVars1Ptr;
//     unsharedVars:           PPointer;
//     majorVersion:           LongInt;
//     minorVersion:           LongInt;
//     constFlags:             LongWord;
//     inheritVars:            LongWord;
//     classMeta:              PPSOMClass;
//     classInit:              somMethodPtr;
//     classUninit:            somMethodPtr;
//     legacyInit:             somMethodPtr;
//     legacyUninit:           somMethodPtr;
//     udaAssign:              somMethodPtr;
//     udaConstAssign:         somMethodPtr;
//     protectedDataOffset:    LongInt;
//     numEmbeddedObjs:        LongInt;
//     embeddedObjs:           somEmbeddedObjStructPtr;
//     numRegIds:              LongInt;
//     regIds:                 PPAnsiChar;
//     numClassDataEntries:    LongInt;
//     somClassData:           somClassDataStructurePtr;
//     somCClassData:          somCClassDataStructurePtr;
//     som3ClassInfo:          som3ClassInfoStructPtr;
//     numParents:             LongInt;
//     parents:                PPPSOMClass;
//     numDirectInitClasses:   LongInt;
//     directInitClasses:      PPPSOMClass;
//     numNewInitializers:     LongInt;
//     newInitializerSymbols:  somInitSymbolsPtr;
//     numOvInitializers:      LongInt;
//     ovInitializerSymbols:   somInitSymbolsPtr;
//     specialOverrides:       somSpecialOverridesPtr;
//     maxNDMethods:           LongInt;
//     newNDMethods:           somMethodDefnPtr;
//     numOverrides:           LongInt;
//     overrides:              somOverrideMethodPtr_t2;
//     numInheritedSelections: LongInt;
//     inheritedSelections:    somInheritedMethodPtr_t2;
//     numMigratedMethods:     LongInt;
//     migratedMethods:        somMigratedMethodPtr_t2;
//   end;


function somBuildClass2(cib: SOM_CIBPtr;
                        requestedMajorVersion,
                        requestedMinorVersion: LongInt): SOMClass; stdcall;

(*
 *  Used by old single-inheritance emitters to make class creation
 *  an atomic operation. Kept for backwards compatability only.
 *)
//   somTD_classInitRoutine = procedure(
//     parent_class,
//     metaclass: PSOMClass); stdcall;
procedure somConstructClass(
    classInitRoutine: somTD_classInitRoutine;
    parentClass,
    metaClass: SOMClass;
    cds: somClassDataStructurePtr); stdcall;

(*
 * somRegisterLibraryClasses - the parameters are defined as follows:
 * 1. libHandle is the operating system-dependent library handle that
 *    is returned by the operating system's "load library" function.
 *    See somplatf.h for the definition of the somLibraryHandle type.
 * 2. numClasses is the number of SOM classes in the library.
 * 3. classInfoStructs is a pointer to an array of pointers to
 *    som3ClassInfoStruct (one for each class in the library).
 *    The array must be a static variable, so the pointer to this
 *    array will be valid after the call has completed.
 * 4. userInitRoutine may either be NULL or the address of an
 *    initialization function to be called.
 *)
//   userInitTermProc = procedure(libHandle: somLibraryHandle; num: LongWord); stdcall;

function somRegisterLibraryClasses(
                          libHandle: somLibraryHandle;
                          numClasses: LongInt;
                          classInfoStructs: som3ClassInfoStructPtrPtr;
                          userInitTermRoutine: userInitTermProc): LongInt; stdcall;
function somUnregisterLibraryClasses(libHandle: somLibraryHandle): LongInt; stdcall;



// #include <somobj.h>

(*
 *  This is the SOM root class, all SOM classes must be descended from
 *  <SOMObject>. <SOMObject> has no instance data so there is no
 *  per-instance cost to to being descended from it.
 *  a sequence of SOM Objects
 *)

(*
 * Start of bindings for IDL types
 *)

type
  _IDL_SEQUENCE_SOMObject = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PSOMObject;
  end;
  SOMObject_SOMObjectSequence = _IDL_SEQUENCE_SOMObject;
(*
 *  a sequence of booleans.
 *)

type
  _IDL_SEQUENCE_octet = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: Poctet;
  end;
  SOMObject_BooleanSequence = _IDL_SEQUENCE_octet;
(*
 *  a structure to describe an object-related offset, and
 *  a sequence of class-related offsets
 *)

type
  SOMObject_somObjectOffset = record
    obj: SOMObject;
    offset: LongInt;
  end;
  PSOMObject_somObjectOffset = ^SOMObject_somObjectOffset;
  _IDL_SEQUENCE_SOMObject_somObjectOffset = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PSOMObject_somObjectOffset;
  end;
  SOMObject_somObjectOffsets = _IDL_SEQUENCE_SOMObject_somObjectOffset;

(*
 * End of bindings for IDL types.
 *)

const
  SOMObject_MajorVersion = 1;
  SOMObject_MinorVersion = 7;

(*
 * Declare the class creation procedure
 *)
function SOMObjectNewClass(
  somtmajorVersion: integer4 = SOMObject_MajorVersion;
  somtminorVersion: integer4 = SOMObject_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMObjectClassDataStructure = record
	classObject:              SOMClass;
	somInit:                  somMToken;
	somUninit:                somMToken;
	somFree:                  somMToken;
	somDefaultVCopyInit:      somMToken;
	somGetClassName:          somMToken;
	somGetClass:              somMToken;
	somIsA:                   somMToken;
	somRespondsTo:            somMToken;
	somIsInstanceOf:          somMToken;
	somGetSize:               somMToken;
	somDumpSelf:              somMToken;
	somDumpSelfInt:           somMToken;
	somPrintSelf:             somMToken;
	somDefaultConstVCopyInit: somMToken;
	somoPrivate1:             somMToken;
	somoPrivate2:             somMToken;
	somoPrivate3:             somMToken;
	somoPrivate4:             somMToken;
	somDispatch:              somMToken;
	somClassDispatch:         somMToken;
	somCastObj:               somMToken;
	somResetObj:              somMToken;
	somDefaultInit:           somMToken;
	somDestruct:              somMToken;
	somoPrivate5:             somMToken;
	somoPrivate6:             somMToken;
	somDefaultCopyInit:       somMToken;
	somDefaultConstCopyInit:  somMToken;
	somDefaultAssign:         somMToken;
	somDefaultConstAssign:    somMToken;
	somDefaultVAssign:        somMToken;
	somDefaultConstVAssign:   somMToken;
	somoPrivate7:             somMToken;
	somoPrivate8:             somMToken;
	somoPrivate9:             somMToken;
	somoPrivate10:            somMToken;
	somoPrivate11:            somMToken;
	somoPrivate12:            somMToken;
	somoPrivate13:            somMToken;
	somoPrivate14:            somMToken;
end;
PSOMObjectClassDataStructure = ^SOMObjectClassDataStructure;
function SOMObjectClassData: PSOMObjectClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMObjectCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
	somDispatch: somMethodProc;
	somClassDispatch: somMethodProc;
end;
PSOMObjectCClassDataStructure = ^SOMObjectCClassDataStructure;
function SOMObjectCClassData: PSOMObjectCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMObject: SOMClass;

(*
 * New and Renew macros for SOMObject
 *)
function SOMObjectNew: SOMObject;
function SOMObjectRenew(buf: Pointer): SOMObject;

(*
 * New Method: somDefaultInit
 *)
type
  somTP_SOMObject_somDefaultInit = procedure(somSelf: SOMObject;
		ctrl: som3InitCtrlPtr); stdcall;
  somTD_SOMObject_somDefaultInit = somTP_SOMObject_somDefaultInit;
(*
 *  A default initializer for a SOM object. Passing a null ctrl
 *  indicates to the receiver that its class is the class of the
 *  object being initialized, whereby the initializer will determine
 *  an appropriate control structure.
 *)
const somMD_SOMObject_somDefaultInit = '::SOMObject::somDefaultInit';
procedure SOMObject_somDefaultInit(somSelf: SOMObject; ctrl: som3InitCtrlPtr);

(*
 * New Method: somDestruct
 *)
type
  somTP_SOMObject_somDestruct = procedure(somSelf: SOMObject;
		doFree: octet; ctrl: som3DestructCtrlPtr); stdcall;
  somTD_SOMObject_somDestruct = somTP_SOMObject_somDestruct;
(*
 *  The default destructor for a SOM object. A nonzero <doFree>
 *  indicates that the object storage should be freed by the
 *  object's class (via somDeallocate) after uninitialization.
 *  As with somDefaultInit, a null ctrl can be passed.
 *)
const somMD_SOMObject_somDestruct = '::SOMObject::somDestruct';
procedure SOMObject_somDestruct(somSelf: SOMObject;
		doFree: octet; ctrl: som3DestructCtrlPtr);

(*
 * New Method: somDefaultCopyInit
 *)
type
  somTP_SOMObject_somDefaultCopyInit = procedure(somSelf: SOMObject;
		ctrl: som3InitCtrlPtr; fromObj: SOMObject); stdcall;
  somTD_SOMObject_somDefaultCopyInit = somTP_SOMObject_somDefaultCopyInit;
(*
 *  A default copy constructor. Use this to make copies of objects for
 *  calling methods with "by-value" argument semantics.
 *)
const somMD_SOMObject_somDefaultCopyInit = '::SOMObject::somDefaultCopyInit';
procedure SOMObject_somDefaultCopyInit(somSelf: SOMObject;
	ctrl: som3InitCtrlPtr; fromObj: SOMObject);

(*
 * New Method: somDefaultAssign
 *)
type
  somTP_SOMObject_somDefaultAssign = function(somSelf: SOMObject;
		ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject; stdcall;
  somTD_SOMObject_somDefaultAssign = somTP_SOMObject_somDefaultAssign;
(*
 *  A default assignment operator. Use this to "assign" the state of one
 *  object to another.
 *)
const somMD_SOMObject_somDefaultAssign = '::SOMObject::somDefaultAssign';
function SOMObject_somDefaultAssign(somSelf: SOMObject;
	ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject;

(*
 * New Method: somDefaultConstCopyInit
 *)
type
  somTP_SOMObject_somDefaultConstCopyInit = procedure(somSelf: SOMObject;
		ctrl: som3InitCtrlPtr; fromObj: SOMObject); stdcall;
  somTD_SOMObject_somDefaultConstCopyInit = somTP_SOMObject_somDefaultConstCopyInit;
(*
 *  A default copy constructor that uses a const fromObj.
 *)
const somMD_SOMObject_somDefaultConstCopyInit = '::SOMObject::somDefaultConstCopyInit';
procedure SOMObject_somDefaultConstCopyInit(somSelf: SOMObject;
	ctrl: som3InitCtrlPtr; fromObj: SOMObject);

(*
 * New Method: somDefaultVCopyInit
 *)
type
  somTP_SOMObject_somDefaultVCopyInit = procedure(somSelf: SOMObject;
		ctrl: som3InitCtrlPtr; fromObj: SOMObject); stdcall;
  somTD_SOMObject_somDefaultVCopyInit = somTP_SOMObject_somDefaultVCopyInit;
(*
 *  A default copy constructor that uses a volatile fromObj.
 *)
const somMD_SOMObject_somDefaultVCopyInit = '::SOMObject::somDefaultVCopyInit';
procedure SOMObject_somDefaultVCopyInit(somSelf: SOMObject;
	ctrl: som3InitCtrlPtr; fromObj: SOMObject);

(*
 * New Method: somDefaultConstVCopyInit
 *)
type
  somTP_SOMObject_somDefaultConstVCopyInit = procedure(somSelf: SOMObject;
		ctrl: som3InitCtrlPtr; fromObj: SOMObject); stdcall;
  somTD_SOMObject_somDefaultConstVCopyInit = somTP_SOMObject_somDefaultConstVCopyInit;
(*
 *  A default copy constructor that uses a const volatile fromObj.
 *)
const somMD_SOMObject_somDefaultConstVCopyInit = '::SOMObject::somDefaultConstVCopyInit';
procedure SOMObject_somDefaultConstVCopyInit(somSelf: SOMObject;
		ctrl: som3InitCtrlPtr; fromObj: SOMObject);

(*
 * New Method: somDefaultConstAssign
 *)
type
  somTP_SOMObject_somDefaultConstAssign = function(somSelf: SOMObject;
    ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject; stdcall;
  somTD_SOMObject_somDefaultConstAssign = somTP_SOMObject_somDefaultConstAssign;
(*
 *  A default assignment operator that uses a const fromObj.
 *)
const somMD_SOMObject_somDefaultConstAssign = '::SOMObject::somDefaultConstAssign';
function SOMObject_somDefaultConstAssign(somSelf: SOMObject;
  ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject;

(*
 * New Method: somDefaultVAssign
 *)
type
  somTP_SOMObject_somDefaultVAssign = function(somSelf: SOMObject;
  	ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject; stdcall;
  somTD_SOMObject_somDefaultVAssign = somTP_SOMObject_somDefaultVAssign;
(*
 *  A default assignment operator that uses a volatile fromObj.
 *)
const somMD_SOMObject_somDefaultVAssign = '::SOMObject::somDefaultVAssign';
function SOMObject_somDefaultVAssign(somSelf: SOMObject;
  ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject;

(*
 * New Method: somDefaultConstVAssign
 *)
type
  somTP_SOMObject_somDefaultConstVAssign = function(somSelf: SOMObject;
		ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject; stdcall;
  somTD_SOMObject_somDefaultConstVAssign = somTP_SOMObject_somDefaultConstVAssign;
(*
 *  A default assignment operator that uses a const volatile fromObj.
 *)
const somMD_SOMObject_somDefaultConstVAssign = '::SOMObject::somDefaultConstVAssign';
function SOMObject_somDefaultConstVAssign(somSelf: SOMObject;
	ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject;

(*
 * New Method: somInit
 *)
type
  somTP_SOMObject_somInit = procedure(somSelf: SOMObject); stdcall;
  somTD_SOMObject_somInit = somTP_SOMObject_somInit;
(*
 *  Obsolete but still supported. Override somDefaultInit instead of somInit.
 *)
const somMD_SOMObject_somInit = '::SOMObject::somInit';
procedure SOMObject_somInit(somSelf: SOMObject);

(*
 * New Method: somUninit
 *)
type
  somTP_SOMObject_somUninit = procedure(somSelf: SOMObject); stdcall;
  somTD_SOMObject_somUninit = somTP_SOMObject_somUninit;
(*
 *  Obsolete but still supported. Override somDestruct instead of somUninit.
 *)
const somMD_SOMObject_somUninit = '::SOMObject::somUninit';
procedure SOMObject_somUninit(somSelf: SOMObject);

(*
 * New Method: somFree
 *)
type
  somTP_SOMObject_somFree = procedure(somSelf: SOMObject); stdcall;
  somTD_SOMObject_somFree = somTP_SOMObject_somFree;
(*
 *  The default implementation just calls somDestruct.
 *)
const somMD_SOMObject_somFree = '::SOMObject::somFree';
procedure SOMObject_somFree(somSelf: SOMObject);

(*
 * New Method: somGetClass
 *)
type
  somTP_SOMObject_somGetClass = function(somSelf: SOMObject): SOMClass; stdcall;
  somTD_SOMObject_somGetClass = somTP_SOMObject_somGetClass;
(*
 *  Return the receiver's class.
 *)
const somMD_SOMObject_somGetClass = '::SOMObject::somGetClass';
function SOMObject_somGetClass(somSelf: SOMObject): SOMClass;

(*
 * New Method: somGetClassName
 *)
type
  somTP_SOMObject_somGetClassName = function(somSelf: SOMObject): CORBAString; stdcall;
  somTD_SOMObject_somGetClassName = somTP_SOMObject_somGetClassName;
(*
 *  Return the name of the receiver's class.
 *)
const somMD_SOMObject_somGetClassName = '::SOMObject::somGetClassName';
function SOMObject_somGetClassName(somSelf: SOMObject): CORBAString;

(*
 * New Method: somGetSize
 *)
type
  somTP_SOMObject_somGetSize = function(somSelf: SOMObject): LongInt; stdcall;
  somTD_SOMObject_somGetSize = somTP_SOMObject_somGetSize;
(*
 *  Return the size of the receiver.
 *)
const somMD_SOMObject_somGetSize = '::SOMObject::somGetSize';
function SOMObject_somGetSize(somSelf: SOMObject): LongInt;

(*
 * New Method: somIsA
 *)
type
  somTP_SOMObject_somIsA = function(somSelf: SOMObject;
		aClassObj: SOMClass): CORBABoolean; stdcall;
  somTD_SOMObject_somIsA = somTP_SOMObject_somIsA;
(*
 *  Returns 1 (true) if the receiver responds to methods
 *  introduced by <aClassObj>, and 0 (false) otherwise.
 *)
const somMD_SOMObject_somIsA = '::SOMObject::somIsA';
function SOMObject_somIsA(somSelf: SOMObject;
  aClassObj: SOMClass): CORBABoolean;

(*
 * New Method: somIsInstanceOf
 *)
type
  somTP_SOMObject_somIsInstanceOf = function(somSelf: SOMObject;
		aClassObj: SOMClass): CORBABoolean; stdcall;
  somTD_SOMObject_somIsInstanceOf = somTP_SOMObject_somIsInstanceOf;
(*
 *  Returns 1 (true) if the receiver is an instance of
 *  <aClassObj> and 0 (false) otherwise.
 *)
const somMD_SOMObject_somIsInstanceOf = '::SOMObject::somIsInstanceOf';
function SOMObject_somIsInstanceOf(somSelf: SOMObject;
	aClassObj: SOMClass): CORBABoolean;

(*
 * New Method: somRespondsTo
 *)
type
  somTP_SOMObject_somRespondsTo = function(somSelf: SOMObject;
		mId: somId): CORBABoolean; stdcall;
  somTD_SOMObject_somRespondsTo = somTP_SOMObject_somRespondsTo;
(*
 *  Returns 1 (true) if the indicated method can be invoked
 *  on the receiver and 0 (false) otherwise.
 *)
const somMD_SOMObject_somRespondsTo = '::SOMObject::somRespondsTo';
function SOMObject_somRespondsTo(somSelf: SOMObject;
	mId: somId): CORBABoolean;

(*
 * New Method: somDispatch
 *)
type
  somTP_SOMObject_somDispatch = function(somSelf: SOMObject;
		out retValue: somToken;
		methodId: somId;
		ap: va_list): CORBABoolean; stdcall;
  somTD_SOMObject_somDispatch = somTP_SOMObject_somDispatch;
(*
 *  This method provides a generic, class-specific dispatch mechanism.
 *  It accepts as input <retValue> a pointer to the memory area to be
 *  loaded with the result of dispatching the method indicated by
 *  <methodId> using the arguments in <ap>. <ap> contains the object
 *  on which the method is to be invoked as the first argument.
 *
 *  Default redispatch stubs invoke this method.
 *)
const somMD_SOMObject_somDispatch = '::SOMObject::somDispatch';
function SOMObject_somDispatch(somSelf: SOMObject;
	out retValue: somToken;
	methodId: somId;
	ap: va_list): CORBABoolean;

(*
 * normal vararg stubs
 *)
function somva_SOMObject_somDispatch(somSelf: SOMObject;
	out retValue: somToken;
	methodId: somId): CORBABoolean; cdecl; varargs;

(*
 * New Method: somClassDispatch
 *)
type
  somTP_SOMObject_somClassDispatch = function(somSelf: SOMObject;
		clsObj: SOMClass;
		out retValue: somToken;
		methodId: somId;
		ap: va_list): CORBABoolean; stdcall;
  somTD_SOMObject_somClassDispatch = somTP_SOMObject_somClassDispatch;
(*
 *  Like somDispatch, but method resolution for static methods is done
 *  according to the clsObj instance method table.
 *)
const somMD_SOMObject_somClassDispatch = '::SOMObject::somClassDispatch';
function SOMObject_somClassDispatch(somSelf: SOMObject;
	clsObj: SOMClass;
	out retValue: somToken;
	methodId: somId;
	ap: va_list): CORBABoolean;

(*
 * normal vararg stubs
 *)
function somva_SOMObject_somClassDispatch(somSelf: SOMObject;
	clsObj: SOMClass;
	retValue: somTokenPtr;
	methodId: somId): CORBABoolean; cdecl; varargs;

(*
 * New Method: somCastObj
 *)
type
  somTP_SOMObject_somCastObj = function(somSelf: SOMObject;
		castedCls: SOMClass): CORBABoolean; stdcall;
  somTD_SOMObject_somCastObj = somTP_SOMObject_somCastObj;
(*
 *  Changes the behavior of the target object to that implemented
 *  by castedCls. This is possible when all concrete data in castedCls
 *  is also concrete in the true class of the target object.
 *  Returns true (1) on success, and false (0) otherwise.
 *)
const somMD_SOMObject_somCastObj = '::SOMObject::somCastObj';
function SOMObject_somCastObj(somSelf: SOMObject;
	castedCls: SOMClass): CORBABoolean;

(*
 * New Method: somResetObj
 *)
type
  somTP_SOMObject_somResetObj = function(somSelf: SOMObject): CORBABoolean; stdcall;
  somTD_SOMObject_somResetObj = somTP_SOMObject_somResetObj;
(*
 *  reset an object to its true class. Returns true always.
 *)
const somMD_SOMObject_somResetObj = '::SOMObject::somResetObj';
function SOMObject_somResetObj(somSelf: SOMObject): CORBABoolean;

(*
 * New Method: somPrintSelf
 *)
type
  somTP_SOMObject_somPrintSelf = function(somSelf: SOMObject): SOMObject; stdcall;
  somTD_SOMObject_somPrintSelf = somTP_SOMObject_somPrintSelf;
(*
 *  Uses <SOMOutCharRoutine> to write a brief string with identifying
 *  information about this object.  The default implementation just gives
 *  the object's class name and its address in memory.
 *  <self> is returned.
 *)
const somMD_SOMObject_somPrintSelf = '::SOMObject::somPrintSelf';
function SOMObject_somPrintSelf(somSelf: SOMObject): SOMObject;

(*
 * New Method: somDumpSelf
 *)
type
  somTP_SOMObject_somDumpSelf = procedure(somSelf: SOMObject;
		level: LongInt); stdcall;
  somTD_SOMObject_somDumpSelf = somTP_SOMObject_somDumpSelf;
(*
 *  Uses <SOMOutCharRoutine> to write a detailed description of this object
 *  and its current state.
 *
 *  <level> indicates the nesting level for describing compound objects
 *  it must be greater than or equal to zero.  All lines in the
 *  description will be preceeded by <2*level> spaces.
 *
 *  This routine only actually writes the data that concerns the object
 *  as a whole, such as class, and uses <somDumpSelfInt> to describe
 *  the object's current state.  This approach allows readable
 *  descriptions of compound objects to be constructed.
 *
 *  Generally it is not necessary to override this method, if it is
 *  overriden it generally must be completely replaced.
 *)
const somMD_SOMObject_somDumpSelf = '::SOMObject::somDumpSelf';
procedure SOMObject_somDumpSelf(somSelf: SOMObject; level: LongInt);

(*
 * New Method: somDumpSelfInt
 *)
type
  somTP_SOMObject_somDumpSelfInt = procedure(somSelf: SOMObject;
		level: LongInt); stdcall;
  somTD_SOMObject_somDumpSelfInt = somTP_SOMObject_somDumpSelfInt;
(*
 *  Uses <SOMOutCharRoutine> to write in the current state of this object.
 *  Generally this method will need to be overridden.  When overriding
 *  it, begin by calling the parent class form of this method and then
 *  write in a description of your class's instance data. This will
 *  result in a description of all the object's instance data going
 *  from its root ancestor class to its specific class.
 *)
const somMD_SOMObject_somDumpSelfInt = '::SOMObject::somDumpSelfInt';
procedure SOMObject_somDumpSelfInt(somSelf: SOMObject; level: LongInt);

// #include <somcls.h>

(*
 *   SOMClass is the root SOM metaclass. Because it is a metaclass, its
 *   instances are classes. Because it is the root metaclass, all other
 *   metaclasses inherit its methods.
 *
 *   SOMClass defines the default behavior for SOM class objects
 *   accessed using methods available through the SOMClass interface.
 *   Other metaclasses are allowed to specialize the behavior of
 *   classes by introducing new methods and overriding SOMClass
 *   methods.
 *
 *   Generally, when SOMClass methods are overridden by user-defined
 *   metaclasses, a relative parent call should be made at some point to
 *   allow the default behavior implemented by SOMClass to execute
 *   (in addition to whatever additional behavior might be desired by the
 *   new metaclasses).
 *
 *)

(*
 * Start of bindings for IDL types
 *)
type
  _IDL_SEQUENCE_somToken = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: somTokenPtr;
  end;
  SOMClass_somTokenSequence = _IDL_SEQUENCE_somToken;
(*
 *  a (generic) sequence of somTokens
 *)

type
  _IDL_SEQUENCE_SOMClass = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PSOMClass;
  end;
  SOMClass_SOMClassSequence = _IDL_SEQUENCE_SOMClass;
  PSOMClass_SOMClassSequence = ^SOMClass_SOMClassSequence;
(*
 *  a sequence of classes
 *)

type
  SOMClass_somOffsetInfo = record
    cls: SOMClass;
    offset: LongInt;
  end;
  PSOMClass_somOffsetInfo = ^SOMClass_somOffsetInfo;
(*
 *  a structure to describe a class-related offset
 *)

type
  _IDL_SEQUENCE_SOMClass_somOffsetInfo = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PSOMClass_somOffsetInfo;
  end;
  SOMClass_somOffsets = _IDL_SEQUENCE_SOMClass_somOffsetInfo ;
(*
 *  a sequence of class-related offsets
 *)

type
  _IDL_SEQUENCE_somId = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: somIdPtr;
  end;
  SOMClass_somIdSequence = _IDL_SEQUENCE_somId;
(*
 *  a sequence of somIds
 *)

(*
 * End of bindings for IDL types.
 *)

const
  SOMClass_MajorVersion = 1;
  SOMClass_MinorVersion = 6;

(*
 * Declare the class creation procedure
 *)
function SOMClassNewClass(
  somtmajorVersion: integer4 = SOMClass_MajorVersion;
  somtminorVersion: integer4 = SOMClass_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMClassClassDataStructure = record
	classObject:                   SOMClass;
	somNew:                        somMToken;
	somRenew:                      somMToken;
	somcPrivate1:                  somMToken;
	somClassReady:                 somMToken;
	somGetName:                    somMToken;
	somcPrivate2:                  somMToken;
	somDescendedFrom:              somMToken;
	somCheckVersion:               somMToken;
	somFindMethod:                 somMToken;
	somFindMethodOk:               somMToken;
	somSupportsMethod:             somMToken;
	somGetNumMethods:              somMToken;
	somGetInstanceSize:            somMToken;
	somcPrivate3:                  somMToken;
	somGetInstancePartSize:        somMToken;
	somGetMethodIndex:             somMToken;
	somGetNumStaticMethods:        somMToken;
	somGetPClsMtab:                somMToken;
	somGetClassMtab:               somMToken;
	somAddStaticMethod:            somMToken;
	somOverrideSMethod:            somMToken;
	somAddDynamicMethod:           somMToken;
	somcUnused1:                   somMToken;
	somGetApplyStub:               somMToken;
	somFindSMethod:                somMToken;
	somFindSMethodOk:              somMToken;
	somGetMethodDescriptor:        somMToken;
	somGetNthMethodInfo:           somMToken;
	somSetClassData:               somMToken;
	somGetClassData:               somMToken;
	somNewNoInit:                  somMToken;
	somRenewNoInit:                somMToken;
	somGetInstanceToken:           somMToken;
	somGetMemberToken:             somMToken;
	somcUnused2:                   somMToken;
	somGetMethodData:              somMToken;
	somOverrideMtab:               somMToken;
	somGetMethodToken:             somMToken;
	somGetParents:                 somMToken;
	somUnused3:                    somMToken;
	somInitMIClass:                somMToken;
	somGetVersionNumbers:          somMToken;
	somLookupMethod:               somMToken;
	_get_somInstanceDataOffsets:   somMToken;
	somRenewNoZero:                somMToken;
	somRenewNoInitNoZero:          somMToken;
	somAllocate:                   somMToken;
	somDeallocate:                 somMToken;
	somGetRdStub:                  somMToken;
	somGetNthMethodData:           somMToken;
	somcPrivate8:                  somMToken;
	somcPrivate9:                  somMToken;
	_get_somDirectInitClasses:     somMToken;
	somcPrivate10:                 somMToken;
	somcPrivate11:                 somMToken;
	somcPrivate12:                 somMToken;
	somcPrivate13:                 somMToken;
	somcPrivate14:                 somMToken;
	somMethodImplOwner:            somMToken;
	somcPrivate15:                 somMToken;
	somcPrivate16:                 somMToken;
	somDefinedMethod:              somMToken;
	somcPrivate17:                 somMToken;
	somcPrivate18:                 somMToken;
	somcPrivate19:                 somMToken;
	somClassOfNewClassWithParents: somMethodProc;
	somcPrivate20:                 somMToken;
	somcUnused5:                   somMToken;
	somcUnused6:                   somMToken;
	somcUnused7:                   somMToken;
	_get_somDataAlignment:         somMToken;
	somcPrivate21:                 somMToken;
	somcUnused8:                   somMToken;
	somcPrivate22:                 somMToken;
	somcUnused9:                   somMToken;
	somcUnused10:                  somMToken;
	somGetMarshalPlan:             somMToken;
	somcUnused11:                  somMToken;
	somPrivate23:                  somMToken;
	somJoin:                       somMToken;
	somEndow:                      somMToken;
end;
PSOMClassClassDataStructure = ^SOMClassClassDataStructure;
function SOMClassClassData: PSOMClassClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMClassCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMClassCClassDataStructure = ^SOMClassCClassDataStructure;
function SOMClassCClassData: PSOMClassCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMClass: SOMClass;

(*
 * New and Renew macros for SOMObject
 *)
function SOMClassNew: SOMClass;
function SOMClassRenew(buf: Pointer): SOMClass;

(*
 * New Method: somNew
 *)
type
  somTP_SOMClass_somNew = function(somSelf: SOMClass): SOMObject; stdcall;
  somTD_SOMClass_somNew = somTP_SOMClass_somNew;
(*
 *  Uses somAllocate to allocate storage for a new
 *  instance of the receiving class, calls somRenewNoInitNoZero
 *  to load the new object's method table pointer, and then
 *  calls somDefaultInit to initialize the new object.
 *  Overrides are not expected. NULL is returned on failure.
 *)
const somMD_SOMClass_somNew = '::SOMClass::somNew';
function SOMClass_somNew(somSelf: SOMClass): SOMObject;

(*
 * New Method: somNewNoInit
 *)
type
  somTP_SOMClass_somNewNoInit = function(somSelf: SOMClass): SOMObject; stdcall;
  somTD_SOMClass_somNewNoInit = somTP_SOMClass_somNewNoInit;
(*
 *  Equivalent to somNew except that somDefaultInit is not called.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somNewNoInit = '::SOMClass::somNewNoInit';
function SOMClass_somNewNoInit(somSelf: SOMClass): SOMObject;

(*
 * New Method: somRenew
 *)
type
  somTP_SOMClass_somRenew = function(somSelf: SOMClass;
		obj: Pointer): SOMObject; stdcall;
  somTD_SOMClass_somRenew = somTP_SOMClass_somRenew;
(*
 *  Equivalent to somNew except that storage is not allocated.
 *  <obj> is taken as the address of the new object.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somRenew = '::SOMClass::somRenew';
function SOMClass_somRenew(somSelf: SOMClass; obj: Pointer): SOMObject;

(*
 * New Method: somRenewNoInit
 *)
type
  somTP_SOMClass_somRenewNoInit = function(somSelf: SOMClass;
		obj: Pointer): SOMObject; stdcall;
  somTD_SOMClass_somRenewNoInit = somTP_SOMClass_somRenewNoInit;
(*
 *  Equivalent to somRenew except that somDefaultInit is not called.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somRenewNoInit = '::SOMClass::somRenewNoInit';
function SOMClass_somRenewNoInit(somSelf: SOMClass; obj: Pointer): SOMObject;

(*
 * New Method: somRenewNoZero
 *)
type
  somTP_SOMClass_somRenewNoZero = function(somSelf: SOMClass;
		obj: Pointer): SOMObject; stdcall;
  somTD_SOMClass_somRenewNoZero = somTP_SOMClass_somRenewNoZero;

(*
 *  Equivalent to somRenew except that memory is not zeroed out.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somRenewNoZero = '::SOMClass::somRenewNoZero';
function SOMClass_somRenewNoZero(somSelf: SOMClass; obj: Pointer): SOMObject;

(*
 * New Method: somRenewNoInitNoZero
 *)
type
  somTP_SOMClass_somRenewNoInitNoZero = function(somSelf: SOMClass;
		obj: Pointer): SOMObject; stdcall;
  somTD_SOMClass_somRenewNoInitNoZero = somTP_SOMClass_somRenewNoInitNoZero;
(*
 *  This method loads an object's method table pointer, turning raw
 *  memory into an uninitialized SOM object. The other somNew and
 *  somRenew methods all call this method, so metaclasses can override
 *  this method to track object creation if this is desired. A relative
 *  parent call should be done from overrides.
 *)
const somMD_SOMClass_somRenewNoInitNoZero = '::SOMClass::somRenewNoInitNoZero';
function SOMClass_somRenewNoInitNoZero(somSelf: SOMClass;
  obj: Pointer): SOMObject;

(*
 * New Method: somAllocate
 *)
type
  somTP_SOMClass_somAllocate = function(somSelf: SOMClass;
		size: LongInt): somToken; stdcall;
  somTD_SOMClass_somAllocate = somTP_SOMClass_somAllocate;
(*
 *  nonstatic
 *  Uses the memory allocation routine associated with the receiving
 *  class to allocate memory to hold an object of the indicated size.
 *  NULL is returned on failure. The default allocation routine uses
 *  SOMMalloc.
 *)
const somMD_SOMClass_somAllocate = '::SOMClass::somAllocate';
function SOMClass_somAllocate(somSelf: SOMClass; size: LongInt): somToken;

(*
 * New Method: somDeallocate
 *)
type
  somTP_SOMClass_somDeallocate = procedure(somSelf: SOMClass;
		memptr: somToken); stdcall;
  somTD_SOMClass_somDeallocate = somTP_SOMClass_somDeallocate;
(*
 *  nonstatic
 *  Uses the memory deallocation routine associated with the receiving
 *  class to deallocate memory beginning at the address indicated by
 *  memptr. The first word of this memory (normally a method table
 *  pointer) is loaded with NULL. The deallocation routine receives
 *  a void* (memptr) and a size_t (size) as arguments.
 *)
const somMD_SOMClass_somDeallocate = '::SOMClass::somDeallocate';
procedure SOMClass_somDeallocate(somSelf: SOMClass;	memptr: somToken);

(*
 * New Method: somJoin
 *)
type
  somTP_SOMClass_somJoin = function(somSelf: SOMClass;
		secondParent: SOMClass; nameOfNewClass: CORBAString): SOMClass; stdcall;
  somTD_SOMClass_somJoin = somTP_SOMClass_somJoin;
(*
 *  Creates the multiple inheritance join of the target class and the
 *  secondParent with the class name nameOfNewClass.
 *)
const somMD_SOMClass_somJoin = '::SOMClass::somJoin';
function SOMClass_somJoin(somSelf: SOMClass; secondParent: SOMClass;
  nameOfNewClass: CORBAString): SOMClass;

(*
 * New Method: somEndow
 *)
type
  somTP_SOMClass_somEndow = function(somSelf: SOMClass; parent: SOMClass;
		nameOfNewClass: CORBAString): SOMClass; stdcall;
  somTD_SOMClass_somEndow = somTP_SOMClass_somEndow;
(*
 *  Creates the a subclass of parent with the class name nameOfNewClass
 *  where the target class is an added metaclass constraint.
 *  NOTE: this means that the target class must be a metaclass.
 *)
const somMD_SOMClass_somEndow = '::SOMClass::somEndow';
function SOMClass_somEndow(somSelf: SOMClass; parent: SOMClass;
  nameOfNewClass: CORBAString): SOMClass;

(*
 * Direct call procedure
 *)
type
  somTP_SOMClass_somClassOfNewClassWithParents =
    function(newClassName: CORBAString; parents: PSOMClass_SOMClassSequence;
      explicitMeta: SOMClass): SOMClass; stdcall;
  somTD_SOMClass_somClassOfNewClassWithParents =
    somTP_SOMClass_somClassOfNewClassWithParents;
function SOMClass_somClassOfNewClassWithParents(newClassName: CORBAString;
  parents: PSOMClass_SOMClassSequence; explicitMeta: SOMClass): SOMClass;

(*
 * New Method: somInitMIClass
 *)
type
  somTP_SOMClass_somInitMIClass = procedure(somSelf: SOMClass;
		inherit_vars: LongWord; className: CORBAString;
		parentClasses: PSOMClass_SOMClassSequence;
		dataSize, dataAlignment, maxNDMethods,
    majorVersion, minorVersion: LongInt); stdcall;
  somTD_SOMClass_somInitMIClass = somTP_SOMClass_somInitMIClass;
(*
 *  Perform inheritance into a class object from the specified parent
 *  classes, determine the layout of instances for the receiving class, and
 *  determine the layout of the instance method table for the receiving class.
 *  Overrides should perform relative parent calls.
 *)
const somMD_SOMClass_somInitMIClass = '::SOMClass::somInitMIClass';
procedure SOMClass_somInitMIClass(somSelf: SOMClass;
	inherit_vars: LongWord; className: CORBAString;
  parentClasses: PSOMClass_SOMClassSequence;
	dataSize, dataAlignment, maxNDMethods, majorVersion, minorVersion: LongInt);

(*
 * New Method: somAddStaticMethod
 *)
type
  somTP_SOMClass_somAddStaticMethod = function(somSelf: SOMClass;
		methodId, methodDescriptor: somId;
		method, redispatchStub, applyStub: somMethodPtr): somMToken; stdcall;
  somTD_SOMClass_somAddStaticMethod = somTP_SOMClass_somAddStaticMethod;
(*
 *  Introduce a new static method with the indicated methodId into
 *  the receiving class. Overrides should perform relative parent calls.
 *)
const somMD_SOMClass_somAddStaticMethod = '::SOMClass::somAddStaticMethod';
function SOMClass_somAddStaticMethod(somSelf: SOMClass;
	methodId, methodDescriptor: somId;
	method, redispatchStub, applyStub: somMethodPtr): somMToken;

(*
 * New Method: somOverrideSMethod
 *)
type
  somTP_SOMClass_somOverrideSMethod = procedure(somSelf: SOMClass;
		methodId: somId; method: somMethodPtr); stdcall;
  somTD_SOMClass_somOverrideSMethod = somTP_SOMClass_somOverrideSMethod;
(*
 *  Replace the implementation for the indicated method in the instances
 *  of the receiving class. Overrides should perform relative parent calls.
 *)
const somMD_SOMClass_somOverrideSMethod = '::SOMClass::somOverrideSMethod';
procedure SOMClass_somOverrideSMethod(somSelf: SOMClass;
	methodId: somId; method: somMethodPtr);

(*
 * New Method: somClassReady
 *)
type
  somTP_SOMClass_somClassReady = procedure(somSelf: SOMClass); stdcall;
  somTD_SOMClass_somClassReady = somTP_SOMClass_somClassReady;
(*
 *  This method is invoked when all of the static initialization for
 *  the class has been finished (i.e., its instance method table has
 *  been loaded) and allows final setup for the class to be done. When
 *  overriding this method, all setup should be done before doing a
 *  relative pcall, since SOMClass's implementation will register the
 *  class with the class manager.
 *)
const somMD_SOMClass_somClassReady = '::SOMClass::somClassReady';
procedure SOMClass_somClassReady(somSelf: SOMClass);

(*
 * New Method: somAddDynamicMethod
 *)
type
  somTP_SOMClass_somAddDynamicMethod = procedure(somSelf: SOMClass;
		methodId, methodDescriptor: somId;
		methodImpl, applyStub: somMethodPtr); stdcall;
  somTD_SOMClass_somAddDynamicMethod = somTP_SOMClass_somAddDynamicMethod;
(*
 *  If the receiving class supports a static method with the indicated
 *  methodId, then override the method with the indicated implementation.
 *  Otherwise, a dynamic method with the indicated methodId is added to
 *  the receiving class.
 *)
const somMD_SOMClass_somAddDynamicMethod  = '::SOMClass::somAddDynamicMethod';
procedure SOMClass_somAddDynamicMethod(somSelf: SOMClass;
	methodId, methodDescriptor: somId; methodImpl, applyStub: somMethodPtr);

(*
 * New Method: somGetName
 *)
type
  somTP_SOMClass_somGetName = function(somSelf: SOMClass): CORBAString; stdcall;
  somTD_SOMClass_somGetName = somTP_SOMClass_somGetName;
(*
 *  This object's class name as a NULL terminated string.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetName = '::SOMClass::somGetName';
function SOMClass_somGetName(somSelf: SOMClass): CORBAString;

(*
 * New Method: somGetVersionNumbers
 *)
type
  somTP_SOMClass_somGetVersionNumbers = procedure(somSelf: SOMClass;
		out majorVersion, minorVersion: LongInt); stdcall;
  somTD_SOMClass_somGetVersionNumbers = somTP_SOMClass_somGetVersionNumbers;
(*
 *  Returns the class' major and minor version numbers in the corresponding
 *  output parameters.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetVersionNumbers = '::SOMClass::somGetVersionNumbers';
procedure SOMClass_somGetVersionNumbers(somSelf: SOMClass;
  out majorVersion, minorVersion: LongInt);

(*
 * New Method: somGetNumMethods
 *)
type
  somTP_SOMClass_somGetNumMethods = function(somSelf: SOMClass):
    LongInt; stdcall;
  somTD_SOMClass_somGetNumMethods = somTP_SOMClass_somGetNumMethods;
(*
 *  The number of methods currently supported by this class,
 *  including inherited methods (static, nonstatic, and dynamic).
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetNumMethods = '::SOMClass::somGetNumMethods';
function SOMClass_somGetNumMethods(somSelf: SOMClass): LongInt;

(*
 * New Method: somGetNumStaticMethods
 *)
type
  somTP_SOMClass_somGetNumStaticMethods = function(somSelf: SOMClass):
    LongInt; stdcall;
  somTD_SOMClass_somGetNumStaticMethods = somTP_SOMClass_somGetNumStaticMethods;
(*
 *  The number of nondynamic methods that this class has.  Can
 *  be used by a child class when initializing its method table.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetNumStaticMethods = '::SOMClass::somGetNumStaticMethods';
function SOMClass_somGetNumStaticMethods(somSelf: SOMClass): LongInt;

(*
 * New Method: somGetParents
 *)
type
  somTP_SOMClass_somGetParents = function(somSelf: SOMClass):
    SOMClass_SOMClassSequence; stdcall;
  somTD_SOMClass_somGetParents = somTP_SOMClass_somGetParents;
(*
 *  Returns a sequence containing pointers to the receiver's parent classes.
 *  Caller is responsible for using SOMFree on the returned sequence buffer.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetParents = '::SOMClass::somGetParents';
function SOMClass_somGetParents(somSelf: SOMClass): SOMClass_SOMClassSequence;

(*
 * New Method: somGetInstanceSize
 *)
type
  somTP_SOMClass_somGetInstanceSize = function(somSelf: SOMClass): LongInt; stdcall;
  somTD_SOMClass_somGetInstanceSize = somTP_SOMClass_somGetInstanceSize;
(*
 *  The total size of an instance of the receiving class.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetInstanceSize = '::SOMClass::somGetInstanceSize';
function SOMClass_somGetInstanceSize(somSelf: SOMClass): LongInt;

(*
 * New Method: somGetInstancePartSize
 *)
type
  somTP_SOMClass_somGetInstancePartSize = function(somSelf: SOMClass):
    LongInt; stdcall;
  somTD_SOMClass_somGetInstancePartSize = somTP_SOMClass_somGetInstancePartSize;
(*
 *  The size in bytes of the instance data introduced by the receiving
 *  class.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetInstancePartSize = '::SOMClass::somGetInstancePartSize';
function SOMClass_somGetInstancePartSize(somSelf: SOMClass): LongInt;

(*
 * New Method: somGetInstanceToken
 *)
type
  somTP_SOMClass_somGetInstanceToken = function(somSelf: SOMClass):
    somDToken; stdcall;
  somTD_SOMClass_somGetInstanceToken = somTP_SOMClass_somGetInstanceToken;
(*
 *  A data token that identifies the introduced portion of this class
 *  within itself or any derived class.  This token can be subsequently
 *  passed to the run-time somDataResolve function to locate the instance
 *  data introduced by this class in any object derived from this class.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetInstanceToken = '::SOMClass::somGetInstanceToken';
function SOMClass_somGetInstanceToken(somSelf: SOMClass): somDToken;

(*
 * New Method: somGetMemberToken
 *)
type
  somTP_SOMClass_somGetMemberToken = function(somSelf: SOMClass;
		memberOffset: LongInt; instanceToken: somDToken): somDToken; stdcall;
  somTD_SOMClass_somGetMemberToken = somTP_SOMClass_somGetMemberToken;
(*
 *  Returns a data token that for the data member at offset
 *  "memberOffset" within the introduced portion of the class identified
 *  by instanceToken.  The instance token must have been obtained from a
 *  previous invocation of somGetInstanceToken.  The returned member
 *  token can be subsequently passed to the run-time somDataResolve
 *  function to locate the data member.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetMemberToken = '::SOMClass::somGetMemberToken';
function SOMClass_somGetMemberToken(somSelf: SOMClass;
  memberOffset: LongInt; instanceToken: somDToken): somDToken;

(*
 * New Method: somGetClassMtab
 *)
type
  somTP_SOMClass_somGetClassMtab = function(somSelf: SOMClass):
    somMethodTabPtr; stdcall;
  somTD_SOMClass_somGetClassMtab = somTP_SOMClass_somGetClassMtab;
(*
 *  A pointer to the method table used by instances of this class. This
 *  method was misnamed; it should have been called somGetInstanceMtab.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetClassMtab = '::SOMClass::somGetClassMtab';
function SOMClass_somGetClassMtab(somSelf: SOMClass): somMethodTabPtr;

(*
 * New Method: somGetClassData
 *)
type
  somTP_SOMClass_somGetClassData = function(somSelf: SOMClass):
    somClassDataStructurePtr; stdcall;
  somTD_SOMClass_somGetClassData = somTP_SOMClass_somGetClassData;
const somMD_SOMClass_somGetClassData = '::SOMClass::somGetClassData';
function SOMClass_somGetClassData(somSelf: SOMClass): somClassDataStructurePtr;

(*
 * New Method: somSetClassData
 *)
type
  somTP_SOMClass_somSetClassData = procedure(somSelf: SOMClass;
		cds: somClassDataStructurePtr); stdcall;
  somTD_SOMClass_somSetClassData = somTP_SOMClass_somSetClassData;
(*
 *  The pointer to the static <className>ClassData structure.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somSetClassData = '::SOMClass::somSetClassData';
procedure SOMClass_somSetClassData(somSelf: SOMClass;
  cds: somClassDataStructurePtr);

(*
 * New Method: _get_somDataAlignment
 *)
type
  somTP_SOMClass__get_somDataAlignment = function(somSelf: SOMClass):
    LongInt; stdcall;
  somTD_SOMClass__get_somDataAlignment = somTP_SOMClass__get_somDataAlignment;
(*
 *  The alignment required for the instance data structure
 *  introduced by the receiving class.
 *  Overrides are not expected.
 *)
const somMD_SOMClass__get_somDataAlignment = '::SOMClass::_get_somDataAlignment';
function SOMClass__get_somDataAlignment(somSelf: SOMClass): LongInt;

(*
 * New Method: _get_somInstanceDataOffsets
 *)
type
  somTP_SOMClass__get_somInstanceDataOffsets = function(somSelf: SOMClass):
    SOMClass_somOffsets; stdcall;
  somTD_SOMClass__get_somInstanceDataOffsets =
    somTP_SOMClass__get_somInstanceDataOffsets;
(*
 *  A sequence of the instance data offsets for all classes used in
 *  the derivation of the receiving class (including the receiver).
 *  The caller is responsible for freeing the returned sequence buffer.
 *  Overrides are not expected.
 *)
const somMD_SOMClass__get_somInstanceDataOffsets =
  '::SOMClass::_get_somInstanceDataOffsets';
function SOMClass__get_somInstanceDataOffsets(somSelf: SOMClass):
  SOMClass_somOffsets;

(*
 * New Method: _get_somDirectInitClasses
 *)
type
  somTP_SOMClass__get_somDirectInitClasses = function(somSelf: SOMClass):
    SOMClass_SOMClassSequence; stdcall;
  somTD_SOMClass__get_somDirectInitClasses =
    somTP_SOMClass__get_somDirectInitClasses;
(*
 *  The ancestors whose initializers the receiving class wants to
 *  directly invoke. Caller is responsible for freeing the returned
 *  sequence buffer.
 *  Overrides are not expected.
 *)
const somMD_SOMClass__get_somDirectInitClasses = '::SOMClass::_get_somDirectInitClasses';
function SOMClass__get_somDirectInitClasses(somSelf: SOMClass):
  SOMClass_SOMClassSequence;

(*
 * New Method: somGetMethodDescriptor
 *)
type
  somTP_SOMClass_somGetMethodDescriptor = function(somSelf: SOMClass;
    methodId: somId): somId; stdcall;
  somTD_SOMClass_somGetMethodDescriptor = somTP_SOMClass_somGetMethodDescriptor;
(*
 *  Returns the method descriptor for the indicated method.    If
 *  this object does not support the indicated method then NULL is
 *  returned.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetMethodDescriptor = '::SOMClass::somGetMethodDescriptor';
function SOMClass_somGetMethodDescriptor(somSelf: SOMClass;
  methodId: somId): somId;

(*
 * New Method: somGetMethodIndex
 *)
type
  somTP_SOMClass_somGetMethodIndex = function(somSelf: SOMClass; id: somId):
    LongInt; stdcall;
  somTD_SOMClass_somGetMethodIndex = somTP_SOMClass_somGetMethodIndex;
(*
 *  Returns the index for the specified method. (A number that may
 *  change if any methods are added or deleted to this class object or
 *  any of its ancestors).  This number is the basis for other calls to
 *  get info about the method. Indexes start at 0. A -1 is returned if
 *  the method cannot be found.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetMethodIndex = '::SOMClass::somGetMethodIndex';
function SOMClass_somGetMethodIndex(somSelf: SOMClass; id: somId): LongInt;

(*
 * New Method: somGetMethodToken
 *)
type
  somTP_SOMClass_somGetMethodToken = function(somSelf: SOMClass;
    methodId: somId): somMToken; stdcall;
  somTD_SOMClass_somGetMethodToken = somTP_SOMClass_somGetMethodToken;
(*
 *  Returns the specified method's access token. This token can then
 *  be passed to method resolution routines, which use the token
 *  to select a method pointer from a method table.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetMethodToken = '::SOMClass::somGetMethodToken';
function SOMClass_somGetMethodToken(somSelf: SOMClass; methodId: somId):
  somMToken;

(*
 * New Method: somGetNthMethodInfo
 *)
type
  somTP_SOMClass_somGetNthMethodInfo = function(somSelf: SOMClass;
		n: LongInt; out descriptor: somId): somId; stdcall;
  somTD_SOMClass_somGetNthMethodInfo = somTP_SOMClass_somGetNthMethodInfo;
(*
 *  Returns the id of the <n>th method if one exists and NULL
 *  otherwise.
 *
 *  The ordering of the methods is unpredictable, but will not change
 *  unless some change is made to the class or one of its ancestor classes.
 *
 *  See CORBA documentation for info on method descriptors.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetNthMethodInfo = '::SOMClass::somGetNthMethodInfo';
function SOMClass_somGetNthMethodInfo(somSelf: SOMClass; n: LongInt;
  out descriptor: somId): somId;

(*
 * New Method: somGetMarshalPlan
 *)
type
  somTP_SOMClass_somGetMarshalPlan = function(somSelf: SOMClass;
		methodId: somId): somToken; stdcall;
  somTD_SOMClass_somGetMarshalPlan = somTP_SOMClass_somGetMarshalPlan;
(*
 *  uses namelookup from the target class to locate a method that has the
 *  indicated methodId, and returns that method's marshal plan if there
 *  is one. Otherwise, null is returned.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetMarshalPlan = '::SOMClass::somGetMarshalPlan';
function SOMClass_somGetMarshalPlan(somSelf: SOMClass; methodId: somId):
  somToken;

(*
 * New Method: somGetMethodData
 *)
type
  somTP_SOMClass_somGetMethodData = function(somSelf: SOMClass;
		methodId: somId; out md: somMethodData): CORBABoolean; stdcall;
  somTD_SOMClass_somGetMethodData = somTP_SOMClass_somGetMethodData;
(*
 *  If the receiving class supports a method with the specified somId,
 *  then the method data pointed to by md is loaded with information
 *  for the method and 1 (TRUE) is returned. Otherwise md->id is set to
 *  NULL and 0 (FALSE) is returned. On success, the md->method field is
 *  loaded with a the address of a function that invokes the method
 *  implementation appropriate for instances of the receiving class.
 *  Successive calls for the same method are *not* guaranteed to load
 *  md->method with the same address. All somId-based method resolution
 *  routines use the md->method address computed by somGetMethodData
 *  as their resolution result.
 *)
const somMD_SOMClass_somGetMethodData = '::SOMClass::somGetMethodData';
function SOMClass_somGetMethodData(somSelf: SOMClass;	methodId: somId;
  out md: somMethodData): CORBABoolean;

(*
 * New Method: somGetNthMethodData
 *)
type
  somTP_SOMClass_somGetNthMethodData = function(somSelf: SOMClass;
		n: LongInt; out md: somMethodData): CORBABoolean; stdcall;
  somTD_SOMClass_somGetNthMethodData = somTP_SOMClass_somGetNthMethodData;
(*
 *  This method is similar to somGetMethodData. The method
 *  whose data is returned is the method for which the receiving
 *  class would return n from somGetMethodIndex.
 *)
const somMD_SOMClass_somGetNthMethodData = '::SOMClass::somGetNthMethodData';
function SOMClass_somGetNthMethodData(somSelf: SOMClass; n: LongInt;
  out md: somMethodData): CORBABoolean;

(*
 * New Method: somFindMethod
 *)
type
  somTP_SOMClass_somFindMethod = function(somSelf: SOMClass;
		methodId: somId; out m: somMethodPtr): CORBABoolean; stdcall;
  somTD_SOMClass_somFindMethod = somTP_SOMClass_somFindMethod;
(*
 *  If the receiving class supports a method with the specified
 *  methodId, m is set to the address of a function that
 *  will invoke the method implementation appropriate for instances
 *  of the receiving class and 1 (TRUE) is returned. Otherwise, m is
 *  set to NULL and 0 (FALSE) is returned. Successive calls on the
 *  same class with the same arguments are not guaranteed to return
 *  the same function address.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somFindMethod = '::SOMClass::somFindMethod';
function SOMClass_somFindMethod(somSelf: SOMClass; methodId: somId;
  out m: somMethodPtr): CORBABoolean;

(*
 * New Method: somFindMethodOk
 *)
type
  somTP_SOMClass_somFindMethodOk = function(somSelf: SOMClass;
		methodId: somId; out m: somMethodPtr): CORBABoolean; stdcall;
  somTD_SOMClass_somFindMethodOk = somTP_SOMClass_somFindMethodOk;
(*
 *  Just like <somFindMethod> except that if the method is not
 *  supported then an error is raised and execution is halted.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somFindMethodOk = '::SOMClass::somFindMethodOk';
function SOMClass_somFindMethodOk(somSelf: SOMClass; methodId: somId;
  out m: somMethodPtr): CORBABoolean;

(*
 * New Method: somFindSMethod
 *)
type
  somTP_SOMClass_somFindSMethod = function(somSelf: SOMClass;
		methodId: somId): somMethodPtr; stdcall;
  somTD_SOMClass_somFindSMethod = somTP_SOMClass_somFindSMethod;
(*
 *  Finds the indicated method, which must be a static method supported
 *  by this class, and returns a pointer to a function that will
 *  invoke the method implementation appropriate for instances of the
 *  receiving class. If the method is not supported by the receiver
 *  (as a static method or at all) then a NULL pointer is returned.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somFindSMethod = '::SOMClass::somFindSMethod';
function SOMClass_somFindSMethod(somSelf: SOMClass;	methodId: somId):
  somMethodPtr;

(*
 * New Method: somFindSMethodOk
 *)
type
  somTP_SOMClass_somFindSMethodOk = function(somSelf: SOMClass;
    methodId: somId): somMethodPtr; stdcall;
  somTD_SOMClass_somFindSMethodOk = somTP_SOMClass_somFindSMethodOk;
(*
 *  Uses <somFindSMethod>, and raises an error if the result is NULL.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somFindSMethodOk = '::SOMClass::somFindSMethodOk';
function SOMClass_somFindSMethodOk(somSelf: SOMClass; methodId: somId):
  somMethodPtr;

(*
 * New Method: somLookupMethod
 *)
type
  somTP_SOMClass_somLookupMethod = function(somSelf: SOMClass; methodId: somId):
    somMethodPtr; stdcall;
  somTD_SOMClass_somLookupMethod = somTP_SOMClass_somLookupMethod;
(*
 *  Like <somFindSMethodOK>, but without restriction to static methods.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somLookupMethod = '::SOMClass::somLookupMethod';
function SOMClass_somLookupMethod(somSelf: SOMClass; methodId: somId):
  somMethodPtr;

(*
 * New Method: somGetApplyStub
 *)
type
  somTP_SOMClass_somGetApplyStub = function(somSelf: SOMClass; methodId: somId):
    somMethodPtr; stdcall;
  somTD_SOMClass_somGetApplyStub = somTP_SOMClass_somGetApplyStub;
(*
 *  Returns the apply stub associated with the specified method,
 *  if one exists; otherwise NULL is returned. This method is obsolete,
 *  and retained for binary compatability. In SOMr2, users never access
 *  apply stubs directly; The function somApply is used to invoke apply
 *  stubs. See somApply documentation for further information on apply
 *  stubs, and see somAddStaticMethod documentation for information
 *  on how apply stubs are registered by class implementations.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetApplyStub = '::SOMClass::somGetApplyStub';
function SOMClass_somGetApplyStub(somSelf: SOMClass; methodId: somId):
  somMethodPtr;

(*
 * New Method: somGetPClsMtab
 *)
type
  somTP_SOMClass_somGetPClsMtab = function(somSelf: SOMClass):
    somMethodTabs; stdcall;
  somTD_SOMClass_somGetPClsMtab = somTP_SOMClass_somGetPClsMtab;
(*
 *  Returns a list of the method tables of this class's parent classes in the
 *  specific format required by somParentNumResolve (for making parent method
 *  calls. The first entry on the list is actually the method table of the
 *  receiving class. Because the CClassData structure contains this list, the
 *  method table for any class with a CClassData structure is statically
 *  available. This method now returns a list because older SI emitters load
 *  CClassData.parentMtab with the result of this call, and the new runtime
 *  requires a list of classes in that position.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somGetPClsMtab = '::SOMClass::somGetPClsMtab';
function SOMClass_somGetPClsMtab(somSelf: SOMClass): somMethodTabs;

(*
 * New Method: somCheckVersion
 *)
type
  somTP_SOMClass_somCheckVersion = function(somSelf: SOMClass;
		majorVersion, minorVersion: LongInt): CORBABoolean; stdcall;
  somTD_SOMClass_somCheckVersion = somTP_SOMClass_somCheckVersion;
(*
 *  Returns 1 (true) if the implementation of this class is
 *  compatible with the specified major and minor version number and
 *  false (0) otherwise.  An implementation is compatible with the
 *  specified version numbers if it has the same major version number
 *  and a minor version number that is equal to or greater than
 *  <minorVersion>.    The major, minor version number pair (0,0) is
 *  considered to match any version.  This method is usually called
 *  immediately after creating the class object to verify that a
 *  dynamically loaded class definition is compatible with a using
 *  application.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somCheckVersion = '::SOMClass::somCheckVersion';
function SOMClass_somCheckVersion(somSelf: SOMClass;
	majorVersion, minorVersion: LongInt): CORBABoolean;

(*
 * New Method: somDescendedFrom
 *)
type
  somTP_SOMClass_somDescendedFrom = function(somSelf: SOMClass;
    aClassObj: SOMClass): CORBABoolean; stdcall;
  somTD_SOMClass_somDescendedFrom = somTP_SOMClass_somDescendedFrom;
(*
 *  Returns 1 (true) if <self> is a descendent class of <aClassObj> and
 *  0 (false) otherwise.  Note: a class object is considered to be
 *  descended itself for the purposes of this method.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somDescendedFrom = '::SOMClass::somDescendedFrom';
function SOMClass_somDescendedFrom(somSelf: SOMClass; aClassObj: SOMClass):
  CORBABoolean;

(*
 * New Method: somSupportsMethod
 *)
type
  somTP_SOMClass_somSupportsMethod = function(somSelf: SOMClass;
		mId: somId): CORBABoolean; stdcall;
  somTD_SOMClass_somSupportsMethod = somTP_SOMClass_somSupportsMethod;
(*
 *  Returns 1 (true) if the indicated method is supported by this
 *  class and 0 (false) otherwise.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somSupportsMethod = '::SOMClass::somSupportsMethod';
function SOMClass_somSupportsMethod(somSelf: SOMClass; mId: somId): CORBABoolean;

(*
 * New Method: somDefinedMethod
 *)
type
  somTP_SOMClass_somDefinedMethod = function(somSelf: SOMClass;
		method: somMToken): somMethodPtr; stdcall;
  somTD_SOMClass_somDefinedMethod = somTP_SOMClass_somDefinedMethod;
(*
 *  If the receiving class explicitly defines an implementation for
 *  the indicated method, then the address of a function that will invoke
 *  this implementation is returned. Otherwise NULL is returned.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somDefinedMethod = '::SOMClass::somDefinedMethod';
function SOMClass_somDefinedMethod(somSelf: SOMClass;	method: somMToken):
  somMethodPtr;

(*
 * New Method: somMethodImplOwner
 *)
type
  somTP_SOMClass_somMethodImplOwner = function(somSelf: SOMClass;
		var md: somMethodData): SOMClass; stdcall;
  somTD_SOMClass_somMethodImplOwner = somTP_SOMClass_somMethodImplOwner;
(*
 *  Returns the owner of the implementation of the method indicated by md
 *  for instances of the receiving class, and loads md->method with a
 *  pointer to the method implementation. If the receiving class doesn't
 *  support the method, md->method is not changed, and null is returned.
 *  Implementations that are automatically installed by SOM (such as for
 *  SOMObject's initializers and for legacy support of somInit) are
 *  reported as being owned by SOMObject.
 *  Overrides are not expected.
 *)
const somMD_SOMClass_somMethodImplOwner = '::SOMClass::somMethodImplOwner';
function SOMClass_somMethodImplOwner(somSelf: SOMClass;	var md: somMethodData):
  SOMClass;

(*
 * New Method: somGetRdStub
 *)
type
  somTP_SOMClass_somGetRdStub = function(somSelf: SOMClass; methodId: somId):
    somMethodProc; stdcall;
  somTD_SOMClass_somGetRdStub = somTP_SOMClass_somGetRdStub;
(*
 *  Returns a redispatch stub for the indicated method if possible.
 *  If not possible (because a valid redispatch stub has not been
 *  registered, and there is insufficient information to dynamically
 *  construct one), then a pointer to a function that prints an
 *  informative message and terminates execution is returned.
 *)
const somMD_SOMClass_somGetRdStub = '::SOMClass::somGetRdStub';
function SOMClass_somGetRdStub(somSelf: SOMClass; methodId: somId):
  somMethodProc;

(*
 * New Method: somOverrideMtab
 *)
type
  somTP_SOMClass_somOverrideMtab = procedure(somSelf: SOMClass); stdcall;
  somTD_SOMClass_somOverrideMtab = somTP_SOMClass_somOverrideMtab;
(*
 *  Overrides the method table pointers to point to the redispatch stubs.
 *  All the methods except somDispatch methods are overriden.
 *)
const somMD_SOMClass_somOverrideMtab = '::SOMClass::somOverrideMtab';
procedure SOMClass_somOverrideMtab(somSelf: SOMClass);

// #include <somcm.h>

(*
 *  [Basic Functions Group]
 *)

(*
 * Start of bindings for IDL types
 *)
type
  Repository = SOMObject;
  SOMClassMgr_SOMClassArray = PSOMClass;
(*
 *  Used for SOM 1.0 binary compatibility
 *)

(*
 * End of bindings for IDL types.
 *)

const
  SOMClassMgr_MajorVersion = 1;
  SOMClassMgr_MinorVersion = 6;

(*
 * Declare the class creation procedure
 *)
function SOMClassMgrNewClass(
  somtmajorVersion: integer4 = SOMClassMgr_MajorVersion;
	somtminorVersion: integer4 = SOMClassMgr_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMClassMgrClassDataStructure = record
	classObject: SOMClass;
	somFindClsInFile: somMToken;
	somFindClass: somMToken;
	somClassFromId: somMToken;
	somRegisterClass: somMToken;
	somUnregisterClass: somMToken;
	somLocateClassFile: somMToken;
	somLoadClassFile: somMToken;
	somUnloadClassFile: somMToken;
	somGetInitFunction: somMToken;
	somMergeInto: somMToken;
	somGetRelatedClasses: somMToken;
	somSubstituteClass: somMToken;
	_get_somInterfaceRepository: somMToken;
	_set_somInterfaceRepository: somMToken;
	_get_somRegisteredClasses: somMToken;
	somBeginPersistentClasses: somMToken;
	somEndPersistentClasses: somMToken;
	somcmPrivate1: somMToken;
	somcmPrivate2: somMToken;
	somRegisterClassLibrary: somMToken;
	somJoinAffinityGroup: somMToken;
	somUnregisterClassLibrary: somMToken;
	somImportObject: somMToken;
	somcmPrivate3: somMToken;
	somcmPrivate4: somMToken;
end;
PSOMClassMgrClassDataStructure = ^SOMClassMgrClassDataStructure;
function SOMClassMgrClassData: PSOMClassMgrClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMClassMgrCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMClassMgrCClassDataStructure = ^SOMClassMgrCClassDataStructure;
function SOMClassMgrCClassData: PSOMClassMgrCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMClassMgr: SOMClass;

(*
 * New and Renew macros for SOMObject
 *)
function SOMClassMgrNew: SOMClassMgr;
function SOMClassMgrRenew(buf: Pointer): SOMClassMgr;

(*
 * New Method: somLoadClassFile
 *)
type
  somTP_SOMClassMgr_somLoadClassFile = function(somSelf: SOMClassMgr;
    classId: somId; majorVersion, minorVersion: LongInt;
    fileName: CORBAString): SOMClass; stdcall;
  somTD_SOMClassMgr_somLoadClassFile = somTP_SOMClassMgr_somLoadClassFile;
(*
 *  Loads the class' code and initializes the class object.
 *)
const somMD_SOMClassMgr_somLoadClassFile = '::SOMClassMgr::somLoadClassFile';
function SOMClassMgr_somLoadClassFile(somSelf: SOMClassMgr; classId: somId;
  majorVersion, minorVersion: LongInt; fileName: CORBAString): SOMClass;

(*
 * New Method: somLocateClassFile
 *)
type
  somTP_SOMClassMgr_somLocateClassFile = function(somSelf: SOMClassMgr;
		classId: somId;	majorVersion,	minorVersion: LongInt): CORBAString; stdcall;
  somTD_SOMClassMgr_somLocateClassFile = somTP_SOMClassMgr_somLocateClassFile;
(*
 *  Real implementation supplied by subclasses.  Default implementation
 *  will lookup the class name in the Interface Repository (if one is
 *  available) to determine the implementation file name (ie, DLL name).
 *  If this information is not available, the class name itself is
 *  returned as the file name.   Subclasses may use version number
 *  info to assist in deriving the file name.
 *)
const somMD_SOMClassMgr_somLocateClassFile = '::SOMClassMgr::somLocateClassFile';
function SOMClassMgr_somLocateClassFile(somSelf: SOMClassMgr;	classId: somId;
  majorVersion,	minorVersion: LongInt): CORBAString;

(*
 * New Method: somRegisterClass
 *)
type
  somTP_SOMClassMgr_somRegisterClass = procedure(somSelf: SOMClassMgr;
		classObj: SOMClass); stdcall;
  somTD_SOMClassMgr_somRegisterClass = somTP_SOMClassMgr_somRegisterClass;
(*
 *  Lets the class manager know that the specified class is installed
 *  and tells it where the class object is.
 *)
const somMD_SOMClassMgr_somRegisterClass = '::SOMClassMgr::somRegisterClass';
procedure SOMClassMgr_somRegisterClass(somSelf: SOMClassMgr;
  classObj: SOMClass);

(*
 * New Method: somRegisterClassLibrary
 *)
type
  somTP_SOMClassMgr_somRegisterClassLibrary = procedure(somSelf: SOMClassMgr;
		libraryName: CORBAString; libraryInitRtn: somMethodPtr); stdcall;
  somTD_SOMClassMgr_somRegisterClassLibrary =
    somTP_SOMClassMgr_somRegisterClassLibrary;
(*
 *  Informs the class manager that a class library has been loaded.
 *  "libraryName" is the name associated with the file containing the
 *  implementation(s) of the class(es) in the class library.
 *  "libraryInitRtn" is the entry point of a SOMInitModule function
 *  that can be used to initialize the class library.  For platforms
 *  that have the capability to automatically invoke a library
 *  initialization function whenever a library is loaded, a call
 *  to this method should occur within the library's automatic init
 *  function.
 *)
const somMD_SOMClassMgr_somRegisterClassLibrary = '::SOMClassMgr::somRegisterClassLibrary';
procedure SOMClassMgr_somRegisterClassLibrary(somSelf: SOMClassMgr;
  libraryName: CORBAString; libraryInitRtn: somMethodPtr);

(*
 * New Method: somUnregisterClassLibrary
 *)
type
  somTP_SOMClassMgr_somUnregisterClassLibrary = procedure(somSelf: SOMClassMgr;
    libraryName: CORBAString); stdcall;
  somTD_SOMClassMgr_somUnregisterClassLibrary =
    somTP_SOMClassMgr_somUnregisterClassLibrary;
(*
 *  Informs the class manager that a class library has been unloaded.
 *  "libraryName" is the name associated with the file containing the
 *  implementation(s) of the class(es) in the class library.
 *  For platforms that have the capability to automatically invoke a
 *  library termination function whenever a library is unloaded, a call
 *  to this method should occur within the library's automatic
 *  termination function.
 *)
const somMD_SOMClassMgr_somUnregisterClassLibrary = '::SOMClassMgr::somUnregisterClassLibrary';
procedure SOMClassMgr_somUnregisterClassLibrary(somSelf: SOMClassMgr;
  libraryName: CORBAString);

(*
 * New Method: somUnloadClassFile
 *)
type
  somTP_SOMClassMgr_somUnloadClassFile = function(somSelf: SOMClassMgr;
		classObj: SOMClass): LongInt; stdcall;
  somTD_SOMClassMgr_somUnloadClassFile = somTP_SOMClassMgr_somUnloadClassFile;
(*
 *  Releases the class' code and unregisters all classes in the
 *  same affinity group (see somGetRelatedClasses below).
 *)
const somMD_SOMClassMgr_somUnloadClassFile = '::SOMClassMgr::somUnloadClassFile';
function SOMClassMgr_somUnloadClassFile(somSelf: SOMClassMgr;
  classObj: SOMClass): LongInt;

(*
 * New Method: somUnregisterClass
 *)
type
  somTP_SOMClassMgr_somUnregisterClass = function(somSelf: SOMClassMgr;
    classObj: SOMClass): LongInt; stdcall;
  somTD_SOMClassMgr_somUnregisterClass = somTP_SOMClassMgr_somUnregisterClass;
(*
 *  Free the class object and removes the class from the SOM registry.
 *  If the class caused dynamic loading to occur, it is also unloaded
 *  (causing its entire affinity group to be unregistered as well).
 *)
const somMD_SOMClassMgr_somUnregisterClass = '::SOMClassMgr::somUnregisterClass';
function SOMClassMgr_somUnregisterClass(somSelf: SOMClassMgr;
  classObj: SOMClass): LongInt;

(*
 * New Method: somBeginPersistentClasses
 *)
type
  somTP_SOMClassMgr_somBeginPersistentClasses = procedure(somSelf: SOMClassMgr);
    stdcall;
  somTD_SOMClassMgr_somBeginPersistentClasses =
    somTP_SOMClassMgr_somBeginPersistentClasses;
(*
 *  Starts a bracket for the current thread wherein all classes
 *  that are registered are marked as permanant and cannot be
 *  unregistered or unloaded.  Persistent classes brackets may be
 *  nested.
 *)
const somMD_SOMClassMgr_somBeginPersistentClasses = '::SOMClassMgr::somBeginPersistentClasses';
procedure SOMClassMgr_somBeginPersistentClasses(somSelf: SOMClassMgr);

(*
 * New Method: somEndPersistentClasses
 *)
type
  somTP_SOMClassMgr_somEndPersistentClasses = procedure(somSelf: SOMClassMgr);
    stdcall;
  somTD_SOMClassMgr_somEndPersistentClasses =
    somTP_SOMClassMgr_somEndPersistentClasses;
(*
 *  Ends a persistent classes bracket for the current thread.
 *)
const somMD_SOMClassMgr_somEndPersistentClasses = '::SOMClassMgr::somEndPersistentClasses';
procedure SOMClassMgr_somEndPersistentClasses(somSelf: SOMClassMgr);

(*
 * New Method: somJoinAffinityGroup
 *)
type
  somTP_SOMClassMgr_somJoinAffinityGroup = function(somSelf: SOMClassMgr;
    newClass, affClass: SOMClass): CORBABoolean; stdcall;
  somTD_SOMClassMgr_somJoinAffinityGroup = somTP_SOMClassMgr_somJoinAffinityGroup;
(*
 *  If <affClass> is a member of an affinity group, and <newClass> is not a
 *  member of any affinity group, this method adds <newClass> to the
 *  same affinity group as <affClass>.  If the method succeeds it returns
 *  TRUE, otherwise it returns FALSE.  Adding a class to an affinity group
 *  effectively equates its lifetime with that of the other members of
 *  the affinity group.
 *  [Access Group]
 *)
const somMD_SOMClassMgr_somJoinAffinityGroup = '::SOMClassMgr::somJoinAffinityGroup';
function SOMClassMgr_somJoinAffinityGroup(somSelf: SOMClassMgr;
  newClass, affClass: SOMClass): CORBABoolean;

(*
 * New Method: somGetInitFunction
 *)
type
  somTP_SOMClassMgr_somGetInitFunction = function(somSelf: SOMClassMgr):
    CORBAString; stdcall;
  somTD_SOMClassMgr_somGetInitFunction = somTP_SOMClassMgr_somGetInitFunction;
(*
 *  The name of the initialization function in the class' code file.
 *  Default implementation returns (*SOMClassInitFuncName)().
 *)
const somMD_SOMClassMgr_somGetInitFunction = '::SOMClassMgr::somGetInitFunction';
function SOMClassMgr_somGetInitFunction(somSelf: SOMClassMgr): CORBAString;

(*
 * New Method: _get_somInterfaceRepository
 *)
type
  somTP_SOMClassMgr__get_somInterfaceRepository = function(
    somSelf: SOMClassMgr): Repository; stdcall;
  somTD_SOMClassMgr__get_somInterfaceRepository =
    somTP_SOMClassMgr__get_somInterfaceRepository;
(*
 *  The Repository object that provides access to the Interface Repository,
 *  If no Interface Repository has yet been assigned to this attribute,
 *  and the SOMClassMgr is unable to load and instantiate it, the attribute
 *  will have the value NULL.  When finished using the Repository object
 *  you should release your reference using the somDestruct method with
 *  a non-zero <doFree> parameter.
 *)
const somMD_SOMClassMgr__get_somInterfaceRepository = '::SOMClassMgr::_get_somInterfaceRepository';
function SOMClassMgr__get_somInterfaceRepository(somSelf: SOMClassMgr):
  Repository;

(*
 * New Method: _set_somInterfaceRepository
 *)
type
  somTP_SOMClassMgr__set_somInterfaceRepository = procedure(
    somSelf: SOMClassMgr; somInterfaceRepository: Repository); stdcall;
  somTD_SOMClassMgr__set_somInterfaceRepository =
    somTP_SOMClassMgr__set_somInterfaceRepository;
(*
 *  The Repository object that provides access to the Interface Repository,
 *  If no Interface Repository has yet been assigned to this attribute,
 *  and the SOMClassMgr is unable to load and instantiate it, the attribute
 *  will have the value NULL.  When finished using the Repository object
 *  you should release your reference using the somDestruct method with
 *  a non-zero <doFree> parameter.
 *)
const somMD_SOMClassMgr__set_somInterfaceRepository = '::SOMClassMgr::_set_somInterfaceRepository';
procedure SOMClassMgr__set_somInterfaceRepository(somSelf: SOMClassMgr;
  somInterfaceRepository: Repository);

(*
 * New Method: _get_somRegisteredClasses
 *)
type
  somTP_SOMClassMgr__get_somRegisteredClasses = function(somSelf: SOMClassMgr):
    _IDL_SEQUENCE_SOMClass; stdcall;
  somTD_SOMClassMgr__get_somRegisteredClasses =
    somTP_SOMClassMgr__get_somRegisteredClasses;
(*
 *  A list of all classes currently registered in this process.
 *)
const somMD_SOMClassMgr__get_somRegisteredClasses = '::SOMClassMgr::_get_somRegisteredClasses';
function SOMClassMgr__get_somRegisteredClasses(somSelf: SOMClassMgr):
  _IDL_SEQUENCE_SOMClass;

(*
 * New Method: somGetRelatedClasses
 *)
type
  somTP_SOMClassMgr_somGetRelatedClasses = function(somSelf: SOMClassMgr;
		classObj: SOMClass): SOMClassMgr_SOMClassArray; stdcall;
  somTD_SOMClassMgr_somGetRelatedClasses =
    somTP_SOMClassMgr_somGetRelatedClasses;
(*
 *  Returns an array of class objects that were all registered during
 *  the dynamic loading of a class.    These classes are considered to
 *  define an affinity group.  Any class is a member of at most one
 *  affinity group.    The affinity group returned by this call is the
 *  one containing the class identified by classObj.  The first element
 *  in the array is the class that caused the group to be loaded, or the
 *  special value -1 which means that the SOMClassMgr is currently in the
 *  process of unregistering and deleting the affinity group (only
 *  SOMClassMgr subclasses would ever see this value).
 *  The remainder of the array (elements one thru n) consists of
 *  pointers to class objects ordered in reverse chronological sequence
 *  to that in which they were originally registered.  This list includes
 *  the given argument, classObj, as one of its elements, as well as the
 *  class, if any, returned as element[0] above.  The array is terminated
 *  by a NULL pointer as the last element.  Use SOMFree to release the
 *  array when it is no longer needed.  If the supplied class was not
 *  dynamically loaded, it is not a member of any affinity
 *  group and NULL is returned.
 *  [Dynamic Group]
 *)
const somMD_SOMClassMgr_somGetRelatedClasses = '::SOMClassMgr::somGetRelatedClasses';
function SOMClassMgr_somGetRelatedClasses(somSelf: SOMClassMgr;
  classObj: SOMClass): SOMClassMgr_SOMClassArray;

(*
 * New Method: somClassFromId
 *)
type
  somTP_SOMClassMgr_somClassFromId = function(somSelf: SOMClassMgr;
    classId: somId): SOMClass; stdcall;
  somTD_SOMClassMgr_somClassFromId = somTP_SOMClassMgr_somClassFromId;
(*
 *  Finds the class object, given its Id, if it already exists.
 *  Does not load the class.  Returns NULL if the class object does
 *  not yet exist.
 *)
const somMD_SOMClassMgr_somClassFromId = '::SOMClassMgr::somClassFromId';
function SOMClassMgr_somClassFromId(somSelf: SOMClassMgr; classId: somId):
  SOMClass;

(*
 * New Method: somFindClass
 *)
type
  somTP_SOMClassMgr_somFindClass = function(somSelf: SOMClassMgr;
		classId: somId; majorVersion, minorVersion: LongInt): SOMClass; stdcall;
  somTD_SOMClassMgr_somFindClass = somTP_SOMClassMgr_somFindClass;
(*
 *  Returns the class object for the specified class.  This may result
 *  in dynamic loading.  Uses somLocateClassFile to obtain the name of
 *  the file where the class' code resides, then uses somFindClsInFile.
 *)
const somMD_SOMClassMgr_somFindClass = '::SOMClassMgr::somFindClass';
function SOMClassMgr_somFindClass(somSelf: SOMClassMgr; classId: somId;
  majorVersion, minorVersion: LongInt): SOMClass;

(*
 * New Method: somFindClsInFile
 *)
type
  somTP_SOMClassMgr_somFindClsInFile = function(somSelf: SOMClassMgr;
    classId: somId; majorVersion, minorVersion: LongInt; fileName: CORBAString):
    SOMClass; stdcall;
  somTD_SOMClassMgr_somFindClsInFile = somTP_SOMClassMgr_somFindClsInFile;
(*
 *  Returns the class object for the specified class.  This may result
 *  in dynamic loading.  If the class already exists <file> is ignored,
 *  otherwise it is used to locate and dynamically load the class.
 *  Values of 0 for major and minor version numbers bypass version checking.
 *)
const somMD_SOMClassMgr_somFindClsInFile = '::SOMClassMgr::somFindClsInFile';
function SOMClassMgr_somFindClsInFile(somSelf: SOMClassMgr; classId: somId;
  majorVersion, minorVersion: LongInt; fileName: CORBAString): SOMClass;

(*
 * New Method: somMergeInto
 *)
type
  somTP_SOMClassMgr_somMergeInto = procedure(somSelf: SOMClassMgr;
    targetObj: SOMObject); stdcall;
  somTD_SOMClassMgr_somMergeInto = somTP_SOMClassMgr_somMergeInto;
(*
 *  Merges the SOMClassMgr registry information from the receiver to
 *  <targetObj>.  <targetObj> is required to be an instance of SOMClassMgr
 *  or one of its subclasses.  At the completion of this operation,
 *  the <targetObj> should be able to function as a replacement for the
 *  receiver.  At the end of the operation the receiver object (which is
 *  then in a newly uninitialized state) is freed.  Subclasses that
 *  override this method should similarly transfer their sections of
 *  the object and pass this method to their parent as the final step.
 *  If the receiving object is the distinguished instance pointed to
 *  from the global variable SOMClassMgrObject, SOMCLassMgrObject is
 *  then reassigned to point to <targetObj>.
 *)
const somMD_SOMClassMgr_somMergeInto = '::SOMClassMgr::somMergeInto';
procedure SOMClassMgr_somMergeInto(somSelf: SOMClassMgr; targetObj: SOMObject);

(*
 * New Method: somSubstituteClass
 *)
type
  somTP_SOMClassMgr_somSubstituteClass = function(somSelf: SOMClassMgr;
		origClassName, newClassName: CORBAString): LongInt; stdcall;
  somTD_SOMClassMgr_somSubstituteClass = somTP_SOMClassMgr_somSubstituteClass;
(*
 *  This method causes the somFindClass, somFindClsInFile, and
 *  somClassFromId methods to return the class named newClassName
 *  whenever they would have normally returned the class named
 *  origClassName.  This effectively results in class <newClassName>
 *  replacing or substituting itself for class <origClassName>.
 *  Some restrictions are enforced to insure that this works well.
 *  Both class <origClassName> and class <newClassName> must
 *  have been already registered before issuing this method, and newClass
 *  must be an immediate child of origClass.  In addition (although not
 *  enforceable), no instances should exist of either class at the time
 *  this method is invoked.    A return value of zero indicates success;
 *  a non-zero value indicates an error was detected.
 *)
const somMD_SOMClassMgr_somSubstituteClass = '::SOMClassMgr::somSubstituteClass';
function SOMClassMgr_somSubstituteClass(somSelf: SOMClassMgr;
  origClassName, newClassName: CORBAString): LongInt;

(*
 * New Method: somImportObject
 *)
type
  somTP_SOMClassMgr_somImportObject = function(somSelf: SOMClassMgr;
		objToBeShared: SOMObject): CORBABoolean; stdcall;
  somTD_SOMClassMgr_somImportObject = somTP_SOMClassMgr_somImportObject;
(*
 *  This method causes the local class manager to load the
 *  dlls that are required for sharing the object <objToBeShared>.
 *  The returned boolean indicates whether or not the operation succeeded.
 *  A return of FALSE (the operation failed) means that it is not safe
 *  to use the object, i.e., invoking a method on the object may lead to
 *  an exception.
 *)
const somMD_SOMClassMgr_somImportObject = '::SOMClassMgr::somImportObject';
function SOMClassMgr_somImportObject(somSelf: SOMClassMgr;
  objToBeShared: SOMObject): CORBABoolean;





implementation

uses
  Windows;

const
  SOM_DLL_Name = 'som.dll';
  Unknown_Source = '<unknown>.pas'; // no __FILE__ and __LINE__ macros in Delphi

var
  SOM_DLL: System.HMODULE = 0;
  DLLLoad_CriticalSection : Windows.TRTLCriticalSection;
  SOM_MainProgram_Called : Boolean = False;

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

function SOM_Resolve(o: SOMObject; oc: SOMClass; m: somMToken;
  fileName: PAnsiChar = nil; lineNum: Integer = 0): somMethodProc;
begin
  if not Assigned(fileName) then fileName := Unknown_Source;
  SOM_TestCls(o, oc, fileName, lineNum);
  Result := m;
end;

function SOM_ResolveNoCheck(o: SOMObject; oc: SOMClass; m: somMToken): somMethodProc;
begin
  Result := m;
end;

function SOM_MainProgram: SOMClassMgr;
begin
  SOM_MainProgram_Called := True;
  Result := somMainProgram;
end;

function SOM_GetClass(obj: SOMObject): SOMClass;
begin
  Result := obj.mtab.classObject;
end;

procedure SOM_IgnoreWarning(var v);
begin
end;

function SOM_TestCls(obj: SOMObject; cls: SOMClass;
  fileName: PAnsiChar = nil; lineNum: Integer = 0): SOMObject;
begin
  if not Assigned(fileName) then fileName := Unknown_Source;
  Result := somTestCls(obj, cls, fileName, lineNum);
end;

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
function exception_id; external SOM_DLL_Name name 'somExceptionId';
function exception_value; external SOM_DLL_Name name 'somExceptionValue';
procedure exception_free; external SOM_DLL_Name name 'somExceptionFree';

function SOM_CreateLocalEnvironment: PEnvironment;
begin
  Result := PEnvironment(SOMCalloc(1, SizeOf(Environment)));
end;

procedure SOM_DestroyLocalEnvironment(ev: PEnvironment);
begin
  somExceptionFree(ev);
  if somGetGlobalEnvironment <> ev then
    SOMFree(ev);
end;

procedure SOM_InitEnvironment(ev: PEnvironment);
begin
  if somGetGlobalEnvironment <> ev then
  begin
    FillChar(ev^, SizeOf(Environment), 0);
  end;
end;

procedure SOM_UninitEnvironment(ev: PEnvironment);
begin
  somExceptionFree(ev);
end;

// #include <somapi.h>

var
  SOM_DLL_SOM_MajorVersion: PLongInt;

function Replaceable_SOM_MajorVersion: PLongInt;
begin
  if Assigned(SOM_DLL_SOM_MajorVersion) then
    Result := SOM_DLL_SOM_MajorVersion
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOM_MajorVersion, 'SOM_MajorVersion');
    Result := SOM_DLL_SOM_MajorVersion;
  end;
end;

function SOM_MajorVersion: LongInt;
begin
  Result := Replaceable_SOM_MajorVersion^;
end;

var
  SOM_DLL_SOM_MinorVersion: PLongInt;

function Replaceable_SOM_MinorVersion: PLongInt;
begin
  if Assigned(SOM_DLL_SOM_MinorVersion) then
    Result := SOM_DLL_SOM_MinorVersion
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOM_MinorVersion, 'SOM_MinorVersion');
    Result := SOM_DLL_SOM_MinorVersion;
  end;
end;

function SOM_MinorVersion: LongInt;
begin
  Result := Replaceable_SOM_MinorVersion^;
end;

var
  SOM_DLL_SOM_MaxThreads: PLongInt;

function Replaceable_SOM_MaxThreads: PLongInt;
begin
  if Assigned(SOM_DLL_SOM_MaxThreads) then
    Result := SOM_DLL_SOM_MaxThreads
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOM_MaxThreads, 'SOM_MaxThreads');
    Result := SOM_DLL_SOM_MaxThreads;
  end;
end;

function SOM_MaxThreads: LongInt;
begin
  Result := Replaceable_SOM_MaxThreads^;
end;

function somEnvironmentNew; external SOM_DLL_Name;
procedure somEnvironmentEnd; external SOM_DLL_Name;
function somMainProgram; external SOM_DLL_Name;
function somAbnormalEnd; external SOM_DLL_Name;

var
  SOM_DLL_SOMCalloc: PsomTD_SOMCalloc;

function Replaceable_SOMCalloc: PsomTD_SOMCalloc;
begin
  if Assigned(SOM_DLL_SOMCalloc) then
    Result := SOM_DLL_SOMCalloc
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMCalloc, 'SOMCalloc');
    Result := SOM_DLL_SOMCalloc;
  end;
end;

function SOMCalloc(element_count, element_size: UIntPtr): somToken;
begin
  Result := Replaceable_SOMCalloc^(element_count, element_size);
end;

var
  SOM_DLL_SOMFree: PsomTD_SOMFree;

function Replaceable_SOMFree: PsomTD_SOMFree;
begin
  if Assigned(SOM_DLL_SOMFree) then
    Result := SOM_DLL_SOMFree
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMFree, 'SOMFree');
    Result := SOM_DLL_SOMFree;
  end;
end;

procedure SOMFree(memory: somToken);
begin
  Replaceable_SOMFree^(memory);
end;

var
  SOM_DLL_SOMMalloc: PsomTD_SOMMalloc;

function Replaceable_SOMMalloc: PsomTD_SOMMalloc;
begin
  if Assigned(SOM_DLL_SOMMalloc) then
    Result := SOM_DLL_SOMMalloc
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMMalloc, 'SOMMalloc');
    Result := SOM_DLL_SOMMalloc;
  end;
end;

function SOMMalloc(nbytes: UIntPtr): somToken;
begin
  Result := Replaceable_SOMMalloc^(nbytes);
end;

var
  SOM_DLL_SOMRealloc: PsomTD_SOMRealloc;

function Replaceable_SOMRealloc: PsomTD_SOMRealloc;
begin
  if Assigned(SOM_DLL_SOMRealloc) then
    Result := SOM_DLL_SOMRealloc
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMRealloc, 'SOMRealloc');
    Result := SOM_DLL_SOMRealloc;
  end;
end;

function SOMRealloc(memory: somToken; nbytes: UIntPtr): somToken;
begin
  Result := Replaceable_SOMRealloc^(memory, nbytes);
end;

var
  SOM_DLL_SOMError: PsomTD_SOMError;

function Replaceable_SOMError: PsomTD_SOMError;
begin
  if Assigned(SOM_DLL_SOMError) then
    Result := SOM_DLL_SOMError
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMError, 'SOMError');
    Result := SOM_DLL_SOMError;
  end;
end;

procedure SOMError(
    code: Integer;
    fileName: PAnsiChar;
    lineNum: Integer);
begin
  Replaceable_SOMError^(code, fileName, lineNum);
end;

var
  SOM_DLL_SOMCreateMutexSem: PsomTD_SOMCreateMutexSem;

function Replaceable_SOMCreateMutexSem: PsomTD_SOMCreateMutexSem;
begin
  if Assigned(SOM_DLL_SOMCreateMutexSem) then
    Result := SOM_DLL_SOMCreateMutexSem
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMCreateMutexSem, 'SOMCreateMutexSem');
    Result := SOM_DLL_SOMCreateMutexSem;
  end;
end;

function SOMCreateMutexSem(out sem: somToken): LongWord;
begin
  Result := Replaceable_SOMCreateMutexSem^(sem);
end;

var
  SOM_DLL_SOMRequestMutexSem: PsomTD_SOMRequestMutexSem;

function Replaceable_SOMRequestMutexSem: PsomTD_SOMRequestMutexSem;
begin
  if Assigned(SOM_DLL_SOMRequestMutexSem) then
    Result := SOM_DLL_SOMRequestMutexSem
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMRequestMutexSem, 'SOMRequestMutexSem');
    Result := SOM_DLL_SOMRequestMutexSem;
  end;
end;

function SOMRequestMutexSem(sem: somToken): LongWord;
begin
  Result := Replaceable_SOMRequestMutexSem^(sem);
end;

var
  SOM_DLL_SOMReleaseMutexSem: PsomTD_SOMReleaseMutexSem;

function Replaceable_SOMReleaseMutexSem: PsomTD_SOMReleaseMutexSem;
begin
  if Assigned(SOM_DLL_SOMReleaseMutexSem) then
    Result := SOM_DLL_SOMReleaseMutexSem
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMReleaseMutexSem, 'SOMReleaseMutexSem');
    Result := SOM_DLL_SOMReleaseMutexSem;
  end;
end;

function SOMReleaseMutexSem(sem: somToken): LongWord;
begin
  Result := Replaceable_SOMReleaseMutexSem^(sem);
end;

var
  SOM_DLL_SOMDestroyMutexSem: PsomTD_SOMDestroyMutexSem;

function Replaceable_SOMDestroyMutexSem: PsomTD_SOMDestroyMutexSem;
begin
  if Assigned(SOM_DLL_SOMDestroyMutexSem) then
    Result := SOM_DLL_SOMDestroyMutexSem
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMDestroyMutexSem, 'SOMDestroyMutexSem');
    Result := SOM_DLL_SOMDestroyMutexSem;
  end;
end;

function SOMDestroyMutexSem(sem: somToken): LongWord;
begin
  Result := Replaceable_SOMDestroyMutexSem^(sem);
end;

var
  SOM_DLL_SOMGetThreadId: PsomTD_SOMGetThreadId;

function Replaceable_SOMGetThreadId: PsomTD_SOMGetThreadId;
begin
  if Assigned(SOM_DLL_SOMGetThreadId) then
    Result := SOM_DLL_SOMGetThreadId
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMGetThreadId, 'SOMGetThreadId');
    Result := SOM_DLL_SOMGetThreadId;
  end;
end;

function SOMGetThreadId: LongWord;
begin
  Result := Replaceable_SOMGetThreadId^();
end;

var
  SOM_DLL_SOMClassMgrObject: PSOMClassMgr;

function Replaceable_SOMClassMgrObject: PSOMClassMgr;
begin
  if Assigned(SOM_DLL_SOMClassMgrObject) then
    Result := SOM_DLL_SOMClassMgrObject
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMClassMgrObject, 'SOMClassMgrObject');
    Result := SOM_DLL_SOMClassMgrObject;
  end;
end;

function SOMClassMgrObject: SOMClassMgr;
begin
  Result := Replaceable_SOMClassMgrObject^;
end;

procedure somRegisterClassLibrary; external SOM_DLL_Name;
procedure somUnregisterClassLibrary; external SOM_DLL_Name;

var
  SOM_DLL_SOMLoadModule: PsomTD_SOMLoadModule;

function Replaceable_SOMLoadModule: PsomTD_SOMLoadModule;
begin
  if Assigned(SOM_DLL_SOMLoadModule) then
    Result := SOM_DLL_SOMLoadModule
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMLoadModule, 'SOMLoadModule');
    Result := SOM_DLL_SOMLoadModule;
  end;
end;

function SOMLoadModule(
    className: PAnsiChar;
    fileName: PAnsiChar;
    functionName: PAnsiChar;
    majorVersion: LongInt;
    minorVersion: LongInt;
    out modHandle: somToken): Integer;
begin
  Result := Replaceable_SOMLoadModule^(className, fileName, functionName,
    majorVersion, minorVersion, modHandle);
end;

var
  SOM_DLL_SOMDeleteModule: PsomTD_SOMDeleteModule;

function Replaceable_SOMDeleteModule: PsomTD_SOMDeleteModule;
begin
  if Assigned(SOM_DLL_SOMDeleteModule) then
    Result := SOM_DLL_SOMDeleteModule
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMDeleteModule, 'SOMDeleteModule');
    Result := SOM_DLL_SOMDeleteModule;
  end;
end;

function SOMDeleteModule(modHandle: somToken): Integer;
begin
  Result := Replaceable_SOMDeleteModule^(modHandle);
end;

var
  SOM_DLL_SOMClassInitFuncName: PsomTD_SOMClassInitFuncName;

function Replaceable_SOMClassInitFuncName: PsomTD_SOMClassInitFuncName;
begin
  if Assigned(SOM_DLL_SOMClassInitFuncName) then
    Result := SOM_DLL_SOMClassInitFuncName
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMClassInitFuncName, 'SOMClassInitFuncName');
    Result := SOM_DLL_SOMClassInitFuncName;
  end;
end;

function SOMClassInitFuncName: PAnsiChar;
begin
  Result := Replaceable_SOMClassInitFuncName^();
end;

function somPrintf; external SOM_DLL_Name;
function somVprintf; external SOM_DLL_Name;
procedure somPrefixLevel; external SOM_DLL_Name;
function somLPrintf; external SOM_DLL_Name;
procedure somSetOutChar; external SOM_DLL_Name;

var
  SOM_DLL_SOMOutCharRoutine: PsomTD_SOMOutCharRoutine;

function Replaceable_SOMOutCharRoutine: PsomTD_SOMOutCharRoutine;
begin
  if Assigned(SOM_DLL_SOMOutCharRoutine) then
    Result := SOM_DLL_SOMOutCharRoutine
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMOutCharRoutine, 'SOMOutCharRoutine');
    Result := SOM_DLL_SOMOutCharRoutine;
  end;
end;

function SOMOutCharRoutine(C: AnsiChar): Integer;
begin
  Result := Replaceable_SOMOutCharRoutine^(C);
end;

function somResolve; external SOM_DLL_Name;
function somPCallResolve; external SOM_DLL_Name;
function somParentResolve; external SOM_DLL_Name;
function somParentNumResolve; external SOM_DLL_Name;
function somClassResolve; external SOM_DLL_Name;
function somResolveTerminal; external SOM_DLL_Name;
function somAncestorResolve; external SOM_DLL_Name;
function somResolveByName; external SOM_DLL_Name;
function somDataResolve; external SOM_DLL_Name;
function somDataResolveChk; external SOM_DLL_Name;
function somApply; external SOM_DLL_Name;

function SOM_IsDynamicMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := (md_type and 1) <> 0;
end;

function SOM_IsNonstaticMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := (md_type and 2) <> 0;
end;

function SOM_IsStaticMethod(md_type: LongWord): Boolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := not (SOM_IsDynamicMethod(md_type) or SOM_IsNonstaticMethod(md_type));
end;

function somIsObj; external SOM_DLL_Name;
function somTestCls; external SOM_DLL_Name;
function somGetClassFromMToken; external SOM_DLL_Name;
function somRegisterId; external SOM_DLL_Name;
function somCheckId; external SOM_DLL_Name;
procedure somRegisterIds; external SOM_DLL_Name;
function somIdFromString; external SOM_DLL_Name;
function somIdFromStringNoFree; external SOM_DLL_Name;
function somStringFromId; external SOM_DLL_Name;
function somCompareIds; external SOM_DLL_Name;
function somTotalRegIds; external SOM_DLL_Name;
procedure somSetExpectedIds; external SOM_DLL_Name;
function somUniqueKey; external SOM_DLL_Name;
procedure somBeginPersistentIds; external SOM_DLL_Name;
procedure somEndPersistentIds; external SOM_DLL_Name;
procedure somRelocateIds; external SOM_DLL_Name;
function somBuildClass; external SOM_DLL_Name;
function somBuildClass2; external SOM_DLL_Name;
procedure somConstructClass; external SOM_DLL_Name;
function somRegisterLibraryClasses; external SOM_DLL_Name;
function somUnregisterLibraryClasses; external SOM_DLL_Name;



// #include <somobj.h>

function SOMObjectNewClass; external SOM_DLL_Name;

var
  SOM_DLL_SOMObjectClassData: PSOMObjectClassDataStructure;

function SOMObjectClassData: PSOMObjectClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMObjectClassData) then
    Result := SOM_DLL_SOMObjectClassData
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMObjectClassData, 'SOMObjectClassData');
    Result := SOM_DLL_SOMObjectClassData;
  end;
end;

var
  SOM_DLL_SOMObjectCClassData: PSOMObjectCClassDataStructure;

function SOMObjectCClassData: PSOMObjectCClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMObjectCClassData) then
    Result := SOM_DLL_SOMObjectCClassData
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMObjectCClassData, 'SOMObjectCClassData');
    Result := SOM_DLL_SOMObjectCClassData;
  end;
end;

function _SOMCLASS_SOMObject: SOMClass;
begin
  Result := SOMObjectClassData.classObject;
end;

function SOMObjectNew: SOMObject;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMObject;
  if not Assigned(cls) then
  begin
    SOMObjectNewClass;
    cls := _SOMCLASS_SOMObject;
  end;
  Result := SOMClass_somNew(cls);
end;

function SOMObjectRenew(buf: Pointer): SOMObject;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMObject;
  if not Assigned(cls) then
  begin
	  SOMObjectNewClass;
    cls := _SOMCLASS_SOMObject;
  end;
	Result := SOMClass_somRenew(cls, buf);
end;

procedure SOMObject_somDefaultInit(somSelf: SOMObject; ctrl: som3InitCtrlPtr);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somDefaultInit
   (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultInit))(somSelf, ctrl);
end;

procedure SOMObject_somDestruct(somSelf: SOMObject;
		doFree: octet; ctrl: som3DestructCtrlPtr);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somDestruct
   (SOM_Resolve(somSelf, cd.classObject, cd.somDestruct))(somSelf, doFree, ctrl);
end;

procedure SOMObject_somDefaultCopyInit(somSelf: SOMObject;
	ctrl: som3InitCtrlPtr; fromObj: SOMObject);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somDefaultCopyInit
   (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultCopyInit))
     (somSelf, ctrl, fromObj);
end;

function SOMObject_somDefaultAssign(somSelf: SOMObject;
	ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somDefaultAssign
     (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultAssign))
       (somSelf, ctrl, fromObj);
end;

procedure SOMObject_somDefaultConstCopyInit(somSelf: SOMObject;
	ctrl: som3InitCtrlPtr; fromObj: SOMObject);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somDefaultConstCopyInit
   (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultConstCopyInit))
     (somSelf, ctrl, fromObj);
end;

procedure SOMObject_somDefaultVCopyInit(somSelf: SOMObject;
	ctrl: som3InitCtrlPtr; fromObj: SOMObject);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somDefaultVCopyInit
   (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultVCopyInit))
     (somSelf, ctrl, fromObj);
end;

procedure SOMObject_somDefaultConstVCopyInit(somSelf: SOMObject;
		ctrl: som3InitCtrlPtr; fromObj: SOMObject);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somDefaultConstVCopyInit
   (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultConstVCopyInit))
     (somSelf, ctrl, fromObj);
end;

function SOMObject_somDefaultConstAssign(somSelf: SOMObject;
  ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somDefaultConstAssign
     (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultConstAssign))
       (somSelf, ctrl, fromObj);
end;

function SOMObject_somDefaultVAssign(somSelf: SOMObject;
  ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somDefaultVAssign
     (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultVAssign))
       (somSelf, ctrl, fromObj);
end;

function SOMObject_somDefaultConstVAssign(somSelf: SOMObject;
	ctrl: som3AssignCtrlPtr; fromObj: SOMObject): SOMObject;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somDefaultConstVAssign
     (SOM_Resolve(somSelf, cd.classObject, cd.somDefaultConstVAssign))
       (somSelf, ctrl, fromObj);
end;

procedure SOMObject_somInit(somSelf: SOMObject);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somInit
   (SOM_Resolve(somSelf, cd.classObject, cd.somInit))(somSelf);
end;

procedure SOMObject_somUninit(somSelf: SOMObject);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somUninit
   (SOM_Resolve(somSelf, cd.classObject, cd.somUninit))(somSelf);
end;

procedure SOMObject_somFree(somSelf: SOMObject);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somFree
   (SOM_Resolve(somSelf, cd.classObject, cd.somFree))(somSelf);
end;

function SOMObject_somGetClass(somSelf: SOMObject): SOMClass;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somGetClass
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetClass))(somSelf);
end;

function SOMObject_somGetClassName(somSelf: SOMObject): CORBAString;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somGetClassName
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetClassName))(somSelf);
end;

function SOMObject_somGetSize(somSelf: SOMObject): LongInt;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somGetSize
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetSize))(somSelf);
end;

function SOMObject_somIsA(somSelf: SOMObject;
  aClassObj: SOMClass): CORBABoolean;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somIsA
     (SOM_Resolve(somSelf, cd.classObject, cd.somIsA))(somSelf, aClassObj);
end;

function SOMObject_somIsInstanceOf(somSelf: SOMObject;
	aClassObj: SOMClass): CORBABoolean;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somIsInstanceOf
     (SOM_Resolve(somSelf, cd.classObject, cd.somIsInstanceOf))
       (somSelf, aClassObj);
end;

function SOMObject_somRespondsTo(somSelf: SOMObject;
  mId: somId): CORBABoolean;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somRespondsTo
     (SOM_Resolve(somSelf, cd.classObject, cd.somRespondsTo))(somSelf, mId);
end;

function SOMObject_somDispatch(somSelf: SOMObject;
	out retValue: somToken;
	methodId: somId;
	ap: va_list): CORBABoolean;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somDispatch
     (SOM_Resolve(somSelf, cd.classObject, cd.somDispatch))
       (somSelf, retValue, methodId, ap);
end;

function somva_SOMObject_somDispatch; external SOM_DLL_Name;

function SOMObject_somClassDispatch(somSelf: SOMObject;
	clsObj: SOMClass;
	out retValue: somToken;
	methodId: somId;
	ap: va_list): CORBABoolean;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somClassDispatch
     (SOM_Resolve(somSelf, cd.classObject, cd.somClassDispatch))
       (somSelf, clsObj, retValue, methodId, ap);
end;

function somva_SOMObject_somClassDispatch; external SOM_DLL_Name;

function SOMObject_somCastObj(somSelf: SOMObject;
	castedCls: SOMClass): CORBABoolean;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somCastObj
     (SOM_Resolve(somSelf, cd.classObject, cd.somCastObj))(somSelf, castedCls);
end;

function SOMObject_somResetObj(somSelf: SOMObject): CORBABoolean;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somResetObj
     (SOM_Resolve(somSelf, cd.classObject, cd.somResetObj))(somSelf);
end;

function SOMObject_somPrintSelf(somSelf: SOMObject): SOMObject;
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  Result :=
    somTD_SOMObject_somPrintSelf
     (SOM_Resolve(somSelf, cd.classObject, cd.somPrintSelf))(somSelf);
end;

procedure SOMObject_somDumpSelf(somSelf: SOMObject; level: LongInt);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somDumpSelf
   (SOM_Resolve(somSelf, cd.classObject, cd.somDumpSelf))(somSelf, level);
end;

procedure SOMObject_somDumpSelfInt(somSelf: SOMObject; level: LongInt);
var
  cd: PSOMObjectClassDataStructure;
begin
  cd := SOMObjectClassData;
  somTD_SOMObject_somDumpSelfInt
   (SOM_Resolve(somSelf, cd.classObject, cd.somDumpSelfInt))(somSelf, level);
end;

// #include <somcls.h>

function SOMClassNewClass; external SOM_DLL_Name;

var
  SOM_DLL_SOMClassClassData: PSOMClassClassDataStructure;

function SOMClassClassData: PSOMClassClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMClassClassData) then
    Result := SOM_DLL_SOMClassClassData
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMClassClassData, 'SOMClassClassData');
    Result := SOM_DLL_SOMClassClassData;
  end;
end;

var
  SOM_DLL_SOMClassCClassData: PSOMClassCClassDataStructure;

function SOMClassCClassData: PSOMClassCClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMClassCClassData) then
    Result := SOM_DLL_SOMClassCClassData
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMClassCClassData, 'SOMClassCClassData');
    Result := SOM_DLL_SOMClassCClassData;
  end;
end;

function _SOMCLASS_SOMClass: SOMClass;
begin
  Result := SOMClassClassData.classObject;
end;

function SOMClassNew: SOMClass;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMClass;
  if not Assigned(cls) then
  begin
    SOMClassNewClass;
    cls := _SOMCLASS_SOMClass;
  end;
  Result := SOMClass_somNew(cls);
end;

function SOMClassRenew(buf: Pointer): SOMClass;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMClass;
  if not Assigned(cls) then
  begin
	  SOMClassNewClass;
    cls := _SOMCLASS_SOMClass;
  end;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMClass_somNew(somSelf: SOMClass): SOMObject;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somNew
     (SOM_Resolve(somSelf, cd.classObject, cd.somNew))(somSelf);
end;

function SOMClass_somNewNoInit(somSelf: SOMClass): SOMObject;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somNewNoInit
     (SOM_Resolve(somSelf, cd.classObject, cd.somNewNoInit))(somSelf);
end;

function SOMClass_somRenew(somSelf: SOMClass; obj: Pointer): SOMObject;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somRenew
     (SOM_Resolve(somSelf, cd.classObject, cd.somRenew))(somSelf, obj);
end;

function SOMClass_somRenewNoInit(somSelf: SOMClass; obj: Pointer): SOMObject;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somRenewNoInit
     (SOM_Resolve(somSelf, cd.classObject, cd.somRenewNoInit))(somSelf, obj);
end;

function SOMClass_somRenewNoZero(somSelf: SOMClass; obj: Pointer): SOMObject;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somRenewNoZero
     (SOM_Resolve(somSelf, cd.classObject, cd.somRenewNoZero))(somSelf, obj);
end;

function SOMClass_somRenewNoInitNoZero(somSelf: SOMClass;
  obj: Pointer): SOMObject;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somRenewNoInitNoZero
     (SOM_Resolve(somSelf, cd.classObject, cd.somRenewNoInitNoZero))
       (somSelf, obj);
end;

function SOMClass_somAllocate(somSelf: SOMClass; size: LongInt): somToken;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somAllocate
     (SOM_Resolve(somSelf, cd.classObject, cd.somAllocate))(somSelf, size);
end;

procedure SOMClass_somDeallocate(somSelf: SOMClass;	memptr: somToken);
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  somTD_SOMClass_somDeallocate
   (SOM_Resolve(somSelf, cd.classObject, cd.somDeallocate))(somSelf, memptr);
end;

function SOMClass_somJoin(somSelf: SOMClass; secondParent: SOMClass;
  nameOfNewClass: CORBAString): SOMClass;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somJoin
     (SOM_Resolve(somSelf, cd.classObject, cd.somJoin))
       (somSelf, secondParent, nameOfNewClass);
end;

function SOMClass_somEndow(somSelf: SOMClass; parent: SOMClass;
  nameOfNewClass: CORBAString): SOMClass;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somEndow
     (SOM_Resolve(somSelf, cd.classObject, cd.somEndow))
       (somSelf, parent, nameOfNewClass);
end;

function SOMClass_somClassOfNewClassWithParents(newClassName: CORBAString;
  parents: PSOMClass_SOMClassSequence; explicitMeta: SOMClass): SOMClass;
begin
  Result :=
    somTD_SOMClass_somClassOfNewClassWithParents
      (SOMClassClassData.somClassOfNewClassWithParents)(newClassName, parents, explicitMeta);
end;

procedure SOMClass_somInitMIClass(somSelf: SOMClass;
	inherit_vars: LongWord; className: CORBAString;
  parentClasses: PSOMClass_SOMClassSequence;
	dataSize, dataAlignment, maxNDMethods, majorVersion, minorVersion: LongInt);
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  somTD_SOMClass_somInitMIClass
   (SOM_Resolve(somSelf, cd.classObject, cd.somInitMIClass))
     (somSelf, inherit_vars, className, parentClasses,
      dataSize, dataAlignment, maxNDMethods, majorVersion, minorVersion);
end;

function SOMClass_somAddStaticMethod(somSelf: SOMClass;
	methodId, methodDescriptor: somId;
	method, redispatchStub, applyStub: somMethodPtr): somMToken;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somAddStaticMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somAddStaticMethod))
       (somSelf, methodId, methodDescriptor, method, redispatchStub, applyStub);
end;

procedure SOMClass_somOverrideSMethod(somSelf: SOMClass;
	methodId: somId; method: somMethodPtr);
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  somTD_SOMClass_somOverrideSMethod
   (SOM_Resolve(somSelf, cd.classObject, cd.somOverrideSMethod))
     (somSelf, methodId, method);
end;

procedure SOMClass_somClassReady(somSelf: SOMClass);
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  somTD_SOMClass_somClassReady
   (SOM_Resolve(somSelf, cd.classObject, cd.somClassReady))(somSelf);
end;

procedure SOMClass_somAddDynamicMethod(somSelf: SOMClass;
	methodId, methodDescriptor: somId; methodImpl, applyStub: somMethodPtr);
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  somTD_SOMClass_somAddDynamicMethod
   (SOM_Resolve(somSelf, cd.classObject, cd.somAddDynamicMethod))
     (somSelf, methodId, methodDescriptor, methodImpl, applyStub);
end;

function SOMClass_somGetName(somSelf: SOMClass): CORBAString;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetName
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetName))(somSelf);
end;

procedure SOMClass_somGetVersionNumbers(somSelf: SOMClass;
  out majorVersion, minorVersion: LongInt);
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  somTD_SOMClass_somGetVersionNumbers
   (SOM_Resolve(somSelf, cd.classObject, cd.somGetVersionNumbers))
     (somSelf, majorVersion, minorVersion);
end;

function SOMClass_somGetNumMethods(somSelf: SOMClass): LongInt;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetNumMethods
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetNumMethods))(somSelf);
end;

function SOMClass_somGetNumStaticMethods(somSelf: SOMClass): LongInt;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetNumStaticMethods
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetNumStaticMethods))(somSelf);
end;

function SOMClass_somGetParents(somSelf: SOMClass): SOMClass_SOMClassSequence;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetParents
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetParents))(somSelf);
end;

function SOMClass_somGetInstanceSize(somSelf: SOMClass): LongInt;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetInstanceSize
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetInstanceSize))(somSelf);
end;

function SOMClass_somGetInstancePartSize(somSelf: SOMClass): LongInt;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetInstancePartSize
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetInstancePartSize))(somSelf);
end;

function SOMClass_somGetInstanceToken(somSelf: SOMClass): somDToken;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetInstanceToken
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetInstanceToken))(somSelf);
end;

function SOMClass_somGetMemberToken(somSelf: SOMClass;
  memberOffset: LongInt; instanceToken: somDToken): somDToken;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetMemberToken
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetMemberToken))
       (somSelf, memberOffset, instanceToken);
end;

function SOMClass_somGetClassMtab(somSelf: SOMClass): somMethodTabPtr;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetClassMtab
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetClassMtab))(somSelf);
end;

function SOMClass_somGetClassData(somSelf: SOMClass): somClassDataStructurePtr;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetClassData
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetClassData))(somSelf);
end;

procedure SOMClass_somSetClassData(somSelf: SOMClass;
  cds: somClassDataStructurePtr);
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  somTD_SOMClass_somSetClassData
   (SOM_Resolve(somSelf, cd.classObject, cd.somSetClassData))(somSelf, cds);
end;

function SOMClass__get_somDataAlignment(somSelf: SOMClass): LongInt;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass__get_somDataAlignment
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somDataAlignment))(somSelf);
end;

function SOMClass__get_somInstanceDataOffsets(somSelf: SOMClass):
  SOMClass_somOffsets;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass__get_somInstanceDataOffsets
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somInstanceDataOffsets))
       (somSelf);
end;

function SOMClass__get_somDirectInitClasses(somSelf: SOMClass):
  SOMClass_SOMClassSequence;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass__get_somDirectInitClasses
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somDirectInitClasses))
       (somSelf);
end;

function SOMClass_somGetMethodDescriptor(somSelf: SOMClass;
  methodId: somId): somId;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetMethodDescriptor
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetMethodDescriptor))
       (somSelf, methodId);
end;

function SOMClass_somGetMethodIndex(somSelf: SOMClass; id: somId): LongInt;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetMethodIndex
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetMethodIndex))(somSelf, id);
end;

function SOMClass_somGetMethodToken(somSelf: SOMClass; methodId: somId):
  somMToken;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetMethodToken
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetMethodToken))
       (somSelf, methodId);
end;

function SOMClass_somGetNthMethodInfo(somSelf: SOMClass; n: LongInt;
  out descriptor: somId): somId;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetNthMethodInfo
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetNthMethodInfo))
       (somSelf, n, descriptor);
end;

function SOMClass_somGetMarshalPlan(somSelf: SOMClass; methodId: somId):
  somToken;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetMarshalPlan
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetMarshalPlan))
       (somSelf, methodId);
end;

function SOMClass_somGetMethodData(somSelf: SOMClass;	methodId: somId;
  out md: somMethodData): CORBABoolean;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetMethodData
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetMarshalPlan))
       (somSelf, methodId, md);
end;

function SOMClass_somGetNthMethodData(somSelf: SOMClass; n: LongInt;
  out md: somMethodData): CORBABoolean;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetNthMethodData
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetNthMethodData))
       (somSelf, n, md);
end;

function SOMClass_somFindMethod(somSelf: SOMClass; methodId: somId;
  out m: somMethodPtr): CORBABoolean;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somFindMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somFindMethod))
       (somSelf, methodId, m);
end;

function SOMClass_somFindMethodOk(somSelf: SOMClass; methodId: somId;
  out m: somMethodPtr): CORBABoolean;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somFindMethodOk
     (SOM_Resolve(somSelf, cd.classObject, cd.somFindMethodOk))
       (somSelf, methodId, m);
end;

function SOMClass_somFindSMethod(somSelf: SOMClass;	methodId: somId):
  somMethodPtr;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somFindSMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somFindSMethod))
       (somSelf, methodId);
end;

function SOMClass_somFindSMethodOk(somSelf: SOMClass; methodId: somId):
  somMethodPtr;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somFindSMethodOk
     (SOM_Resolve(somSelf, cd.classObject, cd.somFindSMethodOk))
       (somSelf, methodId);
end;

function SOMClass_somLookupMethod(somSelf: SOMClass; methodId: somId):
  somMethodPtr;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somLookupMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somLookupMethod))
       (somSelf, methodId);
end;

function SOMClass_somGetApplyStub(somSelf: SOMClass; methodId: somId):
  somMethodPtr;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetApplyStub
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetApplyStub))
       (somSelf, methodId);
end;

function SOMClass_somGetPClsMtab(somSelf: SOMClass): somMethodTabs;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetPClsMtab
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetPClsMtab))(somSelf);
end;

function SOMClass_somCheckVersion(somSelf: SOMClass;
	majorVersion, minorVersion: LongInt): CORBABoolean;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somCheckVersion
     (SOM_Resolve(somSelf, cd.classObject, cd.somCheckVersion))
       (somSelf, majorVersion, minorVersion);
end;

function SOMClass_somDescendedFrom(somSelf: SOMClass; aClassObj: SOMClass):
  CORBABoolean;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somDescendedFrom
     (SOM_Resolve(somSelf, cd.classObject, cd.somDescendedFrom))
       (somSelf, aClassObj);
end;

function SOMClass_somSupportsMethod(somSelf: SOMClass; mId: somId): CORBABoolean;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somSupportsMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somSupportsMethod))(somSelf, mId);
end;

function SOMClass_somDefinedMethod(somSelf: SOMClass;	method: somMToken):
  somMethodPtr;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somDefinedMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somDefinedMethod))
       (somSelf, method);
end;

function SOMClass_somMethodImplOwner(somSelf: SOMClass;	var md: somMethodData):
  SOMClass;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somMethodImplOwner
     (SOM_Resolve(somSelf, cd.classObject, cd.somMethodImplOwner))(somSelf, md);
end;

function SOMClass_somGetRdStub(somSelf: SOMClass; methodId: somId):
  somMethodProc;
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  Result :=
    somTD_SOMClass_somGetRdStub
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetRdStub))(somSelf, methodId);
end;

procedure SOMClass_somOverrideMtab(somSelf: SOMClass);
var
  cd: PSOMClassClassDataStructure;
begin
  cd := SOMClassClassData;
  somTD_SOMClass_somOverrideMtab
   (SOM_Resolve(somSelf, cd.classObject, cd.somOverrideMtab))(somSelf);
end;

// #include <somcm.h>

function SOMClassMgrNewClass; external SOM_DLL_Name;

var
  SOM_DLL_SOMClassMgrClassData: PSOMClassMgrClassDataStructure;

function SOMClassMgrClassData: PSOMClassMgrClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMClassMgrClassData) then
    Result := SOM_DLL_SOMClassMgrClassData
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMClassMgrClassData, 'SOMClassMgrClassData');
    Result := SOM_DLL_SOMClassMgrClassData;
  end;
end;

var
  SOM_DLL_SOMClassMgrCClassData: PSOMClassMgrCClassDataStructure;

function SOMClassMgrCClassData: PSOMClassMgrCClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMClassMgrCClassData) then
    Result := SOM_DLL_SOMClassMgrCClassData
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOMClassMgrCClassData, 'SOMClassMgrCClassData');
    Result := SOM_DLL_SOMClassMgrCClassData;
  end;
end;

function _SOMCLASS_SOMClassMgr: SOMClass;
begin
  Result := SOMClassMgrClassData.classObject;
end;

function SOMClassMgrNew: SOMClassMgr;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMClassMgr;
  if not Assigned(cls) then
  begin
    SOMClassMgrNewClass;
    cls := _SOMCLASS_SOMClassMgr;
  end;
  Result := SOMClass_somNew(cls);
end;

function SOMClassMgrRenew(buf: Pointer): SOMClassMgr;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMClassMgr;
  if not Assigned(cls) then
  begin
	  SOMClassMgrNewClass;
    cls := _SOMCLASS_SOMClassMgr;
  end;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMClassMgr_somLoadClassFile(somSelf: SOMClassMgr; classId: somId;
  majorVersion, minorVersion: LongInt; fileName: CORBAString): SOMClass;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somLoadClassFile
     (SOM_Resolve(somSelf, cd.classObject, cd.somLoadClassFile))
       (somSelf, classId, majorVersion, minorVersion, fileName);
end;

function SOMClassMgr_somLocateClassFile(somSelf: SOMClassMgr;	classId: somId;
  majorVersion,	minorVersion: LongInt): CORBAString;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somLocateClassFile
     (SOM_Resolve(somSelf, cd.classObject, cd.somLocateClassFile))
       (somSelf, classId, majorVersion, minorVersion);
end;

procedure SOMClassMgr_somRegisterClass(somSelf: SOMClassMgr;
  classObj: SOMClass);
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  somTD_SOMClassMgr_somRegisterClass
   (SOM_Resolve(somSelf, cd.classObject, cd.somRegisterClass))
     (somSelf, classObj);
end;

procedure SOMClassMgr_somRegisterClassLibrary(somSelf: SOMClassMgr;
  libraryName: CORBAString; libraryInitRtn: somMethodPtr);
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  somTD_SOMClassMgr_somRegisterClassLibrary
   (SOM_Resolve(somSelf, cd.classObject, cd.somRegisterClassLibrary))
     (somSelf, libraryName, libraryInitRtn);
end;

procedure SOMClassMgr_somUnregisterClassLibrary(somSelf: SOMClassMgr;
  libraryName: CORBAString);
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  somTD_SOMClassMgr_somUnregisterClassLibrary
   (SOM_Resolve(somSelf, cd.classObject, cd.somUnregisterClassLibrary))
     (somSelf, libraryName);
end;

function SOMClassMgr_somUnloadClassFile(somSelf: SOMClassMgr;
  classObj: SOMClass): LongInt;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somUnloadClassFile
     (SOM_Resolve(somSelf, cd.classObject, cd.somUnloadClassFile))
       (somSelf, classObj);
end;

function SOMClassMgr_somUnregisterClass(somSelf: SOMClassMgr;
  classObj: SOMClass): LongInt;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somUnregisterClass
     (SOM_Resolve(somSelf, cd.classObject, cd.somUnregisterClass))
       (somSelf, classObj);
end;

procedure SOMClassMgr_somBeginPersistentClasses(somSelf: SOMClassMgr);
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  somTD_SOMClassMgr_somBeginPersistentClasses
   (SOM_Resolve(somSelf, cd.classObject, cd.somBeginPersistentClasses))
     (somSelf);
end;

procedure SOMClassMgr_somEndPersistentClasses(somSelf: SOMClassMgr);
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  somTD_SOMClassMgr_somEndPersistentClasses
   (SOM_Resolve(somSelf, cd.classObject, cd.somEndPersistentClasses))(somSelf);
end;

function SOMClassMgr_somJoinAffinityGroup(somSelf: SOMClassMgr;
  newClass, affClass: SOMClass): CORBABoolean;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somJoinAffinityGroup
     (SOM_Resolve(somSelf, cd.classObject, cd.somJoinAffinityGroup))
       (somSelf, newClass, affClass);
end;

function SOMClassMgr_somGetInitFunction(somSelf: SOMClassMgr): CORBAString;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somGetInitFunction
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetInitFunction))(somSelf);
end;

function SOMClassMgr__get_somInterfaceRepository(somSelf: SOMClassMgr):
  Repository;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr__get_somInterfaceRepository
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somInterfaceRepository))
       (somSelf);
end;

procedure SOMClassMgr__set_somInterfaceRepository(somSelf: SOMClassMgr;
  somInterfaceRepository: Repository);
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  somTD_SOMClassMgr__set_somInterfaceRepository
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somInterfaceRepository))
     (somSelf, somInterfaceRepository);
end;

function SOMClassMgr__get_somRegisteredClasses(somSelf: SOMClassMgr):
  _IDL_SEQUENCE_SOMClass;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr__get_somRegisteredClasses
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somRegisteredClasses))
       (somSelf);
end;

function SOMClassMgr_somGetRelatedClasses(somSelf: SOMClassMgr;
  classObj: SOMClass): SOMClassMgr_SOMClassArray;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somGetRelatedClasses
     (SOM_Resolve(somSelf, cd.classObject, cd.somGetRelatedClasses))
       (somSelf, classObj);
end;

function SOMClassMgr_somClassFromId(somSelf: SOMClassMgr; classId: somId):
  SOMClass;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somClassFromId
     (SOM_Resolve(somSelf, cd.classObject, cd.somClassFromId))
       (somSelf, classId);
end;

function SOMClassMgr_somFindClass(somSelf: SOMClassMgr; classId: somId;
  majorVersion, minorVersion: LongInt): SOMClass;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somFindClass
     (SOM_Resolve(somSelf, cd.classObject, cd.somFindClass))
       (somSelf, classId, majorVersion, minorVersion);
end;

function SOMClassMgr_somFindClsInFile(somSelf: SOMClassMgr; classId: somId;
  majorVersion, minorVersion: LongInt; fileName: CORBAString): SOMClass;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somFindClsInFile
     (SOM_Resolve(somSelf, cd.classObject, cd.somFindClsInFile))
       (somSelf, classId, majorVersion, minorVersion, fileName);
end;

procedure SOMClassMgr_somMergeInto(somSelf: SOMClassMgr; targetObj: SOMObject);
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  somTD_SOMClassMgr_somMergeInto
   (SOM_Resolve(somSelf, cd.classObject, cd.somMergeInto))(somSelf, targetObj);
end;

function SOMClassMgr_somSubstituteClass(somSelf: SOMClassMgr;
  origClassName, newClassName: CORBAString): LongInt;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somSubstituteClass
     (SOM_Resolve(somSelf, cd.classObject, cd.somSubstituteClass))
       (somSelf, origClassName, newClassName);
end;

function SOMClassMgr_somImportObject(somSelf: SOMClassMgr;
  objToBeShared: SOMObject): CORBABoolean;
var
  cd: PSOMClassMgrClassDataStructure;
begin
  cd := SOMClassMgrClassData;
  Result :=
    somTD_SOMClassMgr_somImportObject
     (SOM_Resolve(somSelf, cd.classObject, cd.somImportObject))
       (somSelf, objToBeShared);
end;




initialization
  Windows.InitializeCriticalSection(DLLLoad_CriticalSection);

finalization
  if SOM_MainProgram_Called then
  begin
    somEnvironmentEnd;
  end;
  if SOM_DLL <> 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    FreeLibrary(SOM_DLL);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  Windows.DeleteCriticalSection(DLLLoad_CriticalSection);
end.
