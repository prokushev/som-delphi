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
  SOMAnyStrict = record
    mtab: somMethodTabPtr;
    body: array[0 .. 0] of integer4;
  end;
  SOMAny_struct = SOMAnyStrict;

(* SOM Primitive Classes *)
  SOMObject = ^SOMAnyStrict;
  PSOMObject = ^SOMObject;
  PPSOMObject = ^PSOMObject;
  SOMClass = type SOMObject;
  PSOMClass = ^SOMClass;
  PPSOMClass = ^PSOMClass;
  SOMClassMgr = type SOMClass;
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

// function SOM_Resolve(o: SOMObject; oc: SOMClass; m: somMethodProc): somMethodProc; // (moved down)

(* Check the validity of method resolution using the specified target  *)
(* object.  Note: this macro makes programs bigger and slower.	After  *)
(* you are confident that your program is running correctly you should *)
(* turn off this macro by defining SOM_NoTest, or adding -DSOM_NoTest  *)
(* to your makefile.						       *)

// function SOM_TestCls(obj: SOMObject; cls: SOMClass): SOMObject; // (moved down)

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

// #include <somapi.h>

(*  SOM Version Numbers  *)
// function SOM_MajorVersion: PLongInt; // (moved down)
// function SOM_MinorVersion: PLongInt; // (moved down)

(*  SOM Thread Support  *)
// function SOM_MaxThreads: PLongInt; // (moved down)

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
// function somEnvironmentNew: PSOMClassMgr; stdcall; // (moved down)

// procedure somEnvironmentEnd; stdcall; // (moved down)
// function somMainProgram: PSOMClassMgr; stdcall; // (moved down)
// function somAbnormalEnd: ByteBool; stdcall; // (moved down)

(*
 *  Replaceable SOM Memory Management Interfaces
 *
 *  External procedure variables SOMCalloc, SOMFree, SOMMalloc, SOMRealloc
 *  have the same interface as their standard C-library analogs.
 *)
// function SOMCalloc: PsomTD_SOMCalloc; // (moved down)
// function SOMFree: PsomTD_SOMFree; // (moved down)
// function SOMMalloc: PsomTD_SOMMalloc; // (moved down)
// function SOMRealloc: PsomTD_SOMRealloc; // (moved down)

(*
 *  Replaceable SOM Error handler
 *)
// function SOMError: PsomTD_SOMError; // (moved down)

(*
 *  Replaceable SOM Semaphore Operations
 *
 *  These operations are used by the SOM Kernel to make thread-safe
 *  state changes to internal resources and for synchronization between
 *  the SOM services process and client SOM processes.
 *)
// function SOMCreateMutexSem: PsomTD_SOMCreateMutexSem; // (moved down)
// function SOMRequestMutexSem: PsomTD_SOMRequestMutexSem; // (moved down)
// function SOMReleaseMutexSem: PsomTD_SOMReleaseMutexSem; // (moved down)
// function SOMDestroyMutexSem: PsomTD_SOMDestroyMutexSem; // (moved down)

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
// function SOMGetThreadId: PsomTD_SOMGetThreadId; // (moved down)


(*----------------------------------------------------------------------
 * SOM Class Manager Section
 *---------------------------------------------------------------------*)

(*
 * Global class manager object
 *)
// function SOMClassMgrObject: PPSOMClassMgr; // (moved down)

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
// function SOMLoadModule: PsomTD_SOMLoadModule; // (moved down)
// function SOMDeleteModule: PsomTD_SOMDeleteModule; // (moved down)
// function SOMClassInitFuncName: PsomTD_SOMClassInitFuncName; // (moved down)


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
// function SOMOutCharRoutine: PsomTD_SOMOutCharRoutine; // (moved down)


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
//   SOMClass = type SOMObject;
//   PSOMClass = ^SOMClass;
//   PPSOMClass = ^PSOMClass;
//   PPPSOMClass = ^PPSOMClass;
//   SOMClassMgr = type SOMClass;
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

function SOM_Resolve(o: SOMObject; oc: SOMClass; m: somMethodProc): somMethodProc;

(* Check the validity of method resolution using the specified target  *)
(* object.  Note: this macro makes programs bigger and slower.	After  *)
(* you are confident that your program is running correctly you should *)
(* turn off this macro by defining SOM_NoTest, or adding -DSOM_NoTest  *)
(* to your makefile.						       *)

function SOM_TestCls(obj: SOMObject; cls: SOMClass): SOMObject;

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

// #include <somapi.h>

(*  SOM Version Numbers  *)
function SOM_MajorVersion: PLongInt;
function SOM_MinorVersion: PLongInt;

(*  SOM Thread Support  *)
function SOM_MaxThreads: PLongInt;

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
function SOMClassMgrObject: PSOMClassMgr;

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

const
  SOMObject_MajorVersion = 1;
  SOMObject_MinorVersion = 7;

(*
 * Declare the class creation procedure
 *)
function SOMObjectNewClass(somtmajorVersion, somtminorVersion: integer4): SOMClass; stdcall;

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
(* function SOMObjectRenew(buf: Pointer): SOMObject; *)

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
(* procedure SOMObject_somDefaultInit(somSelf: SOMObject; ctrl: som3InitCtrlPtr); *)

(*
 * New Method: somDestruct
 *)
type
  somTP_SOMObject_somDestruct = procedure(somSelf: SOMObject;
		doFree: octet;
		ctrl: som3DestructCtrlPtr); stdcall;
  somTD_SOMObject_somDestruct = somTP_SOMObject_somDestruct;
(*
 *  The default destructor for a SOM object. A nonzero <doFree>
 *  indicates that the object storage should be freed by the
 *  object's class (via somDeallocate) after uninitialization.
 *  As with somDefaultInit, a null ctrl can be passed.
 *)
(* procedure SOMObject_somDestruct(somSelf: SOMObject;
		doFree: octet; ctrl: som3DestructCtrlPtr); *)

(*
 * New Method: somFree
 *)
type
  somTP_SOMObject_somFree = procedure(somSelf: SOMObject); stdcall;
  somTD_SOMObject_somFree = somTP_SOMObject_somFree;
(*
 *  The default implementation just calls somDestruct.
 *)
(* procedure SOMObject_somFree(somSelf: SOMObject); *)

(*
 * New Method: somGetClassName
 *)
type
  somTP_SOMObject_somGetClassName = function(somSelf: SOMObject): CORBAString; stdcall;
  somTD_SOMObject_somGetClassName = somTP_SOMObject_somGetClassName;
(*
 *  Return the name of the receiver's class.
 *)


// #include <somcls.h>

(*
 * Start of bindings for IDL types
 *)
type
  _IDL_SEQUENCE_somToken = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: somTokenPtr;
  end;
  SOMClass_somTokenSequence = _IDL_SEQUENCE_somToken ;
(*
 *  a (generic) sequence of somTokens
 *)

  _IDL_SEQUENCE_SOMClass = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PSOMClass;
  end;
  SOMClass_SOMClassSequence = _IDL_SEQUENCE_SOMClass;
(*
 *  a sequence of classes
 *)

  SOMClass_somOffsetInfo = record
    cls: SOMClass;
    offset: LongInt;
  end;
  PSOMClass_somOffsetInfo = ^SOMClass_somOffsetInfo;
(*
 *  a structure to describe a class-related offset
 *)

  _IDL_SEQUENCE_SOMClass_somOffsetInfo = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PSOMClass_somOffsetInfo;
  end;
  SOMClass_somOffsets = _IDL_SEQUENCE_SOMClass_somOffsetInfo ;
(*
 *  a sequence of class-related offsets
 *)

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
function SOMClassNewClass(somtmajorVersion,
  somtminorVersion: integer4): SOMClass; stdcall;

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
function SOMClass_somNew(somSelf: SOMClass): SOMObject;









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

function SOM_Resolve(o: SOMObject; oc: SOMClass; m: somMethodProc): somMethodProc;
begin
  SOM_TestCls(o, oc);
  Result := m;
end;

function SOM_TestCls(obj: SOMObject; cls: SOMClass): SOMObject;
begin
  Result := somTestCls(obj, cls, '??', 0);
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

// #include <somapi.h>

var
  SOM_DLL_SOM_MajorVersion: PLongInt;

function SOM_MajorVersion: PLongInt;
begin
  if Assigned(SOM_DLL_SOM_MajorVersion) then
    Result := SOM_DLL_SOM_MajorVersion
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOM_MajorVersion, 'SOM_MajorVersion');
    Result := SOM_DLL_SOM_MajorVersion;
  end;
end;

var
  SOM_DLL_SOM_MinorVersion: PLongInt;

function SOM_MinorVersion: PLongInt;
begin
  if Assigned(SOM_DLL_SOM_MinorVersion) then
    Result := SOM_DLL_SOM_MinorVersion
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOM_MinorVersion, 'SOM_MinorVersion');
    Result := SOM_DLL_SOM_MinorVersion;
  end;
end;

var
  SOM_DLL_SOM_MaxThreads: PLongInt;

function SOM_MaxThreads: PLongInt;
begin
  if Assigned(SOM_DLL_SOM_MaxThreads) then
    Result := SOM_DLL_SOM_MaxThreads
  else
  begin
    SOM_Load_Variable(SOM_DLL_SOM_MaxThreads, 'SOM_MaxThreads');
    Result := SOM_DLL_SOM_MaxThreads;
  end;
end;

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
  SOM_DLL_SOMClassMgrObject: PSOMClassMgr;

function SOMClassMgrObject: PSOMClassMgr;
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
	  SOMObjectNewClass(
  		SOMObject_MajorVersion,
	  	SOMObject_MinorVersion);
  end;
  Result := SOMClass_somNew(_SOMCLASS_SOMObject);
end;

(* function SOMObjectRenew(buf: Pointer): SOMObject;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMObject;
  if not Assigned(cls) then
  begin
	  SOMObjectNewClass(
  		SOMObject_MajorVersion,
	  	SOMObject_MinorVersion);
  end;
	Result := _somRenew(_SOMObject, buf);
end; *)

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

function SOMClass_somNew(somSelf: SOMClass): SOMObject;
begin
  Result :=
    somTD_SOMClass_somNew
     (SOM_Resolve
       (somSelf,
        SOMClassClassData.classObject,
        SOMClassClassData.somNew))(somSelf);
end;

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
