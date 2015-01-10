unit SOM.Thin.Impl;

interface

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

uses
  SOM.DelphiFeatures, SOM.Thin, SOM.Thin.RTL;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

// #include <somcsr.h>

(*
 *    @(#) 1.10 src/somk/somcsr.h, somk.api, som3.0 9/25/96 17:03:04 [12/22/96 21:33:30]
 *)
(*
 *   COMPONENT_NAME: somk
 *
 *   ORIGINS: 27
 *
 *
 *    25H7912  (C)  COPYRIGHT International Business Machines Corp. 1992,1996,1996
 *   All Rights Reserved
 *   Licensed Materials - Property of IBM
 *   US Government Users Restricted Rights - Use, duplication or
 *   disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 *)

(**********************************************************************)
(* Here we define structures actually needed at emit time to emit an  *)
(* initialized marshal plan (csr).  Definitions needed only to        *)
(* generate and analyze a csr are in cpct_csr.h.  All names intro-    *)
(* duced in this file should begin with som or SOM since they will    *)
(* be present in .ih and .xih files that are included in class im-    *)
(* plementations.                                                     *)
(**********************************************************************)

(* A length-counted TDC stream *)
type somcsr_tdcstream = record
    tdcstream_len: LongInt;
    tdcs: Poctet;
end;

(* User exception attribute structures *)

type somcsr_exception_entry = record
    exn_string_ident: PAnsiChar;
    exn_tdcs: somcsr_tdcstream;
end;
Psomcsr_exception_entry = ^somcsr_exception_entry;

type somcsr_Exception_Attributes = record
    num_exns: LongInt;
    exns: Psomcsr_exception_entry;
end;

(* Context attribute structure *)

type somcsr_Context_Attributes = record
  fields: PPAnsiChar;
end;

(* Union attribute structures *)

(* [case_val] is the value of the case, and [case_tdc/len] is
   the actual TDC stream. *)

type somcsr_union_case = record
  case_val: LongInt;
  case_tdcs: somcsr_tdcstream;
end;
Psomcsr_union_case = ^somcsr_union_case;

(* [default_index] is the index of the default case in the
   [cases] array.  If it is [-1], then there is no default case *)

type somcsr_Union_Attributes = record
  default_index: LongInt;
  num_cases: LongInt;
  cases: Psomcsr_union_case;
end;

(* Foreign Marshaler attribute structures                             *)
(* NOTE: The values used for the direction and function arguments below
   must come from the enumerations defined in datmarsh.idl. *)

type
  somcsr_Static_foreign_marshaler = procedure
  (latent_param: Pointer;
   foreign_addr: PAnsiChar;
   direction: LongWord;
   function_: LongWord;
   stream: Pointer;
   ev: PEnvironment); stdcall;

(*
 * The next typedef is needed prior to the macro redefinition below because
 * the explicit pointer qualification in somcsr_Static_foreign_marshaler *
 * will result in a syntax error (after macro expansion).  Pointers to
 * static foreign marshaler * functions must be declared with the
 * somcsr_Static_foreign_marshal_ptr to avoid this error.  See marshfun below
 * for an example.
 *)
type somcsr_Static_foreign_marshal_ptr = somcsr_Static_foreign_marshaler;

(*
 * The type definition for somcsr_Static_foreign_marshaler specifies
 * system linkage, but the C Set++ compiler doesn't apply this correctly
 * when somcsr_Static_foreign_marshaler is used in a second or subsequent
 * declaration for a function.  We work around this compiler problem by
 * redefining the type name for the function to include an explicit _System
 * keyword.  This problem doesn't occur with VisualAge C++.
 *)

procedure somcsr_static_foreign_octet_marshaler
  (latent_param: Pointer;
   foreign_addr: PAnsiChar;
   direction: LongWord;
   function_: LongWord;
   stream: Pointer;
   ev: PEnvironment); stdcall;

type somcsr_ForeignStatic_Attributes = record
  marshfun_name: PAnsiChar;
  marshfun: somcsr_Static_foreign_marshal_ptr;
  latent_param_name: PAnsiChar;
  latent_param: Pointer;
end;
Psomcsr_ForeignStatic_Attributes = ^somcsr_ForeignStatic_Attributes;
type somcsr_ForeignDynamic_Attributes = record
  class_name: PAnsiChar;
  vers_major: LongInt;
  vers_minor: LongInt;
  latent_param: PAnsiChar;
end;
Psomcsr_ForeignDynamic_Attributes = ^somcsr_ForeignDynamic_Attributes;

(* attrKind exists as a check; it records whether the attribute structure
   was converted dynamically or compiled into a DLL; a ForeignStatic marshaler
   only legal in the latter case *)


type attrKind = type LongWord; (* #21904 *)
const
  somcsr_Converted = attrKind(0);
  somcsr_Compiled = attrKind(1);

type somcsr_Foreign_Attributes = record
  attrKind: attrKind;      (* #21904 *)
  is_static: CORBABoolean;
  _static: Psomcsr_ForeignStatic_Attributes;
  _dynamic: Psomcsr_ForeignDynamic_Attributes;

end;

(**********************************************************************)
(* Marshal Plan Rows                                                  *)
(**********************************************************************)

(* All marshal plan rows begin with the following standard header *)

type
PsomMpRowStruct = ^somMpRowStruct;
somMpRowStruct = record
   next: PsomMpRowStruct;
   rowtype: LongWord;
end;
somMpRow = somMpRowStruct;

(* The following rowtypes are defined                                 *)

(* The `long return' rowtype is present for methods returning
   aggregate (struct or union) results, where the length of the result is
  too large to be represented in a short varint (eg, greater than 127
  bytes).  This is expected to be very rare; however, correctness
  dictates that we check for this case and do the right thing.
*)

type somMpRowLongretStruct = record
  hdr: somMpRow;  (* rowtype == 0 *)
  rlvaluelen: LongWord;
end;
somMpRowLongret = somMpRowLongretStruct;

const SOM_MP_ROWTYPE_LONGRET = 0;

(* The `redispatch/apply' rowtype exists as a transition aid for carrying
   forward the SOM 2.x style somMethodInfo structure while reusing the
   emitted fields that used to point to somMethodInfo.  What we do is to
   incorporate somMethodInfo as a marshal plan row.  Eventually, we can get
   rid of somMethodInfo entirely, since it is possible to support redispatch
   and apply stubs based only on information in the csr. *)

type somMpRowMethodInfoStruct = record
  hdr: somMpRow;  (* rowtype == 1 *)
  minfo: somMethodInfo;
end;
somMpRowMethodInfo = somMpRowMethodInfoStruct;

const SOM_MP_ROWTYPE_METHODINFO = 1;

implementation

uses
  SOM.Thin.DLL;

procedure somcsr_static_foreign_octet_marshaler; external SOMDCOMM_DLL_Name;

end.
