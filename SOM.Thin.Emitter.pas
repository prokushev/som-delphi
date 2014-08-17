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

type
  SOMTEntryC = SOMObject; // used in <sm.h>

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
function SOMTTemplateOutputCNew: SOMTTemplateOutputC;
function SOMTTemplateOutputCRenew(buf: Pointer): SOMTTemplateOutputC;

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

// #include <scentry.h>

(*
 * Define the class name as an object type
 *)
// type
//   SOMTEntryC = SOMObject;
(*
 *  A SOM class interface definition is compiled to produce a graph
 *  structure whose nodes are instances of <SOMTEntry> or its
 *  sub-classes.  Each entry is derived from some syntactic element of
 *  the definition source. The attributes defined in <SOMTEntryC>
 *  refer to this syntactic element in a fairly obvious way.
 *
 *)

const
  SOMTEntryC_MajorVersion = 2;
  SOMTEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTEntryCNewClass(
  somtmajorVersion: integer4 = SOMTEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTEntryC_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTEntryCClassDataStructure = record
	classObject: SOMClass;
	_get_somtEntryName: somMToken;
	_set_somtEntryName: somMToken;
	_get_somtElementType: somMToken;
	_set_somtElementType: somMToken;
	_get_somtEntryComment: somMToken;
	_get_somtSourceLineNumber: somMToken;
	_get_somtTypeCode: somMToken;
	_get_somtIsReference: somMToken;
	somtGetModifierValue: somMToken;
	somtGetFirstModifier: somMToken;
	somtGetNextModifier: somMToken;
	somtFormatModifier: somMToken;
	somtGetModifierList: somMToken;
	somtSetSymbolsOnEntry: somMToken;
	somtSetEntryStruct: somMToken;
	_get_somtEntryStruct: somMToken;
	somtShowAssocEntry: somMToken;
	_get_somtCScopedName: somMToken;
	_get_somtIDLScopedName: somMToken;
	_get_somtElementTypeName: somMToken;
end;
PSOMTEntryCClassDataStructure = ^SOMTEntryCClassDataStructure;
function SOMTEntryCClassData: PSOMTEntryCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTEntryCCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMTEntryCCClassDataStructure = ^SOMTEntryCCClassDataStructure;
function SOMTEntryCCClassData: PSOMTEntryCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTEntryC
 *)
function SOMTEntryCNew: SOMTEntryC;
function SOMTEntryCRenew(buf: Pointer): SOMTEntryC;

(*
 * New Method: _get_somtEntryName
 *)
type
  somTP_SOMTEntryC__get_somtEntryName = function(somSelf: SOMTEntryC): CORBAString; stdcall;
  somTD_SOMTEntryC__get_somtEntryName = somTP_SOMTEntryC__get_somtEntryName;
(*
 *  The name associated with this entry.  Eg, the name of
 *  the data item, the class, the method, the type, etc.
 *)
const somMD_SOMTEntryC__get_somtEntryName = '::SOMTEntryC::_get_somtEntryName';
function SOMTEntryC__get_somtEntryName(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtEntryName
 *)
type
  somTP_SOMTEntryC__set_somtEntryName = procedure(somSelf: SOMTEntryC;
		somtEntryName: CORBAString); stdcall;
  somTD_SOMTEntryC__set_somtEntryName = somTP_SOMTEntryC__set_somtEntryName;
(*
 *  The name associated with this entry.  Eg, the name of
 *  the data item, the class, the method, the type, etc.
 *)
const somMD_SOMTEntryC__set_somtEntryName = '::SOMTEntryC::_set_somtEntryName';
procedure SOMTEntryC__set_somtEntryName(somSelf: SOMTEntryC;
  somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtElementType
 *)
type
  somTP_SOMTEntryC__get_somtElementType = function(somSelf: SOMTEntryC): SOMTTypes; stdcall;
  somTD_SOMTEntryC__get_somtElementType = somTP_SOMTEntryC__get_somtElementType;
(*
 *  Returns the type of this entry.
 *  This is not datatype, but entry type (method, class,
 *  passthru, etc.). The value is defined by SOMTTypes.
 *)
const somMD_SOMTEntryC__get_somtElementType = '::SOMTEntryC::_get_somtElementType';
function SOMTEntryC__get_somtElementType(somSelf: SOMTEntryC): SOMTTypes; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtElementType
 *)
type
  somTP_SOMTEntryC__set_somtElementType = procedure(somSelf: SOMTEntryC;
		somtElementType: SOMTTypes); stdcall;
  somTD_SOMTEntryC__set_somtElementType = somTP_SOMTEntryC__set_somtElementType;
(*
 *  Returns the type of this entry.
 *  This is not datatype, but entry type (method, class,
 *  passthru, etc.). The value is defined by SOMTTypes.
 *)
const somMD_SOMTEntryC__set_somtElementType = '::SOMTEntryC::_set_somtElementType';
procedure SOMTEntryC__set_somtElementType(somSelf: SOMTEntryC;
  somtElementType: SOMTTypes); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtElementTypeName
 *)
type
  somTP_SOMTEntryC__get_somtElementTypeName = function(somSelf: SOMTEntryC): CORBAString; stdcall;
  somTD_SOMTEntryC__get_somtElementTypeName = somTP_SOMTEntryC__get_somtElementTypeName;
(*
 *  String version of somtElementType.
 *)
const somMD_SOMTEntryC__get_somtElementTypeName = '::SOMTEntryC::_get_somtElementTypeName';
function SOMTEntryC__get_somtElementTypeName(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtEntryComment
 *)
type
  somTP_SOMTEntryC__get_somtEntryComment = function(somSelf: SOMTEntryC): CORBAString; stdcall;
  somTD_SOMTEntryC__get_somtEntryComment = somTP_SOMTEntryC__get_somtEntryComment;
(*
 *  Returns the comment associated with this entry, or NULL is this
 *  entry has no associated comment.  Comments will have comment
 *  delimitors removed, but will retain newline characters as
 *  specified in the source file. (use smLookupComment)
 *)
const somMD_SOMTEntryC__get_somtEntryComment = '::SOMTEntryC::_get_somtEntryComment';
function SOMTEntryC__get_somtEntryComment(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtSourceLineNumber
 *)
type
  somTP_SOMTEntryC__get_somtSourceLineNumber = function(somSelf: SOMTEntryC): LongWord; stdcall;
  somTD_SOMTEntryC__get_somtSourceLineNumber = somTP_SOMTEntryC__get_somtSourceLineNumber;
(*
 *  Returns the line number in the source file where this entry's
 *  syntactic form ended.
 *)
const somMD_SOMTEntryC__get_somtSourceLineNumber = '::SOMTEntryC::_get_somtSourceLineNumber';
function SOMTEntryC__get_somtSourceLineNumber(somSelf: SOMTEntryC): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtTypeCode
 *)
type
  somTP_SOMTEntryC__get_somtTypeCode = function(somSelf: SOMTEntryC): TypeCode; stdcall;
  somTD_SOMTEntryC__get_somtTypeCode = somTP_SOMTEntryC__get_somtTypeCode;
(*
 *  The typecode, if appropriate, or NULL.
 *)
const somMD_SOMTEntryC__get_somtTypeCode = '::SOMTEntryC::_get_somtTypeCode';
function SOMTEntryC__get_somtTypeCode(somSelf: SOMTEntryC): TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtIsReference
 *)
type
  somTP_SOMTEntryC__get_somtIsReference = function(somSelf: SOMTEntryC): CORBABoolean; stdcall;
  somTD_SOMTEntryC__get_somtIsReference = somTP_SOMTEntryC__get_somtIsReference;
(*
 *  Whether the entry is just a reference to the real type (TRUE)
 *  rather than a declaration of it (FALSE).
 *)
const somMD_SOMTEntryC__get_somtIsReference = '::SOMTEntryC::_get_somtIsReference';
function SOMTEntryC__get_somtIsReference(somSelf: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtIDLScopedName
 *)
type
  somTP_SOMTEntryC__get_somtIDLScopedName = function(somSelf: SOMTEntryC): CORBAString; stdcall;
  somTD_SOMTEntryC__get_somtIDLScopedName = somTP_SOMTEntryC__get_somtIDLScopedName;
(*
 *  The IDL scoped name of the entry (using double colon as delimiter).
 *)
const somMD_SOMTEntryC__get_somtIDLScopedName = '::SOMTEntryC::_get_somtIDLScopedName';
function SOMTEntryC__get_somtIDLScopedName(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtCScopedName
 *)
type
  somTP_SOMTEntryC__get_somtCScopedName = function(somSelf: SOMTEntryC): CORBAString; stdcall;
  somTD_SOMTEntryC__get_somtCScopedName = somTP_SOMTEntryC__get_somtCScopedName;
(*
 *  The C scoped name of the entry (using underscore as delimiter).
 *)
const somMD_SOMTEntryC__get_somtCScopedName = '::SOMTEntryC::_get_somtCScopedName';
function SOMTEntryC__get_somtCScopedName(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetModifierValue
 *)
type
  somTP_SOMTEntryC_somtGetModifierValue = function(somSelf: SOMTEntryC;
		modifierName: CORBAString): CORBAString; stdcall;
  somTD_SOMTEntryC_somtGetModifierValue = somTP_SOMTEntryC_somtGetModifierValue;
(*
 *  Returns the value of the named modifier if this entry has the
 *  named modifier and NULL otherwise. Note: if the modifier is
 *  present but does not have a value then a value of <'\1'> is
 *  returned.
 *)
const somMD_SOMTEntryC_somtGetModifierValue = '::SOMTEntryC::somtGetModifierValue';
function SOMTEntryC_somtGetModifierValue(somSelf: SOMTEntryC;
  modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstModifier
 *)
type
  somTP_SOMTEntryC_somtGetFirstModifier = function(somSelf: SOMTEntryC;
		var modifierName, modifierValue: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEntryC_somtGetFirstModifier = somTP_SOMTEntryC_somtGetFirstModifier;
(*
 *  Returns the first modifier associated with this entry.  1 (true)
 *  is returned if the entry has at least one modifier and 0 (false)
 *  otherwise.
 *)
const somMD_SOMTEntryC_somtGetFirstModifier = '::SOMTEntryC::somtGetFirstModifier';
function SOMTEntryC_somtGetFirstModifier(somSelf: SOMTEntryC;
  var modifierName, modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModifier
 *)
type
  somTP_SOMTEntryC_somtGetNextModifier = function(somSelf: SOMTEntryC;
		var modifierName, modifierValue: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEntryC_somtGetNextModifier = somTP_SOMTEntryC_somtGetNextModifier;
(*
 *  Returns the next modifier (with respect to the last call to
 *  <somtGetNextModifier> or <somtGetFirstModifier>)
 *  associated with this entry.  1 (true) is returned if the entry
 *  had another modifier and 0 (false) otherwise.
 *)
const somMD_SOMTEntryC_somtGetNextModifier = '::SOMTEntryC::somtGetNextModifier';
function SOMTEntryC_somtGetNextModifier(somSelf: SOMTEntryC;
  var modifierName, modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtFormatModifier
 *)
type
  somTP_SOMTEntryC_somtFormatModifier = function(somSelf: SOMTEntryC;
		buffer, name, value: CORBAString): LongInt; stdcall;
  somTD_SOMTEntryC_somtFormatModifier = somTP_SOMTEntryC_somtFormatModifier;
(*
 *  Formats the indicated name/value pair into buffer.  Buffer must
 *  be big enough to hold all the formatted pair, no checks are made.
 *  The number of characters added to buffer are returned (not
 *  including the trailing null character).
 *  Note: value may be null
 *  You will probably never call this method, it is provided so that
 *  you can override it to control the format returned in
 *  <somtGetModifierList>.
 *)
const somMD_SOMTEntryC_somtFormatModifier = '::SOMTEntryC::somtFormatModifier';
function SOMTEntryC_somtFormatModifier(somSelf: SOMTEntryC;
  buffer, name, value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetModifierList
 *)
type
  somTP_SOMTEntryC_somtGetModifierList = function(somSelf: SOMTEntryC;
		buffer: CORBAString): LongInt; stdcall;
  somTD_SOMTEntryC_somtGetModifierList = somTP_SOMTEntryC_somtGetModifierList;
(*
 *  The modifiers for this entry are placed in <buffer> in template
 *  list form (newline separated).  Buffer must be big enough to
 *  hold all the modifiers, no checks are made. The number of
 *  modifiers is returned.
 *)
const somMD_SOMTEntryC_somtGetModifierList = '::SOMTEntryC::somtGetModifierList';
function SOMTEntryC_somtGetModifierList(somSelf: SOMTEntryC;
  buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtSetSymbolsOnEntry
 *)
type
  somTP_SOMTEntryC_somtSetSymbolsOnEntry = function(somSelf: SOMTEntryC;
		emitter: SOMTEmitC; prefix: CORBAString): LongInt; stdcall;
  somTD_SOMTEntryC_somtSetSymbolsOnEntry = somTP_SOMTEntryC_somtSetSymbolsOnEntry;
(*
 *  Places a number of symbol/value pairs in <t>.  All the symbols
 *  will begin with <prefix>.
 *)
const somMD_SOMTEntryC_somtSetSymbolsOnEntry = '::SOMTEntryC::somtSetSymbolsOnEntry';
function SOMTEntryC_somtSetSymbolsOnEntry(somSelf: SOMTEntryC;
  emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtSetEntryStruct
 *)
type
  somTP_SOMTEntryC_somtSetEntryStruct = procedure(somSelf: SOMTEntryC;
		es: PEntry); stdcall;
  somTD_SOMTEntryC_somtSetEntryStruct = somTP_SOMTEntryC_somtSetEntryStruct;
(*
 *  Sets the entry struct data member.
 *  Note, when overridding this method, it is important to call the
 *  parent version of the method first and then do your processing.
 *)
const somMD_SOMTEntryC_somtSetEntryStruct = '::SOMTEntryC::somtSetEntryStruct';
procedure SOMTEntryC_somtSetEntryStruct(somSelf: SOMTEntryC; es: PEntry); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <scclass.h>

(*
 * Define the class name as an object type
 *)
type
  SOMTClassEntryC = SOMTEntryC;
(*
 *  This entry is the anchor for all information about a class
 *  definition. The part it inherits from <SOMTEntryC> concerns
 *  the actual class statement in the interface definition.  The new
 *  methods and attributes provided by the class concern the class
 *  definition as a whole.
 *  A number of the possible statements in a class definition are
 *  optional, when they are missing from the class definition then
 *  methods that would return an entry for this kind of statement, will
 *  return NULL.
 *)

(*
 * Start of bindings for IDL types
 *)

type
  SOMTMetaClassEntryC = SOMTEntryC;
  SOMTAttributeEntryC = SOMTEntryC;
  SOMTTypedefEntryC = SOMTEntryC;
  SOMTBaseClassEntryC = SOMTEntryC;
  SOMTPassthruEntryC = SOMTEntryC;
  SOMTCommonEntryC = SOMTEntryC;
  SOMTDataEntryC = SOMTCommonEntryC;
  SOMTMethodEntryC = SOMTCommonEntryC;
  SOMTModuleEntryC = SOMTEntryC;
  SOMTStructEntryC = SOMTEntryC;
  SOMTUnionEntryC = SOMTEntryC;
  SOMTEnumEntryC = SOMTEntryC;
  SOMTConstEntryC = SOMTEntryC;
  SOMTSequenceEntryC = SOMTEntryC;

(*
 * End of bindings for IDL types.
 *)

const
  SOMTClassEntryC_MajorVersion = 2;
  SOMTClassEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTClassEntryCNewClass(
  somtmajorVersion: integer4 = SOMTClassEntryC_MajorVersion;
	somtminorVersion: integer4 = SOMTClassEntryC_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTClassEntryCClassDataStructure = record
	classObject: SOMClass;
	_get_somtSourceFileName: somMToken;
	_get_somtMetaClassEntry: somMToken;
	_get_somtNewMethodCount: somMToken;
	_get_somtLocalInclude: somMToken;
	_get_somtPrivateMethodCount: somMToken;
	_get_somtStaticMethodCount: somMToken;
	_get_somtOverrideMethodCount: somMToken;
	_get_somtProcMethodCount: somMToken;
	_get_somtVAMethodCount: somMToken;
	_get_somtBaseCount: somMToken;
	_get_somtExternalDataCount: somMToken;
	_get_somtPublicDataCount: somMToken;
	_get_somtPrivateDataCount: somMToken;
	somtGetFirstBaseClass: somMToken;
	somtGetNextBaseClass: somMToken;
	somtGetFirstReleaseName: somMToken;
	somtGetNextReleaseName: somMToken;
	somtGetReleaseNameList: somMToken;
	somtGetFirstPassthru: somMToken;
	somtGetNextPassthru: somMToken;
	somtGetFirstData: somMToken;
	somtGetNextData: somMToken;
	somtGetFirstMethod: somMToken;
	somtGetNextMethod: somMToken;
	somtGetFirstInheritedMethod: somMToken;
	somtGetNextInheritedMethod: somMToken;
	somtFilterNew: somMToken;
	somtFilterOverridden: somMToken;
	somtFilterPrivOrPub: somMToken;
	_get_somtMetaclassFor: somMToken;
	_get_somtForwardRef: somMToken;
	somtGetFirstAttribute: somMToken;
	somtGetNextAttribute: somMToken;
	somtGetFirstStruct: somMToken;
	somtGetNextStruct: somMToken;
	somtGetFirstTypedef: somMToken;
	somtGetNextTypedef: somMToken;
	somtGetFirstUnion: somMToken;
	somtGetNextUnion: somMToken;
	somtGetFirstEnum: somMToken;
	somtGetNextEnum: somMToken;
	somtGetFirstConstant: somMToken;
	somtGetNextConstant: somMToken;
	somtGetFirstSequence: somMToken;
	somtGetNextSequence: somMToken;
	_get_somtClassModule: somMToken;
	somtGetFirstPubdef: somMToken;
	somtGetNextPubdef: somMToken;
	somtGetFirstStaticData: somMToken;
	somtGetNextStaticData: somMToken;
end;
PSOMTClassEntryCClassDataStructure = ^SOMTClassEntryCClassDataStructure;
function SOMTClassEntryCClassData: PSOMTClassEntryCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTClassEntryCCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMTClassEntryCCClassDataStructure = ^SOMTClassEntryCCClassDataStructure;
function SOMTClassEntryCCClassData: PSOMTClassEntryCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTClassEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTClassEntryC
 *)
function SOMTClassEntryCNew: SOMTClassEntryC;
function SOMTClassEntryCRenew(buf: Pointer): SOMTClassEntryC;

(*
 * New Method: _get_somtSourceFileName
 *)
type
  somTP_SOMTClassEntryC__get_somtSourceFileName = function(somSelf: SOMTClassEntryC): CORBAString; stdcall;
  somTD_SOMTClassEntryC__get_somtSourceFileName = somTP_SOMTClassEntryC__get_somtSourceFileName;
(*
 *  Returns the name of file containing the definition of this class.
 *)
const somMD_SOMTClassEntryC__get_somtSourceFileName = '::SOMTClassEntryC::_get_somtSourceFileName';
function SOMTClassEntryC__get_somtSourceFileName(somSelf: SOMTClassEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtMetaClassEntry
 *)
type
  somTP_SOMTClassEntryC__get_somtMetaClassEntry = function(somSelf: SOMTClassEntryC): SOMTMetaClassEntryC; stdcall;
  somTD_SOMTClassEntryC__get_somtMetaClassEntry = somTP_SOMTClassEntryC__get_somtMetaClassEntry;
(*
 *  Returns the entry for the meta class statement in class
 *  definition or NULL if there is no meta class statement.
 *  Note: the SOM architecture requires that all classes have a meta
 *  class, however <SOMClass> is its own metaclass. Thus, any attempt
 *  to walk up the metaclass chain must terminate when it finds a
 *  class that is its own meta class, otherwise an infinite loop is
 *  possible.
 *)
const somMD_SOMTClassEntryC__get_somtMetaClassEntry = '::SOMTClassEntryC::_get_somtMetaClassEntry';
function SOMTClassEntryC__get_somtMetaClassEntry(somSelf: SOMTClassEntryC): SOMTMetaClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtClassModule
 *)
type
  somTP_SOMTClassEntryC__get_somtClassModule = function(somSelf: SOMTClassEntryC): SOMTModuleEntryC; stdcall;
  somTD_SOMTClassEntryC__get_somtClassModule = somTP_SOMTClassEntryC__get_somtClassModule;
(*
 *  The module that contains this class, or NULL if there is not one.
 *)
const somMD_SOMTClassEntryC__get_somtClassModule = '::SOMTClassEntryC::_get_somtClassModule';
function SOMTClassEntryC__get_somtClassModule(somSelf: SOMTClassEntryC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtNewMethodCount
 *)
type
  somTP_SOMTClassEntryC__get_somtNewMethodCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtNewMethodCount = somTP_SOMTClassEntryC__get_somtNewMethodCount;
(*
 *  Returns the number of new methods introduced in this class
 *  definition.
 *)
const somMD_SOMTClassEntryC__get_somtNewMethodCount = '::SOMTClassEntryC::_get_somtNewMethodCount';
function SOMTClassEntryC__get_somtNewMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtLocalInclude
 *)
type
  somTP_SOMTClassEntryC__get_somtLocalInclude = function(somSelf: SOMTClassEntryC): CORBABoolean; stdcall;
  somTD_SOMTClassEntryC__get_somtLocalInclude = somTP_SOMTClassEntryC__get_somtLocalInclude;
(*
 *  Returns true if the header files associated with this class
 *  definition should be included using local search, eg, "name.h"
 *  instead of <name.h>
 *)
const somMD_SOMTClassEntryC__get_somtLocalInclude = '::SOMTClassEntryC::_get_somtLocalInclude';
function SOMTClassEntryC__get_somtLocalInclude(somSelf: SOMTClassEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtPrivateMethodCount
 *)
type
  somTP_SOMTClassEntryC__get_somtPrivateMethodCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtPrivateMethodCount = somTP_SOMTClassEntryC__get_somtPrivateMethodCount;
(*
 *  Returns number of new private methods in class.
 *)
const somMD_SOMTClassEntryC__get_somtPrivateMethodCount = '::SOMTClassEntryC::_get_somtPrivateMethodCount';
function SOMTClassEntryC__get_somtPrivateMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtStaticMethodCount
 *)
type
  somTP_SOMTClassEntryC__get_somtStaticMethodCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtStaticMethodCount = somTP_SOMTClassEntryC__get_somtStaticMethodCount;
(*
 *  Returns number of new static methods in class.
 *)
const somMD_SOMTClassEntryC__get_somtStaticMethodCount = '::SOMTClassEntryC::_get_somtStaticMethodCount';
function SOMTClassEntryC__get_somtStaticMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtOverrideMethodCount
 *)
type
  somTP_SOMTClassEntryC__get_somtOverrideMethodCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtOverrideMethodCount = somTP_SOMTClassEntryC__get_somtOverrideMethodCount;
(*
 *  Returns number of new override methods in class.
 *)
const somMD_SOMTClassEntryC__get_somtOverrideMethodCount = '::SOMTClassEntryC::_get_somtOverrideMethodCount';
function SOMTClassEntryC__get_somtOverrideMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtProcMethodCount
 *)
type
  somTP_SOMTClassEntryC__get_somtProcMethodCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtProcMethodCount = somTP_SOMTClassEntryC__get_somtProcMethodCount;
(*
 *  Returns number of procedure methods for class.
 *)
const somMD_SOMTClassEntryC__get_somtProcMethodCount = '::SOMTClassEntryC::_get_somtProcMethodCount';
function SOMTClassEntryC__get_somtProcMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtVAMethodCount
 *)
type
  somTP_SOMTClassEntryC__get_somtVAMethodCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtVAMethodCount = somTP_SOMTClassEntryC__get_somtVAMethodCount;
(*
 *  Returns number of VarArg methods for class.
 *)
const somMD_SOMTClassEntryC__get_somtVAMethodCount = '::SOMTClassEntryC::_get_somtVAMethodCount';
function SOMTClassEntryC__get_somtVAMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtBaseCount
 *)
type
  somTP_SOMTClassEntryC__get_somtBaseCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtBaseCount = somTP_SOMTClassEntryC__get_somtBaseCount;
(*
 *  Returns number of base classes for class.
 *)
const somMD_SOMTClassEntryC__get_somtBaseCount = '::SOMTClassEntryC::_get_somtBaseCount';
function SOMTClassEntryC__get_somtBaseCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtExternalDataCount
 *)
type
  somTP_SOMTClassEntryC__get_somtExternalDataCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtExternalDataCount = somTP_SOMTClassEntryC__get_somtExternalDataCount;
(*
 *  Returns number of external (public or private) data members for class.
 *)
const somMD_SOMTClassEntryC__get_somtExternalDataCount = '::SOMTClassEntryC::_get_somtExternalDataCount';
function SOMTClassEntryC__get_somtExternalDataCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtPublicDataCount
 *)
type
  somTP_SOMTClassEntryC__get_somtPublicDataCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtPublicDataCount = somTP_SOMTClassEntryC__get_somtPublicDataCount;
(*
 *  Returns number of public data members for class.
 *)
const somMD_SOMTClassEntryC__get_somtPublicDataCount = '::SOMTClassEntryC::_get_somtPublicDataCount';
function SOMTClassEntryC__get_somtPublicDataCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtPrivateDataCount
 *)
type
  somTP_SOMTClassEntryC__get_somtPrivateDataCount = function(somSelf: SOMTClassEntryC): LongInt; stdcall;
  somTD_SOMTClassEntryC__get_somtPrivateDataCount = somTP_SOMTClassEntryC__get_somtPrivateDataCount;
(*
 *  Returns number of private data members for class.
 *)
const somMD_SOMTClassEntryC__get_somtPrivateDataCount = '::SOMTClassEntryC::_get_somtPrivateDataCount';
function SOMTClassEntryC__get_somtPrivateDataCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtMetaclassFor
 *)
type
  somTP_SOMTClassEntryC__get_somtMetaclassFor = function(somSelf: SOMTClassEntryC): SOMTClassEntryC; stdcall;
  somTD_SOMTClassEntryC__get_somtMetaclassFor = somTP_SOMTClassEntryC__get_somtMetaclassFor;
(*
 *  If this is a metaclass, the class for which it is a metaclass, else NULL.
 *)
const somMD_SOMTClassEntryC__get_somtMetaclassFor = '::SOMTClassEntryC::_get_somtMetaclassFor';
function SOMTClassEntryC__get_somtMetaclassFor(somSelf: SOMTClassEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtForwardRef
 *)
type
  somTP_SOMTClassEntryC__get_somtForwardRef = function(somSelf: SOMTClassEntryC): CORBABoolean; stdcall;
  somTD_SOMTClassEntryC__get_somtForwardRef = somTP_SOMTClassEntryC__get_somtForwardRef;
(*
 *  Whether this is a forward reference or not.
 *)
const somMD_SOMTClassEntryC__get_somtForwardRef = '::SOMTClassEntryC::_get_somtForwardRef';
function SOMTClassEntryC__get_somtForwardRef(somSelf: SOMTClassEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstBaseClass
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstBaseClass = function(somSelf: SOMTClassEntryC): SOMTBaseClassEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstBaseClass = somTP_SOMTClassEntryC_somtGetFirstBaseClass;
(*
 *  Returns the entry for the "left most" direct base class form for
 *  this class, if it has one and NULL otherwise.  Note: <SOMObject>
 *  does not have any base classes and therefore will terminate an
 *  attempt to walk up the base class chain.
 *)
const somMD_SOMTClassEntryC_somtGetFirstBaseClass = '::SOMTClassEntryC::somtGetFirstBaseClass';
function SOMTClassEntryC_somtGetFirstBaseClass(somSelf: SOMTClassEntryC): SOMTBaseClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextBaseClass
 *)
type
  somTP_SOMTClassEntryC_somtGetNextBaseClass = function(somSelf: SOMTClassEntryC): SOMTBaseClassEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextBaseClass = somTP_SOMTClassEntryC_somtGetNextBaseClass;
(*
 *  Returns the entry for the next direct base class form of this
 *  class, if it has one and NULL otherwise.  The direct base classes
 *  of a derived class are ordered from "left to right".
 *)
const somMD_SOMTClassEntryC_somtGetNextBaseClass = '::SOMTClassEntryC::somtGetNextBaseClass';
function SOMTClassEntryC_somtGetNextBaseClass(somSelf: SOMTClassEntryC): SOMTBaseClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstReleaseName
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstReleaseName = function(somSelf: SOMTClassEntryC): CORBAString; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstReleaseName = somTP_SOMTClassEntryC_somtGetFirstReleaseName;
(*
 *  Returns the first name in the release order statement for this
 *  entry if it has one and NULL otherwise.
 *)
const somMD_SOMTClassEntryC_somtGetFirstReleaseName = '::SOMTClassEntryC::somtGetFirstReleaseName';
function SOMTClassEntryC_somtGetFirstReleaseName(somSelf: SOMTClassEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextReleaseName
 *)
type
  somTP_SOMTClassEntryC_somtGetNextReleaseName = function(somSelf: SOMTClassEntryC): CORBAString; stdcall;
  somTD_SOMTClassEntryC_somtGetNextReleaseName = somTP_SOMTClassEntryC_somtGetNextReleaseName;
(*
 *  Returns the next name in the release order statement for this
 *  entry if it has one and NULL otherwise.
 *)
const somMD_SOMTClassEntryC_somtGetNextReleaseName = '::SOMTClassEntryC::somtGetNextReleaseName';
function SOMTClassEntryC_somtGetNextReleaseName(somSelf: SOMTClassEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetReleaseNameList
 *)
type
  somTP_SOMTClassEntryC_somtGetReleaseNameList = function(somSelf: SOMTClassEntryC;
		buffer: CORBAString): LongInt; stdcall;
  somTD_SOMTClassEntryC_somtGetReleaseNameList = somTP_SOMTClassEntryC_somtGetReleaseNameList;
(*
 *  Puts all the release names in <buffer> in template output form,
 *  buffer must be large enough, no tests are made.  The number of
 *  release names is returned.
 *)
const somMD_SOMTClassEntryC_somtGetReleaseNameList = '::SOMTClassEntryC::somtGetReleaseNameList';
function SOMTClassEntryC_somtGetReleaseNameList(somSelf: SOMTClassEntryC;
  buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstPassthru
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstPassthru = function(somSelf: SOMTClassEntryC): SOMTPassthruEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstPassthru = somTP_SOMTClassEntryC_somtGetFirstPassthru;
(*
 *  Returns the first passthru entry for this class definition if it
 *  has one and NULL otherwise.
 *)
const somMD_SOMTClassEntryC_somtGetFirstPassthru = '::SOMTClassEntryC::somtGetFirstPassthru';
function SOMTClassEntryC_somtGetFirstPassthru(somSelf: SOMTClassEntryC): SOMTPassthruEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextPassthru
 *)
type
  somTP_SOMTClassEntryC_somtGetNextPassthru = function(somSelf: SOMTClassEntryC): SOMTPassthruEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextPassthru = somTP_SOMTClassEntryC_somtGetNextPassthru;
(*
 *  Returns the next passthru entry for this class definition if it
 *  has one and NULL otherwise.  The passthru entry will be returned
 *  in an order based on the appearence of passthru statements in the
 *  class definition.
 *)
const somMD_SOMTClassEntryC_somtGetNextPassthru = '::SOMTClassEntryC::somtGetNextPassthru';
function SOMTClassEntryC_somtGetNextPassthru(somSelf: SOMTClassEntryC): SOMTPassthruEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstData
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstData = function(somSelf: SOMTClassEntryC): SOMTDataEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstData = somTP_SOMTClassEntryC_somtGetFirstData;
(*
 *  Returns the first data entry for this class definition if it has
 *  one and NULL otherwise.
 *)
const somMD_SOMTClassEntryC_somtGetFirstData = '::SOMTClassEntryC::somtGetFirstData';
function SOMTClassEntryC_somtGetFirstData(somSelf: SOMTClassEntryC): SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextData
 *)
type
  somTP_SOMTClassEntryC_somtGetNextData = function(somSelf: SOMTClassEntryC): SOMTDataEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextData = somTP_SOMTClassEntryC_somtGetNextData;
(*
 *  Returns the next data entry for this class definition if it has
 *  one and NULL otherwise.  The data entries will be returned in an
 *  order based on the appearence data member declarations in the
 *  class definition.
 *)
const somMD_SOMTClassEntryC_somtGetNextData = '::SOMTClassEntryC::somtGetNextData';
function SOMTClassEntryC_somtGetNextData(somSelf: SOMTClassEntryC): SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstStaticData
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstStaticData = function(somSelf: SOMTClassEntryC): SOMTDataEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstStaticData = somTP_SOMTClassEntryC_somtGetFirstStaticData;
(*
 *  Returns the first static data entry for this class definition if it has
 *  one and NULL otherwise. Static data is handled specialy in SOM so a
 *  different accessor method is provided.
 *)
const somMD_SOMTClassEntryC_somtGetFirstStaticData = '::SOMTClassEntryC::somtGetFirstStaticData';
function SOMTClassEntryC_somtGetFirstStaticData(somSelf: SOMTClassEntryC): SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextStaticData
 *)
type
  somTP_SOMTClassEntryC_somtGetNextStaticData = function(somSelf: SOMTClassEntryC): SOMTDataEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextStaticData = somTP_SOMTClassEntryC_somtGetNextStaticData;
(*
 *  Returns the next static data entry for this class definition if it has
 *  one and NULL otherwise.  The data entries will be returned in an
 *  order based on the release order
 *)
const somMD_SOMTClassEntryC_somtGetNextStaticData = '::SOMTClassEntryC::somtGetNextStaticData';
function SOMTClassEntryC_somtGetNextStaticData(somSelf: SOMTClassEntryC): SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstMethod
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstMethod = function(somSelf: SOMTClassEntryC): SOMTMethodEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstMethod = somTP_SOMTClassEntryC_somtGetFirstMethod;
(*
 *  Returns the first method entry for this class definition if it
 *  has one and NULL otherwise.  Method entries may be for new or
 *  overridden methods.
 *)
const somMD_SOMTClassEntryC_somtGetFirstMethod = '::SOMTClassEntryC::somtGetFirstMethod';
function SOMTClassEntryC_somtGetFirstMethod(somSelf: SOMTClassEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextMethod
 *)
type
  somTP_SOMTClassEntryC_somtGetNextMethod = function(somSelf: SOMTClassEntryC): SOMTMethodEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextMethod = somTP_SOMTClassEntryC_somtGetNextMethod;
(*
 *  Returns the next method entry for this class definition if it has
 *  one and NULL otherwise.  The method entries will be returned in an
 *  order based on the appearence method declarations in the
 *  class definition.  Method entries may be for new or overridden methods.
 *)
const somMD_SOMTClassEntryC_somtGetNextMethod = '::SOMTClassEntryC::somtGetNextMethod';
function SOMTClassEntryC_somtGetNextMethod(somSelf: SOMTClassEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstInheritedMethod
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstInheritedMethod = function(somSelf: SOMTClassEntryC): SOMTMethodEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstInheritedMethod = somTP_SOMTClassEntryC_somtGetFirstInheritedMethod;
(*
 *  Returns the first inherited and not overridden method entry for
 *  this class definition if it has one and NULL otherwise.
 *)
const somMD_SOMTClassEntryC_somtGetFirstInheritedMethod = '::SOMTClassEntryC::somtGetFirstInheritedMethod';
function SOMTClassEntryC_somtGetFirstInheritedMethod(somSelf: SOMTClassEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextInheritedMethod
 *)
type
  somTP_SOMTClassEntryC_somtGetNextInheritedMethod = function(somSelf: SOMTClassEntryC): SOMTMethodEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextInheritedMethod = somTP_SOMTClassEntryC_somtGetNextInheritedMethod;
(*
 *  Returns the next inherited and not overridden method entry for
 *  this class definition if it has one and NULL otherwise.  The
 *  method entries will be returned in an unspecified, but constant
 *  order.
 *)
const somMD_SOMTClassEntryC_somtGetNextInheritedMethod = '::SOMTClassEntryC::somtGetNextInheritedMethod';
function SOMTClassEntryC_somtGetNextInheritedMethod(somSelf: SOMTClassEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstAttribute
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstAttribute = function(somSelf: SOMTClassEntryC): SOMTAttributeEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstAttribute = somTP_SOMTClassEntryC_somtGetFirstAttribute;
const somMD_SOMTClassEntryC_somtGetFirstAttribute = '::SOMTClassEntryC::somtGetFirstAttribute';
function SOMTClassEntryC_somtGetFirstAttribute(somSelf: SOMTClassEntryC): SOMTAttributeEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextAttribute
 *)
type
  somTP_SOMTClassEntryC_somtGetNextAttribute = function(somSelf: SOMTClassEntryC): SOMTAttributeEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextAttribute = somTP_SOMTClassEntryC_somtGetNextAttribute;
const somMD_SOMTClassEntryC_somtGetNextAttribute = '::SOMTClassEntryC::somtGetNextAttribute';
function SOMTClassEntryC_somtGetNextAttribute(somSelf: SOMTClassEntryC): SOMTAttributeEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstStruct
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstStruct = function(somSelf: SOMTClassEntryC): SOMTStructEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstStruct = somTP_SOMTClassEntryC_somtGetFirstStruct;
const somMD_SOMTClassEntryC_somtGetFirstStruct = '::SOMTClassEntryC::somtGetFirstStruct';
function SOMTClassEntryC_somtGetFirstStruct(somSelf: SOMTClassEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextStruct
 *)
type
  somTP_SOMTClassEntryC_somtGetNextStruct = function(somSelf: SOMTClassEntryC): SOMTStructEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextStruct = somTP_SOMTClassEntryC_somtGetNextStruct;
const somMD_SOMTClassEntryC_somtGetNextStruct = '::SOMTClassEntryC::somtGetNextStruct';
function SOMTClassEntryC_somtGetNextStruct(somSelf: SOMTClassEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstTypedef
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstTypedef = function(somSelf: SOMTClassEntryC): SOMTTypedefEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstTypedef = somTP_SOMTClassEntryC_somtGetFirstTypedef;
const somMD_SOMTClassEntryC_somtGetFirstTypedef = '::SOMTClassEntryC::somtGetFirstTypedef';
function SOMTClassEntryC_somtGetFirstTypedef(somSelf: SOMTClassEntryC): SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextTypedef
 *)
type
  somTP_SOMTClassEntryC_somtGetNextTypedef = function(somSelf: SOMTClassEntryC): SOMTTypedefEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextTypedef = somTP_SOMTClassEntryC_somtGetNextTypedef;
const somMD_SOMTClassEntryC_somtGetNextTypedef = '::SOMTClassEntryC::somtGetNextTypedef';
function SOMTClassEntryC_somtGetNextTypedef(somSelf: SOMTClassEntryC): SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstUnion
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstUnion = function(somSelf: SOMTClassEntryC): SOMTUnionEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstUnion = somTP_SOMTClassEntryC_somtGetFirstUnion;
const somMD_SOMTClassEntryC_somtGetFirstUnion = '::SOMTClassEntryC::somtGetFirstUnion';
function SOMTClassEntryC_somtGetFirstUnion(somSelf: SOMTClassEntryC): SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextUnion
 *)
type
  somTP_SOMTClassEntryC_somtGetNextUnion = function(somSelf: SOMTClassEntryC): SOMTUnionEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextUnion = somTP_SOMTClassEntryC_somtGetNextUnion;
const somMD_SOMTClassEntryC_somtGetNextUnion = '::SOMTClassEntryC::somtGetNextUnion';
function SOMTClassEntryC_somtGetNextUnion(somSelf: SOMTClassEntryC): SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstEnum
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstEnum = function(somSelf: SOMTClassEntryC): SOMTEnumEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstEnum = somTP_SOMTClassEntryC_somtGetFirstEnum;
const somMD_SOMTClassEntryC_somtGetFirstEnum = '::SOMTClassEntryC::somtGetFirstEnum';
function SOMTClassEntryC_somtGetFirstEnum(somSelf: SOMTClassEntryC): SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextEnum
 *)
type
  somTP_SOMTClassEntryC_somtGetNextEnum = function(somSelf: SOMTClassEntryC): SOMTEnumEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextEnum = somTP_SOMTClassEntryC_somtGetNextEnum;
const somMD_SOMTClassEntryC_somtGetNextEnum = '::SOMTClassEntryC::somtGetNextEnum';
function SOMTClassEntryC_somtGetNextEnum(somSelf: SOMTClassEntryC): SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstConstant
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstConstant = function(somSelf: SOMTClassEntryC): SOMTConstEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstConstant = somTP_SOMTClassEntryC_somtGetFirstConstant;
const somMD_SOMTClassEntryC_somtGetFirstConstant = '::SOMTClassEntryC::somtGetFirstConstant';
function SOMTClassEntryC_somtGetFirstConstant(somSelf: SOMTClassEntryC): SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextConstant
 *)
type
  somTP_SOMTClassEntryC_somtGetNextConstant = function(somSelf: SOMTClassEntryC): SOMTConstEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextConstant = somTP_SOMTClassEntryC_somtGetNextConstant;
const somMD_SOMTClassEntryC_somtGetNextConstant = '::SOMTClassEntryC::somtGetNextConstant';
function SOMTClassEntryC_somtGetNextConstant(somSelf: SOMTClassEntryC): SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstSequence
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstSequence = function(somSelf: SOMTClassEntryC): SOMTSequenceEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstSequence = somTP_SOMTClassEntryC_somtGetFirstSequence;
const somMD_SOMTClassEntryC_somtGetFirstSequence = '::SOMTClassEntryC::somtGetFirstSequence';
function SOMTClassEntryC_somtGetFirstSequence(somSelf: SOMTClassEntryC): SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextSequence
 *)
type
  somTP_SOMTClassEntryC_somtGetNextSequence = function(somSelf: SOMTClassEntryC): SOMTSequenceEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextSequence = somTP_SOMTClassEntryC_somtGetNextSequence;
const somMD_SOMTClassEntryC_somtGetNextSequence = '::SOMTClassEntryC::somtGetNextSequence';
function SOMTClassEntryC_somtGetNextSequence(somSelf: SOMTClassEntryC): SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstPubdef
 *)
type
  somTP_SOMTClassEntryC_somtGetFirstPubdef = function(somSelf: SOMTClassEntryC): SOMTEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetFirstPubdef = somTP_SOMTClassEntryC_somtGetFirstPubdef;
const somMD_SOMTClassEntryC_somtGetFirstPubdef = '::SOMTClassEntryC::somtGetFirstPubdef';
function SOMTClassEntryC_somtGetFirstPubdef(somSelf: SOMTClassEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextPubdef
 *)
type
  somTP_SOMTClassEntryC_somtGetNextPubdef = function(somSelf: SOMTClassEntryC): SOMTEntryC; stdcall;
  somTD_SOMTClassEntryC_somtGetNextPubdef = somTP_SOMTClassEntryC_somtGetNextPubdef;
const somMD_SOMTClassEntryC_somtGetNextPubdef = '::SOMTClassEntryC::somtGetNextPubdef';
function SOMTClassEntryC_somtGetNextPubdef(somSelf: SOMTClassEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtFilterNew
 *)
type
  somTP_SOMTClassEntryC_somtFilterNew = function(somSelf: SOMTClassEntryC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTClassEntryC_somtFilterNew = somTP_SOMTClassEntryC_somtFilterNew;
(*
 *  Returns 1 if entry is new in the class.
 *)
const somMD_SOMTClassEntryC_somtFilterNew = '::SOMTClassEntryC::somtFilterNew';
function SOMTClassEntryC_somtFilterNew(somSelf: SOMTClassEntryC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtFilterOverridden
 *)
type
  somTP_SOMTClassEntryC_somtFilterOverridden = function(somSelf: SOMTClassEntryC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTClassEntryC_somtFilterOverridden = somTP_SOMTClassEntryC_somtFilterOverridden;
(*
 *  Returns 1 if entry is an overriding method of the class.
 *)
const somMD_SOMTClassEntryC_somtFilterOverridden = '::SOMTClassEntryC::somtFilterOverridden';
function SOMTClassEntryC_somtFilterOverridden(somSelf: SOMTClassEntryC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtFilterPrivOrPub
 *)
type
  somTP_SOMTClassEntryC_somtFilterPrivOrPub = function(somSelf: SOMTClassEntryC;
		entry: SOMTCommonEntryC): CORBABoolean; stdcall;
  somTD_SOMTClassEntryC_somtFilterPrivOrPub = somTP_SOMTClassEntryC_somtFilterPrivOrPub;
(*
 *  Returns TRUE if entry is Private or Public.
 *)
const somMD_SOMTClassEntryC_somtFilterPrivOrPub = '::SOMTClassEntryC::somtFilterPrivOrPub';
function SOMTClassEntryC_somtFilterPrivOrPub(somSelf: SOMTClassEntryC;
  entry: SOMTCommonEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <scmeta.h>

(*
 * Define the class name as an object type
 *)
// type
//   SOMTMetaClassEntryC = SOMTEntryC;

const
  SOMTMetaClassEntryC_MajorVersion = 2;
  SOMTMetaClassEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTMetaClassEntryCNewClass(
  somtmajorVersion: integer4 = SOMTMetaClassEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTMetaClassEntryC_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTMetaClassEntryCClassDataStructure = record
	classObject: SOMClass;
	_get_somtMetaFile: somMToken;
	_get_somtMetaClassDef: somMToken;
end;
PSOMTMetaClassEntryCClassDataStructure = ^SOMTMetaClassEntryCClassDataStructure;
function SOMTMetaClassEntryCClassData: PSOMTMetaClassEntryCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTMetaClassEntryCCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMTMetaClassEntryCCClassDataStructure = ^SOMTMetaClassEntryCCClassDataStructure;
function SOMTMetaClassEntryCCClassData: PSOMTMetaClassEntryCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTMetaClassEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTMetaClassEntryC
 *)
function SOMTMetaClassEntryCNew: SOMTMetaClassEntryC;
function SOMTMetaClassEntryCRenew(buf: Pointer): SOMTMetaClassEntryC;

(*
 * New Method: _get_somtMetaFile
 *)
type
  somTP_SOMTMetaClassEntryC__get_somtMetaFile = function(somSelf: SOMTMetaClassEntryC): CORBAString; stdcall;
  somTD_SOMTMetaClassEntryC__get_somtMetaFile = somTP_SOMTMetaClassEntryC__get_somtMetaFile;
(*
 *  Returns the name of the file containing the definition of the
 *  meta class named in this entry.
 *)
const somMD_SOMTMetaClassEntryC__get_somtMetaFile = '::SOMTMetaClassEntryC::_get_somtMetaFile';
function SOMTMetaClassEntryC__get_somtMetaFile(somSelf: SOMTMetaClassEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtMetaClassDef
 *)
type
  somTP_SOMTMetaClassEntryC__get_somtMetaClassDef = function(somSelf: SOMTMetaClassEntryC): SOMTClassEntryC; stdcall;
  somTD_SOMTMetaClassEntryC__get_somtMetaClassDef = somTP_SOMTMetaClassEntryC__get_somtMetaClassDef;
(*
 *  Returns the class definition entry for the meta class named in
 *  this entry.
 *)
const somMD_SOMTMetaClassEntryC__get_somtMetaClassDef = '::SOMTMetaClassEntryC::_get_somtMetaClassDef';
function SOMTMetaClassEntryC__get_somtMetaClassDef(somSelf: SOMTMetaClassEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <sccommon.h>

(*
 * Passthru lines: File: "C.h", "before"
 *)
type
  somtVisibilityT = type LongWord;
const
  somtInternalVE = somtVisibilityT(0);
  somtPublicVE = somtVisibilityT(1);
  somtPrivateVE = somtVisibilityT(2);

(*
 * Define the class name as an object type
 *)
// type
//   SOMTCommonEntryC = SOMTEntryC;
(*
 *  This class defines a number of methods and attributes that are
 *  common to <SOMTMethodEntry>, <SOMTDataEntry>, and
 *  <SOMTParameterEntry>.  No entries of this type will actually
 *  be found in the entry graph, instead they will all be one of
 *  the types mentioned above.
 *  Exception: entries whose somtElementType is SOMTTypedefBE, which
 *  represent a reference to a user-defined type, are instance of this class.
 *)

const
  SOMTCommonEntryC_MajorVersion = 2;
  SOMTCommonEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTCommonEntryCNewClass(
  somtmajorVersion: integer4 = SOMTCommonEntryC_MajorVersion;
	somtminorVersion: integer4 = SOMTCommonEntryC_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTCommonEntryCClassDataStructure = record
	classObject: SOMClass;
	_get_somtSourceText: somMToken;
	_get_somtType: somMToken;
	_get_somtVisibility: somMToken;
	somtIsArray: somMToken;
	somtIsPointer: somMToken;
	somtIsArrayDominant: somMToken;
	_get_somtTypeObj: somMToken;
	_get_somtPtrs: somMToken;
	_get_somtArrayDimsString: somMToken;
	somtGetFirstArrayDimension: somMToken;
	somtGetNextArrayDimension: somMToken;
end;
PSOMTCommonEntryCClassDataStructure = ^SOMTCommonEntryCClassDataStructure;
function SOMTCommonEntryCClassData: PSOMTCommonEntryCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTCommonEntryCCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMTCommonEntryCCClassDataStructure = ^SOMTCommonEntryCCClassDataStructure;
function SOMTCommonEntryCCClassData: PSOMTCommonEntryCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTCommonEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTCommonEntryC
 *)
function SOMTCommonEntryCNew: SOMTCommonEntryC;
function SOMTCommonEntryCRenew(buf: Pointer): SOMTCommonEntryC;

(*
 * New Method: _get_somtTypeObj
 *)
type
   somTP_SOMTCommonEntryC__get_somtTypeObj = function(somSelf: SOMTCommonEntryC): SOMTEntryC; stdcall;
   somTD_SOMTCommonEntryC__get_somtTypeObj = somTP_SOMTCommonEntryC__get_somtTypeObj;
(*
 *  The object representing the base type of the entry.
 *  This does not include pointer stars or array declarators.
 *)
const somMD_SOMTCommonEntryC__get_somtTypeObj = '::SOMTCommonEntryC::_get_somtTypeObj';
function SOMTCommonEntryC__get_somtTypeObj(somSelf: SOMTCommonEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtPtrs
 *)
type
  somTP_SOMTCommonEntryC__get_somtPtrs = function(somSelf: SOMTCommonEntryC): CORBAString; stdcall;
  somTD_SOMTCommonEntryC__get_somtPtrs = somTP_SOMTCommonEntryC__get_somtPtrs;
(*
 *  The string of stars associated with the entry's type.
 *  For example, an object of type "foo" would have somtPtrs = NULL,
 *  type "foo *" would have somtPtrs = "*", type
 *  "foo **" would have somtPtrs = "**", etc.
 *)
const somMD_SOMTCommonEntryC__get_somtPtrs = '::SOMTCommonEntryC::_get_somtPtrs';
function SOMTCommonEntryC__get_somtPtrs(somSelf: SOMTCommonEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtArrayDimsString
 *)
type
  somTP_SOMTCommonEntryC__get_somtArrayDimsString = function(somSelf: SOMTCommonEntryC): CORBAString; stdcall;
  somTD_SOMTCommonEntryC__get_somtArrayDimsString = somTP_SOMTCommonEntryC__get_somtArrayDimsString;
(*
 *  Array dimensions in string form.
 *)
const somMD_SOMTCommonEntryC__get_somtArrayDimsString = '::SOMTCommonEntryC::_get_somtArrayDimsString';
function SOMTCommonEntryC__get_somtArrayDimsString(somSelf: SOMTCommonEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstArrayDimension
 *)
type
  somTP_SOMTCommonEntryC_somtGetFirstArrayDimension = function(somSelf: SOMTCommonEntryC): LongWord; stdcall;
  somTD_SOMTCommonEntryC_somtGetFirstArrayDimension = somTP_SOMTCommonEntryC_somtGetFirstArrayDimension;
(*
 *  The first array dimension, for items of type array.
 *  Zero indicates that the item is not an array.
 *)
const somMD_SOMTCommonEntryC_somtGetFirstArrayDimension = '::SOMTCommonEntryC::somtGetFirstArrayDimension';
function SOMTCommonEntryC_somtGetFirstArrayDimension(somSelf: SOMTCommonEntryC): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextArrayDimension
 *)
type
  somTP_SOMTCommonEntryC_somtGetNextArrayDimension = function(somSelf: SOMTCommonEntryC): LongWord; stdcall;
  somTD_SOMTCommonEntryC_somtGetNextArrayDimension = somTP_SOMTCommonEntryC_somtGetNextArrayDimension;
(*
 *  The next array dimension, for items of type array,
 *  relative to the previous call to this method or to
 *  somtGetFirstArrayDimension.  Zero indicates no more dimensions.
 *)
const somMD_SOMTCommonEntryC_somtGetNextArrayDimension = '::SOMTCommonEntryC::somtGetNextArrayDimension';
function SOMTCommonEntryC_somtGetNextArrayDimension(somSelf: SOMTCommonEntryC): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtSourceText
 *)
type
  somTP_SOMTCommonEntryC__get_somtSourceText = function(somSelf: SOMTCommonEntryC): CORBAString; stdcall;
  somTD_SOMTCommonEntryC__get_somtSourceText = somTP_SOMTCommonEntryC__get_somtSourceText;
(*
 *  The un-parsed source text for this entry, with leading and
 *  trailing white space removed.  For attribute/typedef declarators
 *  and for user-defined types, this attribute only provides the
 *  source text for the entry's name.  For methods, arguments,
 *  and instance variables, however, this attribute provides the
 *  full definition.
 *)
const somMD_SOMTCommonEntryC__get_somtSourceText = '::SOMTCommonEntryC::_get_somtSourceText';
function SOMTCommonEntryC__get_somtSourceText(somSelf: SOMTCommonEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtType
 *)
type
  somTP_SOMTCommonEntryC__get_somtType = function(somSelf: SOMTCommonEntryC): CORBAString; stdcall;
  somTD_SOMTCommonEntryC__get_somtType = somTP_SOMTCommonEntryC__get_somtType;
(*
 *  The IDL type for this entry in string form. For methods this is the
 *  return type.  For data or parameters this is the type of the data
 *  item or parameter. For user-defined types, this is the type specification.
 *  It is of the form:   <typename><pointer-stars> <array-declarators>
 *)
const somMD_SOMTCommonEntryC__get_somtType = '::SOMTCommonEntryC::_get_somtType';
function SOMTCommonEntryC__get_somtType(somSelf: SOMTCommonEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtVisibility
 *)
type
  somTP_SOMTCommonEntryC__get_somtVisibility = function(somSelf: SOMTCommonEntryC): somtVisibilityT; stdcall;
  somTD_SOMTCommonEntryC__get_somtVisibility = somTP_SOMTCommonEntryC__get_somtVisibility;
(*
 *  The visibility of this entry.  Note: the visibility of
 *  parameter entries will always be public, and methods can never be
 *  internal.
 *)
const somMD_SOMTCommonEntryC__get_somtVisibility = '::SOMTCommonEntryC::_get_somtVisibility';
function SOMTCommonEntryC__get_somtVisibility(somSelf: SOMTCommonEntryC): somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtIsArray
 *)
type
  somTP_SOMTCommonEntryC_somtIsArray = function(somSelf: SOMTCommonEntryC;
		out size: LongInt): CORBABoolean; stdcall;
  somTD_SOMTCommonEntryC_somtIsArray = somTP_SOMTCommonEntryC_somtIsArray;
(*
 *  Returns 1 (true) if the type involves an array.  When the type
 *  involves an array then <size> is set to be the size of the
 *  array.
 *)
const somMD_SOMTCommonEntryC_somtIsArray = '::SOMTCommonEntryC::somtIsArray';
function SOMTCommonEntryC_somtIsArray(somSelf: SOMTCommonEntryC;
  out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtIsPointer
 *)
type
  somTP_SOMTCommonEntryC_somtIsPointer = function(somSelf: SOMTCommonEntryC): CORBABoolean; stdcall;
  somTD_SOMTCommonEntryC_somtIsPointer = somTP_SOMTCommonEntryC_somtIsPointer;
(*
 *  Returns 1 (true) if the type involves a pointer, and 0 (false)
 *  otherwise
 *)
const somMD_SOMTCommonEntryC_somtIsPointer = '::SOMTCommonEntryC::somtIsPointer';
function SOMTCommonEntryC_somtIsPointer(somSelf: SOMTCommonEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <scmethod.h>

(*
 * Define the class name as an object type
 *)
// type
//   SOMTMethodEntryC = SOMTCommonEntryC;

(*
 * Start of bindings for IDL types
 *)
type
  SOMTParameterEntryC = SOMTCommonEntryC;
(*
 * End of bindings for IDL types.
 *)

const
  SOMTMethodEntryC_MajorVersion = 2;
  SOMTMethodEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTMethodEntryCNewClass(
  somtmajorVersion: integer4 = SOMTMethodEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTMethodEntryC_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTMethodEntryCClassDataStructure = record
	classObject: SOMClass;
	_get_somtIsVarargs: somMToken;
	_get_somtOriginalMethod: somMToken;
	_get_somtOriginalClass: somMToken;
	_get_somtMethodGroup: somMToken;
	somtGetFirstParameter: somMToken;
	somtGetNextParameter: somMToken;
	somtGetArgList: somMToken;
	somtGetParmList: somMToken;
	_get_somtIsPrivateMethod: somMToken;
	_get_somtIsOneway: somMToken;
	_get_somtArgCount: somMToken;
	somtGetFirstException: somMToken;
	somtGetNextException: somMToken;
	_get_somtContextArray: somMToken;
	somtGetShortCPrototype: somMToken;
	somtGetFullCPrototype: somMToken;
	somtGetShortParmList: somMToken;
	somtGetFullParmList: somMToken;
	somtGetNthParameter: somMToken;
	_get_somtCReturnType: somMToken;
	somtGetIDLParamList: somMToken;
	somtGetShortCParamList: somMToken;
	somtGetFullCParamList: somMToken;
	somtGetShortParamNameList: somMToken;
	somtGetFullParamNameList: somMToken;
end;
PSOMTMethodEntryCClassDataStructure = ^SOMTMethodEntryCClassDataStructure;
function SOMTMethodEntryCClassData: PSOMTMethodEntryCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTMethodEntryCCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMTMethodEntryCCClassDataStructure = ^SOMTMethodEntryCCClassDataStructure;
function SOMTMethodEntryCCClassData: PSOMTMethodEntryCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTMethodEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTMethodEntryC
 *)
function SOMTMethodEntryCNew: SOMTMethodEntryC;
function SOMTMethodEntryCRenew(buf: Pointer): SOMTMethodEntryC;

(*
 * New Method: _get_somtIsVarargs
 *)
type
  somTP_SOMTMethodEntryC__get_somtIsVarargs = function(somSelf: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTMethodEntryC__get_somtIsVarargs = somTP_SOMTMethodEntryC__get_somtIsVarargs;
(*
 *  Returns 1 (true) if this method definition has a variable length
 *  parameter list.
 *)
const somMD_SOMTMethodEntryC__get_somtIsVarargs = '::SOMTMethodEntryC::_get_somtIsVarargs';
function SOMTMethodEntryC__get_somtIsVarargs(somSelf: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtOriginalMethod
 *)
type
  somTP_SOMTMethodEntryC__get_somtOriginalMethod = function(somSelf: SOMTMethodEntryC): SOMTMethodEntryC; stdcall;
  somTD_SOMTMethodEntryC__get_somtOriginalMethod = somTP_SOMTMethodEntryC__get_somtOriginalMethod;
(*
 *  If this is an override method definition (<SOMTOverrideMethodE>)
 *  then this is the method definition entry that orginially
 *  introduced the method.
 *)
const somMD_SOMTMethodEntryC__get_somtOriginalMethod = '::SOMTMethodEntryC::_get_somtOriginalMethod';
function SOMTMethodEntryC__get_somtOriginalMethod(somSelf: SOMTMethodEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtOriginalClass
 *)
type
  somTP_SOMTMethodEntryC__get_somtOriginalClass = function(somSelf: SOMTMethodEntryC): SOMTClassEntryC; stdcall;
  somTD_SOMTMethodEntryC__get_somtOriginalClass = somTP_SOMTMethodEntryC__get_somtOriginalClass;
(*
 *  If this is an override method definition (<SOMTOverrideMethodE>)
 *  then this is the class definition entry that orginially
 *  introduced the method.
 *)
const somMD_SOMTMethodEntryC__get_somtOriginalClass = '::SOMTMethodEntryC::_get_somtOriginalClass';
function SOMTMethodEntryC__get_somtOriginalClass(somSelf: SOMTMethodEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtMethodGroup
 *)
type
  somTP_SOMTMethodEntryC__get_somtMethodGroup = function(somSelf: SOMTMethodEntryC): SOMTEntryC; stdcall;
  somTD_SOMTMethodEntryC__get_somtMethodGroup = somTP_SOMTMethodEntryC__get_somtMethodGroup;
(*
 *  The group this method is defined in within a class definition.
 *)
const somMD_SOMTMethodEntryC__get_somtMethodGroup = '::SOMTMethodEntryC::_get_somtMethodGroup';
function SOMTMethodEntryC__get_somtMethodGroup(somSelf: SOMTMethodEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtIsPrivateMethod
 *)
type
  somTP_SOMTMethodEntryC__get_somtIsPrivateMethod = function(somSelf: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTMethodEntryC__get_somtIsPrivateMethod = somTP_SOMTMethodEntryC__get_somtIsPrivateMethod;
(*
 *  Whether or not the method is private.
 *)
const somMD_SOMTMethodEntryC__get_somtIsPrivateMethod = '::SOMTMethodEntryC::_get_somtIsPrivateMethod';
function SOMTMethodEntryC__get_somtIsPrivateMethod(somSelf: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtIsOneway
 *)
type
  somTP_SOMTMethodEntryC__get_somtIsOneway = function(somSelf: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTMethodEntryC__get_somtIsOneway = somTP_SOMTMethodEntryC__get_somtIsOneway;
(*
 *  Whether or not the method is oneway.
 *)
const somMD_SOMTMethodEntryC__get_somtIsOneway = '::SOMTMethodEntryC::_get_somtIsOneway';
function SOMTMethodEntryC__get_somtIsOneway(somSelf: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtArgCount
 *)
type
  somTP_SOMTMethodEntryC__get_somtArgCount = function(somSelf: SOMTMethodEntryC): SmallInt; stdcall;
  somTD_SOMTMethodEntryC__get_somtArgCount = somTP_SOMTMethodEntryC__get_somtArgCount;
(*
 *  The number of arguments for the method.
 *)
const somMD_SOMTMethodEntryC__get_somtArgCount = '::SOMTMethodEntryC::_get_somtArgCount';
function SOMTMethodEntryC__get_somtArgCount(somSelf: SOMTMethodEntryC): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstParameter
 *)
type
  somTP_SOMTMethodEntryC_somtGetFirstParameter = function(somSelf: SOMTMethodEntryC): SOMTParameterEntryC; stdcall;
  somTD_SOMTMethodEntryC_somtGetFirstParameter = somTP_SOMTMethodEntryC_somtGetFirstParameter;
(*
 *  Returns the first formal parameter entry for this method if it
 *  has one and NULL otherwise.  Note: the target object parameter is
 *  not included, therefore the first parameter is really the second
 *  parameter from a SOM runtime perspective.
 *)
const somMD_SOMTMethodEntryC_somtGetFirstParameter = '::SOMTMethodEntryC::somtGetFirstParameter';
function SOMTMethodEntryC_somtGetFirstParameter(somSelf: SOMTMethodEntryC): SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextParameter
 *)
type
  somTP_SOMTMethodEntryC_somtGetNextParameter = function(somSelf: SOMTMethodEntryC): SOMTParameterEntryC; stdcall;
  somTD_SOMTMethodEntryC_somtGetNextParameter = somTP_SOMTMethodEntryC_somtGetNextParameter;
(*
 *  Returns the next formal parameter entry for this method if it has
 *  one and NULL otherwise.
 *)
const somMD_SOMTMethodEntryC_somtGetNextParameter = '::SOMTMethodEntryC::somtGetNextParameter';
function SOMTMethodEntryC_somtGetNextParameter(somSelf: SOMTMethodEntryC): SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetIDLParamList
 *)
type
  somTP_SOMTMethodEntryC_somtGetIDLParamList = function(somSelf: SOMTMethodEntryC;
		buffer: CORBAString): CORBAString; stdcall;
  somTD_SOMTMethodEntryC_somtGetIDLParamList = somTP_SOMTMethodEntryC_somtGetIDLParamList;
(*
 *  Returns the formal parameter list (in IDL syntax) for this method.
 *  The parameter list is built in <buffer> and the address of <buffer>
 *  is returned.
 *  Parameters are delimited with newlines.
 *  The method receiver and any implicit method arguments are NOT included.
 *)
const somMD_SOMTMethodEntryC_somtGetIDLParamList = '::SOMTMethodEntryC::somtGetIDLParamList';
function SOMTMethodEntryC_somtGetIDLParamList(somSelf: SOMTMethodEntryC;
  buffer: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetShortCParamList
 *)
type
  somTP_SOMTMethodEntryC_somtGetShortCParamList = function(somSelf: SOMTMethodEntryC;
		buffer, selfParm, varargsParm: CORBAString): CORBAString; stdcall;
  somTD_SOMTMethodEntryC_somtGetShortCParamList = somTP_SOMTMethodEntryC_somtGetShortCParamList;
(*
 *  Returns the formal parameter list (in ANSI C function prototype
 *  form, with types) for this method. The parameter list is built in
 *  <buffer> and the address of <buffer> is returned.
 *  Parameters are delimited with newlines.
 *  If this method takes a variable number of arguments then the
 *  final parameter substring is replaced by <varargsParm>, unless
 *  <varargsParm> is NULL in which case the final parameter is
 *  removed.
 *  If <selfParm> is not null then it is added as an initial
 *  parameter. (The <selfParm> string may actually contain multiple
 *  parameters, delimited by newline characters.)
 *  The method receiver and any implicit method arguments are NOT
 *  included.
 *  The types of the method parameters are given in C form (with pointer
 *  stars, where needed) rather than in the IDL form.
 *)
const somMD_SOMTMethodEntryC_somtGetShortCParamList = '::SOMTMethodEntryC::somtGetShortCParamList';
function SOMTMethodEntryC_somtGetShortCParamList(somSelf: SOMTMethodEntryC;
  buffer, selfParm, varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFullCParamList
 *)
type
  somTP_SOMTMethodEntryC_somtGetFullCParamList = function(somSelf: SOMTMethodEntryC;
		buffer, varargsParm: CORBAString): CORBAString; stdcall;
  somTD_SOMTMethodEntryC_somtGetFullCParamList = somTP_SOMTMethodEntryC_somtGetFullCParamList;
(*
 *  Same as somtGetShortCParamList except that the method receiver and
 *  any implicit method arguments (Environment and Context) are included.
 *  The types of the method parameters are given in C form (with pointer
 *  stars, where needed) rather than in the IDL form.
 *)
const somMD_SOMTMethodEntryC_somtGetFullCParamList = '::SOMTMethodEntryC::somtGetFullCParamList';
function SOMTMethodEntryC_somtGetFullCParamList(somSelf: SOMTMethodEntryC;
  buffer, varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetShortParamNameList
 *)
type
  somTP_SOMTMethodEntryC_somtGetShortParamNameList = function(somSelf: SOMTMethodEntryC;
		buffer, selfParm, varargsParm: CORBAString): CORBAString; stdcall;
  somTD_SOMTMethodEntryC_somtGetShortParamNameList = somTP_SOMTMethodEntryC_somtGetShortParamNameList;
(*
 *  Returns the parameter list for this method in call form (without
 *  types). The argument list is built in <buffer> and the address of
 *  <buffer> is returned. Parameters are delimited with newlines.
 *  If this method takes a variable number of arguments then the
 *  final parameter is replaced by <varargsParm>, unless
 *  <varargsParm> is NULL in which case the final parameter is removed.
 *  If <selfParm> is not null then it is added as an initial
 *  parameter. (The <selfParm> string may actually contain multiple
 *  parameters, delimited by newline characters.)
 *  The method receiver and any implicit method arguments are NOT
 *  included.
 *)
const somMD_SOMTMethodEntryC_somtGetShortParamNameList = '::SOMTMethodEntryC::somtGetShortParamNameList';
function SOMTMethodEntryC_somtGetShortParamNameList(somSelf: SOMTMethodEntryC;
  buffer, selfParm, varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFullParamNameList
 *)
type
  somTP_SOMTMethodEntryC_somtGetFullParamNameList = function(somSelf: SOMTMethodEntryC;
		buffer, varargsParm: CORBAString): CORBAString; stdcall;
  somTD_SOMTMethodEntryC_somtGetFullParamNameList = somTP_SOMTMethodEntryC_somtGetFullParamNameList;
(*
 *  Same as somtGetParamNameList except that the method receiver and
 *  any implicit method arguments (Environment and Context) are included.
 *)
const somMD_SOMTMethodEntryC_somtGetFullParamNameList = '::SOMTMethodEntryC::somtGetFullParamNameList';
function SOMTMethodEntryC_somtGetFullParamNameList(somSelf: SOMTMethodEntryC;
  buffer, varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNthParameter
 *)
type
  somTP_SOMTMethodEntryC_somtGetNthParameter = function(somSelf: SOMTMethodEntryC;
		n: SmallInt): SOMTParameterEntryC; stdcall;
  somTD_SOMTMethodEntryC_somtGetNthParameter = somTP_SOMTMethodEntryC_somtGetNthParameter;
(*
 *  Returns the object representing the nth explicit method parameter.
 *)
const somMD_SOMTMethodEntryC_somtGetNthParameter = '::SOMTMethodEntryC::somtGetNthParameter';
function SOMTMethodEntryC_somtGetNthParameter(somSelf: SOMTMethodEntryC;
  n: SmallInt): SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstException
 *)
type
  somTP_SOMTMethodEntryC_somtGetFirstException = function(somSelf: SOMTMethodEntryC): SOMTStructEntryC; stdcall;
  somTD_SOMTMethodEntryC_somtGetFirstException = somTP_SOMTMethodEntryC_somtGetFirstException;
(*
 *  The first exception this method raises.
 *)
const somMD_SOMTMethodEntryC_somtGetFirstException = '::SOMTMethodEntryC::somtGetFirstException';
function SOMTMethodEntryC_somtGetFirstException(somSelf: SOMTMethodEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextException
 *)
type
  somTP_SOMTMethodEntryC_somtGetNextException = function(somSelf: SOMTMethodEntryC): SOMTStructEntryC; stdcall;
  somTD_SOMTMethodEntryC_somtGetNextException = somTP_SOMTMethodEntryC_somtGetNextException;
(*
 *  The next exception this method raises,
 *  relative to the previous call to this method or to
 *  somtGetFirstException.
 *)
const somMD_SOMTMethodEntryC_somtGetNextException = '::SOMTMethodEntryC::somtGetNextException';
function SOMTMethodEntryC_somtGetNextException(somSelf: SOMTMethodEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtContextArray
 *)
type
  somTP_SOMTMethodEntryC__get_somtContextArray = function(somSelf: SOMTMethodEntryC): PCORBAString; stdcall;
  somTD_SOMTMethodEntryC__get_somtContextArray = somTP_SOMTMethodEntryC__get_somtContextArray;
(*
 *  An array of the context string-literals for the method.
 *)
const somMD_SOMTMethodEntryC__get_somtContextArray = '::SOMTMethodEntryC::_get_somtContextArray';
function SOMTMethodEntryC__get_somtContextArray(somSelf: SOMTMethodEntryC): PCORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtCReturnType
 *)
type
  somTP_SOMTMethodEntryC__get_somtCReturnType = function(somSelf: SOMTMethodEntryC): CORBAString; stdcall;
  somTD_SOMTMethodEntryC__get_somtCReturnType = somTP_SOMTMethodEntryC__get_somtCReturnType;
(*
 *  The C datatype the method returns. This may not correspond to the
 *  IDL data type (in particular, pointer stars may be added).
 *)
const somMD_SOMTMethodEntryC__get_somtCReturnType = '::SOMTMethodEntryC::_get_somtCReturnType';
function SOMTMethodEntryC__get_somtCReturnType(somSelf: SOMTMethodEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <scpass.h>

(*
 * Define the class name as an object type
 *)
// type
//   SOMTPassthruEntryC = SOMTEntryC;

const
  SOMTPassthruEntryC_MajorVersion = 2;
  SOMTPassthruEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTPassthruEntryCNewClass(
  somtmajorVersion: integer4 = SOMTPassthruEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTPassthruEntryC_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTPassthruEntryCClassDataStructure = record
	classObject: SOMClass;
	_get_somtPassthruBody: somMToken;
	_get_somtPassthruTarget: somMToken;
	_get_somtPassthruLanguage: somMToken;
	somtIsBeforePassthru: somMToken;
end;
PSOMTPassthruEntryCClassDataStructure = ^SOMTPassthruEntryCClassDataStructure;
function SOMTPassthruEntryCClassData: PSOMTPassthruEntryCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTPassthruEntryCCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMTPassthruEntryCCClassDataStructure = ^SOMTPassthruEntryCCClassDataStructure;
function SOMTPassthruEntryCCClassData: PSOMTPassthruEntryCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTPassthruEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTPassthruEntryC
 *)
function SOMTPassthruEntryCNew: SOMTPassthruEntryC;
function SOMTPassthruEntryCRenew(buf: Pointer): SOMTPassthruEntryC;

(*
 * New Method: _get_somtPassthruBody
 *)
type
  somTP_SOMTPassthruEntryC__get_somtPassthruBody = function(somSelf: SOMTPassthruEntryC): CORBAString; stdcall;
  somTD_SOMTPassthruEntryC__get_somtPassthruBody = somTP_SOMTPassthruEntryC__get_somtPassthruBody;
(*
 *  The source content text of this passthru entry without
 *  any modification. Newlines that were present in the source will
 *  still be present.
 *)
const somMD_SOMTPassthruEntryC__get_somtPassthruBody = '::SOMTPassthruEntryC::_get_somtPassthruBody';
function SOMTPassthruEntryC__get_somtPassthruBody(somSelf: SOMTPassthruEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtPassthruLanguage
 *)
type
  somTP_SOMTPassthruEntryC__get_somtPassthruLanguage = function(somSelf: SOMTPassthruEntryC): CORBAString; stdcall;
  somTD_SOMTPassthruEntryC__get_somtPassthruLanguage = somTP_SOMTPassthruEntryC__get_somtPassthruLanguage;
(*
 *  Returns the name of the language for which this passthru entry
 *  is intended. Language names are always all upper case.
 *)
const somMD_SOMTPassthruEntryC__get_somtPassthruLanguage = '::SOMTPassthruEntryC::_get_somtPassthruLanguage';
function SOMTPassthruEntryC__get_somtPassthruLanguage(somSelf: SOMTPassthruEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtPassthruTarget
 *)
type
  somTP_SOMTPassthruEntryC__get_somtPassthruTarget = function(somSelf: SOMTPassthruEntryC): CORBAString; stdcall;
  somTD_SOMTPassthruEntryC__get_somtPassthruTarget = somTP_SOMTPassthruEntryC__get_somtPassthruTarget;
(*
 *  Returns the target for this passthru entry.
 *)
const somMD_SOMTPassthruEntryC__get_somtPassthruTarget = '::SOMTPassthruEntryC::_get_somtPassthruTarget';
function SOMTPassthruEntryC__get_somtPassthruTarget(somSelf: SOMTPassthruEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtIsBeforePassthru
 *)
type
  somTP_SOMTPassthruEntryC_somtIsBeforePassthru = function(somSelf: SOMTPassthruEntryC): CORBABoolean; stdcall;
  somTD_SOMTPassthruEntryC_somtIsBeforePassthru = somTP_SOMTPassthruEntryC_somtIsBeforePassthru;
(*
 *  Returns 1 (true) if this passthru entry is to be put at the
 *  beginning of the file or 0 (false) if this passthru entry is to
 *  go later in the file.
 *)
const somMD_SOMTPassthruEntryC_somtIsBeforePassthru = '::SOMTPassthruEntryC::somtIsBeforePassthru';
function SOMTPassthruEntryC_somtIsBeforePassthru(somSelf: SOMTPassthruEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

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

const
  SOMTEmitC_MajorVersion = 2;
  SOMTEmitC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTEmitCNewClass(
  somtmajorVersion: integer4 = SOMTEmitC_MajorVersion;
  somtminorVersion: integer4 = SOMTEmitC_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTEmitCClassDataStructure = record
	classObject: SOMClass;
	_get_somtTemplate: somMToken;
	_get_somtTargetFile: somMToken;
	_set_somtTargetFile: somMToken;
	_get_somtTargetClass: somMToken;
	_set_somtTargetClass: somMToken;
	_get_somtTargetModule: somMToken;
	_set_somtTargetModule: somMToken;
	_get_somtTargetType: somMToken;
	_set_somtTargetType: somMToken;
	somtGenerateSections: somMToken;
	somtOpenSymbolsFile: somMToken;
	somtSetPredefinedSymbols: somMToken;
	somtFileSymbols: somMToken;
	somtEmitProlog: somMToken;
	somtEmitBaseIncludesProlog: somMToken;
	somtEmitBaseIncludes: somMToken;
	somtEmitBaseIncludesEpilog: somMToken;
	somtEmitMetaInclude: somMToken;
	somtEmitClass: somMToken;
	somtEmitMeta: somMToken;
	somtEmitBaseProlog: somMToken;
	somtEmitBase: somMToken;
	somtEmitBaseEpilog: somMToken;
	somtEmitPassthruProlog: somMToken;
	somtEmitPassthru: somMToken;
	somtEmitPassthruEpilog: somMToken;
	somtEmitRelease: somMToken;
	somtEmitDataProlog: somMToken;
	somtEmitData: somMToken;
	somtEmitDataEpilog: somMToken;
	somtEmitMethodsProlog: somMToken;
	somtEmitMethods: somMToken;
	somtEmitMethodsEpilog: somMToken;
	somtEmitMethod: somMToken;
	somtEmitEpilog: somMToken;
	somtScanBases: somMToken;
	somtScanConstants: somMToken;
	somtCheckVisibility: somMToken;
	somtNew: somMToken;
	somtImplemented: somMToken;
	somtOverridden: somMToken;
	somtInherited: somMToken;
	somtAllVisible: somMToken;
	somtAll: somMToken;
	somtNewNoProc: somMToken;
	somtPrivOrPub: somMToken;
	somtNewProc: somMToken;
	somtLink: somMToken;
	somtVA: somMToken;
	somtScanMethods: somMToken;
	somtScanData: somMToken;
	somtScanPassthru: somMToken;
	somtEmitFullPassthru: somMToken;
	somtScanDataF: somMToken;
	somtScanBasesF: somMToken;
	_set_somtTemplate: somMToken;
	_set_somtEmitterName: somMToken;
	_get_somtEmitterName: somMToken;
	somtEmitAttributeProlog: somMToken;
	somtEmitAttribute: somMToken;
	somtEmitAttributeEpilog: somMToken;
	somtEmitConstantProlog: somMToken;
	somtEmitConstant: somMToken;
	somtEmitConstantEpilog: somMToken;
	somtEmitTypedefProlog: somMToken;
	somtEmitTypedef: somMToken;
	somtEmitTypedefEpilog: somMToken;
	somtEmitStructProlog: somMToken;
	somtEmitStruct: somMToken;
	somtEmitStructEpilog: somMToken;
	somtEmitUnionProlog: somMToken;
	somtEmitUnion: somMToken;
	somtEmitUnionEpilog: somMToken;
	somtEmitEnumProlog: somMToken;
	somtEmitEnum: somMToken;
	somtEmitEnumEpilog: somMToken;
	somtEmitInterfaceProlog: somMToken;
	somtEmitInterface: somMToken;
	somtEmitInterfaceEpilog: somMToken;
	somtEmitModuleProlog: somMToken;
	somtEmitModule: somMToken;
	somtEmitModuleEpilog: somMToken;
	somtScanAttributes: somMToken;
	somtScanTypedefs: somMToken;
	somtScanStructs: somMToken;
	somtScanUnions: somMToken;
	somtScanEnums: somMToken;
	somtScanInterfaces: somMToken;
	somtScanModules: somMToken;
	somtGetGlobalModifierValue: somMToken;
	somtGetFirstGlobalDefinition: somMToken;
	somtGetNextGlobalDefinition: somMToken;
end;
PSOMTEmitCClassDataStructure = ^SOMTEmitCClassDataStructure;
function SOMTEmitCClassData: PSOMTEmitCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTEmitCCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMTEmitCCClassDataStructure = ^SOMTEmitCCClassDataStructure;
function SOMTEmitCCClassData: PSOMTEmitCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTEmitC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTEmitC
 *)
function SOMTEmitCNew: SOMTEmitC;
function SOMTEmitCRenew(buf: Pointer): SOMTEmitC;

(*
 * New Method: _get_somtTemplate
 *)
type
  somTP_SOMTEmitC__get_somtTemplate = function(somSelf: SOMTEmitC): SOMTTemplateOutputC; stdcall;
  somTD_SOMTEmitC__get_somtTemplate = somTP_SOMTEmitC__get_somtTemplate;
(*
 *  The template is to provide template output and maintains a symbol
 *  table that provides a sort of global context for the emitter.
 *)
const somMD_SOMTEmitC__get_somtTemplate = '::SOMTEmitC::_get_somtTemplate';
function SOMTEmitC__get_somtTemplate(somSelf: SOMTEmitC): SOMTTemplateOutputC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtTemplate
 *)
type
  somTP_SOMTEmitC__set_somtTemplate = procedure(somSelf: SOMTEmitC;
		somtTemplate: SOMTTemplateOutputC); stdcall;
  somTD_SOMTEmitC__set_somtTemplate = somTP_SOMTEmitC__set_somtTemplate;
(*
 *  The template is to provide template output and maintains a symbol
 *  table that provides a sort of global context for the emitter.
 *)
const somMD_SOMTEmitC__set_somtTemplate = '::SOMTEmitC::_set_somtTemplate';
procedure SOMTEmitC__set_somtTemplate(somSelf: SOMTEmitC;
  somtTemplate: SOMTTemplateOutputC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtTargetFile
 *)
type
  somTP_SOMTEmitC__get_somtTargetFile = function(somSelf: SOMTEmitC): PFILE; stdcall;
  somTD_SOMTEmitC__get_somtTargetFile = somTP_SOMTEmitC__get_somtTargetFile;
(*
 *  The target file is the one to which all emitter output is to be
 *  directed.
 *)
const somMD_SOMTEmitC__get_somtTargetFile = '::SOMTEmitC::_get_somtTargetFile';
function SOMTEmitC__get_somtTargetFile(somSelf: SOMTEmitC): PFILE; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtTargetFile
 *)
type
  somTP_SOMTEmitC__set_somtTargetFile = procedure(somSelf: SOMTEmitC;
		somtTargetFile: PFILE); stdcall;
  somTD_SOMTEmitC__set_somtTargetFile = somTP_SOMTEmitC__set_somtTargetFile;
(*
 *  The target file is the one to which all emitter output is to be
 *  directed.
 *)
const somMD_SOMTEmitC__set_somtTargetFile = '::SOMTEmitC::_set_somtTargetFile';
procedure SOMTEmitC__set_somtTargetFile(somSelf: SOMTEmitC;
  somtTargetFile: PFILE); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtTargetClass
 *)
type
  somTP_SOMTEmitC__get_somtTargetClass = function(somSelf: SOMTEmitC): SOMTClassEntryC; stdcall;
  somTD_SOMTEmitC__get_somtTargetClass = somTP_SOMTEmitC__get_somtTargetClass;
(*
 *  The target class is the class definition for which code is to be
 *  emitted.
 *)
const somMD_SOMTEmitC__get_somtTargetClass = '::SOMTEmitC::_get_somtTargetClass';
function SOMTEmitC__get_somtTargetClass(somSelf: SOMTEmitC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtTargetClass
 *)
type
  somTP_SOMTEmitC__set_somtTargetClass = procedure(somSelf: SOMTEmitC;
		somtTargetClass: SOMTClassEntryC); stdcall;
  somTD_SOMTEmitC__set_somtTargetClass = somTP_SOMTEmitC__set_somtTargetClass;
(*
 *  The target class is the class definition for which code is to be
 *  emitted.
 *)
const somMD_SOMTEmitC__set_somtTargetClass = '::SOMTEmitC::_set_somtTargetClass';
procedure SOMTEmitC__set_somtTargetClass(somSelf: SOMTEmitC;
  somtTargetClass: SOMTClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtTargetModule
 *)
type
  somTP_SOMTEmitC__get_somtTargetModule = function(somSelf: SOMTEmitC): SOMTModuleEntryC; stdcall;
  somTD_SOMTEmitC__get_somtTargetModule = somTP_SOMTEmitC__get_somtTargetModule;
(*
 *  The target module is the module definition for which code is to be
 *  emitted.
 *)
const somMD_SOMTEmitC__get_somtTargetModule = '::SOMTEmitC::_get_somtTargetModule';
function SOMTEmitC__get_somtTargetModule(somSelf: SOMTEmitC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtTargetModule
 *)
type
  somTP_SOMTEmitC__set_somtTargetModule = procedure(somSelf: SOMTEmitC;
		somtTargetModule: SOMTModuleEntryC); stdcall;
  somTD_SOMTEmitC__set_somtTargetModule = somTP_SOMTEmitC__set_somtTargetModule;
(*
 *  The target module is the module definition for which code is to be
 *  emitted.
 *)
const somMD_SOMTEmitC__set_somtTargetModule = '::SOMTEmitC::_set_somtTargetModule';
procedure SOMTEmitC__set_somtTargetModule(somSelf: SOMTEmitC;
  somtTargetModule: SOMTModuleEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtTargetType
 *)
type
  somTP_SOMTEmitC__get_somtTargetType = function(somSelf: SOMTEmitC): SOMTTargetTypeT; stdcall;
  somTD_SOMTEmitC__get_somtTargetType = somTP_SOMTEmitC__get_somtTargetType;
(*
 *  The target type indicates what type of output file is being
 *  produced, public, private, or implementation.  This allows the
 *  same emitter subclass to produce several different output files
 *  that generally differ only in how much of the class definition
 *  they cover. Eg, .csc, .sc, and .psc.
 *  This is attribute is for OIDL compatibility only.
 *)
const somMD_SOMTEmitC__get_somtTargetType = '::SOMTEmitC::_get_somtTargetType';
function SOMTEmitC__get_somtTargetType(somSelf: SOMTEmitC): SOMTTargetTypeT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtTargetType
 *)
type
  somTP_SOMTEmitC__set_somtTargetType = procedure(somSelf: SOMTEmitC;
		somtTargetType: SOMTTargetTypeT); stdcall;
  somTD_SOMTEmitC__set_somtTargetType = somTP_SOMTEmitC__set_somtTargetType;
(*
 *  The target type indicates what type of output file is being
 *  produced, public, private, or implementation.  This allows the
 *  same emitter subclass to produce several different output files
 *  that generally differ only in how much of the class definition
 *  they cover. Eg, .csc, .sc, and .psc.
 *  This is attribute is for OIDL compatibility only.
 *)
const somMD_SOMTEmitC__set_somtTargetType = '::SOMTEmitC::_set_somtTargetType';
procedure SOMTEmitC__set_somtTargetType(somSelf: SOMTEmitC;
  somtTargetType: SOMTTargetTypeT); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtEmitterName
 *)
type
  somTP_SOMTEmitC__get_somtEmitterName = function(somSelf: SOMTEmitC): CORBAString; stdcall;
  somTD_SOMTEmitC__get_somtEmitterName = somTP_SOMTEmitC__get_somtEmitterName;
(*
 *  The short name of the emitter (the name used to invoke it via the
 *  SOM Compiler.  Typically this is the file stem of the subclass
 *  of SOMTEmitC. This attribute should be set in the driver program
 *  that runs the emitter.  It is used to filter passthrus so that only
 *  passthrus directed to a particular emitter are seen by it.
 *)
const somMD_SOMTEmitC__get_somtEmitterName = '::SOMTEmitC::_get_somtEmitterName';
function SOMTEmitC__get_somtEmitterName(somSelf: SOMTEmitC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somtEmitterName
 *)
type
  somTP_SOMTEmitC__set_somtEmitterName = procedure(somSelf: SOMTEmitC;
		somtEmitterName: CORBAString); stdcall;
  somTD_SOMTEmitC__set_somtEmitterName = somTP_SOMTEmitC__set_somtEmitterName;
(*
 *  The short name of the emitter (the name used to invoke it via the
 *  SOM Compiler.  Typically this is the file stem of the subclass
 *  of SOMTEmitC. This attribute should be set in the driver program
 *  that runs the emitter.  It is used to filter passthrus so that only
 *  passthrus directed to a particular emitter are seen by it.
 *)
const somMD_SOMTEmitC__set_somtEmitterName = '::SOMTEmitC::_set_somtEmitterName';
procedure SOMTEmitC__set_somtEmitterName(somSelf: SOMTEmitC;
  somtEmitterName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGenerateSections
 *)
type
  somTP_SOMTEmitC_somtGenerateSections = function(somSelf: SOMTEmitC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtGenerateSections = somTP_SOMTEmitC_somtGenerateSections;
(*
 *  Calls each of the section methods in order.  The order is:
 *
 *    somtEmitProlog
 *    when emitting a class:
 *    	  somtEmitClass
 *    	  somtEmitBase
 *    	  somtEmitMeta
 *    somtEmitConstant
 *    somtEmitTypedef
 *    somtEmitStruct
 *    somtEmitUnion
 *    somtEmitEnum
 *    when emitting a class:
 *       somtEmitAttribute
 *       somtEmitMethod
 *       somtEmitRelease
 *       somtEmitPassthru
 *       somtEmitData
 *    when emitting a module:
 *        somtEmitInterface
 *        somtEmitModule
 *    somtEmitEpilog
 *
 *  This method will need to be overridden by many emitters in order
 *  to rearange the order of the sections and to add or delete
 *  sections.
 *  Note: repeating sections such as methods, data, and passthru,
 *  have a prolog and epilog method as well. The prolog method is
 *  called before the first sections is processed and the epilog method
 *  is called after the last section is processed.
 *)
const somMD_SOMTEmitC_somtGenerateSections = '::SOMTEmitC::somtGenerateSections';
function SOMTEmitC_somtGenerateSections(somSelf: SOMTEmitC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtOpenSymbolsFile
 *)
type
  somTP_SOMTEmitC_somtOpenSymbolsFile = function(somSelf: SOMTEmitC;
		fileName, mode: CORBAString): PFILE; stdcall;
  somTD_SOMTEmitC_somtOpenSymbolsFile = somTP_SOMTEmitC_somtOpenSymbolsFile;
(*
 *  This method attempts to open the symbols file.
 *  If file doesn't exist then it will attempt to find it in the
 *  directories specified in the SMINCLUDE environment variable.
 *  If the file can be found a FILE * pointer is returned, otherwise
 *  NULL is returned.
 *)
const somMD_SOMTEmitC_somtOpenSymbolsFile = '::SOMTEmitC::somtOpenSymbolsFile';
function SOMTEmitC_somtOpenSymbolsFile(somSelf: SOMTEmitC;
  fileName, mode: CORBAString): PFILE; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtSetPredefinedSymbols
 *)
type
  somTP_SOMTEmitC_somtSetPredefinedSymbols = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtSetPredefinedSymbols = somTP_SOMTEmitC_somtSetPredefinedSymbols;
(*
 *  Set predefined symbols that are used for such things as section
 *  names etc.
 *)
const somMD_SOMTEmitC_somtSetPredefinedSymbols = '::SOMTEmitC::somtSetPredefinedSymbols';
procedure SOMTEmitC_somtSetPredefinedSymbols(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtFileSymbols
 *)
type
  somTP_SOMTEmitC_somtFileSymbols = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtFileSymbols = somTP_SOMTEmitC_somtFileSymbols;
(*
 *  Symbols that are common to the file.  This includes the target
 *  class symbols, and the metaclass symbols, and special symbols
 *  like <timeStamp>.  IE, all symbols that have a single definition.
 *)
const somMD_SOMTEmitC_somtFileSymbols = '::SOMTEmitC::somtFileSymbols';
procedure SOMTEmitC_somtFileSymbols(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitProlog
 *)
type
  somTP_SOMTEmitC_somtEmitProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitProlog = somTP_SOMTEmitC_somtEmitProlog;
const somMD_SOMTEmitC_somtEmitProlog = '::SOMTEmitC::somtEmitProlog';
procedure SOMTEmitC_somtEmitProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitBaseIncludesProlog
 *)
type
  somTP_SOMTEmitC_somtEmitBaseIncludesProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitBaseIncludesProlog = somTP_SOMTEmitC_somtEmitBaseIncludesProlog;
const somMD_SOMTEmitC_somtEmitBaseIncludesProlog = '::SOMTEmitC::somtEmitBaseIncludesProlog';
procedure SOMTEmitC_somtEmitBaseIncludesProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitBaseIncludes
 *)
type
  somTP_SOMTEmitC_somtEmitBaseIncludes = procedure(somSelf: SOMTEmitC;
		base: SOMTBaseClassEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitBaseIncludes = somTP_SOMTEmitC_somtEmitBaseIncludes;
const somMD_SOMTEmitC_somtEmitBaseIncludes = '::SOMTEmitC::somtEmitBaseIncludes';
procedure SOMTEmitC_somtEmitBaseIncludes(somSelf: SOMTEmitC;
  base: SOMTBaseClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitBaseIncludesEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitBaseIncludesEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitBaseIncludesEpilog = somTP_SOMTEmitC_somtEmitBaseIncludesEpilog;
const somMD_SOMTEmitC_somtEmitBaseIncludesEpilog = '::SOMTEmitC::somtEmitBaseIncludesEpilog';
procedure SOMTEmitC_somtEmitBaseIncludesEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitMetaInclude
 *)
type
  somTP_SOMTEmitC_somtEmitMetaInclude = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitMetaInclude = somTP_SOMTEmitC_somtEmitMetaInclude;
const somMD_SOMTEmitC_somtEmitMetaInclude = '::SOMTEmitC::somtEmitMetaInclude';
procedure SOMTEmitC_somtEmitMetaInclude(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitClass
 *)
type
  somTP_SOMTEmitC_somtEmitClass = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitClass = somTP_SOMTEmitC_somtEmitClass;
const somMD_SOMTEmitC_somtEmitClass = '::SOMTEmitC::somtEmitClass';
procedure SOMTEmitC_somtEmitClass(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitMeta
 *)
type
  somTP_SOMTEmitC_somtEmitMeta = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitMeta = somTP_SOMTEmitC_somtEmitMeta;
const somMD_SOMTEmitC_somtEmitMeta = '::SOMTEmitC::somtEmitMeta';
procedure SOMTEmitC_somtEmitMeta(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitBaseProlog
 *)
type
  somTP_SOMTEmitC_somtEmitBaseProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitBaseProlog = somTP_SOMTEmitC_somtEmitBaseProlog;
const somMD_SOMTEmitC_somtEmitBaseProlog = '::SOMTEmitC::somtEmitBaseProlog';
procedure SOMTEmitC_somtEmitBaseProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitBase
 *)
type
  somTP_SOMTEmitC_somtEmitBase = procedure(somSelf: SOMTEmitC;
		base: SOMTBaseClassEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitBase = somTP_SOMTEmitC_somtEmitBase;
const somMD_SOMTEmitC_somtEmitBase = '::SOMTEmitC::somtEmitBase';
procedure SOMTEmitC_somtEmitBase(somSelf: SOMTEmitC;
  base: SOMTBaseClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitBaseEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitBaseEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitBaseEpilog = somTP_SOMTEmitC_somtEmitBaseEpilog;
const somMD_SOMTEmitC_somtEmitBaseEpilog = '::SOMTEmitC::somtEmitBaseEpilog';
procedure SOMTEmitC_somtEmitBaseEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitPassthruProlog
 *)
type
  somTP_SOMTEmitC_somtEmitPassthruProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitPassthruProlog = somTP_SOMTEmitC_somtEmitPassthruProlog;
const somMD_SOMTEmitC_somtEmitPassthruProlog = '::SOMTEmitC::somtEmitPassthruProlog';
procedure SOMTEmitC_somtEmitPassthruProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitPassthru
 *)
type
  somTP_SOMTEmitC_somtEmitPassthru = procedure(somSelf: SOMTEmitC;
		entry: SOMTPassthruEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitPassthru = somTP_SOMTEmitC_somtEmitPassthru;
const somMD_SOMTEmitC_somtEmitPassthru = '::SOMTEmitC::somtEmitPassthru';
procedure SOMTEmitC_somtEmitPassthru(somSelf: SOMTEmitC;
  entry: SOMTPassthruEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitPassthruEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitPassthruEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitPassthruEpilog = somTP_SOMTEmitC_somtEmitPassthruEpilog;
const somMD_SOMTEmitC_somtEmitPassthruEpilog = '::SOMTEmitC::somtEmitPassthruEpilog';
procedure SOMTEmitC_somtEmitPassthruEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitRelease
 *)
type
  somTP_SOMTEmitC_somtEmitRelease = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitRelease = somTP_SOMTEmitC_somtEmitRelease;
const somMD_SOMTEmitC_somtEmitRelease = '::SOMTEmitC::somtEmitRelease';
procedure SOMTEmitC_somtEmitRelease(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitDataProlog
 *)
type
  somTP_SOMTEmitC_somtEmitDataProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitDataProlog = somTP_SOMTEmitC_somtEmitDataProlog;
const somMD_SOMTEmitC_somtEmitDataProlog = '::SOMTEmitC::somtEmitDataProlog';
procedure SOMTEmitC_somtEmitDataProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitData
 *)
type
  somTP_SOMTEmitC_somtEmitData = procedure(somSelf: SOMTEmitC;
		entry: SOMTDataEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitData = somTP_SOMTEmitC_somtEmitData;
const somMD_SOMTEmitC_somtEmitData = '::SOMTEmitC::somtEmitData';
procedure SOMTEmitC_somtEmitData(somSelf: SOMTEmitC;
  entry: SOMTDataEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitDataEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitDataEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitDataEpilog = somTP_SOMTEmitC_somtEmitDataEpilog;
const somMD_SOMTEmitC_somtEmitDataEpilog = '::SOMTEmitC::somtEmitDataEpilog';
procedure SOMTEmitC_somtEmitDataEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitAttributeProlog
 *)
type
  somTP_SOMTEmitC_somtEmitAttributeProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitAttributeProlog = somTP_SOMTEmitC_somtEmitAttributeProlog;
const somMD_SOMTEmitC_somtEmitAttributeProlog = '::SOMTEmitC::somtEmitAttributeProlog';
procedure SOMTEmitC_somtEmitAttributeProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitAttribute
 *)
type
  somTP_SOMTEmitC_somtEmitAttribute = procedure(somSelf: SOMTEmitC;
		att: SOMTAttributeEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitAttribute = somTP_SOMTEmitC_somtEmitAttribute;
const somMD_SOMTEmitC_somtEmitAttribute = '::SOMTEmitC::somtEmitAttribute';
procedure SOMTEmitC_somtEmitAttribute(somSelf: SOMTEmitC;
  att: SOMTAttributeEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitAttributeEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitAttributeEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitAttributeEpilog = somTP_SOMTEmitC_somtEmitAttributeEpilog;
const somMD_SOMTEmitC_somtEmitAttributeEpilog = '::SOMTEmitC::somtEmitAttributeEpilog';
procedure SOMTEmitC_somtEmitAttributeEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitConstantProlog
 *)
type
  somTP_SOMTEmitC_somtEmitConstantProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitConstantProlog = somTP_SOMTEmitC_somtEmitConstantProlog;
const somMD_SOMTEmitC_somtEmitConstantProlog = '::SOMTEmitC::somtEmitConstantProlog';
procedure SOMTEmitC_somtEmitConstantProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitConstant
 *)
type
  somTP_SOMTEmitC_somtEmitConstant = procedure(somSelf: SOMTEmitC;
		con: SOMTConstEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitConstant = somTP_SOMTEmitC_somtEmitConstant;
const somMD_SOMTEmitC_somtEmitConstant = '::SOMTEmitC::somtEmitConstant';
procedure SOMTEmitC_somtEmitConstant(somSelf: SOMTEmitC;
  con: SOMTConstEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitConstantEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitConstantEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitConstantEpilog = somTP_SOMTEmitC_somtEmitConstantEpilog;
const somMD_SOMTEmitC_somtEmitConstantEpilog = '::SOMTEmitC::somtEmitConstantEpilog';
procedure SOMTEmitC_somtEmitConstantEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitTypedefProlog
 *)
type
  somTP_SOMTEmitC_somtEmitTypedefProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitTypedefProlog = somTP_SOMTEmitC_somtEmitTypedefProlog;
const somMD_SOMTEmitC_somtEmitTypedefProlog = '::SOMTEmitC::somtEmitTypedefProlog';
procedure SOMTEmitC_somtEmitTypedefProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitTypedef
 *)
type
  somTP_SOMTEmitC_somtEmitTypedef = procedure(somSelf: SOMTEmitC;
		td: SOMTTypedefEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitTypedef = somTP_SOMTEmitC_somtEmitTypedef;
const somMD_SOMTEmitC_somtEmitTypedef = '::SOMTEmitC::somtEmitTypedef';
procedure SOMTEmitC_somtEmitTypedef(somSelf: SOMTEmitC;
  td: SOMTTypedefEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitTypedefEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitTypedefEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitTypedefEpilog = somTP_SOMTEmitC_somtEmitTypedefEpilog;
const somMD_SOMTEmitC_somtEmitTypedefEpilog = '::SOMTEmitC::somtEmitTypedefEpilog';
procedure SOMTEmitC_somtEmitTypedefEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitStructProlog
 *)
type
  somTP_SOMTEmitC_somtEmitStructProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitStructProlog = somTP_SOMTEmitC_somtEmitStructProlog;
const somMD_SOMTEmitC_somtEmitStructProlog = '::SOMTEmitC::somtEmitStructProlog';
procedure SOMTEmitC_somtEmitStructProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitStruct
 *)
type
  somTP_SOMTEmitC_somtEmitStruct = procedure(somSelf: SOMTEmitC;
		struc: SOMTStructEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitStruct = somTP_SOMTEmitC_somtEmitStruct;
const somMD_SOMTEmitC_somtEmitStruct = '::SOMTEmitC::somtEmitStruct';
procedure SOMTEmitC_somtEmitStruct(somSelf: SOMTEmitC;
  struc: SOMTStructEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitStructEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitStructEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitStructEpilog = somTP_SOMTEmitC_somtEmitStructEpilog;
const somMD_SOMTEmitC_somtEmitStructEpilog = '::SOMTEmitC::somtEmitStructEpilog';
procedure SOMTEmitC_somtEmitStructEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitUnionProlog
 *)
type
  somTP_SOMTEmitC_somtEmitUnionProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitUnionProlog = somTP_SOMTEmitC_somtEmitUnionProlog;
const somMD_SOMTEmitC_somtEmitUnionProlog = '::SOMTEmitC::somtEmitUnionProlog';
procedure SOMTEmitC_somtEmitUnionProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitUnion
 *)
type
  somTP_SOMTEmitC_somtEmitUnion = procedure(somSelf: SOMTEmitC;
		un: SOMTUnionEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitUnion = somTP_SOMTEmitC_somtEmitUnion;
const somMD_SOMTEmitC_somtEmitUnion = '::SOMTEmitC::somtEmitUnion';
procedure SOMTEmitC_somtEmitUnion(somSelf: SOMTEmitC;
  un: SOMTUnionEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitUnionEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitUnionEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitUnionEpilog = somTP_SOMTEmitC_somtEmitUnionEpilog;
const somMD_SOMTEmitC_somtEmitUnionEpilog = '::SOMTEmitC::somtEmitUnionEpilog';
procedure SOMTEmitC_somtEmitUnionEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitEnumProlog
 *)
type
  somTP_SOMTEmitC_somtEmitEnumProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitEnumProlog = somTP_SOMTEmitC_somtEmitEnumProlog;
const somMD_SOMTEmitC_somtEmitEnumProlog = '::SOMTEmitC::somtEmitEnumProlog';
procedure SOMTEmitC_somtEmitEnumProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitEnum
 *)
type
  somTP_SOMTEmitC_somtEmitEnum = procedure(somSelf: SOMTEmitC;
		en: SOMTEnumEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitEnum = somTP_SOMTEmitC_somtEmitEnum;
const somMD_SOMTEmitC_somtEmitEnum = '::SOMTEmitC::somtEmitEnum';
procedure SOMTEmitC_somtEmitEnum(somSelf: SOMTEmitC;
  en: SOMTEnumEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitEnumEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitEnumEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitEnumEpilog = somTP_SOMTEmitC_somtEmitEnumEpilog;
const somMD_SOMTEmitC_somtEmitEnumEpilog = '::SOMTEmitC::somtEmitEnumEpilog';
procedure SOMTEmitC_somtEmitEnumEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitInterfaceProlog
 *)
type
  somTP_SOMTEmitC_somtEmitInterfaceProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitInterfaceProlog = somTP_SOMTEmitC_somtEmitInterfaceProlog;
const somMD_SOMTEmitC_somtEmitInterfaceProlog = '::SOMTEmitC::somtEmitInterfaceProlog';
procedure SOMTEmitC_somtEmitInterfaceProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitInterface
 *)
type
  somTP_SOMTEmitC_somtEmitInterface = procedure(somSelf: SOMTEmitC;
		intfc: SOMTClassEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitInterface = somTP_SOMTEmitC_somtEmitInterface;
const somMD_SOMTEmitC_somtEmitInterface = '::SOMTEmitC::somtEmitInterface';
procedure SOMTEmitC_somtEmitInterface(somSelf: SOMTEmitC;
  intfc: SOMTClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitInterfaceEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitInterfaceEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitInterfaceEpilog = somTP_SOMTEmitC_somtEmitInterfaceEpilog;
const somMD_SOMTEmitC_somtEmitInterfaceEpilog = '::SOMTEmitC::somtEmitInterfaceEpilog';
procedure SOMTEmitC_somtEmitInterfaceEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitModuleProlog
 *)
type
  somTP_SOMTEmitC_somtEmitModuleProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitModuleProlog = somTP_SOMTEmitC_somtEmitModuleProlog;
const somMD_SOMTEmitC_somtEmitModuleProlog = '::SOMTEmitC::somtEmitModuleProlog';
procedure SOMTEmitC_somtEmitModuleProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitModule
 *)
type
  somTP_SOMTEmitC_somtEmitModule = procedure(somSelf: SOMTEmitC;
		module: SOMTModuleEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitModule = somTP_SOMTEmitC_somtEmitModule;
const somMD_SOMTEmitC_somtEmitModule = '::SOMTEmitC::somtEmitModule';
procedure SOMTEmitC_somtEmitModule(somSelf: SOMTEmitC;
  module: SOMTModuleEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitModuleEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitModuleEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitModuleEpilog = somTP_SOMTEmitC_somtEmitModuleEpilog;
const somMD_SOMTEmitC_somtEmitModuleEpilog = '::SOMTEmitC::somtEmitModuleEpilog';
procedure SOMTEmitC_somtEmitModuleEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitMethodsProlog
 *)
type
  somTP_SOMTEmitC_somtEmitMethodsProlog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitMethodsProlog = somTP_SOMTEmitC_somtEmitMethodsProlog;
const somMD_SOMTEmitC_somtEmitMethodsProlog = '::SOMTEmitC::somtEmitMethodsProlog';
procedure SOMTEmitC_somtEmitMethodsProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitMethods
 *)
type
  somTP_SOMTEmitC_somtEmitMethods = procedure(somSelf: SOMTEmitC;
		method: SOMTMethodEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitMethods = somTP_SOMTEmitC_somtEmitMethods;
const somMD_SOMTEmitC_somtEmitMethods = '::SOMTEmitC::somtEmitMethods';
procedure SOMTEmitC_somtEmitMethods(somSelf: SOMTEmitC;
  method: SOMTMethodEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitMethodsEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitMethodsEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitMethodsEpilog = somTP_SOMTEmitC_somtEmitMethodsEpilog;
const somMD_SOMTEmitC_somtEmitMethodsEpilog = '::SOMTEmitC::somtEmitMethodsEpilog';
procedure SOMTEmitC_somtEmitMethodsEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitMethod
 *)
type
  somTP_SOMTEmitC_somtEmitMethod = procedure(somSelf: SOMTEmitC;
		method: SOMTMethodEntryC); stdcall;
  somTD_SOMTEmitC_somtEmitMethod = somTP_SOMTEmitC_somtEmitMethod;
const somMD_SOMTEmitC_somtEmitMethod = '::SOMTEmitC::somtEmitMethod';
procedure SOMTEmitC_somtEmitMethod(somSelf: SOMTEmitC;
  method: SOMTMethodEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitEpilog
 *)
type
  somTP_SOMTEmitC_somtEmitEpilog = procedure(somSelf: SOMTEmitC); stdcall;
  somTD_SOMTEmitC_somtEmitEpilog = somTP_SOMTEmitC_somtEmitEpilog;
const somMD_SOMTEmitC_somtEmitEpilog = '::SOMTEmitC::somtEmitEpilog';
procedure SOMTEmitC_somtEmitEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanBases
 *)
type
  somTP_SOMTEmitC_somtScanBases = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanBases = somTP_SOMTEmitC_somtScanBases;
const somMD_SOMTEmitC_somtScanBases = '::SOMTEmitC::somtScanBases';
function SOMTEmitC_somtScanBases(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtCheckVisibility
 *)
type
  somTP_SOMTEmitC_somtCheckVisibility = function(somSelf: SOMTEmitC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtCheckVisibility = somTP_SOMTEmitC_somtCheckVisibility;
(*
 *  Return 1 (true) if <entry> should be visible in the current
 *  target file.  This method is used by each of the following filter
 *  methods that are concerned with visibility.
 *  The default rule for visibility is:
 *    only private methods are visible in private target files,
 *    only public methods are visibile in public target files,
 *    all methods are visibile in implementation or <somtAllE> target
 *    files.
 *)
const somMD_SOMTEmitC_somtCheckVisibility = '::SOMTEmitC::somtCheckVisibility';
function SOMTEmitC_somtCheckVisibility(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtNew
 *)
type
  somTP_SOMTEmitC_somtNew = function(somSelf: SOMTEmitC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtNew = somTP_SOMTEmitC_somtNew;
(*
 *  Returns 1 (true) if <entry> is a method introduced by the target
 *  class and its visibility matches <somtTargetType> (somtImplementationE
 *  matches both private and public)
 *)
const somMD_SOMTEmitC_somtNew = '::SOMTEmitC::somtNew';
function SOMTEmitC_somtNew(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtImplemented
 *)
type
  somTP_SOMTEmitC_somtImplemented = function(somSelf: SOMTEmitC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtImplemented = somTP_SOMTEmitC_somtImplemented;
(*
 *  Returns 1 (true) if <entry> is a method introduced or overridden
 *  by the target class and its visibility matches <somtTargetType>
 *  (somtImplementationE matches both private and public)
 *)
const somMD_SOMTEmitC_somtImplemented = '::SOMTEmitC::somtImplemented';
function SOMTEmitC_somtImplemented(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtOverridden
 *)
type
  somTP_SOMTEmitC_somtOverridden = function(somSelf: SOMTEmitC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtOverridden = somTP_SOMTEmitC_somtOverridden;
(*
 *  Returns 1 (true) if <entry> is an overridding method of the target class
 *  and its visibility matches <somtTargetType> (somtImplementationE
 *  matches both private and public)
 *)
const somMD_SOMTEmitC_somtOverridden = '::SOMTEmitC::somtOverridden';
function SOMTEmitC_somtOverridden(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtInherited
 *)
type
  somTP_SOMTEmitC_somtInherited = function(somSelf: SOMTEmitC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtInherited = somTP_SOMTEmitC_somtInherited;
(*
 *  Returns 1 (true) if <entry> is inherited
 *  by the target class and its visibility matches <somtTargetType>
 *  (somtImplementationE matches both private and public)
 *)
const somMD_SOMTEmitC_somtInherited = '::SOMTEmitC::somtInherited';
function SOMTEmitC_somtInherited(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtAllVisible
 *)
type
  somTP_SOMTEmitC_somtAllVisible = function(somSelf: SOMTEmitC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtAllVisible = somTP_SOMTEmitC_somtAllVisible;
(*
 *  Returns 1 (true) if <entry> is supported by the target class and
 *  its visibility matches <somtTargetType> (somtImplementationE
 *  matches both private and public)
 *)
const somMD_SOMTEmitC_somtAllVisible = '::SOMTEmitC::somtAllVisible';
function SOMTEmitC_somtAllVisible(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtAll
 *)
type
  somTP_SOMTEmitC_somtAll = function(somSelf: SOMTEmitC;
		entry: SOMTMethodEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtAll = somTP_SOMTEmitC_somtAll;
(*
 *  Returns 1 (true) if <entry> is supported by the target class.
 *)
const somMD_SOMTEmitC_somtAll = '::SOMTEmitC::somtAll';
function SOMTEmitC_somtAll(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtNewNoProc
 *)
type
  somTP_SOMTEmitC_somtNewNoProc = function(somSelf: SOMTEmitC;
		entry: SOMTEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtNewNoProc = somTP_SOMTEmitC_somtNewNoProc;
(*
 *  Returns 1 (true) if somtNew does and the method
 *  IS NOT a direct call Procedure.
 *)
const somMD_SOMTEmitC_somtNewNoProc = '::SOMTEmitC::somtNewNoProc';
function SOMTEmitC_somtNewNoProc(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtPrivOrPub
 *)
type
  somTP_SOMTEmitC_somtPrivOrPub = function(somSelf: SOMTEmitC;
		entry: SOMTEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtPrivOrPub = somTP_SOMTEmitC_somtPrivOrPub;
(*
 *  Returns 1 (true) if entry is Private or Public.
 *)
const somMD_SOMTEmitC_somtPrivOrPub = '::SOMTEmitC::somtPrivOrPub';
function SOMTEmitC_somtPrivOrPub(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtNewProc
 *)
type
  somTP_SOMTEmitC_somtNewProc = function(somSelf: SOMTEmitC;
		entry: SOMTEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtNewProc = somTP_SOMTEmitC_somtNewProc;
(*
 *  Returns 1 (true) if somtNew does and the method
 *  IS a direct call Procedure.
 *)
const somMD_SOMTEmitC_somtNewProc = '::SOMTEmitC::somtNewProc';
function SOMTEmitC_somtNewProc(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtLink
 *)
type
  somTP_SOMTEmitC_somtLink = function(somSelf: SOMTEmitC;
		entry: SOMTEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtLink = somTP_SOMTEmitC_somtLink;
(*
 *  Returns 1 (true) if "nolink" is not set.
 *)
const somMD_SOMTEmitC_somtLink = '::SOMTEmitC::somtLink';
function SOMTEmitC_somtLink(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtVA
 *)
type
  somTP_SOMTEmitC_somtVA = function(somSelf: SOMTEmitC;
		entry: SOMTEntryC): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtVA = somTP_SOMTEmitC_somtVA;
(*
 *  Returns 1 (true) if entry is a VarArgs method.
 *)
const somMD_SOMTEmitC_somtVA = '::SOMTEmitC::somtVA';
function SOMTEmitC_somtVA(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanMethods
 *)
type
  somTP_SOMTEmitC_somtScanMethods = function(somSelf: SOMTEmitC;
		filter, prolog, each, epilog: CORBAString;
		forceProlog: CORBABoolean): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanMethods = somTP_SOMTEmitC_somtScanMethods;
(*
 *  Will only call <each> on methods accepted by <filter>.
 *  If <forceProlog> is not true then the prolog and epilog emiters
 *  will be called only if there is at least one method that passes
 *  the filter.
 *)
const somMD_SOMTEmitC_somtScanMethods = '::SOMTEmitC::somtScanMethods';
function SOMTEmitC_somtScanMethods(somSelf: SOMTEmitC;
  filter, prolog, each, epilog: CORBAString;
  forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanConstants
 *)
type
  somTP_SOMTEmitC_somtScanConstants = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanConstants = somTP_SOMTEmitC_somtScanConstants;
const somMD_SOMTEmitC_somtScanConstants = '::SOMTEmitC::somtScanConstants';
function SOMTEmitC_somtScanConstants(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanTypedefs
 *)
type
  somTP_SOMTEmitC_somtScanTypedefs = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanTypedefs = somTP_SOMTEmitC_somtScanTypedefs;
const somMD_SOMTEmitC_somtScanTypedefs = '::SOMTEmitC::somtScanTypedefs';
function SOMTEmitC_somtScanTypedefs(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanStructs
 *)
type
  somTP_SOMTEmitC_somtScanStructs = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanStructs = somTP_SOMTEmitC_somtScanStructs;
const somMD_SOMTEmitC_somtScanStructs = '::SOMTEmitC::somtScanStructs';
function SOMTEmitC_somtScanStructs(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanUnions
 *)
type
  somTP_SOMTEmitC_somtScanUnions = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanUnions = somTP_SOMTEmitC_somtScanUnions;
const somMD_SOMTEmitC_somtScanUnions = '::SOMTEmitC::somtScanUnions';
function SOMTEmitC_somtScanUnions(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanEnums
 *)
type
  somTP_SOMTEmitC_somtScanEnums = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanEnums = somTP_SOMTEmitC_somtScanEnums;
const somMD_SOMTEmitC_somtScanEnums = '::SOMTEmitC::somtScanEnums';
function SOMTEmitC_somtScanEnums(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanData
 *)
type
  somTP_SOMTEmitC_somtScanData = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanData = somTP_SOMTEmitC_somtScanData;
const somMD_SOMTEmitC_somtScanData = '::SOMTEmitC::somtScanData';
function SOMTEmitC_somtScanData(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanAttributes
 *)
type
  somTP_SOMTEmitC_somtScanAttributes = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanAttributes = somTP_SOMTEmitC_somtScanAttributes;
const somMD_SOMTEmitC_somtScanAttributes = '::SOMTEmitC::somtScanAttributes';
function SOMTEmitC_somtScanAttributes(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanInterfaces
 *)
type
  somTP_SOMTEmitC_somtScanInterfaces = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanInterfaces = somTP_SOMTEmitC_somtScanInterfaces;
const somMD_SOMTEmitC_somtScanInterfaces = '::SOMTEmitC::somtScanInterfaces';
function SOMTEmitC_somtScanInterfaces(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanModules
 *)
type
  somTP_SOMTEmitC_somtScanModules = function(somSelf: SOMTEmitC;
		prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanModules = somTP_SOMTEmitC_somtScanModules;
const somMD_SOMTEmitC_somtScanModules = '::SOMTEmitC::somtScanModules';
function SOMTEmitC_somtScanModules(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanPassthru
 *)
type
  somTP_SOMTEmitC_somtScanPassthru = function(somSelf: SOMTEmitC;
		before: CORBABoolean; prolog, each, epilog: CORBAString): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanPassthru = somTP_SOMTEmitC_somtScanPassthru;
const somMD_SOMTEmitC_somtScanPassthru = '::SOMTEmitC::somtScanPassthru';
function SOMTEmitC_somtScanPassthru(somSelf: SOMTEmitC;
  before: CORBABoolean; prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtEmitFullPassthru
 *)
type
  somTP_SOMTEmitC_somtEmitFullPassthru = procedure(somSelf: SOMTEmitC;
		before: CORBABoolean; language: CORBAString); stdcall;
  somTD_SOMTEmitC_somtEmitFullPassthru = somTP_SOMTEmitC_somtEmitFullPassthru;
(*
 *  Emits each passthru section defined for the language and targetType,
 *  and the result of the somtIsBeforePassthru method is equal to the
 *  before parameter.  (before = 1(true), or before = 0(false), i.e. after.)
 *)
const somMD_SOMTEmitC_somtEmitFullPassthru = '::SOMTEmitC::somtEmitFullPassthru';
procedure SOMTEmitC_somtEmitFullPassthru(somSelf: SOMTEmitC;
  before: CORBABoolean; language: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanDataF
 *)
type
  somTP_SOMTEmitC_somtScanDataF = function(somSelf: SOMTEmitC;
		filter, prolog, each, epilog: CORBAString;
		forceProlog: CORBABoolean): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanDataF = somTP_SOMTEmitC_somtScanDataF;
(*
 *  This method is like somtScanData but it also provides a paramater
 *  for a filter method.
 *)
const somMD_SOMTEmitC_somtScanDataF = '::SOMTEmitC::somtScanDataF';
function SOMTEmitC_somtScanDataF(somSelf: SOMTEmitC;
  filter, prolog, each, epilog: CORBAString;
  forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtScanBasesF
 *)
type
  somTP_SOMTEmitC_somtScanBasesF = function(somSelf: SOMTEmitC;
		filter, prolog, each, epilog: CORBAString;
		forceProlog: CORBABoolean): CORBABoolean; stdcall;
  somTD_SOMTEmitC_somtScanBasesF = somTP_SOMTEmitC_somtScanBasesF;
(*
 *  This method is like somtScanBases but it also provides a paramater
 *  for a filter method.
 *)
const somMD_SOMTEmitC_somtScanBasesF = '::SOMTEmitC::somtScanBasesF';
function SOMTEmitC_somtScanBasesF(somSelf: SOMTEmitC;
  filter, prolog, each, epilog: CORBAString;
  forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetGlobalModifierValue
 *)
type
  somTP_SOMTEmitC_somtGetGlobalModifierValue = function(somSelf: SOMTEmitC;
		modifierName: CORBAString): CORBAString; stdcall;
  somTD_SOMTEmitC_somtGetGlobalModifierValue = somTP_SOMTEmitC_somtGetGlobalModifierValue;
(*
 *  Returns the value of the specified global modifier.
 *  Global modifiers are specified when the SOM Compiler is invoked,
 *  via the "-a" option.  For example,
 *                        sc -a"foo=bar"  file.idl
 *  specifies to the SOM Compiler and the emitters being run that
 *  the global modifier "foo" has the value "bar."
 *  Values of global modifiers are transient; they last only for the
 *  duration of the compile for which they were specified.
 *  If a modifier is specified in the "sc" command with no value,
 *  as in
 *                        sc -afoo file.idl
 *  then the result of this method will be non-NULL.
 *  If no such modifier is specified, then the result is NULL.
 *)
const somMD_SOMTEmitC_somtGetGlobalModifierValue = '::SOMTEmitC::somtGetGlobalModifierValue';
function SOMTEmitC_somtGetGlobalModifierValue(somSelf: SOMTEmitC;
  modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstGlobalDefinition
 *)
type
  somTP_SOMTEmitC_somtGetFirstGlobalDefinition = function(somSelf: SOMTEmitC): SOMTEntryC; stdcall;
  somTD_SOMTEmitC_somtGetFirstGlobalDefinition = somTP_SOMTEmitC_somtGetFirstGlobalDefinition;
(*
 *  Returns the first type or constant definition that is not
 *  associated with any interface or module.
 *  These global definitions must be surrounded by the somemittypes
 *  pragmas for them to be visible via this method.
 *  E.g., #pragma somemittypes on
 *        ....
 *        #pragma someemittypes off
 *  The list of global definitions returned by this method and
 *  the somtGetNextGlobalDefinition method may include entries
 *  for forward declarations as well as typedefs and constants.
 *  Global structs and unions are also included in the list.
 *)
const somMD_SOMTEmitC_somtGetFirstGlobalDefinition = '::SOMTEmitC::somtGetFirstGlobalDefinition';
function SOMTEmitC_somtGetFirstGlobalDefinition(somSelf: SOMTEmitC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextGlobalDefinition
 *)
type
  somTP_SOMTEmitC_somtGetNextGlobalDefinition = function(somSelf: SOMTEmitC): SOMTEntryC; stdcall;
  somTD_SOMTEmitC_somtGetNextGlobalDefinition = somTP_SOMTEmitC_somtGetNextGlobalDefinition;
(*
 *  Returns the next type or constant definition that is not
 *  associated with any interface or module, relative to a
 *  previous call to somtGetFirstGlobalDefinition or
 *  somtGetNextGlobalDefinition.
 *)
const somMD_SOMTEmitC_somtGetNextGlobalDefinition = '::SOMTEmitC::somtGetNextGlobalDefinition';
function SOMTEmitC_somtGetNextGlobalDefinition(somSelf: SOMTEmitC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <scmodule.h> (not included in emitters by default, strictly speaking)

(*
 * Define the class name as an object type
 *)
// type
//   SOMTModuleEntryC = SOMTEntryC;

const
  SOMTModuleEntryC_MajorVersion = 2;
  SOMTModuleEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTModuleEntryCNewClass(somtmajorVersion: integer4 = SOMTModuleEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTModuleEntryC_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type SOMTModuleEntryCClassDataStructure = record
	classObject: SOMClass;
	_get_somtOuterModule: somMToken;
	somtGetFirstModuleStruct: somMToken;
	somtGetNextModuleStruct: somMToken;
	somtGetFirstModuleTypedef: somMToken;
	somtGetNextModuleTypedef: somMToken;
	somtGetFirstModuleUnion: somMToken;
	somtGetNextModuleUnion: somMToken;
	somtGetFirstModuleEnum: somMToken;
	somtGetNextModuleEnum: somMToken;
	somtGetFirstModuleConstant: somMToken;
	somtGetNextModuleConstant: somMToken;
	somtGetFirstModuleSequence: somMToken;
	somtGetNextModuleSequence: somMToken;
	somtGetFirstInterface: somMToken;
	somtGetNextInterface: somMToken;
	somtGetFirstModule: somMToken;
	somtGetNextModule: somMToken;
	somtGetFirstModuleDef: somMToken;
	somtGetNextModuleDef: somMToken;
	_get_somtModuleFile: somMToken;
end;
PSOMTModuleEntryCClassDataStructure = ^SOMTModuleEntryCClassDataStructure;
function SOMTModuleEntryCClassData: PSOMTModuleEntryCClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type SOMTModuleEntryCCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
PSOMTModuleEntryCCClassDataStructure = ^SOMTModuleEntryCCClassDataStructure;
function SOMTModuleEntryCCClassData: PSOMTModuleEntryCCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTModuleEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for SOMTModuleEntryC
 *)
function SOMTModuleEntryCNew: SOMTModuleEntryC;
function SOMTModuleEntryCRenew(buf: Pointer): SOMTModuleEntryC;

(*
 * New Method: _get_somtOuterModule
 *)
type
  somTP_SOMTModuleEntryC__get_somtOuterModule = function(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; stdcall;
  somTD_SOMTModuleEntryC__get_somtOuterModule = somTP_SOMTModuleEntryC__get_somtOuterModule;
(*
 *  The module enclosing this module, or NULL if there is none.
 *)
const somMD_SOMTModuleEntryC__get_somtOuterModule = '::SOMTModuleEntryC::_get_somtOuterModule';
function SOMTModuleEntryC__get_somtOuterModule(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somtModuleFile
 *)
type
  somTP_SOMTModuleEntryC__get_somtModuleFile = function(somSelf: SOMTModuleEntryC): CORBAString; stdcall;
  somTD_SOMTModuleEntryC__get_somtModuleFile = somTP_SOMTModuleEntryC__get_somtModuleFile;
(*
 *  The name of the file in which the module appears.
 *)
const somMD_SOMTModuleEntryC__get_somtModuleFile = '::SOMTModuleEntryC::_get_somtModuleFile';
function SOMTModuleEntryC__get_somtModuleFile(somSelf: SOMTModuleEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstModuleStruct
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstModuleStruct = function(somSelf: SOMTModuleEntryC): SOMTStructEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstModuleStruct = somTP_SOMTModuleEntryC_somtGetFirstModuleStruct;
const somMD_SOMTModuleEntryC_somtGetFirstModuleStruct = '::SOMTModuleEntryC::somtGetFirstModuleStruct';
function SOMTModuleEntryC_somtGetFirstModuleStruct(somSelf: SOMTModuleEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModuleStruct
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextModuleStruct = function(somSelf: SOMTModuleEntryC): SOMTStructEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextModuleStruct = somTP_SOMTModuleEntryC_somtGetNextModuleStruct;
const somMD_SOMTModuleEntryC_somtGetNextModuleStruct = '::SOMTModuleEntryC::somtGetNextModuleStruct';
function SOMTModuleEntryC_somtGetNextModuleStruct(somSelf: SOMTModuleEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstModuleTypedef
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstModuleTypedef = function(somSelf: SOMTModuleEntryC): SOMTTypedefEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstModuleTypedef = somTP_SOMTModuleEntryC_somtGetFirstModuleTypedef;
const somMD_SOMTModuleEntryC_somtGetFirstModuleTypedef = '::SOMTModuleEntryC::somtGetFirstModuleTypedef';
function SOMTModuleEntryC_somtGetFirstModuleTypedef(somSelf: SOMTModuleEntryC): SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModuleTypedef
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextModuleTypedef = function(somSelf: SOMTModuleEntryC): SOMTTypedefEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextModuleTypedef = somTP_SOMTModuleEntryC_somtGetNextModuleTypedef;
const somMD_SOMTModuleEntryC_somtGetNextModuleTypedef = '::SOMTModuleEntryC::somtGetNextModuleTypedef';
function SOMTModuleEntryC_somtGetNextModuleTypedef(somSelf: SOMTModuleEntryC): SOMTTypedefEntryC;

(*
 * New Method: somtGetFirstModuleUnion
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstModuleUnion = function(somSelf: SOMTModuleEntryC): SOMTUnionEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstModuleUnion = somTP_SOMTModuleEntryC_somtGetFirstModuleUnion;
const somMD_SOMTModuleEntryC_somtGetFirstModuleUnion = '::SOMTModuleEntryC::somtGetFirstModuleUnion';
function SOMTModuleEntryC_somtGetFirstModuleUnion(somSelf: SOMTModuleEntryC): SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModuleUnion
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextModuleUnion = function(somSelf: SOMTModuleEntryC): SOMTUnionEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextModuleUnion = somTP_SOMTModuleEntryC_somtGetNextModuleUnion;
const somMD_SOMTModuleEntryC_somtGetNextModuleUnion = '::SOMTModuleEntryC::somtGetNextModuleUnion';
function SOMTModuleEntryC_somtGetNextModuleUnion(somSelf: SOMTModuleEntryC): SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstModuleEnum
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstModuleEnum = function(somSelf: SOMTModuleEntryC): SOMTEnumEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstModuleEnum = somTP_SOMTModuleEntryC_somtGetFirstModuleEnum;
const somMD_SOMTModuleEntryC_somtGetFirstModuleEnum = '::SOMTModuleEntryC::somtGetFirstModuleEnum';
function SOMTModuleEntryC_somtGetFirstModuleEnum(somSelf: SOMTModuleEntryC): SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModuleEnum
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextModuleEnum = function(somSelf: SOMTModuleEntryC): SOMTEnumEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextModuleEnum = somTP_SOMTModuleEntryC_somtGetNextModuleEnum;
const somMD_SOMTModuleEntryC_somtGetNextModuleEnum = '::SOMTModuleEntryC::somtGetNextModuleEnum';
function SOMTModuleEntryC_somtGetNextModuleEnum(somSelf: SOMTModuleEntryC): SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstModuleConstant
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstModuleConstant = function(somSelf: SOMTModuleEntryC): SOMTConstEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstModuleConstant = somTP_SOMTModuleEntryC_somtGetFirstModuleConstant;
const somMD_SOMTModuleEntryC_somtGetFirstModuleConstant = '::SOMTModuleEntryC::somtGetFirstModuleConstant';
function SOMTModuleEntryC_somtGetFirstModuleConstant(somSelf: SOMTModuleEntryC): SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModuleConstant
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextModuleConstant = function(somSelf: SOMTModuleEntryC): SOMTConstEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextModuleConstant = somTP_SOMTModuleEntryC_somtGetNextModuleConstant;
const somMD_SOMTModuleEntryC_somtGetNextModuleConstant = '::SOMTModuleEntryC::somtGetNextModuleConstant';
function SOMTModuleEntryC_somtGetNextModuleConstant(somSelf: SOMTModuleEntryC): SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstModuleSequence
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstModuleSequence = function(somSelf: SOMTModuleEntryC): SOMTSequenceEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstModuleSequence = somTP_SOMTModuleEntryC_somtGetFirstModuleSequence;
const somMD_SOMTModuleEntryC_somtGetFirstModuleSequence = '::SOMTModuleEntryC::somtGetFirstModuleSequence';
function SOMTModuleEntryC_somtGetFirstModuleSequence(somSelf: SOMTModuleEntryC): SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModuleSequence
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextModuleSequence = function(somSelf: SOMTModuleEntryC): SOMTSequenceEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextModuleSequence = somTP_SOMTModuleEntryC_somtGetNextModuleSequence;
const somMD_SOMTModuleEntryC_somtGetNextModuleSequence = '::SOMTModuleEntryC::somtGetNextModuleSequence';
function SOMTModuleEntryC_somtGetNextModuleSequence(somSelf: SOMTModuleEntryC): SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstInterface
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstInterface = function(somSelf: SOMTModuleEntryC): SOMTClassEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstInterface = somTP_SOMTModuleEntryC_somtGetFirstInterface;
const somMD_SOMTModuleEntryC_somtGetFirstInterface = '::SOMTModuleEntryC::somtGetFirstInterface';
function SOMTModuleEntryC_somtGetFirstInterface(somSelf: SOMTModuleEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextInterface
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextInterface = function(somSelf: SOMTModuleEntryC): SOMTClassEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextInterface = somTP_SOMTModuleEntryC_somtGetNextInterface;
const somMD_SOMTModuleEntryC_somtGetNextInterface = '::SOMTModuleEntryC::somtGetNextInterface';
function SOMTModuleEntryC_somtGetNextInterface(somSelf: SOMTModuleEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstModule
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstModule = function(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstModule = somTP_SOMTModuleEntryC_somtGetFirstModule;
const somMD_SOMTModuleEntryC_somtGetFirstModule = '::SOMTModuleEntryC::somtGetFirstModule';
function SOMTModuleEntryC_somtGetFirstModule(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModule
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextModule = function(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextModule = somTP_SOMTModuleEntryC_somtGetNextModule;
const somMD_SOMTModuleEntryC_somtGetNextModule = '::SOMTModuleEntryC::somtGetNextModule';
function SOMTModuleEntryC_somtGetNextModule(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetFirstModuleDef
 *)
type
  somTP_SOMTModuleEntryC_somtGetFirstModuleDef = function(somSelf: SOMTModuleEntryC): SOMTEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetFirstModuleDef = somTP_SOMTModuleEntryC_somtGetFirstModuleDef;
const somMD_SOMTModuleEntryC_somtGetFirstModuleDef = '::SOMTModuleEntryC::somtGetFirstModuleDef';
function SOMTModuleEntryC_somtGetFirstModuleDef(somSelf: SOMTModuleEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: somtGetNextModuleDef
 *)
type
  somTP_SOMTModuleEntryC_somtGetNextModuleDef = function(somSelf: SOMTModuleEntryC): SOMTEntryC; stdcall;
  somTD_SOMTModuleEntryC_somtGetNextModuleDef = somTP_SOMTModuleEntryC_somtGetNextModuleDef;
const somMD_SOMTModuleEntryC_somtGetNextModuleDef = '::SOMTModuleEntryC::somtGetNextModuleDef';
function SOMTModuleEntryC_somtGetNextModuleDef(somSelf: SOMTModuleEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}










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

// #include <sctmplt.h>

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

function SOMTTemplateOutputCNew: SOMTTemplateOutputC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTTemplateOutputC;
  if not Assigned(cls) then cls := SOMTTemplateOutputCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTTemplateOutputCRenew(buf: Pointer): SOMTTemplateOutputC;
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

// #include <scentry.h>

function SOMTEntryCNewClass; external SOME_DLL_Name;

var
  SOME_DLL_SOMTEntryCClassData: PSOMTEntryCClassDataStructure;

function SOMTEntryCClassData: PSOMTEntryCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTEntryCClassData) then
    Result := SOME_DLL_SOMTEntryCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTEntryCClassData, 'SOMTEntryCClassData');
    Result := SOME_DLL_SOMTEntryCClassData;
  end;
end;

var
  SOME_DLL_SOMTEntryCCClassData: PSOMTEntryCCClassDataStructure;

function SOMTEntryCCClassData: PSOMTEntryCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTEntryCCClassData) then
    Result := SOME_DLL_SOMTEntryCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTEntryCCClassData, 'SOMTEntryCCClassData');
    Result := SOME_DLL_SOMTEntryCCClassData;
  end;
end;

function _SOMCLASS_SOMTEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTEntryCClassData.classObject;
end;

function SOMTEntryCNew: SOMTEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTEntryC;
  if not Assigned(cls) then cls := SOMTEntryCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTEntryCRenew(buf: Pointer): SOMTEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTEntryC;
  if not Assigned(cls) then cls := SOMTEntryCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTEntryC__get_somtEntryName(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtEntryName
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtEntryName))(somSelf);
end;

procedure SOMTEntryC__set_somtEntryName(somSelf: SOMTEntryC;
  somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  somTD_SOMTEntryC__set_somtEntryName
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtEntryName))
     (somSelf, somtEntryName);
end;

function SOMTEntryC__get_somtElementType(somSelf: SOMTEntryC): SOMTTypes; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtElementType
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtElementType))(somSelf);
end;

procedure SOMTEntryC__set_somtElementType(somSelf: SOMTEntryC;
  somtElementType: SOMTTypes); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  somTD_SOMTEntryC__set_somtElementType
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtElementType))
     (somSelf, somtElementType);
end;

function SOMTEntryC__get_somtElementTypeName(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtElementTypeName
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtElementTypeName))(somSelf);
end;

function SOMTEntryC__get_somtEntryComment(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtEntryComment
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtEntryComment))(somSelf);
end;

function SOMTEntryC__get_somtSourceLineNumber(somSelf: SOMTEntryC): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtSourceLineNumber
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtSourceLineNumber))(somSelf);
end;

function SOMTEntryC__get_somtTypeCode(somSelf: SOMTEntryC): TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtTypeCode
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtTypeCode))(somSelf);
end;

function SOMTEntryC__get_somtIsReference(somSelf: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtIsReference
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtIsReference))(somSelf);
end;

function SOMTEntryC__get_somtIDLScopedName(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtIDLScopedName
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtIDLScopedName))(somSelf);
end;

function SOMTEntryC__get_somtCScopedName(somSelf: SOMTEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC__get_somtCScopedName
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtCScopedName))(somSelf);
end;

function SOMTEntryC_somtGetModifierValue(somSelf: SOMTEntryC;
  modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC_somtGetModifierValue
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetModifierValue))
       (somSelf, modifierName);
end;

function SOMTEntryC_somtGetFirstModifier(somSelf: SOMTEntryC;
  var modifierName, modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC_somtGetFirstModifier
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModifier))
       (somSelf, modifierName, modifierValue);
end;

function SOMTEntryC_somtGetNextModifier(somSelf: SOMTEntryC;
  var modifierName, modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC_somtGetNextModifier
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModifier))
       (somSelf, modifierName, modifierValue);
end;

function SOMTEntryC_somtFormatModifier(somSelf: SOMTEntryC;
  buffer, name, value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC_somtFormatModifier
     (SOM_Resolve(somSelf, cd.classObject, cd.somtFormatModifier))
       (somSelf, buffer, name, value);
end;

function SOMTEntryC_somtGetModifierList(somSelf: SOMTEntryC;
  buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC_somtGetModifierList
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetModifierList))
       (somSelf, buffer);
end;

function SOMTEntryC_somtSetSymbolsOnEntry(somSelf: SOMTEntryC;
  emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  Result :=
    somTD_SOMTEntryC_somtSetSymbolsOnEntry
     (SOM_Resolve(somSelf, cd.classObject, cd.somtSetSymbolsOnEntry))
       (somSelf, emitter, prefix);
end;

procedure SOMTEntryC_somtSetEntryStruct(somSelf: SOMTEntryC; es: PEntry); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEntryCClassDataStructure;
begin
  cd := SOMTEntryCClassData;
  somTD_SOMTEntryC_somtSetEntryStruct
   (SOM_Resolve(somSelf, cd.classObject, cd.somtSetEntryStruct))(somSelf, es);
end;

// #include <scclass.h>

function SOMTClassEntryCNewClass; external SOME_DLL_Name;

var
  SOME_DLL_SOMTClassEntryCClassData: PSOMTClassEntryCClassDataStructure;

function SOMTClassEntryCClassData: PSOMTClassEntryCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTClassEntryCClassData) then
    Result := SOME_DLL_SOMTClassEntryCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTClassEntryCClassData, 'SOMTClassEntryCClassData');
    Result := SOME_DLL_SOMTClassEntryCClassData;
  end;
end;

var
  SOME_DLL_SOMTClassEntryCCClassData: PSOMTClassEntryCCClassDataStructure;

function SOMTClassEntryCCClassData: PSOMTClassEntryCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTClassEntryCCClassData) then
    Result := SOME_DLL_SOMTClassEntryCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTClassEntryCCClassData, 'SOMTClassEntryCCClassData');
    Result := SOME_DLL_SOMTClassEntryCCClassData;
  end;
end;

function _SOMCLASS_SOMTClassEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTClassEntryCClassData.classObject;
end;

function SOMTClassEntryCNew: SOMClassMgr;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTClassEntryC;
  if not Assigned(cls) then cls := SOMTClassEntryCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTClassEntryCRenew(buf: Pointer): SOMClassMgr;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTClassEntryC;
  if not Assigned(cls) then cls := SOMTClassEntryCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTClassEntryC__get_somtSourceFileName(somSelf: SOMTClassEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtSourceFileName
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtSourceFileName))(somSelf);
end;

function SOMTClassEntryC__get_somtMetaClassEntry(somSelf: SOMTClassEntryC): SOMTMetaClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtMetaClassEntry
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtMetaClassEntry))(somSelf);
end;

function SOMTClassEntryC__get_somtClassModule(somSelf: SOMTClassEntryC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtClassModule
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtClassModule))(somSelf);
end;

function SOMTClassEntryC__get_somtNewMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtNewMethodCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtNewMethodCount))(somSelf);
end;

function SOMTClassEntryC__get_somtLocalInclude(somSelf: SOMTClassEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtLocalInclude
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtLocalInclude))(somSelf);
end;

function SOMTClassEntryC__get_somtPrivateMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtPrivateMethodCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtPrivateMethodCount))(somSelf);
end;

function SOMTClassEntryC__get_somtStaticMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtStaticMethodCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtStaticMethodCount))(somSelf);
end;

function SOMTClassEntryC__get_somtOverrideMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtOverrideMethodCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtOverrideMethodCount))(somSelf);
end;

function SOMTClassEntryC__get_somtProcMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtProcMethodCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtProcMethodCount))(somSelf);
end;

function SOMTClassEntryC__get_somtVAMethodCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtVAMethodCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtVAMethodCount))(somSelf);
end;

function SOMTClassEntryC__get_somtBaseCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtBaseCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtBaseCount))(somSelf);
end;

function SOMTClassEntryC__get_somtExternalDataCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtExternalDataCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtExternalDataCount))(somSelf);
end;

function SOMTClassEntryC__get_somtPublicDataCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtPublicDataCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtPublicDataCount))(somSelf);
end;

function SOMTClassEntryC__get_somtPrivateDataCount(somSelf: SOMTClassEntryC): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtPrivateDataCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtPrivateDataCount))(somSelf);
end;

function SOMTClassEntryC__get_somtMetaclassFor(somSelf: SOMTClassEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtMetaclassFor
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtMetaclassFor))(somSelf);
end;

function SOMTClassEntryC__get_somtForwardRef(somSelf: SOMTClassEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC__get_somtForwardRef
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtForwardRef))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstBaseClass(somSelf: SOMTClassEntryC): SOMTBaseClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstBaseClass
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstBaseClass))(somSelf);
end;

function SOMTClassEntryC_somtGetNextBaseClass(somSelf: SOMTClassEntryC): SOMTBaseClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextBaseClass
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextBaseClass))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstReleaseName(somSelf: SOMTClassEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstReleaseName
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstReleaseName))(somSelf);
end;

function SOMTClassEntryC_somtGetNextReleaseName(somSelf: SOMTClassEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextReleaseName
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextReleaseName))(somSelf);
end;

function SOMTClassEntryC_somtGetReleaseNameList(somSelf: SOMTClassEntryC;
  buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetReleaseNameList
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetReleaseNameList))
       (somSelf, buffer);
end;

function SOMTClassEntryC_somtGetFirstPassthru(somSelf: SOMTClassEntryC): SOMTPassthruEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstPassthru
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstPassthru))(somSelf);
end;

function SOMTClassEntryC_somtGetNextPassthru(somSelf: SOMTClassEntryC): SOMTPassthruEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextPassthru
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextPassthru))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstData(somSelf: SOMTClassEntryC): SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstData
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstData))(somSelf);
end;

function SOMTClassEntryC_somtGetNextData(somSelf: SOMTClassEntryC): SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextData
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextData))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstStaticData(somSelf: SOMTClassEntryC): SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstStaticData
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstStaticData))(somSelf);
end;

function SOMTClassEntryC_somtGetNextStaticData(somSelf: SOMTClassEntryC): SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextStaticData
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextStaticData))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstMethod(somSelf: SOMTClassEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstMethod))(somSelf);
end;

function SOMTClassEntryC_somtGetNextMethod(somSelf: SOMTClassEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextMethod))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstInheritedMethod(somSelf: SOMTClassEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstInheritedMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstInheritedMethod))(somSelf);
end;

function SOMTClassEntryC_somtGetNextInheritedMethod(somSelf: SOMTClassEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextInheritedMethod
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextInheritedMethod))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstAttribute(somSelf: SOMTClassEntryC): SOMTAttributeEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstAttribute
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstAttribute))(somSelf);
end;

function SOMTClassEntryC_somtGetNextAttribute(somSelf: SOMTClassEntryC): SOMTAttributeEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextAttribute
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextAttribute))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstStruct(somSelf: SOMTClassEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstStruct
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstStruct))(somSelf);
end;

function SOMTClassEntryC_somtGetNextStruct(somSelf: SOMTClassEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextStruct
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextStruct))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstTypedef(somSelf: SOMTClassEntryC): SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstTypedef
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstTypedef))(somSelf);
end;

function SOMTClassEntryC_somtGetNextTypedef(somSelf: SOMTClassEntryC): SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextTypedef
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextTypedef))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstUnion(somSelf: SOMTClassEntryC): SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstUnion
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstUnion))(somSelf);
end;

function SOMTClassEntryC_somtGetNextUnion(somSelf: SOMTClassEntryC): SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextUnion
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextUnion))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstEnum(somSelf: SOMTClassEntryC): SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstEnum
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstEnum))(somSelf);
end;

function SOMTClassEntryC_somtGetNextEnum(somSelf: SOMTClassEntryC): SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextEnum
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextEnum))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstConstant(somSelf: SOMTClassEntryC): SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstConstant
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstConstant))(somSelf);
end;

function SOMTClassEntryC_somtGetNextConstant(somSelf: SOMTClassEntryC): SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextConstant
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextConstant))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstSequence(somSelf: SOMTClassEntryC): SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstSequence
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstSequence))(somSelf);
end;

function SOMTClassEntryC_somtGetNextSequence(somSelf: SOMTClassEntryC): SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextSequence
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextSequence))(somSelf);
end;

function SOMTClassEntryC_somtGetFirstPubdef(somSelf: SOMTClassEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetFirstPubdef
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstPubdef))(somSelf);
end;

function SOMTClassEntryC_somtGetNextPubdef(somSelf: SOMTClassEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtGetNextPubdef
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextPubdef))(somSelf);
end;

function SOMTClassEntryC_somtFilterNew(somSelf: SOMTClassEntryC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtFilterNew
     (SOM_Resolve(somSelf, cd.classObject, cd.somtFilterNew))(somSelf, entry);
end;

function SOMTClassEntryC_somtFilterOverridden(somSelf: SOMTClassEntryC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtFilterOverridden
     (SOM_Resolve(somSelf, cd.classObject, cd.somtFilterOverridden))(somSelf, entry);
end;

function SOMTClassEntryC_somtFilterPrivOrPub(somSelf: SOMTClassEntryC;
  entry: SOMTCommonEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTClassEntryCClassDataStructure;
begin
  cd := SOMTClassEntryCClassData;
  Result :=
    somTD_SOMTClassEntryC_somtFilterPrivOrPub
     (SOM_Resolve(somSelf, cd.classObject, cd.somtFilterPrivOrPub))(somSelf, entry);
end;

// #include <scmeta.h>

function SOMTMetaClassEntryCNewClass; external SOME_DLL_Name;

var
  SOME_DLL_SOMTMetaClassEntryCClassData: PSOMTMetaClassEntryCClassDataStructure;

function SOMTMetaClassEntryCClassData: PSOMTMetaClassEntryCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTMetaClassEntryCClassData) then
    Result := SOME_DLL_SOMTMetaClassEntryCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTMetaClassEntryCClassData, 'SOMTMetaClassEntryCClassData');
    Result := SOME_DLL_SOMTMetaClassEntryCClassData;
  end;
end;

var
  SOME_DLL_SOMTMetaClassEntryCCClassData: PSOMTMetaClassEntryCCClassDataStructure;

function SOMTMetaClassEntryCCClassData: PSOMTMetaClassEntryCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTMetaClassEntryCCClassData) then
    Result := SOME_DLL_SOMTMetaClassEntryCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTMetaClassEntryCCClassData, 'SOMTMetaClassEntryCCClassData');
    Result := SOME_DLL_SOMTMetaClassEntryCCClassData;
  end;
end;

function _SOMCLASS_SOMTMetaClassEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTMetaClassEntryCClassData.classObject;
end;

function SOMTMetaClassEntryCNew: SOMTMetaClassEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTMetaClassEntryC;
  if not Assigned(cls) then cls := SOMTMetaClassEntryCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTMetaClassEntryCRenew(buf: Pointer): SOMTMetaClassEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTMetaClassEntryC;
  if not Assigned(cls) then cls := SOMTMetaClassEntryCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTMetaClassEntryC__get_somtMetaFile(somSelf: SOMTMetaClassEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMetaClassEntryCClassDataStructure;
begin
  cd := SOMTMetaClassEntryCClassData;
  Result :=
    somTD_SOMTMetaClassEntryC__get_somtMetaFile
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtMetaFile))(somSelf);
end;

function SOMTMetaClassEntryC__get_somtMetaClassDef(somSelf: SOMTMetaClassEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMetaClassEntryCClassDataStructure;
begin
  cd := SOMTMetaClassEntryCClassData;
  Result :=
    somTD_SOMTMetaClassEntryC__get_somtMetaClassDef
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtMetaClassDef))(somSelf);
end;

// #include <sccommon.h>

function SOMTCommonEntryCNewClass; external SOME_DLL_Name;

var
  SOME_DLL_SOMTCommonEntryCClassData: PSOMTCommonEntryCClassDataStructure;

function SOMTCommonEntryCClassData: PSOMTCommonEntryCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTCommonEntryCClassData) then
    Result := SOME_DLL_SOMTCommonEntryCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTCommonEntryCClassData, 'SOMTCommonEntryCClassData');
    Result := SOME_DLL_SOMTCommonEntryCClassData;
  end;
end;

var
  SOME_DLL_SOMTCommonEntryCCClassData: PSOMTCommonEntryCCClassDataStructure;

function SOMTCommonEntryCCClassData: PSOMTCommonEntryCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTCommonEntryCCClassData) then
    Result := SOME_DLL_SOMTCommonEntryCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTCommonEntryCCClassData, 'SOMTCommonEntryCCClassData');
    Result := SOME_DLL_SOMTCommonEntryCCClassData;
  end;
end;

function _SOMCLASS_SOMTCommonEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTCommonEntryCClassData.classObject;
end;

function SOMTCommonEntryCNew: SOMTCommonEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTCommonEntryC;
  if not Assigned(cls) then cls := SOMTCommonEntryCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTCommonEntryCRenew(buf: Pointer): SOMTCommonEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTCommonEntryC;
  if not Assigned(cls) then cls := SOMTCommonEntryCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTCommonEntryC__get_somtTypeObj(somSelf: SOMTCommonEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC__get_somtTypeObj
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtTypeObj))(somSelf);
end;

function SOMTCommonEntryC__get_somtPtrs(somSelf: SOMTCommonEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC__get_somtPtrs
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtPtrs))(somSelf);
end;

function SOMTCommonEntryC__get_somtArrayDimsString(somSelf: SOMTCommonEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC__get_somtArrayDimsString
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtArrayDimsString))(somSelf);
end;

function SOMTCommonEntryC_somtGetFirstArrayDimension(somSelf: SOMTCommonEntryC): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC_somtGetFirstArrayDimension
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstArrayDimension))(somSelf);
end;

function SOMTCommonEntryC_somtGetNextArrayDimension(somSelf: SOMTCommonEntryC): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC_somtGetNextArrayDimension
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextArrayDimension))(somSelf);
end;

function SOMTCommonEntryC__get_somtSourceText(somSelf: SOMTCommonEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC__get_somtSourceText
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtSourceText))(somSelf);
end;

function SOMTCommonEntryC__get_somtType(somSelf: SOMTCommonEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC__get_somtType
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtType))(somSelf);
end;

function SOMTCommonEntryC__get_somtVisibility(somSelf: SOMTCommonEntryC): somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC__get_somtVisibility
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtVisibility))(somSelf);
end;

function SOMTCommonEntryC_somtIsArray(somSelf: SOMTCommonEntryC;
  out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC_somtIsArray
     (SOM_Resolve(somSelf, cd.classObject, cd.somtIsArray))(somSelf, size);
end;

function SOMTCommonEntryC_somtIsPointer(somSelf: SOMTCommonEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTCommonEntryCClassDataStructure;
begin
  cd := SOMTCommonEntryCClassData;
  Result :=
    somTD_SOMTCommonEntryC_somtIsPointer
     (SOM_Resolve(somSelf, cd.classObject, cd.somtIsPointer))(somSelf);
end;

// #include <scmethod.h>

function SOMTMethodEntryCNewClass; external SOME_DLL_Name;

var
  SOME_DLL_SOMTMethodEntryCClassData: PSOMTMethodEntryCClassDataStructure;

function SOMTMethodEntryCClassData: PSOMTMethodEntryCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTMethodEntryCClassData) then
    Result := SOME_DLL_SOMTMethodEntryCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTMethodEntryCClassData, 'SOMTMethodEntryCClassData');
    Result := SOME_DLL_SOMTMethodEntryCClassData;
  end;
end;

var
  SOME_DLL_SOMTMethodEntryCCClassData: PSOMTMethodEntryCCClassDataStructure;

function SOMTMethodEntryCCClassData: PSOMTMethodEntryCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTMethodEntryCCClassData) then
    Result := SOME_DLL_SOMTMethodEntryCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTMethodEntryCCClassData, 'SOMTMethodEntryCCClassData');
    Result := SOME_DLL_SOMTMethodEntryCCClassData;
  end;
end;

function _SOMCLASS_SOMTMethodEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTMethodEntryCClassData.classObject;
end;

function SOMTMethodEntryCNew: SOMTMethodEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTMethodEntryC;
  if not Assigned(cls) then cls := SOMTMethodEntryCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTMethodEntryCRenew(buf: Pointer): SOMTMethodEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTMethodEntryC;
  if not Assigned(cls) then cls := SOMTMethodEntryCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTMethodEntryC__get_somtIsVarargs(somSelf: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtIsVarargs
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtIsVarargs))(somSelf);
end;

function SOMTMethodEntryC__get_somtOriginalMethod(somSelf: SOMTMethodEntryC): SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtOriginalMethod
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtOriginalMethod))(somSelf);
end;

function SOMTMethodEntryC__get_somtOriginalClass(somSelf: SOMTMethodEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtOriginalClass
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtOriginalClass))(somSelf);
end;

function SOMTMethodEntryC__get_somtMethodGroup(somSelf: SOMTMethodEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtMethodGroup
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtMethodGroup))(somSelf);
end;

function SOMTMethodEntryC__get_somtIsPrivateMethod(somSelf: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtIsPrivateMethod
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtIsPrivateMethod))(somSelf);
end;

function SOMTMethodEntryC__get_somtIsOneway(somSelf: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtIsOneway
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtIsOneway))(somSelf);
end;

function SOMTMethodEntryC__get_somtArgCount(somSelf: SOMTMethodEntryC): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtArgCount
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtArgCount))(somSelf);
end;

function SOMTMethodEntryC_somtGetFirstParameter(somSelf: SOMTMethodEntryC): SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetFirstParameter
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstParameter))(somSelf);
end;

function SOMTMethodEntryC_somtGetNextParameter(somSelf: SOMTMethodEntryC): SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetNextParameter
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextParameter))(somSelf);
end;

function SOMTMethodEntryC_somtGetIDLParamList(somSelf: SOMTMethodEntryC;
  buffer: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetIDLParamList
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetIDLParamList))
       (somSelf, buffer);
end;

function SOMTMethodEntryC_somtGetShortCParamList(somSelf: SOMTMethodEntryC;
  buffer, selfParm, varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetShortCParamList
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetShortCParamList))
       (somSelf, buffer, selfParm, varargsParm);
end;

function SOMTMethodEntryC_somtGetFullCParamList(somSelf: SOMTMethodEntryC;
  buffer, varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetFullCParamList
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFullCParamList))
       (somSelf, buffer, varargsParm);
end;

function SOMTMethodEntryC_somtGetShortParamNameList(somSelf: SOMTMethodEntryC;
  buffer, selfParm, varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetShortParamNameList
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetShortParamNameList))
       (somSelf, buffer, selfParm, varargsParm);
end;

function SOMTMethodEntryC_somtGetFullParamNameList(somSelf: SOMTMethodEntryC;
  buffer, varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetFullParamNameList
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFullParamNameList))
       (somSelf, buffer, varargsParm);
end;

function SOMTMethodEntryC_somtGetNthParameter(somSelf: SOMTMethodEntryC;
  n: SmallInt): SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetNthParameter
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNthParameter))(somSelf, n);
end;

function SOMTMethodEntryC_somtGetFirstException(somSelf: SOMTMethodEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetFirstException
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstException))(somSelf);
end;

function SOMTMethodEntryC_somtGetNextException(somSelf: SOMTMethodEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC_somtGetNextException
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextException))(somSelf);
end;

function SOMTMethodEntryC__get_somtContextArray(somSelf: SOMTMethodEntryC): PCORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtContextArray
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtContextArray))(somSelf);
end;

function SOMTMethodEntryC__get_somtCReturnType(somSelf: SOMTMethodEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTMethodEntryCClassDataStructure;
begin
  cd := SOMTMethodEntryCClassData;
  Result :=
    somTD_SOMTMethodEntryC__get_somtCReturnType
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtCReturnType))(somSelf);
end;

// #include <scpass.h>

function SOMTPassthruEntryCNewClass; external SOME_DLL_Name;

var
  SOME_DLL_SOMTPassthruEntryCClassData: PSOMTPassthruEntryCClassDataStructure;

function SOMTPassthruEntryCClassData: PSOMTPassthruEntryCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTPassthruEntryCClassData) then
    Result := SOME_DLL_SOMTPassthruEntryCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTPassthruEntryCClassData, 'SOMTPassthruEntryCClassData');
    Result := SOME_DLL_SOMTPassthruEntryCClassData;
  end;
end;

var
  SOME_DLL_SOMTPassthruEntryCCClassData: PSOMTPassthruEntryCCClassDataStructure;

function SOMTPassthruEntryCCClassData: PSOMTPassthruEntryCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTPassthruEntryCCClassData) then
    Result := SOME_DLL_SOMTPassthruEntryCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTPassthruEntryCCClassData, 'SOMTPassthruEntryCCClassData');
    Result := SOME_DLL_SOMTPassthruEntryCCClassData;
  end;
end;

function _SOMCLASS_SOMTPassthruEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTPassthruEntryCClassData.classObject;
end;

function SOMTPassthruEntryCNew: SOMTPassthruEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTPassthruEntryC;
  if not Assigned(cls) then cls := SOMTPassthruEntryCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTPassthruEntryCRenew(buf: Pointer): SOMTPassthruEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTPassthruEntryC;
  if not Assigned(cls) then cls := SOMTPassthruEntryCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTPassthruEntryC__get_somtPassthruBody(somSelf: SOMTPassthruEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTPassthruEntryCClassDataStructure;
begin
  cd := SOMTPassthruEntryCClassData;
  Result :=
    somTD_SOMTPassthruEntryC__get_somtPassthruBody
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtPassthruBody))(somSelf);
end;

function SOMTPassthruEntryC__get_somtPassthruLanguage(somSelf: SOMTPassthruEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTPassthruEntryCClassDataStructure;
begin
  cd := SOMTPassthruEntryCClassData;
  Result :=
    somTD_SOMTPassthruEntryC__get_somtPassthruLanguage
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtPassthruLanguage))(somSelf);
end;

function SOMTPassthruEntryC__get_somtPassthruTarget(somSelf: SOMTPassthruEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTPassthruEntryCClassDataStructure;
begin
  cd := SOMTPassthruEntryCClassData;
  Result :=
    somTD_SOMTPassthruEntryC__get_somtPassthruTarget
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtPassthruTarget))(somSelf);
end;

function SOMTPassthruEntryC_somtIsBeforePassthru(somSelf: SOMTPassthruEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTPassthruEntryCClassDataStructure;
begin
  cd := SOMTPassthruEntryCClassData;
  Result :=
    somTD_SOMTPassthruEntryC_somtIsBeforePassthru
     (SOM_Resolve(somSelf, cd.classObject, cd.somtIsBeforePassthru))(somSelf);
end;

// #include <scemit.h>

function SOMTEmitCNewClass; external SOME_DLL_Name;

var
  SOME_DLL_SOMTEmitCClassData: PSOMTEmitCClassDataStructure;

function SOMTEmitCClassData: PSOMTEmitCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTEmitCClassData) then
    Result := SOME_DLL_SOMTEmitCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTEmitCClassData, 'SOMTEmitCClassData');
    Result := SOME_DLL_SOMTEmitCClassData;
  end;
end;

var
  SOME_DLL_SOMTEmitCCClassData: PSOMTEmitCCClassDataStructure;

function SOMTEmitCCClassData: PSOMTEmitCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTEmitCCClassData) then
    Result := SOME_DLL_SOMTEmitCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTEmitCCClassData, 'SOMTEmitCCClassData');
    Result := SOME_DLL_SOMTEmitCCClassData;
  end;
end;

function _SOMCLASS_SOMTEmitC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTEmitCClassData.classObject;
end;

function SOMTEmitCNew: SOMTEmitC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTEmitC;
  if not Assigned(cls) then cls := SOMTEmitCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTEmitCRenew(buf: Pointer): SOMTEmitC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTEmitC;
  if not Assigned(cls) then cls := SOMTEmitCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTEmitC__get_somtTemplate(somSelf: SOMTEmitC): SOMTTemplateOutputC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC__get_somtTemplate
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtTemplate))(somSelf);
end;

procedure SOMTEmitC__set_somtTemplate(somSelf: SOMTEmitC;
  somtTemplate: SOMTTemplateOutputC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC__set_somtTemplate
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtTemplate))
     (somSelf, somtTemplate);
end;

function SOMTEmitC__get_somtTargetFile(somSelf: SOMTEmitC): PFILE; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC__get_somtTargetFile
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtTargetFile))(somSelf);
end;

procedure SOMTEmitC__set_somtTargetFile(somSelf: SOMTEmitC;
  somtTargetFile: PFILE); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC__set_somtTargetFile
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtTargetFile))
     (somSelf, somtTargetFile);
end;

function SOMTEmitC__get_somtTargetClass(somSelf: SOMTEmitC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC__get_somtTargetClass
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtTargetClass))(somSelf);
end;

procedure SOMTEmitC__set_somtTargetClass(somSelf: SOMTEmitC;
  somtTargetClass: SOMTClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC__set_somtTargetClass
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtTargetClass))
     (somSelf, somtTargetClass);
end;

function SOMTEmitC__get_somtTargetModule(somSelf: SOMTEmitC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC__get_somtTargetModule
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtTargetModule))(somSelf);
end;

procedure SOMTEmitC__set_somtTargetModule(somSelf: SOMTEmitC;
  somtTargetModule: SOMTModuleEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC__set_somtTargetModule
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtTargetModule))
     (somSelf, somtTargetModule);
end;

function SOMTEmitC__get_somtTargetType(somSelf: SOMTEmitC): SOMTTargetTypeT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC__get_somtTargetType
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtTargetType))(somSelf);
end;

procedure SOMTEmitC__set_somtTargetType(somSelf: SOMTEmitC;
  somtTargetType: SOMTTargetTypeT); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC__set_somtTargetType
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtTargetType))
     (somSelf, somtTargetType);
end;

function SOMTEmitC__get_somtEmitterName(somSelf: SOMTEmitC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC__get_somtEmitterName
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtEmitterName))(somSelf);
end;

procedure SOMTEmitC__set_somtEmitterName(somSelf: SOMTEmitC;
  somtEmitterName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC__set_somtEmitterName
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somtEmitterName))
     (somSelf, somtEmitterName);
end;

function SOMTEmitC_somtGenerateSections(somSelf: SOMTEmitC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtGenerateSections
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGenerateSections))(somSelf);
end;

function SOMTEmitC_somtOpenSymbolsFile(somSelf: SOMTEmitC;
  fileName, mode: CORBAString): PFILE; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtOpenSymbolsFile
     (SOM_Resolve(somSelf, cd.classObject, cd.somtOpenSymbolsFile))
       (somSelf, fileName, mode);
end;

procedure SOMTEmitC_somtSetPredefinedSymbols(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtSetPredefinedSymbols
   (SOM_Resolve(somSelf, cd.classObject, cd.somtSetPredefinedSymbols))(somSelf);
end;

procedure SOMTEmitC_somtFileSymbols(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtFileSymbols
   (SOM_Resolve(somSelf, cd.classObject, cd.somtFileSymbols))(somSelf);
end;

procedure SOMTEmitC_somtEmitProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitBaseIncludesProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitBaseIncludesProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitBaseIncludesProlog))
     (somSelf);
end;

procedure SOMTEmitC_somtEmitBaseIncludes(somSelf: SOMTEmitC;
  base: SOMTBaseClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitBaseIncludes
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitBaseIncludes))
     (somSelf, base);
end;

procedure SOMTEmitC_somtEmitBaseIncludesEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitBaseIncludesEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitBaseIncludesEpilog))
     (somSelf);
end;

procedure SOMTEmitC_somtEmitMetaInclude(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitMetaInclude
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitMetaInclude))(somSelf);
end;

procedure SOMTEmitC_somtEmitClass(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitClass
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitClass))(somSelf);
end;

procedure SOMTEmitC_somtEmitMeta(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitMeta
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitMeta))(somSelf);
end;

procedure SOMTEmitC_somtEmitBaseProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitBaseProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitBaseProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitBase(somSelf: SOMTEmitC;
  base: SOMTBaseClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitBase
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitBase))(somSelf, base);
end;

procedure SOMTEmitC_somtEmitBaseEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitBaseEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitBaseEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitPassthruProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitPassthruProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitPassthruProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitPassthru(somSelf: SOMTEmitC;
  entry: SOMTPassthruEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitPassthru
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitPassthru))(somSelf, entry);
end;

procedure SOMTEmitC_somtEmitPassthruEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitPassthruEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitPassthruEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitRelease(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitRelease
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitRelease))(somSelf);
end;

procedure SOMTEmitC_somtEmitDataProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitDataProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitDataProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitData(somSelf: SOMTEmitC;
  entry: SOMTDataEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitData
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitData))(somSelf, entry);
end;

procedure SOMTEmitC_somtEmitDataEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitDataEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitDataEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitAttributeProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitAttributeProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitAttributeProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitAttribute(somSelf: SOMTEmitC;
  att: SOMTAttributeEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitAttribute
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitAttribute))(somSelf, att);
end;

procedure SOMTEmitC_somtEmitAttributeEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitAttributeEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitAttributeEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitConstantProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitConstantProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitConstantProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitConstant(somSelf: SOMTEmitC;
  con: SOMTConstEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitConstant
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitConstant))(somSelf, con);
end;

procedure SOMTEmitC_somtEmitConstantEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitConstantEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitConstantEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitTypedefProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitTypedefProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitTypedefProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitTypedef(somSelf: SOMTEmitC;
  td: SOMTTypedefEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitTypedef
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitTypedef))(somSelf, td);
end;

procedure SOMTEmitC_somtEmitTypedefEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitTypedefEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitTypedefEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitStructProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitStructProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitStructProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitStruct(somSelf: SOMTEmitC;
  struc: SOMTStructEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitStruct
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitStruct))(somSelf, struc);
end;

procedure SOMTEmitC_somtEmitStructEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitStructEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitStructEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitUnionProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitUnionProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitUnionProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitUnion(somSelf: SOMTEmitC;
  un: SOMTUnionEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitUnion
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitUnion))(somSelf, un);
end;

procedure SOMTEmitC_somtEmitUnionEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitUnionEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitUnionEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitEnumProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitEnumProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitEnumProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitEnum(somSelf: SOMTEmitC;
  en: SOMTEnumEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitEnum
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitEnum))(somSelf, en);
end;

procedure SOMTEmitC_somtEmitEnumEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitEnumEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitEnumEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitInterfaceProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitInterfaceProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitInterfaceProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitInterface(somSelf: SOMTEmitC;
  intfc: SOMTClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitInterface
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitInterface))(somSelf, intfc);
end;

procedure SOMTEmitC_somtEmitInterfaceEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitInterfaceEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitInterfaceEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitModuleProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitModuleProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitModuleProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitModule(somSelf: SOMTEmitC;
  module: SOMTModuleEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitModule
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitModule))(somSelf, module);
end;

procedure SOMTEmitC_somtEmitModuleEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitModuleEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitModuleEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitMethodsProlog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitMethodsProlog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitMethodsProlog))(somSelf);
end;

procedure SOMTEmitC_somtEmitMethods(somSelf: SOMTEmitC;
  method: SOMTMethodEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitMethods
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitMethods))(somSelf, method);
end;

procedure SOMTEmitC_somtEmitMethodsEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitMethodsEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitMethodsEpilog))(somSelf);
end;

procedure SOMTEmitC_somtEmitMethod(somSelf: SOMTEmitC;
  method: SOMTMethodEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitMethod
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitMethod))(somSelf, method);
end;

procedure SOMTEmitC_somtEmitEpilog(somSelf: SOMTEmitC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitEpilog
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitEpilog))(somSelf);
end;

function SOMTEmitC_somtScanBases(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanBases
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanBases))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtCheckVisibility(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtCheckVisibility
     (SOM_Resolve(somSelf, cd.classObject, cd.somtCheckVisibility))
       (somSelf, entry);
end;

function SOMTEmitC_somtNew(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtNew
     (SOM_Resolve(somSelf, cd.classObject, cd.somtNew))(somSelf, entry);
end;

function SOMTEmitC_somtImplemented(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtImplemented
     (SOM_Resolve(somSelf, cd.classObject, cd.somtImplemented))(somSelf, entry);
end;

function SOMTEmitC_somtOverridden(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtOverridden
     (SOM_Resolve(somSelf, cd.classObject, cd.somtOverridden))(somSelf, entry);
end;

function SOMTEmitC_somtInherited(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtInherited
     (SOM_Resolve(somSelf, cd.classObject, cd.somtInherited))(somSelf, entry);
end;

function SOMTEmitC_somtAllVisible(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtAllVisible
     (SOM_Resolve(somSelf, cd.classObject, cd.somtAllVisible))(somSelf, entry);
end;

function SOMTEmitC_somtAll(somSelf: SOMTEmitC;
  entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtAll
     (SOM_Resolve(somSelf, cd.classObject, cd.somtAll))(somSelf, entry);
end;

function SOMTEmitC_somtNewNoProc(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtNewNoProc
     (SOM_Resolve(somSelf, cd.classObject, cd.somtNewNoProc))(somSelf, entry);
end;

function SOMTEmitC_somtPrivOrPub(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtPrivOrPub
     (SOM_Resolve(somSelf, cd.classObject, cd.somtPrivOrPub))(somSelf, entry);
end;

function SOMTEmitC_somtNewProc(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtNewProc
     (SOM_Resolve(somSelf, cd.classObject, cd.somtNewProc))(somSelf, entry);
end;

function SOMTEmitC_somtLink(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtLink
     (SOM_Resolve(somSelf, cd.classObject, cd.somtLink))(somSelf, entry);
end;

function SOMTEmitC_somtVA(somSelf: SOMTEmitC;
  entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtVA
     (SOM_Resolve(somSelf, cd.classObject, cd.somtVA))(somSelf, entry);
end;

function SOMTEmitC_somtScanMethods(somSelf: SOMTEmitC;
  filter, prolog, each, epilog: CORBAString;
  forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanMethods
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanMethods))
       (somSelf, filter, prolog, each, epilog, forceProlog);
end;

function SOMTEmitC_somtScanConstants(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanConstants
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanConstants))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanTypedefs(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanTypedefs
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanTypedefs))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanStructs(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanStructs
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanStructs))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanUnions(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanUnions
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanUnions))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanEnums(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanEnums
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanEnums))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanData(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanData
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanData))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanAttributes(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanAttributes
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanAttributes))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanInterfaces(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanInterfaces
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanInterfaces))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanModules(somSelf: SOMTEmitC;
  prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanModules
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanModules))
       (somSelf, prolog, each, epilog);
end;

function SOMTEmitC_somtScanPassthru(somSelf: SOMTEmitC;
  before: CORBABoolean; prolog, each, epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanPassthru
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanPassthru))
       (somSelf, before, prolog, each, epilog);
end;

procedure SOMTEmitC_somtEmitFullPassthru(somSelf: SOMTEmitC;
  before: CORBABoolean; language: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  somTD_SOMTEmitC_somtEmitFullPassthru
   (SOM_Resolve(somSelf, cd.classObject, cd.somtEmitFullPassthru))
     (somSelf, before, language);
end;

function SOMTEmitC_somtScanDataF(somSelf: SOMTEmitC;
  filter, prolog, each, epilog: CORBAString;
  forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanDataF
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanDataF))
       (somSelf, filter, prolog, each, epilog, forceProlog);
end;

function SOMTEmitC_somtScanBasesF(somSelf: SOMTEmitC;
  filter, prolog, each, epilog: CORBAString;
  forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtScanBasesF
     (SOM_Resolve(somSelf, cd.classObject, cd.somtScanBasesF))
       (somSelf, filter, prolog, each, epilog, forceProlog);
end;

function SOMTEmitC_somtGetGlobalModifierValue(somSelf: SOMTEmitC;
  modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtGetGlobalModifierValue
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetGlobalModifierValue))
       (somSelf, modifierName);
end;

function SOMTEmitC_somtGetFirstGlobalDefinition(somSelf: SOMTEmitC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtGetFirstGlobalDefinition
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstGlobalDefinition))
       (somSelf);
end;

function SOMTEmitC_somtGetNextGlobalDefinition(somSelf: SOMTEmitC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTEmitCClassDataStructure;
begin
  cd := SOMTEmitCClassData;
  Result :=
    somTD_SOMTEmitC_somtGetNextGlobalDefinition
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextGlobalDefinition))
       (somSelf);
end;

// #include <scmodule.h> (not included in emitters by default, strictly speaking)

function SOMTModuleEntryCNewClass; external SOME_DLL_Name;

var
  SOME_DLL_SOMTModuleEntryCClassData: PSOMTModuleEntryCClassDataStructure;

function SOMTModuleEntryCClassData: PSOMTModuleEntryCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTModuleEntryCClassData) then
    Result := SOME_DLL_SOMTModuleEntryCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTModuleEntryCClassData, 'SOMTModuleEntryCClassData');
    Result := SOME_DLL_SOMTModuleEntryCClassData;
  end;
end;

var
  SOME_DLL_SOMTModuleEntryCCClassData: PSOMTModuleEntryCCClassDataStructure;

function SOMTModuleEntryCCClassData: PSOMTModuleEntryCCClassDataStructure;
begin
  if Assigned(SOME_DLL_SOMTModuleEntryCCClassData) then
    Result := SOME_DLL_SOMTModuleEntryCCClassData
  else
  begin
    SOME_Load_Variable(SOME_DLL_SOMTModuleEntryCCClassData, 'SOMTModuleEntryCCClassData');
    Result := SOME_DLL_SOMTModuleEntryCCClassData;
  end;
end;

function _SOMCLASS_SOMTModuleEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTModuleEntryCClassData.classObject;
end;

function SOMTModuleEntryCNew: SOMTModuleEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTModuleEntryC;
  if not Assigned(cls) then cls := SOMTModuleEntryCNewClass;
  Result := SOMClass_somNew(cls);
end;

function SOMTModuleEntryCRenew(buf: Pointer): SOMTModuleEntryC;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_SOMTModuleEntryC;
  if not Assigned(cls) then cls := SOMTModuleEntryCNewClass;
	Result := SOMClass_somRenew(cls, buf);
end;

function SOMTModuleEntryC__get_somtOuterModule(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC__get_somtOuterModule
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtOuterModule))(somSelf);
end;

function SOMTModuleEntryC__get_somtModuleFile(somSelf: SOMTModuleEntryC): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC__get_somtModuleFile
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somtModuleFile))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstModuleStruct(somSelf: SOMTModuleEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstModuleStruct
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModuleStruct))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextModuleStruct(somSelf: SOMTModuleEntryC): SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextModuleStruct
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModuleStruct))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstModuleTypedef(somSelf: SOMTModuleEntryC): SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstModuleTypedef
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModuleTypedef))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextModuleTypedef(somSelf: SOMTModuleEntryC): SOMTTypedefEntryC;
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextModuleTypedef
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModuleTypedef))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstModuleUnion(somSelf: SOMTModuleEntryC): SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstModuleUnion
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModuleUnion))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextModuleUnion(somSelf: SOMTModuleEntryC): SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextModuleUnion
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModuleUnion))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstModuleEnum(somSelf: SOMTModuleEntryC): SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstModuleEnum
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModuleEnum))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextModuleEnum(somSelf: SOMTModuleEntryC): SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextModuleEnum
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModuleEnum))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstModuleConstant(somSelf: SOMTModuleEntryC): SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstModuleConstant
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModuleConstant))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextModuleConstant(somSelf: SOMTModuleEntryC): SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextModuleConstant
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModuleConstant))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstModuleSequence(somSelf: SOMTModuleEntryC): SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstModuleSequence
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModuleSequence))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextModuleSequence(somSelf: SOMTModuleEntryC): SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextModuleSequence
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModuleSequence))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstInterface(somSelf: SOMTModuleEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstInterface
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstInterface))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextInterface(somSelf: SOMTModuleEntryC): SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextInterface
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextInterface))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstModule(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstModule
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModule))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextModule(somSelf: SOMTModuleEntryC): SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextModule
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModule))(somSelf);
end;

function SOMTModuleEntryC_somtGetFirstModuleDef(somSelf: SOMTModuleEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetFirstModuleDef
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetFirstModuleDef))(somSelf);
end;

function SOMTModuleEntryC_somtGetNextModuleDef(somSelf: SOMTModuleEntryC): SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PSOMTModuleEntryCClassDataStructure;
begin
  cd := SOMTModuleEntryCClassData;
  Result :=
    somTD_SOMTModuleEntryC_somtGetNextModuleDef
     (SOM_Resolve(somSelf, cd.classObject, cd.somtGetNextModuleDef))(somSelf);
end;


end.