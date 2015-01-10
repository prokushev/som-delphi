/* @(#) somc/gen_emit.efs 2.9 6/7/96 16:14:29 [12/22/96 21:11:24] */

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
 *         File:    emitdelphi.c
 *       Author:    SOMObjects Emitter Framework
 *     Contents:    Generic framework emitter for DelphiEmitter.
 *         Date:    Sun Jan 11 00:51:12 2015.
 */

#include <scentry.h>
#include <emitlib.h>
#include "delphi.h"

#define SYMBOLS_FILE   "delphi.efw"

SOMEXTERN FILE * SOMLINK emitSL(char *file, Entry * cls, Stab * stab)
{
    FILE *fp;
    FILE *deffile;
    SOMTClassEntryC *oCls;
    SOMTModuleEntryC *mod;
    DelphiEmitter *emitter;
    SOMTTemplateOutputC *t;

    /* if this is a class, rather than a module: */
    if (cls->type == SOMTClassE) {

        fp = somtopenEmitFileSL(file, "delphi");
        oCls = (SOMTClassEntryC *) somtGetObjectWrapper(cls);
        emitter = DelphiEmitterNew();
        __set_somtTargetFile(emitter, fp);
        __set_somtTargetClass(emitter, oCls);
	__set_somtEmitterName(emitter, "delphi");
        t = __get_somtTemplate(emitter);
        __set_somtCommentStyle(t, somtCPPE);
        if (deffile = _somtOpenSymbolsFile(emitter, SYMBOLS_FILE, "r")) {
            _somtReadSectionDefinitions(t, deffile);
            somtfcloseSL(deffile);
        }
        else {
            fprintf(stderr, "Cannot open Symbols file \" %s \".\n", 
			     SYMBOLS_FILE);
            exit(-1);
        }
        _somtGenerateSections(emitter);
        _somFree(emitter);
	_somFree(oCls);

        return (fp);
    }
    else if (cls->type == SOMTModuleE) {

        fp = somtopenEmitFileSL(file, "delphi");
	mod = (SOMTModuleEntryC *) somtGetObjectWrapper(cls);
        emitter = DelphiEmitterNew();
        __set_somtTargetFile(emitter, fp);
        __set_somtTargetModule(emitter, mod);
        t = __get_somtTemplate(emitter);
        __set_somtCommentStyle(t, somtCPPE);
        if (deffile = _somtOpenSymbolsFile(emitter, SYMBOLS_FILE, "r")) {
            _somtReadSectionDefinitions(t, deffile);
            somtfcloseSL(deffile);
        }
        else {
            fprintf(stderr, "Cannot open Symbols file \" %s \".\n", 
			     SYMBOLS_FILE);
            exit(-1);
        }
        _somtGenerateSections(emitter);
        _somFree(emitter);
        _somFree(mod);

        return (fp);
    }

    else return ((FILE *) NULL);
}
