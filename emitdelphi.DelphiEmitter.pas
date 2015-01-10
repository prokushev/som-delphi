unit emitdelphi.DelphiEmitter;

interface

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

uses
  SOM.DelphiFeatures, SOM.Thin, SOM.Thin.RTL,
  SOM.Thin.Emitter, SOM.Thin.TypeCodes;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

// #include "delphi.c"

(* @(#) somc/gen_c.efs 2.5 9/1/94 19:33:10 [12/22/96 21:11:22] *)

(*
 *   COMPONENT_NAME: some
 *
 *   ORIGINS: 27
 *
 *
 *   10H9767, 10H9769  (C) COPYRIGHT International Business Machines Corp. 1992,1994
 *   All Rights Reserved
 *   Licensed Materials - Property of IBM
 *   US Government Users Restricted Rights - Use, duplication or
 *   disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 *)

(*
 *         File:    delphi.c
 *       Author:    SOMObjects Emitter Framework.
 *     Contents:    Generic framework implementation for DelphiEmitter.
 *         Date:    Sun Jan 11 00:51:12 2015.
 *)

// #include "delphi.ih"

(*
 * This file was generated by the SOM Compiler.
 * FileName: delphi.ih.
 * Generated using:
 *     SOM Precompiler somipc: 2.29.1.19
 *     SOM Emitter emitih.dll: 2.77.1.179
 *)

(*
 *         File:    DelphiEmitter.idl
 *       Author:    SOMObjects Emitter Framework
 *     Contents:    Generic framework logic class for DelphiEmitter.
 *         Date:    Sun Jan 11 00:51:12 2015.
 *)

// #include "delphi.h"

(*
 * This file was generated by the SOM Compiler.
 * FileName: delphi.h.
 * Generated using:
 *     SOM Precompiler somipc: 2.29.1.19
 *     SOM Emitter emith.dll: 2.31.1.64
 *)

(*
 *         File:    DelphiEmitter.idl
 *       Author:    SOMObjects Emitter Framework
 *     Contents:    Generic framework logic class for DelphiEmitter.
 *         Date:    Sun Jan 11 00:51:12 2015.
 *)

(*
 * Define the class name as an object type
 *)
type
  DelphiEmitter = SOMObject;

const DelphiEmitter_MajorVersion = 1;
const DelphiEmitter_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function DelphiEmitterNewClass(
    somtmajorVersion: integer4 = DelphiEmitter_MajorVersion;
		somtminorVersion: integer4 = DelphiEmitter_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type DelphiEmitterClassDataStructure = record
	classObject: SOMClass;
end;
// DelphiEmitterClassData

(*
 * Declare the ABI 2 CClassData structure
 *)
type DelphiEmitterCClassDataStructure = record
	parentMtab: somMethodTabs;
	instanceDataToken: somDToken;
end;
// DelphiEmitterCClassData

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_DelphiEmitter: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for DelphiEmitter
 *)
function DelphiEmitterNew: DelphiEmitter;
function DelphiEmitterRenew(buf: Pointer): DelphiEmitter;
// #define DelphiEmitterNew() \
//    ( _DelphiEmitter ? \
// 	_somNew(_DelphiEmitter) \
// 	: ( DelphiEmitterNewClass(\
// 		DelphiEmitter_MajorVersion, \
// 		DelphiEmitter_MinorVersion),\
// 	   _somNew(_DelphiEmitter)))
// #define DelphiEmitterRenew(buf) \
//    ( _DelphiEmitter ? \
// 	_somRenew(_DelphiEmitter, buf) \
// 	: ( DelphiEmitterNewClass(\
// 		DelphiEmitter_MajorVersion, \
// 		DelphiEmitter_MinorVersion),\
// 	   _somRenew(_DelphiEmitter, buf)))

// #include "delphi.ih"

(*
 * -- Instance data
 *)
type
  DelphiEmitterData = record
	dummy: LongInt;
end;
DelphiEmitterDataPtr = ^DelphiEmitterData;

(*
 * -- GetData macro
 *)
type somTP_DelphiEmitter_DataThunk = function(somSelf: DelphiEmitter): DelphiEmitterDataPtr; stdcall;
somTD_DelphiEmitter_DataThunk = somTP_DelphiEmitter_DataThunk;

// #define DelphiEmitterGetData(somSelf) \
//    (((somTD_DelphiEmitter_DataThunk)(DelphiEmitterCClassData.instanceDataToken))(somSelf))
function DelphiEmitterGetData(somSelf: DelphiEmitter): DelphiEmitterDataPtr;

(*
 * -- Primary Implementation File Support
 *)
// #if (defined(DelphiEmitter_Class_Source) || defined(SOM_Module_delphi_Source))

// #ifndef DelphiEmitterMethodDebug
//    #define DelphiEmitterMethodDebug(c,m) SOMMethodDebug(c,m)
// #endif  /* DelphiEmitterMethodDebug */

procedure __somC_DelphiEmitter_classInit(cls: SOMClass); stdcall;


(*
 * Init ClassData Structures
 *)
var
  DelphiEmitterClassData: DelphiEmitterClassDataStructure = (classObject: nil);
  DelphiEmitterCClassData: DelphiEmitterCClassDataStructure = (parentMTab: nil; instanceDataToken: nil);


(*
 * Identifiers
 *)
const
  __somC_Strings_DelphiEmitter0: PAnsiChar = 'DelphiEmitter'; (* class name *)
  __somC_Strings_DelphiEmitter1: PAnsiChar = 'SOMTEmitC'; (* parent name *)
  __somC_Strings_DelphiEmitter2: PAnsiChar = 'somtGenerateSections'; (* overridden method name *)
  __somC_DelphiEmitter_regIdsArray: array[0 .. 2] of PAnsiChar = [
	__somC_Strings_DelphiEmitter0,
	__somC_Strings_DelphiEmitter1,
	__somC_Strings_DelphiEmitter2
];
const __somC_DelphiEmitter_regIds_somtGenerateSections = 2;


(*
 * Overridden method: somtGenerateSections
 *)
function somtGenerateSections(somSelf: DelphiEmitter): CORBABoolean; stdcall;
var
  DelphiEmitter_parent_SOMTEmitC_somtGenerateSections_resolved: somMethodProc;
function DelphiEmitter_parent_SOMTEmitC_somtGenerateSections(somSelf: DelphiEmitter): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
// #define DelphiEmitter_parent_SOMTEmitC_somtGenerateSections(somSelf) \
//   ((( somTD_SOMTEmitC_somtGenerateSections ) \
//     DelphiEmitter_parent_SOMTEmitC_somtGenerateSections_resolved)(somSelf))
var
  DelphiEmitter_pcall_somtGenerateSections_resolved: somMethodProc;
function DelphiEmitter_pcall_somtGenerateSections(somSelf: DelphiEmitter): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
// #define DelphiEmitter_pcall_somtGenerateSections(somSelf) \
//   ((( somTD_SOMTEmitC_somtGenerateSections ) \
//     DelphiEmitter_pcall_somtGenerateSections_resolved)(somSelf))
function DelphiEmitter_pcallResolve_somtGenerateSections(somSelf: DelphiEmitter): CORBABoolean; stdcall;
{
   return ((somTD_SOMTEmitC_somtGenerateSections)
      somPCallResolve(somSelf, _DelphiEmitter, _SOMMTOKEN_SOMTEmitC(somtGenerateSections)))(somSelf);
}


(*
 * Functions for attributes.
 *)

(*
 * Special Method Support
 *)

(*
 * -- Routines and Structures to create the class object
 *)
var
  __somC_DelphiEmitter_parentArray: array[0 .. 0] of PSOMClass = [
	nil
];
  __somC_DelphiEmitter_parentMtabs: array[0 .. 0] of Pointer;

__somC_DelphiEmitter_overridesArray = array[0 .. 0] of somOverrideMethod_t2 = [
(
  methodId: @(__somC_DelphiEmitter_regIdsArray[__somC_DelphiEmitter_regIds_somtGenerateSections]);
  pcall: somMethodPtrPtr(@DelphiEmitter_pcall_somtGenerateSections_resolved);
  pcallResolve: somMethodPtr(@DelphiEmitter_pcallResolve_somtGenerateSections);
  methodProc: somMethodPtr(@somtGenerateSections) )
];

__somC_DelphiEmitter_classVars1: somClassVars1 = (
	layoutVersion: 1;		(* layoutVersion *)
	extension: nil;	(* extension *)
	dataSize: SizeOf(DelphiEmitterData);	(* dataSize *)
	dataAlignment: 4;		(* type code dataAlignment *)
	classAllocate: nil;	(* classAllocate *)
	classDeallocate: nil	(* classDeallocate *)
);

__somC_DelphiEmitter_resolvedMTokens: DelphiEmitterClassDataStructure;

__somC_DelphiEmitter_CIB_unsharedClassVariablesPtr: Pointer = nil;
// som3ClassInfoStruct __somC_DelphiEmitter_ClassInfo; (* C forward reference *)

var
DelphiEmitter_ClassInitBlock: SOM_CIB = (
	layoutVersion: 1;	(* layoutVersion *)
	classVars1: @__somC_DelphiEmitter_classVars1;
	unsharedVars: @__somC_DelphiEmitter_CIB_unsharedClassVariablesPtr;	(* unsharedVars *)
	majorVersion: DelphiEmitter_MajorVersion;
	minorVersion: DelphiEmitter_MinorVersion;
	constFlags: $40004;	(* constFlags *)
	inheritVars: $FFFFFFFF;	(* inheritVars *)
	classMeta: 0;	(* classMeta *)
	classInit: somMethodPtr(@__somC_DelphiEmitter_classInit);	(* classInit *)
	classUninit: nil;	(* classUninit *)
	legacyInit: nil;	(* legacyInit *)
	legacyUninit: nil;	(* legacyUninit *)
	udaAssign: nil;	(* udaAssign *)
	udaConstAssign: nil;	(* udaConstAssign *)
	protectedDataOffset: 0;	(* protectedDataOffset *)
	numEmbeddedObjs: 0;	(* numEmbeddedObjs *)
	embeddedObjs: 0;	(* embeddedObjs *)
	numRegIds: 3;	(* numRegIds *)
	regIds: @(__somC_DelphiEmitter_regIdsArray[0]);	(* regIds *)
	numClassDataEntries: (SizeOf(DelphiEmitterClassDataStructure) - SizeOf(SOMClass)) div SizeOf(somMToken);	(* numClassDataEntries *)
	somClassData: somClassDataStructurePtr(@DelphiEmitterClassData);
	somCClassData: somCClassDataStructurePtr(@DelphiEmitterCClassData);
	som3ClassInfo: @__somC_DelphiEmitter_ClassInfo;
	numParents: 1;	(* numParents *)
	parents: @(__somC_DelphiEmitter_parentArray[0]);	(* parents *)
	numDirectInitClasses: 1;	(* numDirectInitClasses *)
	directInitClasses: @(__somC_DelphiEmitter_parentArray[0]);	(* directInitClasses *)
	numNewInitializers: 0;	(* numNewInitializers *)
	newInitializerSymbols: 0;	(* newInitializerSymbols *)
	numOvInitializers: 0;	(* numOvInitializers *)
	ovInitializerSymbols: 0;	(* ovInitializerSymbols *)
	specialOverrides: 0;	(* special overrides *)
	maxNDMethods: 0;	(* maxNDMethods *)
	newNDMethods: 0;	(* newNDMethods *)
	numOverrides: 1;	(* numOverrides *)
	overrides: @(__somC_DelphiEmitter_overridesArray[0]);	(* overrides *)
	numInheritedSelections: 0;	(* numInheritedSelections *)
	inheritedSelections: nil;	(* inheritedSelections *)
	numMigratedMethods: 0;	(* numMigratedMethods *)
	migratedMethods: nil 	(* migrated methods *)
);	(* CIB *)

static som3ClassDetails __somC_DelphiEmitter_ClassDetails = {
	(somMethodTabPtr)NULL,	/* mtab */
	(somMethodTabPtr *)__somC_DelphiEmitter_parentMtabs,	/* parentMtabs */
	&DelphiEmitter_ClassInitBlock,	/* CIB pointer */
	(somTD_somRenewNoInitNoZeroThunk)0,	/* somRenewNoInitNoZeroThunk */
	(long)0,	/* instanceSize */
	(somMethodProc**)NULL,	/* resolvedInits */
	(somClassDataStructure *)&__somC_DelphiEmitter_resolvedMTokens,	/* resolvedMTokens */
	{0,0,0,0},	/* initCtrl */
	{0,0,0,0},	/* destructCtrl */
	{0,0,0,0},	/* assignCtrl */
	(long)1,	/* layoutVersion */
	(void*)NULL,	/* extension */
	(somDToken)NULL,	/* publicDataToken */
	(somDToken)NULL,	/* protectedDataToken */
};
som3ClassInfoStruct __somC_DelphiEmitter_ClassInfo = {
	0,	/* classObject */
	&__somC_DelphiEmitter_ClassDetails	/* class details */
};


/*
 * Class Creation and Initialization
 */

#if defined(__IBMC__) && (defined(_WIN32) || defined(__OS2__)) && !defined(SOM_PREWARP)
#pragma alloc_text (SEG0002, __somC_DelphiEmitter_classInit)
#pragma alloc_text (SEG0002, DelphiEmitterNewClass)
#endif

/* classinit function */
SOM_Scope void SOMLINK __somC_DelphiEmitter_classInit(SOMClass somSelf)
{
   SOM_IgnoreWarning(somSelf);
   DelphiEmitter_parent_SOMTEmitC_somtGenerateSections_resolved = 
	somParentNumResolve(DelphiEmitterCClassData.parentMtab, 1, _SOMMTOKEN_SOMTEmitC(somtGenerateSections)); 
}

/* NewClass Function */
SOMEXTERN SOMDLLEXPORT SOMClass  SOMLINK DelphiEmitterNewClass (long reqMajorVersion, long reqMinorVersion)
{
   if (_SOMCLASS_DelphiEmitter && _somCheckVersion(_SOMCLASS_DelphiEmitter,reqMajorVersion,reqMinorVersion))
      return _SOMCLASS_DelphiEmitter;
__somC_DelphiEmitter_parentArray[0] = (SOMClass *)&_SOMCLASS_SOMTEmitC;
   /* require parents */
   if (!_SOMCLASS_SOMTEmitC) SOMTEmitCNewClass(SOMTEmitC_MajorVersion,SOMTEmitC_MinorVersion);
   /* return new class */
   return somBuildClass2( &DelphiEmitter_ClassInitBlock, reqMajorVersion, reqMinorVersion );
}


implementation


(* SOM_Scope boolean  SOMLINK somtGenerateSections(DelphiEmitter *somSelf)
{
    /* DelphiEmitterData *somThis = DelphiEmitterGetData(somSelf); */
    SOMTClassEntryC *cls = __get_somtTargetClass(somSelf);
    SOMTTemplateOutputC *template = __get_somtTemplate(somSelf);
    DelphiEmitterMethodDebug("DelphiEmitter","somtGenerateSections");

    /*
     * Setup symbols that are common to the whole file 
     */
    _somtFileSymbols(somSelf);

    _somtEmitProlog(somSelf);

    if (cls != (SOMTClassEntryC * ) NULL) {
        _somtScanBases(somSelf,
                       "somtEmitBaseIncludesProlog",
                       "somtEmitBaseIncludes",
                       "somtEmitBaseIncludesEpilog");

        _somtEmitMetaInclude(somSelf);

        _somtEmitClass(somSelf);

        _somtScanBases(somSelf,
                       "somtEmitBaseProlog",
                       "somtEmitBase",
                       "somtEmitBaseEpilog");

        _somtEmitMeta(somSelf);
    }
    _somtScanConstants(somSelf, "somtEmitConstantProlog",
                      "somtEmitConstant", "somtEmitConstantEpilog");

    _somtScanTypedefs(somSelf, "somtEmitTypedefProlog",
                      "somtEmitTypedef", "somtEmitTypedefEpilog");

    _somtScanStructs(somSelf, "somtEmitStructProlog",
                     "somtEmitStruct", "somtEmitStructEpilog");

    _somtScanUnions(somSelf, "somtEmitUnionProlog",
                    "somtEmitUnion", "somtEmitUnionEpilog");

    _somtScanEnums(somSelf, "somtEmitEnumProlog",
                   "somtEmitEnum", "somtEmitEnumEpilog");

    if (cls != (SOMTClassEntryC * ) NULL) {
        _somtScanAttributes(somSelf, "somtEmitAttributeProlog",
                            "somtEmitAttribute", "somtEmitAttributeEpilog");

        _somtScanMethods(somSelf,
                         "somtImplemented",
                         "somtEmitMethodsProlog",
                         "somtEmitMethod",
                         "somtEmitMethodsEpilog",
                         0);

        _somtEmitRelease(somSelf);

        _somtScanPassthru(somSelf, 1,
                          "somtEmitPassthruProlog",
                          "somtEmitPassthru",
                          "somtEmitPassthruEpilog");

        _somtScanPassthru(somSelf, 0,
                          "somtEmitPassthruProlog",
                          "somtEmitPassthru",
                          "somtEmitPassthruEpilog");

        _somtScanData(somSelf,
                      "somtEmitDataProlog",
                      "somtEmitData",
                      "somtEmitDataEpilog");
    }

    if (__get_somtTargetModule(somSelf) != (SOMTModuleEntryC * ) NULL) {

        _somtScanInterfaces(somSelf, "somtEmitInterfaceProlog",
                            "somtEmitInterface", "somtEmitInterfaceEpilog");

        _somtScanModules(somSelf, "somtEmitModuleProlog",
                         "somtEmitModule", "somtEmitModuleEpilog");
    }

    _somtEmitEpilog(somSelf);

    return (TRUE);
} *)

end.
