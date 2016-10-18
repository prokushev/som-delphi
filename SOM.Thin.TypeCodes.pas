{$WARN UNSAFE_TYPE OFF}

unit SOM.Thin.TypeCodes;

interface

uses
  SOM.DelphiFeatures, SOM.Thin;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

// #include <somtcnst.h>
(*
 * SOMTCNST.H
 * TypeCode constants as defined in CORBA for use with SOM
 *)

(* CORBA 7.6.2, p.141 *)
function TC_null: TypeCode;
function TC_void: TypeCode;
function TC_short: TypeCode;
function TC_long: TypeCode;
function TC_ushort: TypeCode;
function TC_ulong: TypeCode;
function TC_float: TypeCode;
function TC_double: TypeCode;
function TC_boolean: TypeCode;
function TC_char: TypeCode;
function TC_octet: TypeCode;
function TC_any: TypeCode;
function TC_TypeCode: TypeCode;
function TC_Principal: TypeCode;
function TC_Object: TypeCode;
function TC_string: TypeCode;
function TC_NamedValue: TypeCode;
function TC_InterfaceDescription: TypeCode;
function TC_OperationDescription: TypeCode;
function TC_AttributeDescription: TypeCode;
function TC_ParameterDescription: TypeCode;
function TC_RepositoryDescription: TypeCode;
function TC_ModuleDescription: TypeCode;
function TC_ConstDescription: TypeCode;
function TC_ConstantDescription: TypeCode;
function TC_ExceptionDescription: TypeCode;
function TC_TypeDescription: TypeCode;
function TC_FullInterfaceDescription: TypeCode;

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

var
  SOMTC_DLL: System.HMODULE = 0;

procedure SOMTC_Load_Variable(var V_Pointer; const Var_Name: AnsiString);
begin
  if SOMTC_DLL = 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    if SOMTC_DLL = 0 then
      SOMTC_DLL := Windows.LoadLibraryW(SOMTC_DLL_Name);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  if SOMTC_DLL <> 0 then
    Pointer(V_Pointer) := Windows.GetProcAddress(SOMTC_DLL, PAnsiChar(Var_Name));
end;

var
  SOMTC_DLL_TC__null: TypeCode = TypeCode(nil);

function TC_null: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__null) then
    Result := SOMTC_DLL_TC__null
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__null, 'TC__null');
    Result := SOMTC_DLL_TC__null;
  end;
end;

var
  SOMTC_DLL_TC__void: TypeCode = TypeCode(nil);

function TC_void: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__void) then
    Result := SOMTC_DLL_TC__void
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__void, 'TC__void');
    Result := SOMTC_DLL_TC__void;
  end;
end;

var
  SOMTC_DLL_TC__short: TypeCode = TypeCode(nil);

function TC_short: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__short) then
    Result := SOMTC_DLL_TC__short
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__short, 'TC__short');
    Result := SOMTC_DLL_TC__short;
  end;
end;

var
  SOMTC_DLL_TC__long: TypeCode = TypeCode(nil);

function TC_long: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__long) then
    Result := SOMTC_DLL_TC__long
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__long, 'TC__long');
    Result := SOMTC_DLL_TC__long;
  end;
end;

var
  SOMTC_DLL_TC__ushort: TypeCode = TypeCode(nil);

function TC_ushort: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__ushort) then
    Result := SOMTC_DLL_TC__ushort
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__ushort, 'TC__ushort');
    Result := SOMTC_DLL_TC__ushort;
  end;
end;

var
  SOMTC_DLL_TC__ulong: TypeCode = TypeCode(nil);

function TC_ulong: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__ulong) then
    Result := SOMTC_DLL_TC__ulong
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__ulong, 'TC__ulong');
    Result := SOMTC_DLL_TC__ulong;
  end;
end;

var
  SOMTC_DLL_TC__float: TypeCode = TypeCode(nil);

function TC_float: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__float) then
    Result := SOMTC_DLL_TC__float
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__float, 'TC__float');
    Result := SOMTC_DLL_TC__float;
  end;
end;

var
  SOMTC_DLL_TC__double: TypeCode = TypeCode(nil);

function TC_double: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__double) then
    Result := SOMTC_DLL_TC__double
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__double, 'TC__double');
    Result := SOMTC_DLL_TC__double;
  end;
end;

var
  SOMTC_DLL_TC__boolean: TypeCode = TypeCode(nil);

function TC_boolean: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__boolean) then
    Result := SOMTC_DLL_TC__boolean
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__boolean, 'TC__boolean');
    Result := SOMTC_DLL_TC__boolean;
  end;
end;

var
  SOMTC_DLL_TC__char: TypeCode = TypeCode(nil);

function TC_char: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__char) then
    Result := SOMTC_DLL_TC__char
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__char, 'TC__char');
    Result := SOMTC_DLL_TC__char;
  end;
end;

var
  SOMTC_DLL_TC__octet: TypeCode = TypeCode(nil);

function TC_octet: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__octet) then
    Result := SOMTC_DLL_TC__octet
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__octet, 'TC__octet');
    Result := SOMTC_DLL_TC__octet;
  end;
end;

var
  SOMTC_DLL_TC__any: TypeCode = TypeCode(nil);

function TC_any: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__any) then
    Result := SOMTC_DLL_TC__any
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__any, 'TC__any');
    Result := SOMTC_DLL_TC__any;
  end;
end;

var
  SOMTC_DLL_TC__TypeCode: TypeCode = TypeCode(nil);

function TC_TypeCode: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__TypeCode) then
    Result := SOMTC_DLL_TC__TypeCode
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__TypeCode, 'TC__TypeCode');
    Result := SOMTC_DLL_TC__TypeCode;
  end;
end;

var
  SOMTC_DLL_TC__Principal: TypeCode = TypeCode(nil);

function TC_Principal: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__Principal) then
    Result := SOMTC_DLL_TC__Principal
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__Principal, 'TC__Principal');
    Result := SOMTC_DLL_TC__Principal;
  end;
end;

var
  SOMTC_DLL_TC__Object: TypeCode = TypeCode(nil);

function TC_Object: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__Object) then
    Result := SOMTC_DLL_TC__Object
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__Object, 'TC__Object');
    Result := SOMTC_DLL_TC__Object;
  end;
end;

var
  SOMTC_DLL_TC__string: TypeCode = TypeCode(nil);

function TC_string: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__string) then
    Result := SOMTC_DLL_TC__string
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__string, 'TC__string');
    Result := SOMTC_DLL_TC__string;
  end;
end;

var
  SOMTC_DLL_TC__NamedValue: TypeCode = TypeCode(nil);

function TC_NamedValue: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__NamedValue) then
    Result := SOMTC_DLL_TC__NamedValue
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__NamedValue, 'TC__NamedValue');
    Result := SOMTC_DLL_TC__NamedValue;
  end;
end;

var
  SOMTC_DLL_TC__InterfaceDescription: TypeCode = TypeCode(nil);

function TC_InterfaceDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__InterfaceDescription) then
    Result := SOMTC_DLL_TC__InterfaceDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__InterfaceDescription, 'TC__InterfaceDescription');
    Result := SOMTC_DLL_TC__InterfaceDescription;
  end;
end;

var
  SOMTC_DLL_TC__OperationDescription: TypeCode = TypeCode(nil);

function TC_OperationDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__OperationDescription) then
    Result := SOMTC_DLL_TC__OperationDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__OperationDescription, 'TC__OperationDescription');
    Result := SOMTC_DLL_TC__OperationDescription;
  end;
end;

var
  SOMTC_DLL_TC__AttributeDescription: TypeCode = TypeCode(nil);

function TC_AttributeDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__AttributeDescription) then
    Result := SOMTC_DLL_TC__AttributeDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__AttributeDescription, 'TC__AttributeDescription');
    Result := SOMTC_DLL_TC__AttributeDescription;
  end;
end;

var
  SOMTC_DLL_TC__ParameterDescription: TypeCode = TypeCode(nil);

function TC_ParameterDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__ParameterDescription) then
    Result := SOMTC_DLL_TC__ParameterDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__ParameterDescription, 'TC__ParameterDescription');
    Result := SOMTC_DLL_TC__ParameterDescription;
  end;
end;

var
  SOMTC_DLL_TC__RepositoryDescription: TypeCode = TypeCode(nil);

function TC_RepositoryDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__RepositoryDescription) then
    Result := SOMTC_DLL_TC__RepositoryDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__RepositoryDescription, 'TC__RepositoryDescription');
    Result := SOMTC_DLL_TC__RepositoryDescription;
  end;
end;

var
  SOMTC_DLL_TC__ModuleDescription: TypeCode = TypeCode(nil);

function TC_ModuleDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__ModuleDescription) then
    Result := SOMTC_DLL_TC__ModuleDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__ModuleDescription, 'TC__ModuleDescription');
    Result := SOMTC_DLL_TC__ModuleDescription;
  end;
end;

var
  SOMTC_DLL_TC__ConstDescription: TypeCode = TypeCode(nil);

function TC_ConstDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__ConstDescription) then
    Result := SOMTC_DLL_TC__ConstDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__ConstDescription, 'TC__ConstDescription');
    Result := SOMTC_DLL_TC__ConstDescription;
  end;
end;

var
  SOMTC_DLL_TC__ConstantDescription: TypeCode = TypeCode(nil);

function TC_ConstantDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__ConstantDescription) then
    Result := SOMTC_DLL_TC__ConstantDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__ConstantDescription, 'TC__ConstantDescription');
    Result := SOMTC_DLL_TC__ConstantDescription;
  end;
end;

var
  SOMTC_DLL_TC__ExceptionDescription: TypeCode = TypeCode(nil);

function TC_ExceptionDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__ExceptionDescription) then
    Result := SOMTC_DLL_TC__ExceptionDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__ExceptionDescription, 'TC__ExceptionDescription');
    Result := SOMTC_DLL_TC__ExceptionDescription;
  end;
end;

var
  SOMTC_DLL_TC__TypeDescription: TypeCode = TypeCode(nil);

function TC_TypeDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__TypeDescription) then
    Result := SOMTC_DLL_TC__TypeDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__TypeDescription, 'TC__TypeDescription');
    Result := SOMTC_DLL_TC__TypeDescription;
  end;
end;

var
  SOMTC_DLL_TC__FullInterfaceDescription: TypeCode = TypeCode(nil);

function TC_FullInterfaceDescription: TypeCode;
begin
  if Assigned(SOMTC_DLL_TC__FullInterfaceDescription) then
    Result := SOMTC_DLL_TC__FullInterfaceDescription
  else
  begin
    SOME_Load_Variable(SOMTC_DLL_TC__FullInterfaceDescription, 'TC__FullInterfaceDescription');
    Result := SOMTC_DLL_TC__FullInterfaceDescription;
  end;
end;

function tcAlignment; external SOMTC_DLL_Name;
function tcCopy; external SOMTC_DLL_Name;
function tcEqual; external SOMTC_DLL_Name;
procedure tcFree; external SOMTC_DLL_Name;
// function tcKind; external SOMTC_DLL_Name; // conflicts with TCKind, use TypeCode_kind
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
