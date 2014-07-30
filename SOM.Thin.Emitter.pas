{$R-}
{$WARN UNSAFE_TYPE OFF}

unit SOM.Thin.Emitter;

// Define everything that becomes available in C when doing "include <scemit.h>"

interface

uses
  SOM.DelphiFeatures, SOM.Thin;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

type
  SOMTEmitC = SOMObject;

(*
 *  This is the pluggable unit in the SOM emitter framework. An emitter
 *  is constructed by subclassing this class and then running the
 *  master emitter program providing the name of the subclass as one of
 *  its command line arguments.
 *  The concepts of this class are simple:
 *
 *    Emitters always consist of a set of sections
 *    The sections are in a particular order for any particular
 *    emitter, and the order does not vary with the data processed by
 *    the emitter.
 *    A number of the sections of an emitter are common (maybe with
 *    slight variation) across several (or even most) emitters.
 *    There are a number of constructs that occur in varying numbers,
 *    eg, method declarations, data declarations, and attribute
 *    declarations.
 *  Consequently, this class provides methods for:
 *    Methods for many common sections, including several that may be
 *    useful without overridding in several different emitters
 *    Sequencing through the sections of the emitter
 *    Iterating through the constructs that occur in varying numbers
 *)

(*
 * Start of bindings for IDL types
 *)

  SOMTEntryC = SOMObject;
  SOMTMetaClassEntryC = SOMObject;
  SOMTAttributeEntryC = SOMObject;
  SOMTTypedefEntryC = SOMObject;
  SOMTBaseClassEntryC = SOMObject;
  SOMTPassthruEntryC = SOMObject;
  SOMTDataEntryC = SOMObject;
  SOMTMethodEntryC = SOMObject;
  SOMTClassEntryC = SOMObject;
  SOMTModuleEntryC = SOMObject;
  SOMTParameterEntryC = SOMObject;
  SOMTStructEntryC = SOMObject;
  SOMTUnionEntryC = SOMObject;
  SOMTEnumEntryC = SOMObject;
  SOMTConstEntryC = SOMObject;
  SOMTSequenceEntryC = SOMObject;
  SOMTStringEntryC = SOMObject;
  SOMTEnumNameEntryC = SOMObject;
  SOMTCommonEntryC = SOMObject;
  SOMTUserDefinedTypeEntryC = SOMObject;

(*
 * End of bindings for IDL types.
 *)

(*
 * Passthru lines: File: "C.h", "after"
 *)

// #include <sm.h>

(*
 *         File:    emitlib.h.
 *     Contents:    Basic types used by Emitter Framework.
 *)

  Stab = Pointer;
  SOMTTypes = type LongWord;
const
  SOMTAnyBE = SOMTTypes(0);
  SOMTArgumentE = SOMTTypes(1);
  SOMTAttE = SOMTTypes(2);
  SOMTBadEntryE = SOMTTypes(3);
  SOMTBaseE = SOMTTypes(4);
  SOMTBooleanBE = SOMTTypes(5);
  SOMTCaseEntryE = SOMTTypes(6);
  SOMTCaseListE = SOMTTypes(7);
  SOMTCaseSTME = SOMTTypes(8);
  SOMTCharBE = SOMTTypes(9);
  SOMTClassE = SOMTTypes(10);
  SOMTConstE = SOMTTypes(11);
  SOMTCopyrightE = SOMTTypes(12);
  SOMTDataE = SOMTTypes(13);
  SOMTDclListE = SOMTTypes(14);
  SOMTDefaultE = SOMTTypes(15);
  SOMTDoubleBE = SOMTTypes(16);
  SOMTEBaseE = SOMTTypes(17);
  SOMTEEnumE = SOMTTypes(18);
  SOMTEnumBE = SOMTTypes(19);
  SOMTEnumE = SOMTTypes(20);
  SOMTEnumPE = SOMTTypes(21);
  SOMTFloatBE = SOMTTypes(22);
  SOMTGroupE = SOMTTypes(23);
  SOMTLongBE = SOMTTypes(24);
  SOMTMetaE = SOMTTypes(25);
  SOMTModuleE = SOMTTypes(26);
  SOMTNegativeBE = SOMTTypes(27);
  SOMTNewMethodE = SOMTTypes(28);
  SOMTOctetBE = SOMTTypes(29);
  SOMTOverriddenMethodE = SOMTTypes(30);
  SOMTOverrideMethodE = SOMTTypes(31);
  SOMTPassthruE = SOMTTypes(32);
  SOMTSequenceE = SOMTTypes(33);
  SOMTSequenceTDE = SOMTTypes(34);
  SOMTShortBE = SOMTTypes(35);
  SOMTStringBE = SOMTTypes(36);
  SOMTStringE = SOMTTypes(37);
  SOMTStructE = SOMTTypes(38);
  SOMTStructPE = SOMTTypes(39);
  SOMTStructSE = SOMTTypes(40);
  SOMTTyDclE = SOMTTypes(41);
  SOMTTypeCodeBE = SOMTTypes(42);
  SOMTTypedefBE = SOMTTypes(43);
  SOMTTypedefE = SOMTTypes(44);
  SOMTUnionE = SOMTTypes(45);
  SOMTUnionPE = SOMTTypes(46);
  SOMTUnionSE = SOMTTypes(47);
  SOMTUnsignedLongBE = SOMTTypes(48);
  SOMTUnsignedShortBE = SOMTTypes(49);
  SOMTVoidBE = SOMTTypes(50);
  SOMTVoidPtrBE = SOMTTypes(51);
  SOMTEmitterBeginE = SOMTTypes(52);
  SOMTEmitterEndE = SOMTTypes(53);
  SOMTGlobalOnlyE = SOMTTypes(54);

type
  Entry = record
    name: PAnsiChar;
    somttype: SOMTTypes;
  end;
  PEntry = ^Entry;

// #include <sctypes.h>

const
  SOMT_MAX_STRING_LENGTH = 10000;
  SOMT_MAX_SMALL_STRING = 1000;

type
  SOMTTargetTypeT = type LongWord;
const
  somtPrivateE = SOMTTargetTypeT(0);
  somtPublicE = SOMTTargetTypeT(1);
  somtImplementationE = SOMTTargetTypeT(2);
  somtAllE = SOMTTargetTypeT(3);

function somtGetObjectWrapper(ep: PEntry): SOMTEntryC; stdcall;
// the following procedures are not present in neither implib nor any dll
// sctypes.h is the only file in SOM DTK 3.0 for WinNT containing these strings
// procedure printEntry(entry: SOMTEntryC; level: Integer); stdcall; // ?
// procedure dumpEntry(entry: SOMTEntryC; level: Integer); stdcall; // ?
procedure somtShowEntry(ep: PEntry); stdcall;
function somtStrDup(str: PAnsiChar): PAnsiChar; stdcall;
function somtStrCat(count: Integer): PAnsiChar; cdecl; varargs;
function somtMakeIncludeStr(local: CORBABoolean; stem, suffix: PAnsiChar): PAnsiChar; stdcall;
function somtNewSymbol(prefix, stem: PAnsiChar): PAnsiChar; stdcall;
function somtGetFileStem(fullName: PAnsiChar): PAnsiChar; stdcall;
function somtEntryTypeName(somttype: SOMTTypes): PAnsiChar; stdcall;

// #include <sctmplt.h>

(*
 * Passthru lines: File: "C.h", "before"
 *)

type
  somtCommentStyleT = type LongWord;
const
  somtDashesE = somtCommentStyleT(1);
  somtCPPE = somtCommentStyleT(2);
  somtCSimpleE = somtCommentStyleT(3);
  somtCBlockE = somtCommentStyleT(4);

type
  SOMTTemplateOutputC = SOMObject;

(*
 * Start of bindings for IDL types
 *)
  SOMStringTableC = SOMObject;

const
  SOMTTemplateOutputC_MAX_INPUT_LINE_LENGTH = 1024;
  SOMTTemplateOutputC_MAX_OUTPUT_LINE_LENGTH = 4096;

(*
 * End of bindings for IDL types.
 *)

const
  SOMTTemplateOutputC_MajorVersion = 2;
  SOMTTemplateOutputC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTTemplateOutputCNewClass(
  somtmajorVersion: integer4 = SOMTTemplateOutputC_MajorVersion;
  somtminorVersion: integer4 = SOMTTemplateOutputC_MinorVersion): SOMClass; stdcall;


// #include <scclass.h>
// #include <scmeta.h>
// #include <scmethod.h>
// #include <scpass.h>
    (*
     * These macros provide short-hands for the use of the Scan
     * Methods.
     *)

(*    #define SCAN_NOFILTER(scan,method) \
        _##scan(somSelf, #method"Prolog", #method, #method"Epilog")
    #define SCAN_NOFILTER_SN(scan,method,base,newbase) \
        {_somtSetSymbolCopyBoth(_t, #base"PrologSN", #newbase"PrologS"); \
        _somtSetSymbolCopyBoth(_t, #base"SN", #newbase"S"); \
        _somtSetSymbolCopyBoth(_t, #base"EpilogSN", #newbase"EpilogS"); \
        _##scan(somSelf, #method"Prolog", #method, #method"Epilog");}
    #define SCAN_FILTER(scan,filt,method) \
        _##scan(somSelf, #filt, #method"Prolog", #method, #method"Epilog",0)
    #define SCAN_FILTER_SN(scan,filt,method,base,newbase) \
        {_somtSetSymbolCopyBoth(_t, #base"PrologSN", #newbase"PrologS"); \
        _somtSetSymbolCopyBoth(_t, #base"SN", #newbase"S"); \
        _somtSetSymbolCopyBoth(_t, #base"EpilogSN", #newbase"EpilogS"); \
        _##scan(somSelf, #filt, #method"Prolog", #method, #method"Epilog",0);} *)


implementation

uses
  Windows, SOM.Thin.DLL;

var
  SOME_DLL: System.HMODULE = 0;

procedure SOME_Load_Variable(var V_Pointer; const Var_Name: AnsiString);
begin
  if SOME_DLL = 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    if SOME_DLL = 0 then
      SOME_DLL := Windows.LoadLibraryW(SOME_DLL_Name);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  if SOME_DLL <> 0 then
    Pointer(V_Pointer) := Windows.GetProcAddress(SOME_DLL, PAnsiChar(Var_Name));
end;

// #include <sctypes.h>

function somtGetObjectWrapper; external SOME_DLL_Name;
// procedure printEntry; external SOME_DLL_Name; // ?
// procedure dumpEntry; external SOME_DLL_Name; // ?
procedure somtShowEntry; external SOME_DLL_Name;
function somtStrDup; external SOME_DLL_Name;
function somtStrCat; external SOME_DLL_Name;
function somtMakeIncludeStr; external SOME_DLL_Name;
function somtNewSymbol; external SOME_DLL_Name;
function somtGetFileStem; external SOME_DLL_Name;
function somtEntryTypeName; external SOME_DLL_Name;

function SOMTTemplateOutputCNewClass; external SOME_DLL_Name;

end.
