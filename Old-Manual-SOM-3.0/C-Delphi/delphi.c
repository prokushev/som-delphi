/* @(#) somc/gen_c.efs 2.5 9/1/94 19:33:10 [12/22/96 21:11:22] */

/*
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
 */

/*
 *         File:    delphi.c
 *       Author:    SOMObjects Emitter Framework.
 *     Contents:    Generic framework implementation for DelphiEmitter.
 *         Date:    Sun Jan 11 00:51:12 2015.
 */

#define DelphiEmitter_Class_Source
#include "delphi.ih"

SOM_Scope boolean  SOMLINK somtGenerateSections(DelphiEmitter *somSelf)
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

    if (cls != (SOMTClassEntryC *) NULL) {
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

    if (cls != (SOMTClassEntryC *) NULL) {
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

    if (__get_somtTargetModule(somSelf) != (SOMTModuleEntryC *) NULL) {

        _somtScanInterfaces(somSelf, "somtEmitInterfaceProlog",
                            "somtEmitInterface", "somtEmitInterfaceEpilog");

        _somtScanModules(somSelf, "somtEmitModuleProlog",
                         "somtEmitModule", "somtEmitModuleEpilog");
    }

    _somtEmitEpilog(somSelf);

    return (TRUE);
}
