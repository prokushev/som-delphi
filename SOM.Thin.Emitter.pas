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
//   SOMTParameterEntryC = SOMTCommonEntryC;
  SOMTStructEntryC = SOMTEntryC;
  SOMTUnionEntryC = SOMTEntryC;
  SOMTEnumEntryC = SOMTEntryC;
  SOMTConstEntryC = SOMTEntryC;
  SOMTSequenceEntryC = SOMTEntryC;
//   SOMTStringEntryC = SOMTEntryC;
//   SOMTEnumNameEntryC = SOMTEntryC;
//   SOMTUserDefinedTypeEntryC = SOMTCommonEntryC;

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

end.
