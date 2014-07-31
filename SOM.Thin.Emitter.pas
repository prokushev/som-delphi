{$R-}
{$WARN UNSAFE_TYPE OFF}

unit SOM.Thin.Emitter;

// Define everything that becomes available in C when doing "#include <scemit.h>"

interface

uses
  SOM.DelphiFeatures, SOM.Thin, SOM.Thin.RTL;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

// #include <scemit.h>

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

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTTemplateOutputCClassDataStructure = record
	classObject: SOMClass;
	_get_somtCommentStyle: somMToken;
	_set_somtCommentStyle: somMToken;
	_get_somtLineLength: somMToken;
	_set_somtLineLength: somMToken;
	_set_somtCommentNewline: somMToken;
	_get_somtCommentNewline: somMToken;
	somtGetSymbol: somMToken;
	somtSetSymbol: somMToken;
	somtSetSymbolCopyName: somMToken;
	somtSetSymbolCopyValue: somMToken;
	somtSetSymbolCopyBoth: somMToken;
	somtCheckSymbol: somMToken;
	somtSetOutputFile: somMToken;
	somto: somMToken;
	somtOutputComment: somMToken;
	somtOutputSection: somMToken;
	somtAddSectionDefinitions: somMToken;
	somtReadSectionDefinitions: somMToken;
	somtExpandSymbol: somMToken;
end;
PSOMTTemplateOutputCClassDataStructure = ^SOMTTemplateOutputCClassDataStructure;
function SOMTTemplateOutputCClassData: PSOMTTemplateOutputCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTTemplateOutputCCClassDataStructure = record
	parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PSOMTTemplateOutputCCClassDataStructure = ^SOMTTemplateOutputCCClassDataStructure;
function SOMTTemplateOutputCCClassData: PSOMTTemplateOutputCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTTemplateOutputC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTTemplateOutputC
 *)
function SOMTTemplateOutputCNew: SOMClass;
function SOMTTemplateOutputCRenew(buf: Pointer): SOMClass;

(*
 * New Method: _get_somtCommentStyle
 *)
type
  somTP_SOMTTemplateOutputC__get_somtCommentStyle = function(somSelf: SOMTTemplateOutputC): somtCommentStyleT; stdcall;
  somTD_SOMTTemplateOutputC__get_somtCommentStyle = somTP_SOMTTemplateOutputC__get_somtCommentStyle;
(*
 *  Controls the style in which comments are wrtten as follows:
 *    somtDashesE: "--" at the start of each line
 *    somtCPPE: C++ style, "//" at the start of each line
 *    somtCSimpleE: simple C style, each line wrapped in /* and */
 *    somtCBlockE: block C style, block style, ie leading /* then a * on each
 *               line and then a final */
 *)
const somMD_SOMTTemplateOutputC__get_somtCommentStyle = '::SOMTTemplateOutputC::_get_somtCommentStyle';
function SOMTTemplateOutputC__get_somtCommentStyle(somSelf: SOMTTemplateOutputC): somtCommentStyleT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtCommentStyle
 *)
type
  somTP_SOMTTemplateOutputC__set_somtCommentStyle = procedure(somSelf: SOMTTemplateOutputC;
		somtCommentStyle: somtCommentStyleT); stdcall;
  somTD_SOMTTemplateOutputC__set_somtCommentStyle = somTP_SOMTTemplateOutputC__set_somtCommentStyle;
(*
 *  Controls the style in which comments are wrtten as follows:
 *    somtDashesE: "--" at the start of each line
 *    somtCPPE: C++ style, "//" at the start of each line
 *    somtCSimpleE: simple C style, each line wrapped in / * and * /
 *    somtCBlockE: block C style, block style, ie leading / * then a * on each
 *               line and then a final * /
 *)
const somMD_SOMTTemplateOutputC__set_somtCommentStyle = '::SOMTTemplateOutputC::_set_somtCommentStyle';
procedure SOMTTemplateOutputC__set_somtCommentStyle(somSelf: SOMTTemplateOutputC;
  somtCommentStyle: somtCommentStyleT); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtLineLength
 *)
type
  somTP_SOMTTemplateOutputC__get_somtLineLength = function(somSelf: SOMTTemplateOutputC): LongInt; stdcall;
  somTD_SOMTTemplateOutputC__get_somtLineLength = somTP_SOMTTemplateOutputC__get_somtLineLength;
(*
 *  Controls list output only.  Default is 72.
 *  At least one list item will be output on each line, so making
 *  this value very short will cause list items to be placed on
 *  separate lines.
 *)
const somMD_SOMTTemplateOutputC__get_somtLineLength = '::SOMTTemplateOutputC::_get_somtLineLength';
function SOMTTemplateOutputC__get_somtLineLength(somSelf: SOMTTemplateOutputC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtLineLength
 *)
type
  somTP_SOMTTemplateOutputC__set_somtLineLength = procedure(somSelf: SOMTTemplateOutputC;
		somtLineLength: LongInt); stdcall;
  somTD_SOMTTemplateOutputC__set_somtLineLength = somTP_SOMTTemplateOutputC__set_somtLineLength;
(*
 *  Controls list output only.  Default is 72.
 *  At least one list item will be output on each line, so making
 *  this value very short will cause list items to be placed on
 *  separate lines.
 *)
const somMD_SOMTTemplateOutputC__set_somtLineLength = '::SOMTTemplateOutputC::_set_somtLineLength';
procedure SOMTTemplateOutputC__set_somtLineLength(somSelf: SOMTTemplateOutputC;
  somtLineLength: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtCommentNewline
 *)
type
  somTP_SOMTTemplateOutputC__get_somtCommentNewline = function(somSelf: SOMTTemplateOutputC): CORBABoolean; stdcall;
  somTD_SOMTTemplateOutputC__get_somtCommentNewline = somTP_SOMTTemplateOutputC__get_somtCommentNewline;
(*
 * Method from the IDL attribute statement:
 * "attribute boolean somtCommentNewline"
 *)
const somMD_SOMTTemplateOutputC__get_somtCommentNewline = '::SOMTTemplateOutputC::_get_somtCommentNewline';
function SOMTTemplateOutputC__get_somtCommentNewline(somSelf: SOMTTemplateOutputC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtCommentNewline
 *)
type
  somTP_SOMTTemplateOutputC__set_somtCommentNewline = procedure(somSelf: SOMTTemplateOutputC;
		somtCommentNewline: CORBABoolean); stdcall;
  somTD_SOMTTemplateOutputC__set_somtCommentNewline = somTP_SOMTTemplateOutputC__set_somtCommentNewline;
(*
 * Method from the IDL attribute statement:
 * "attribute boolean somtCommentNewline"
 *)
const somMD_SOMTTemplateOutputC__set_somtCommentNewline = '::SOMTTemplateOutputC::_set_somtCommentNewline';
procedure SOMTTemplateOutputC__set_somtCommentNewline(somSelf: SOMTTemplateOutputC;
	somtCommentNewline: CORBABoolean); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetSymbol
 *)
type
  somTP_SOMTTemplateOutputC_somtGetSymbol = function(somSelf: SOMTTemplateOutputC;
		name: CORBAString): CORBAString; stdcall;
  somTD_SOMTTemplateOutputC_somtGetSymbol = somTP_SOMTTemplateOutputC_somtGetSymbol;
(*
 *  Returns the value associated with <name>.  If no value is
 *  associated with <name> then NULL is returned
 *)
const somMD_SOMTTemplateOutputC_somtGetSymbol = '::SOMTTemplateOutputC::somtGetSymbol';
function SOMTTemplateOutputC_somtGetSymbol(somSelf: SOMTTemplateOutputC;
	name: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtSetSymbol
 *)
type
  somTP_SOMTTemplateOutputC_somtSetSymbol = procedure(somSelf: SOMTTemplateOutputC;
		name, value: CORBAString); stdcall;
  somTD_SOMTTemplateOutputC_somtSetSymbol = somTP_SOMTTemplateOutputC_somtSetSymbol;
(*
 *  Makes the symbol with name <name> have value <value>.  This will
 *  overwrite any previous value the symbol had, and add the symbol
 *  if necessary.
 *  Takes over ownership of both name and value.
 *)
const somMD_SOMTTemplateOutputC_somtSetSymbol = '::SOMTTemplateOutputC::somtSetSymbol';
procedure SOMTTemplateOutputC_somtSetSymbol(somSelf: SOMTTemplateOutputC;
	name, value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtSetSymbolCopyName
 *)
type
  somTP_SOMTTemplateOutputC_somtSetSymbolCopyName = procedure(somSelf: SOMTTemplateOutputC;
		name, value: CORBAString); stdcall;
  somTD_SOMTTemplateOutputC_somtSetSymbolCopyName = somTP_SOMTTemplateOutputC_somtSetSymbolCopyName;
(*
 *  See somtSetSymbol
 *  Only takes over ownership of value.
 *)
const somMD_SOMTTemplateOutputC_somtSetSymbolCopyName = '::SOMTTemplateOutputC::somtSetSymbolCopyName';
procedure SOMTTemplateOutputC_somtSetSymbolCopyName(somSelf: SOMTTemplateOutputC;
	name, value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtSetSymbolCopyValue
 *)
type
  somTP_SOMTTemplateOutputC_somtSetSymbolCopyValue = procedure(somSelf: SOMTTemplateOutputC;
    name, value: CORBAString); stdcall;
  somTD_SOMTTemplateOutputC_somtSetSymbolCopyValue = somTP_SOMTTemplateOutputC_somtSetSymbolCopyValue;
(*
 *  See somtSetSymbol
 *  Only takes over ownership of name.
 *)
const somMD_SOMTTemplateOutputC_somtSetSymbolCopyValue = '::SOMTTemplateOutputC::somtSetSymbolCopyValue';
procedure SOMTTemplateOutputC_somtSetSymbolCopyValue(somSelf: SOMTTemplateOutputC;
  name, value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtSetSymbolCopyBoth
 *)
type
  somTP_SOMTTemplateOutputC_somtSetSymbolCopyBoth = procedure(somSelf: SOMTTemplateOutputC;
		name, value: CORBAString); stdcall;
  somTD_SOMTTemplateOutputC_somtSetSymbolCopyBoth = somTP_SOMTTemplateOutputC_somtSetSymbolCopyBoth;
(*
 *  See somtSetSymbol
 *  Does not take over ownership of either <name> or <value>
 *)
const somMD_SOMTTemplateOutputC_somtSetSymbolCopyBoth = '::SOMTTemplateOutputC::somtSetSymbolCopyBoth';
procedure SOMTTemplateOutputC_somtSetSymbolCopyBoth(somSelf: SOMTTemplateOutputC;
	name, value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtCheckSymbol
 *)
type
  somTP_SOMTTemplateOutputC_somtCheckSymbol = function(somSelf: SOMTTemplateOutputC;
		name: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTTemplateOutputC_somtCheckSymbol = somTP_SOMTTemplateOutputC_somtCheckSymbol;
(*
 *  Returns 1 (true) if the indicated symbol has non-null, non-zero
 *  length value, and 0 (false) otherwise.
 *)
const somMD_SOMTTemplateOutputC_somtCheckSymbol = '::SOMTTemplateOutputC::somtCheckSymbol';
function SOMTTemplateOutputC_somtCheckSymbol(somSelf: SOMTTemplateOutputC;
	name: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtSetOutputFile
 *)
type
  somTP_SOMTTemplateOutputC_somtSetOutputFile = procedure(somSelf: SOMTTemplateOutputC;
		fp: PFILE); stdcall;
  somTD_SOMTTemplateOutputC_somtSetOutputFile = somTP_SOMTTemplateOutputC_somtSetOutputFile;
(*
 *  All template output will be directed to <fp>. Default is <stdout>.
 *)
const somMD_SOMTTemplateOutputC_somtSetOutputFile = '::SOMTTemplateOutputC::somtSetOutputFile';
procedure SOMTTemplateOutputC_somtSetOutputFile(somSelf: SOMTTemplateOutputC;
  fp: PFILE); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somto
 *)
type
  somTP_SOMTTemplateOutputC_somto = procedure(somSelf: SOMTTemplateOutputC;
    tmplt: CORBAString); stdcall;
  somTD_SOMTTemplateOutputC_somto = somTP_SOMTTemplateOutputC_somto;
(*
 *  Outputs a template, <tmplt>, after substitution for any symbols
 *  that occur in it.  Five substitutions are supported: simple,
 *  list, comment, tab, and conditional.
 *  Substitutable items in the template are bracketed with angle
 *  brackets. (Backslash can be used to escape an angle bracket.)
 *  Simple substitutions just replace a symbol with its value. If
 *  the symbol has no value in this template object then the symbol
 *  is replaced error string but no error is raised.
 *  List substitution assumes that the symbol has a value in output
 *  template list form. This is a newline separated string of
 *  values. The list substitution specification consists of four
 *  parts, a prefix, a symbol, a separator, and a list indicator.
 *  prefixes and separators can only be composed of blanks, comma,
 *  colons, and semi-colons.  The list indicator is "..." (three
 *  periods).  For example, the list substitution
 *  specification "<, name, ...> has a prefix of ", ", a symbol of
 *  "name" and a separator of ", ".  The prefix will be used
 *  whenever there is at least one item in the list and the separator
 *  will be used between any two list items.  After the first items
 *  of a list is placed each additional item is evaluated to see if
 *  it would begin after the line length limit (set by
 *  _set_somtLineLength), if it would then a new line is begun and the
 *  value is placed directly under the first item.
 *  Comment substitution assumes that the symbol has a value in
 *  output template list form.  A comment specification consists of
 *  a comment indicator followed by a symbol name. The comment
 *  indicator is "--".  Eg, <-- classComment> is a valid comment
 *  substitution specification.  The lines of the comment are output
 *  according to the current comment style (see <somtCommentStyle>)
 *  and alined with the starting column of the comment
 *  specification.
 *  Tab substitution is specified by <@dd> where "dd" is a valid
 *  positive integer. Blanks will be inserted into the output stream
 *  if necessary to position the next character of output at the
 *  column indicated by "dd".
 *  Conditional substitution is specified by puting a question mark,
 *  "?", in column one of the template line.  The line will not be
 *  output at all unless at least one valid, non-blank,  symbol
 *  substitution  occurs on the line.
 *)
const somMD_SOMTTemplateOutputC_somto = '::SOMTTemplateOutputC::somto';
procedure SOMTTemplateOutputC_somto(somSelf: SOMTTemplateOutputC;
  tmplt: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtOutputComment
 *)
type
  somTP_SOMTTemplateOutputC_somtOutputComment = procedure(somSelf: SOMTTemplateOutputC;
		comment: CORBAString); stdcall;
  somTD_SOMTTemplateOutputC_somtOutputComment = somTP_SOMTTemplateOutputC_somtOutputComment;
(*
 *  Inserts a comment into the output stream.  <comment> must be a
 *  string containing the comment with lines in the comment
 *  seperated by newlines.
 *  The style of output is controlled by <somtCommentStyle>
 *)
const somMD_SOMTTemplateOutputC_somtOutputComment = '::SOMTTemplateOutputC::somtOutputComment';
procedure SOMTTemplateOutputC_somtOutputComment(somSelf: SOMTTemplateOutputC;
	comment: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtOutputSection
 *)
type
  somTP_SOMTTemplateOutputC_somtOutputSection = procedure(somSelf: SOMTTemplateOutputC;
		sectionName: CORBAString); stdcall;
  somTD_SOMTTemplateOutputC_somtOutputSection = somTP_SOMTTemplateOutputC_somtOutputSection;
(*
 *  Just like <somto> above, except <sectionName> must be a symbol
 *  whose value will be used as the template.
 *)
const somMD_SOMTTemplateOutputC_somtOutputSection = '::SOMTTemplateOutputC::somtOutputSection';
procedure SOMTTemplateOutputC_somtOutputSection(somSelf: SOMTTemplateOutputC;
  sectionName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtAddSectionDefinitions
 *)
type
  somTP_SOMTTemplateOutputC_somtAddSectionDefinitions = procedure(somSelf: SOMTTemplateOutputC;
		defString: CORBAString); stdcall;
  somTD_SOMTTemplateOutputC_somtAddSectionDefinitions = somTP_SOMTTemplateOutputC_somtAddSectionDefinitions;
(*
 *  <defString> must be a string of the form:
 *  :section1
 *  value 1 line 1
 *  value 1 line 2
 *  :section2
 *  value 2 line 1
 *  :section3
 *  value 3 line 1
 *  Where the lines that contain a ":" in column 1 immediately followed
 *  by a single name are used to intro the start of a new section.
 *  The section is named by the name on the colon line.  A backslash
 *  can be used to escape a colon in column one that is not supposed
 *  to start a new section.
 *  Adds the indicated section definitions to this template.
 *)
const somMD_SOMTTemplateOutputC_somtAddSectionDefinitions = '::SOMTTemplateOutputC::somtAddSectionDefinitions';
procedure SOMTTemplateOutputC_somtAddSectionDefinitions(somSelf: SOMTTemplateOutputC;
	defString: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtReadSectionDefinitions
 *)
type
  somTP_SOMTTemplateOutputC_somtReadSectionDefinitions = procedure(somSelf: SOMTTemplateOutputC;
		fp: PFILE); stdcall;
  somTD_SOMTTemplateOutputC_somtReadSectionDefinitions = somTP_SOMTTemplateOutputC_somtReadSectionDefinitions;
(*
 *  Reads section definitions from the indicated file.  The section
 *  definitions must be in the form defined above in
 *  <somtAddSectionDefinitions>.
 *)
const somMD_SOMTTemplateOutputC_somtReadSectionDefinitions = '::SOMTTemplateOutputC::somtReadSectionDefinitions';
procedure SOMTTemplateOutputC_somtReadSectionDefinitions(somSelf: SOMTTemplateOutputC;
	fp: PFILE); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtExpandSymbol
 *)
type
  somTP_SOMTTemplateOutputC_somtExpandSymbol = function(somSelf: SOMTTemplateOutputC;
		s, buf: CORBAString): CORBAString; stdcall;
  somTD_SOMTTemplateOutputC_somtExpandSymbol = somTP_SOMTTemplateOutputC_somtExpandSymbol;
(*
 *  Expands simple symbols in an already expanded string.  Thus if you
 *  have a symbol which is itself a Section in a template file, and this
 *  section could have other sections in it then you should call this
 *  method.
 *)
const somMD_SOMTTemplateOutputC_somtExpandSymbol = '::SOMTTemplateOutputC::somtExpandSymbol';
function SOMTTemplateOutputC_somtExpandSymbol(somSelf: SOMTTemplateOutputC;
	s, buf: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}


{ ... }
// #include <scclass.h>
{ ... }
// #include <scmeta.h>
{ ... }
// #include <scmethod.h>
{ ... }
// #include <scpass.h>
{ ... }

// #include <scemit.h>

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

var
  SOME_DLL_SOMTTemplateOutputCClassData: PSOMTTemplateOutputCClassDataStructure;

function SOMTTemplateOutputCClassData: PSOMTTemplateOutputCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTTemplateOutputCClassData) then
    Result := SOME_DLL_SOMTTemplateOutputCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTTemplateOutputCClassData, 'SOMTTemplateOutputCClassData');
    Result := SOME_DLL_SOMTTemplateOutputCClassData;
  end;
end;

var
  SOME_DLL_SOMTTemplateOutputCCClassData: PSOMTTemplateOutputCCClassDataStructure;

function SOMTTemplateOutputCCClassData: PSOMTTemplateOutputCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTTemplateOutputCCClassData) then
    Result := SOME_DLL_SOMTTemplateOutputCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTTemplateOutputCCClassData, 'SOMTTemplateOutputCCClassData');
    Result := SOME_DLL_SOMTTemplateOutputCCClassData;
  end;
end;

function _SOMCLASS_SOMTTemplateOutputC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTTemplateOutputCClassData.classObject;
end;

function SOMTTemplateOutputCNew: SOMClass;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTTemplateOutputC;
  if not Assigned(cls) then cls := SOMTTemplateOutputCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTTemplateOutputCRenew(buf: Pointer): SOMClass;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTTemplateOutputC;
  if not Assigned(cls) then cls := SOMTTemplateOutputCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTTemplateOutputC__get_somtCommentStyle(somSelf: SOMTTemplateOutputC): somtCommentStyleT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  Result :=
    somTD_SOMTTemplateOutputC__get_somtCommentStyle
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtCommentStyle))(somSelf);
end;

procedure SOMTTemplateOutputC__set_somtCommentStyle(somSelf: SOMTTemplateOutputC;
  somtCommentStyle: somtCommentStyleT); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC__set_somtCommentStyle
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtCommentStyle))
     (somSelf, somtCommentStyle);
end;

function SOMTTemplateOutputC__get_somtLineLength(somSelf: SOMTTemplateOutputC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  Result :=
    somTD_SOMTTemplateOutputC__get_somtLineLength
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtLineLength))(somSelf);
end;

procedure SOMTTemplateOutputC__set_somtLineLength(somSelf: SOMTTemplateOutputC;
  somtLineLength: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC__set_somtLineLength
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtLineLength))
     (somSelf, somtLineLength);
end;

function SOMTTemplateOutputC__get_somtCommentNewline(somSelf: SOMTTemplateOutputC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  Result :=
    somTD_SOMTTemplateOutputC__get_somtCommentNewline
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtCommentNewline))(somSelf);
end;

procedure SOMTTemplateOutputC__set_somtCommentNewline(somSelf: SOMTTemplateOutputC;
	somtCommentNewline: CORBABoolean); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC__set_somtCommentNewline
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtCommentNewline))
     (somSelf, somtCommentNewline);
end;

function SOMTTemplateOutputC_somtGetSymbol(somSelf: SOMTTemplateOutputC;
	name: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  Result :=
    somTD_SOMTTemplateOutputC_somtGetSymbol
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetSymbol))(somSelf, name);
end;

procedure SOMTTemplateOutputC_somtSetSymbol(somSelf: SOMTTemplateOutputC;
	name, value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtSetSymbol
   (SOM_Resolve(somSelf, cd.classObject, cd.somtSetSymbol))
     (somSelf, name, value);
end;

procedure SOMTTemplateOutputC_somtSetSymbolCopyName(somSelf: SOMTTemplateOutputC;
	name, value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtSetSymbolCopyName
   (SOM_Resolve(somSelf, cd.classObject, cd.somtSetSymbolCopyName))
     (somSelf, name, value);
end;

procedure SOMTTemplateOutputC_somtSetSymbolCopyValue(somSelf: SOMTTemplateOutputC;
  name, value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtSetSymbolCopyValue
   (SOM_Resolve(somSelf, cd.classObject, cd.somtSetSymbolCopyValue))
     (somSelf, name, value);
end;

procedure SOMTTemplateOutputC_somtSetSymbolCopyBoth(somSelf: SOMTTemplateOutputC;
	name, value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtSetSymbolCopyBoth
   (SOM_Resolve(somSelf, cd.classObject, cd.somtSetSymbolCopyBoth))
     (somSelf, name, value);
end;

function SOMTTemplateOutputC_somtCheckSymbol(somSelf: SOMTTemplateOutputC;
	name: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  Result :=
    somTD_SOMTTemplateOutputC_somtCheckSymbol
     (SOM_Resolve(somSelf, cd.classObject, cd.somtCheckSymbol))(somSelf, name);
end;

procedure SOMTTemplateOutputC_somtSetOutputFile(somSelf: SOMTTemplateOutputC;
  fp: PFILE); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtSetOutputFile
   (SOM_Resolve(somSelf, cd.classObject, cd.somtSetOutputFile))(somSelf, fp);
end;

procedure SOMTTemplateOutputC_somto(somSelf: SOMTTemplateOutputC;
  tmplt: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somto
   (SOM_Resolve(somSelf, cd.classObject, cd.somto))(somSelf, tmplt);
end;

procedure SOMTTemplateOutputC_somtOutputComment(somSelf: SOMTTemplateOutputC;
	comment: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtOutputComment
   (SOM_Resolve(somSelf, cd.classObject, cd.somtOutputComment))
     (somSelf, comment);
end;

procedure SOMTTemplateOutputC_somtOutputSection(somSelf: SOMTTemplateOutputC;
  sectionName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtOutputSection
   (SOM_Resolve(somSelf, cd.classObject, cd.somtOutputSection))
     (somSelf, sectionName);
end;

procedure SOMTTemplateOutputC_somtAddSectionDefinitions(somSelf: SOMTTemplateOutputC;
	defString: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtAddSectionDefinitions
   (SOM_Resolve(somSelf, cd.classObject, cd.somtAddSectionDefinitions))
     (somSelf, defString);
end;

procedure SOMTTemplateOutputC_somtReadSectionDefinitions(somSelf: SOMTTemplateOutputC;
	fp: PFILE); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  somTD_SOMTTemplateOutputC_somtReadSectionDefinitions
   (SOM_Resolve(somSelf, cd.classObject, cd.somtReadSectionDefinitions))
     (somSelf, fp);
end;

function SOMTTemplateOutputC_somtExpandSymbol(somSelf: SOMTTemplateOutputC;
	s, buf: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTTemplateOutputCClassDataStructure;
begin
  cd := SOMTTemplateOutputCClassData;
  Result :=
    somTD_SOMTTemplateOutputC_somtExpandSymbol
     (SOM_Resolve(somSelf, cd.classObject, cd.somtExpandSymbol))(somSelf, s, buf);
end;



end.
