{$WARN UNSAFE_TYPE OFF}

unit SOM.Thin.TypeCodes;

interface

uses
  SOM.DelphiFeatures, SOM.Thin;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

// #include <somtc.h>

(*
 * SOMTC.H
 * Typedefs, structs, & enums in support of CORBA TypeCodes
 * and sequences for use with SOM
 *)

(*
 * Operations supported by TypeCodes
 *
 *)

function tcAlignment(t: TypeCode; ev: PEnvironment): SmallInt; stdcall;
function tcCopy(t: TypeCode; ev: PEnvironment): TypeCode; stdcall;
function tcEqual(x: TypeCode; ev: PEnvironment; y: TypeCode): CORBABoolean; stdcall;
procedure tcFree(t: TypeCode; ev: PEnvironment); stdcall;
// function tcKind(t: TypeCode; ev: PEnvironment): SOM.Thin.TCKind; stdcall; // conflicts with TCKind
function tcParmCount(t: TypeCode; ev: PEnvironment): LongInt; stdcall;
function tcParameter(t: TypeCode; ev: PEnvironment; index: LongInt): any; stdcall;
procedure tcPrint(t: TypeCode; ev: PEnvironment); stdcall;
procedure tcSetAlignment(t: TypeCode; ev: PEnvironment; a: SmallInt); stdcall;
function tcSize(t: TypeCode; ev: PEnvironment): LongInt; stdcall;

function tcSetZeroOriginEnum(t: TypeCode; ev: PEnvironment; value: CORBABoolean): LongInt; stdcall;
function tcGetZeroOriginEnum(t: TypeCode; ev: PEnvironment): CORBABoolean; stdcall;


(*
 * Variable argument sequences for tcNew:
 * (based on CORBA 7.6.1 Table 16 pp 139-140)
 *
 *  char     *interfaceId, *name, *mbrName, *enumId;
 *  char     *structOrUnionName, *typeName, *context;
 *  long     maxLength, length, labelFlag, labelValue;
 *  TypeCode swTC, mbrTC, seqTC, arrayTC, ptrTC;
 *  TCKind   tk_<xxx>;
 *
 *  tcNew (tk_<xxx>);
 *  tcNew (tk_objref interfaceId);
 *  tcNew (tk_string, maxLength);
 *  tcNew (tk_sequence, seqTC, maxLength);
 *  tcNew (tk_array, arrayTC, length);
 *  tcNew (tk_pointer, ptrTC);                     <---[SOM extension]
 *  tcNew (tk_self, structOrUnionName);            <---[SOM extension]
 *  tcNew (tk_foreign, typeName, context, length); <---[SOM extension]
 *
 *  tcNew (tk_struct, name, mbrName, mbrTC, [...,] NULL);
 *      [mbrName & TypeCode repeat as needed]
 *
 *  tcNew (tk_union, name, swTC, 
 *      labelFlag, labelValue, mbrName, mbrTC, [...,] NULL);
 *      [labelFlag, labelValue, mbrName & TypeCode repeat as needed]
 *      labelFlag has the following meanings:
 *	    TCREGULAR_CASE - regular labelValue, cast as a long, follows,
 *	    TCDEFAULT_CASE - default case, with 0L for labelValue follows.
 *
 *  tcNew (tk_enum, name, enumId, [...,] NULL);
 *	[enumId repeats as needed]
 *
 *  NULL is returned if tcNew detects an error or an attempt
 *  to construct an illegal TypeCode
 *
 *  TypeCodes are assigned default alignment attributes appropriate
 *  to their constituent types.  The default alignment associated with
 *  the TypeCode as a whole is the greatest alignment associated with
 *  any of its subordinate TypeCodes or primitive elements.  Note that
 *  alignment information is platform-specific.  Default alignment
 *  information can be overridden using the tcSetAlignment function,
 *  where an argument value of zero means use default alignment,
 *  1 = byte alignment, n = alignment to an address boundary divisible
 *  by n.
 *
 *  TypeCodes created by tcNew do not hold references to any of the
 *  passed strings, which are assumed to be owned by the caller.
 *  This is not the case for the "TypeCode" arguments. They become
 *  directly imbedded in the new TypeCode.  If you need to retain
 *  ownership of passed TypeCodes, pass them using tcCopy.  Note that
 *  TypeCode constants (TC_<xxx>) can be freely passed as arguments to
 *  tcNew without using tcCopy.
 *
 *  All TypeCodes created by tcNew can be freed using tcFree.
 *)
function tcNew(tag: TCKind): TypeCode; cdecl; varargs;

(*  The following special variant on tcNew can be used when the
 *  arguments are not known at compile-time and must be constructed
 *  dynamically as a va_list.
 *)
function tcNewVL(tag: TCKind; ap: va_list): TypeCode; stdcall;

(*
 *  Following constants used with tcNew to create union TypeCodes.
 *  See calling sequences above.
 *)
const
  TCREGULAR_CASE = LongInt(1);
  TCDEFAULT_CASE = LongInt(2);

function tcSequenceNew(t: TypeCode; max: LongWord): PGENERIC_SEQUENCE; stdcall;

type
  _IDL_SEQUENCE_string = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PCORBAString;
  end;
  P_IDL_SEQUENCE_string = ^_IDL_SEQUENCE_string;

function tcSeqFromListString(s: CORBAString): _IDL_SEQUENCE_string; stdcall;

(* CORBA function names for TypeCodes, per CORBA 7.6.1, p.139 *)
function TypeCode_kind(t: TypeCode; ev: PEnvironment): TCKind; stdcall;
function TypeCode_equal(x: TypeCode; ev: PEnvironment; y: TypeCode): CORBABoolean; stdcall;
function TypeCode_param_count(t: TypeCode; ev: PEnvironment): LongInt; stdcall;
function TypeCode_parameter(t: TypeCode; ev: PEnvironment; index: LongInt): any; stdcall;
(*
 *  The following are IBM TypeCode extensions
 *)
function TypeCode_alignment(t: TypeCode; ev: PEnvironment): SmallInt; stdcall;
function TypeCode_copy(t: TypeCode; ev: PEnvironment): TypeCode; stdcall;
procedure TypeCode_free(t: TypeCode; ev: PEnvironment); stdcall;
procedure TypeCode_print(t: TypeCode; ev: PEnvironment); stdcall;
procedure TypeCode_setAlignment(t: TypeCode; ev: PEnvironment; a: SmallInt); stdcall;
function TypeCode_size(t: TypeCode; ev: PEnvironment): LongInt; stdcall;
function TypeCode_setZeroOriginEnum(t: TypeCode; ev: PEnvironment; value: CORBABoolean): LongInt; stdcall;
function TypeCode_getZeroOriginEnum(t: TypeCode; ev: PEnvironment): CORBABoolean; stdcall;

function TypeCodeNew(tag: TCKind): TypeCode; cdecl; varargs;
function TypeCodeNewVL(tag: TCKind; ap: va_list): TypeCode; stdcall;

(* somVaBuf support *)

type
  somVaBuf = type somToken;

function somVaBuf_create(vb: PAnsiChar; size: Integer): somVaBuf; stdcall;
procedure somVaBuf_get_valist(vb: somVaBuf; out ap: va_list); stdcall;
procedure somVaBuf_destroy(vb: somVaBuf); stdcall;
function somVaBuf_add(vb: somVaBuf; arg: PAnsiChar; argType: Integer): LongInt; stdcall;
function somvalistGetTarget(ap: va_list): LongWord; stdcall;
procedure somvalistSetTarget(ap: va_list; val: LongWord); stdcall;

implementation

uses
  SOM.Thin.DLL;

function tcAlignment; external SOMTC_DLL_Name;
function tcCopy; external SOMTC_DLL_Name;
function tcEqual; external SOMTC_DLL_Name;
procedure tcFree; external SOMTC_DLL_Name;
// function tcKind; external SOMTC_DLL_Name;
function tcParmCount; external SOMTC_DLL_Name;
function tcParameter; external SOMTC_DLL_Name;
procedure tcPrint; external SOMTC_DLL_Name;
procedure tcSetAlignment; external SOMTC_DLL_Name;
function tcSize; external SOMTC_DLL_Name;
function tcSetZeroOriginEnum; external SOMTC_DLL_Name;
function tcGetZeroOriginEnum; external SOMTC_DLL_Name;
function tcNew; external SOMTC_DLL_Name;
function tcNewVL; external SOMTC_DLL_Name;
function tcSequenceNew; external SOMTC_DLL_Name;
function tcSeqFromListString; external SOMTC_DLL_Name;
function TypeCode_kind; external SOMTC_DLL_Name name 'tcKind';
function TypeCode_equal; external SOMTC_DLL_Name name 'tcEqual';
function TypeCode_param_count; external SOMTC_DLL_Name name 'tcParmCount';
function TypeCode_parameter; external SOMTC_DLL_Name name 'tcParameter';
function TypeCode_alignment; external SOMTC_DLL_Name name 'tcAlignment';
function TypeCode_copy; external SOMTC_DLL_Name name 'tcCopy';
procedure TypeCode_free; external SOMTC_DLL_Name name 'tcFree';
procedure TypeCode_print; external SOMTC_DLL_Name name 'tcPrint';
procedure TypeCode_setAlignment; external SOMTC_DLL_Name name 'tcSetAlignment';
function TypeCode_size; external SOMTC_DLL_Name name 'tcSize';
function TypeCode_setZeroOriginEnum; external SOMTC_DLL_Name name 'tcSetZeroOriginEnum';
function TypeCode_getZeroOriginEnum; external SOMTC_DLL_Name name 'tcGetZeroOriginEnum';
function TypeCodeNew; external SOMTC_DLL_Name name 'tcNew';
function TypeCodeNewVL; external SOMTC_DLL_Name name 'tcNewVL';
function somVaBuf_create; external SOMTC_DLL_Name;
procedure somVaBuf_get_valist; external SOMTC_DLL_Name;
procedure somVaBuf_destroy; external SOMTC_DLL_Name;
function somVaBuf_add; external SOMTC_DLL_Name;
function somvalistGetTarget; external SOMTC_DLL_Name;
procedure somvalistSetTarget; external SOMTC_DLL_Name;

end.
