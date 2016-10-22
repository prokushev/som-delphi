{$WARN UNSAFE_TYPE OFF}

unit SOMIRTest.DumpOut;

interface
uses
  SOM.DelphiFeatures, SOM.Thin;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

{ Amount of items: 163 }
type
  { Forward definitions }
  SOMObject = class;
  Contained = class;
  AttributeDef = class;
  BOA = class;
  SOMTEmitC = class;
  brsclassc = class;
  Context = class;
  ConstantDef = class;
  Container = class;
  DirectToSomCpp = class;
  CTMEmitC = class;
  DTSImplTmpl = class;
  ExceptionDef = class;
  SOMDServer = class;
  SOMDForeignMarshaler = class;
  somInitModEmitter = class;
  ImplementationDef = class;
  ImplRepository = class;
  InterfaceDef = class;
  LName = class;
  LNameComponent = class;
  ModuleDef = class;
  NVList = class;
  ObjectMgr = class;
  OperationDef = class;
  ORB = class;
  ParameterDef = class;
  Principal = class;
  Repository = class;
  Request = class;
  SOMTEntryC = class;
  SOMTAttributeEntryC = class;
  SOMTBaseClassEntryC = class;
  SOMTClassEntryC = class;
  SOMTCommonEntryC = class;
  SOMTConstEntryC = class;
  SOMTDataEntryC = class;
  SOMTEnumEntryC = class;
  SOMTEnumNameEntryC = class;
  SOMTMetaClassEntryC = class;
  SOMTMethodEntryC = class;
  SOMTModuleEntryC = class;
  SOMTParameterEntryC = class;
  SOMTPassthruEntryC = class;
  SOMTSequenceEntryC = class;
  SOMTStringEntryC = class;
  SOMTStructEntryC = class;
  SOMTTypedefEntryC = class;
  SOMTTemplateOutputC = class;
  SOMTUnionEntryC = class;
  SOMTUserDefinedTypeEntryC = class;
  SOMDServerMgr = class;
  SOMClass = class;
  SOMMSingleInstance = class;
  TypecodeDataManipulator = class;
  SOMMBeforeAfter = class;
  SOMClassMgr = class;
  SOMMProxyForObject = class;
  SOMDObject = class;
  SOMDClientProxy = class;
  SOMDObjectMgr = class;
  SOMUTId = class;
  SOMOA = class;
  SOMParentDerived = class;
  SOMParentDerivedMetaclass = class;
  SOMMProxyFor = class;
  SOMUTStringId = class;
  SOMStringTableC = class;
  SOMMTraced = class;
  TSIdentification = class;
  TypeDef = class;
  SysAdminException = class;
  int = LongInt;
  uchar_t = Byte;
  size_t = LongWord;
  signed_char = Byte;
  SOMFOREIGN = Pointer;
  SOM_FILE = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };
  va_list = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };
  SOMHANDLE = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };
  somToken = Pointer;
  somId = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };
  TCKind = type LongWord;
  integer1 = ShortInt;
  integer2 = SmallInt;
  uinteger2 = Word;
  integer4 = LongInt;
  uinteger4 = LongWord;
  float4 = Single;
  float8 = Double;
  zString = CORBAString;
  fString = CORBAString;
  somMethodProc = Pointer;
  somMethodPtr = Pointer;
  somMethodTab = record
    { ... }
  end;
  SOMAny = record
    { ... }
  end;
  somMToken = Pointer;
  somDToken = Pointer;
  somGenericCtrl = record
    { ... }
  end;
  som3InitCtrl = record
    { ... }
  end;
  som3DestructCtrl = record
    { ... }
  end;
  som3AssignCtrl = record
    { ... }
  end;
  somInitCtrl = Pointer;
  somDestructCtrl = Pointer;
  somAssignCtrl = Pointer;
  somMethodDataStruct = record
    { ... }
  end;
  somMethodData = record
    { ... }
  end;
  somClassList = record
    { ... }
  end;
  somClasses = ^somClassList;
  somObjects = Pointer;
  somMethodTabList = record
    { ... }
  end;
  somMethodTabs = ^somMethodTabList;
  somParentMtabStructPtr = ^somMethodTabList;
  somBooleanVector = ^Byte;
  exception_type = type LongWord;
  Environment = record
    { ... }
  end;
  somCClassDataStructurePtr = Pointer;
  somClassDataStructurePtr = Pointer;
  somMethodTabPtr = Pointer;
  somEmbeddedObjStructPtr = Pointer;
  somMethodDefnPtr = Pointer;
  somClassMemPtr = Pointer;
  somClassVars3Ptr = Pointer;
  SOM_CIBPtr = Pointer;
  somModifier = record
    { ... }
  end;
  Identifier = CORBAString;
  RepositoryId = CORBAString;
  completion_status = type LongWord;
  ORBStatus = LongWord;
  _IDL_Sequence_Byte = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PByte;
  end;
  ReferenceData = _IDL_Sequence_Byte;
  Flags = LongWord;
  ORBid = CORBAString;
  NamedValue = record
    { ... }
  end;
  ImplId = CORBAString;
  somtCommentStyleT = type LongWord;
  Entry = Pointer;
  SOMTTargetTypeT = type LongWord;
  SOMTTypes = LongWord;
  Mlist = Pointer;
  AttList = Pointer;
  NumberList = Pointer;
  SwitchBody = Pointer;
  ContextIdentifier = CORBAString;
  somtVisibilityT = type LongWord;
  somtParameterDirectionT = type LongWord;
  entryT = record
    { ... }
  end;
  PentryT = ^entryT;
  PPentryT = ^PentryT;
  tablePT = ^PPentryT;

  PsomGenericCtrl = ^somGenericCtrl;
  SOMObject = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  PsomModifier = ^somModifier;
  _IDL_Sequence_somModifier = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PsomModifier;
  end;
  PContainer = ^Container;
  _IDL_Sequence_Container = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PContainer;
  end;
  Contained = class
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  AttributeDef = class
    { Found item: AttributeMode }
    { Found item: AttributeDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type: TypeCode;
    procedure _set_type(type: TypeCode);
    function _get_mode: Unresolved_AttributeMode;
    procedure _set_mode(mode: Unresolved_AttributeMode);
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property type: TypeCode read _get_type write _set_type;
    property mode: Unresolved_AttributeMode read _get_mode write _set_mode;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  BOA = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function create(id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject;
    procedure dispose(obj: SOMDObject);
    function get_id(obj: SOMDObject): _IDL_Sequence_Byte;
    function get_principal(obj: SOMDObject; req_ev: Environment): Principal;
    procedure set_exception(major: exception_type; userid: CORBAString; param: Pointer);
    procedure impl_is_ready(impl: ImplementationDef);
    procedure deactivate_impl(impl: ImplementationDef);
    procedure change_implementation(obj: SOMDObject; impl: ImplementationDef);
    procedure obj_is_ready(obj: SOMDObject; impl: ImplementationDef);
    procedure deactivate_obj(obj: SOMDObject);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  PSOM_FILE = ^SOM_FILE;
  SOMTEmitC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate: SOMTTemplateOutputC;
    procedure _set_somtTemplate(somtTemplate: SOMTTemplateOutputC);
    function _get_somtTargetFile: PSOM_FILE;
    procedure _set_somtTargetFile(somtTargetFile: PSOM_FILE);
    function _get_somtTargetClass: SOMTClassEntryC;
    procedure _set_somtTargetClass(somtTargetClass: SOMTClassEntryC);
    function _get_somtTargetModule: SOMTModuleEntryC;
    procedure _set_somtTargetModule(somtTargetModule: SOMTModuleEntryC);
    function _get_somtTargetType: SOMTTargetTypeT;
    procedure _set_somtTargetType(somtTargetType: SOMTTargetTypeT);
    function _get_somtEmitterName: CORBAString;
    procedure _set_somtEmitterName(somtEmitterName: CORBAString);
  public
    function somtGenerateSections: CORBABoolean;
    function somtOpenSymbolsFile(file: CORBAString; mode: CORBAString): PSOM_FILE;
    procedure somtSetPredefinedSymbols;
    procedure somtFileSymbols;
    procedure somtEmitProlog;
    procedure somtEmitBaseIncludesProlog;
    procedure somtEmitBaseIncludes(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseIncludesEpilog;
    procedure somtEmitMetaInclude;
    procedure somtEmitClass;
    procedure somtEmitMeta;
    procedure somtEmitBaseProlog;
    procedure somtEmitBase(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseEpilog;
    procedure somtEmitPassthruProlog;
    procedure somtEmitPassthru(entry: SOMTPassthruEntryC);
    procedure somtEmitPassthruEpilog;
    procedure somtEmitRelease;
    procedure somtEmitDataProlog;
    procedure somtEmitData(entry: SOMTDataEntryC);
    procedure somtEmitDataEpilog;
    procedure somtEmitAttributeProlog;
    procedure somtEmitAttribute(att: SOMTAttributeEntryC);
    procedure somtEmitAttributeEpilog;
    procedure somtEmitConstantProlog;
    procedure somtEmitConstant(con: SOMTConstEntryC);
    procedure somtEmitConstantEpilog;
    procedure somtEmitTypedefProlog;
    procedure somtEmitTypedef(td: SOMTTypedefEntryC);
    procedure somtEmitTypedefEpilog;
    procedure somtEmitStructProlog;
    procedure somtEmitStruct(struc: SOMTStructEntryC);
    procedure somtEmitStructEpilog;
    procedure somtEmitUnionProlog;
    procedure somtEmitUnion(un: SOMTUnionEntryC);
    procedure somtEmitUnionEpilog;
    procedure somtEmitEnumProlog;
    procedure somtEmitEnum(en: SOMTEnumEntryC);
    procedure somtEmitEnumEpilog;
    procedure somtEmitInterfaceProlog;
    procedure somtEmitInterface(intfc: SOMTClassEntryC);
    procedure somtEmitInterfaceEpilog;
    procedure somtEmitModuleProlog;
    procedure somtEmitModule(mod: SOMTModuleEntryC);
    procedure somtEmitModuleEpilog;
    procedure somtEmitMethodsProlog;
    procedure somtEmitMethods(method: SOMTMethodEntryC);
    procedure somtEmitMethodsEpilog;
    procedure somtEmitMethod(entry: SOMTMethodEntryC);
    procedure somtEmitEpilog;
    function somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNew(entry: SOMTMethodEntryC): CORBABoolean;
    function somtImplemented(entry: SOMTMethodEntryC): CORBABoolean;
    function somtOverridden(entry: SOMTMethodEntryC): CORBABoolean;
    function somtInherited(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAll(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNewNoProc(entry: SOMTEntryC): CORBABoolean;
    function somtPrivOrPub(entry: SOMTEntryC): CORBABoolean;
    function somtNewProc(entry: SOMTEntryC): CORBABoolean;
    function somtLink(entry: SOMTEntryC): CORBABoolean;
    function somtVA(entry: SOMTEntryC): CORBABoolean;
    function somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    procedure somtEmitFullPassthru(before: CORBABoolean; language: CORBAString);
    function somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstGlobalDefinition: SOMTEntryC;
    function somtGetNextGlobalDefinition: SOMTEntryC;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTemplate: SOMTTemplateOutputC read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: PSOM_FILE read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: SOMTClassEntryC read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: SOMTModuleEntryC read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: SOMTTargetTypeT read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: CORBAString read _get_somtEmitterName write _set_somtEmitterName;
  end;

  brsclassc = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate: SOMTTemplateOutputC;
    procedure _set_somtTemplate(somtTemplate: SOMTTemplateOutputC);
    function _get_somtTargetFile: PSOM_FILE;
    procedure _set_somtTargetFile(somtTargetFile: PSOM_FILE);
    function _get_somtTargetClass: SOMTClassEntryC;
    procedure _set_somtTargetClass(somtTargetClass: SOMTClassEntryC);
    function _get_somtTargetModule: SOMTModuleEntryC;
    procedure _set_somtTargetModule(somtTargetModule: SOMTModuleEntryC);
    function _get_somtTargetType: SOMTTargetTypeT;
    procedure _set_somtTargetType(somtTargetType: SOMTTargetTypeT);
    function _get_somtEmitterName: CORBAString;
    procedure _set_somtEmitterName(somtEmitterName: CORBAString);
  public
    function somtGenerateSections: CORBABoolean;
    function somtOpenSymbolsFile(file: CORBAString; mode: CORBAString): PSOM_FILE;
    procedure somtSetPredefinedSymbols;
    procedure somtFileSymbols;
    procedure somtEmitProlog;
    procedure somtEmitBaseIncludesProlog;
    procedure somtEmitBaseIncludes(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseIncludesEpilog;
    procedure somtEmitMetaInclude;
    procedure somtEmitClass;
    procedure somtEmitMeta;
    procedure somtEmitBaseProlog;
    procedure somtEmitBase(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseEpilog;
    procedure somtEmitPassthruProlog;
    procedure somtEmitPassthru(entry: SOMTPassthruEntryC);
    procedure somtEmitPassthruEpilog;
    procedure somtEmitRelease;
    procedure somtEmitDataProlog;
    procedure somtEmitData(entry: SOMTDataEntryC);
    procedure somtEmitDataEpilog;
    procedure somtEmitAttributeProlog;
    procedure somtEmitAttribute(att: SOMTAttributeEntryC);
    procedure somtEmitAttributeEpilog;
    procedure somtEmitConstantProlog;
    procedure somtEmitConstant(con: SOMTConstEntryC);
    procedure somtEmitConstantEpilog;
    procedure somtEmitTypedefProlog;
    procedure somtEmitTypedef(td: SOMTTypedefEntryC);
    procedure somtEmitTypedefEpilog;
    procedure somtEmitStructProlog;
    procedure somtEmitStruct(struc: SOMTStructEntryC);
    procedure somtEmitStructEpilog;
    procedure somtEmitUnionProlog;
    procedure somtEmitUnion(un: SOMTUnionEntryC);
    procedure somtEmitUnionEpilog;
    procedure somtEmitEnumProlog;
    procedure somtEmitEnum(en: SOMTEnumEntryC);
    procedure somtEmitEnumEpilog;
    procedure somtEmitInterfaceProlog;
    procedure somtEmitInterface(intfc: SOMTClassEntryC);
    procedure somtEmitInterfaceEpilog;
    procedure somtEmitModuleProlog;
    procedure somtEmitModule(mod: SOMTModuleEntryC);
    procedure somtEmitModuleEpilog;
    procedure somtEmitMethodsProlog;
    procedure somtEmitMethods(method: SOMTMethodEntryC);
    procedure somtEmitMethodsEpilog;
    procedure somtEmitMethod(entry: SOMTMethodEntryC);
    procedure somtEmitEpilog;
    function somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNew(entry: SOMTMethodEntryC): CORBABoolean;
    function somtImplemented(entry: SOMTMethodEntryC): CORBABoolean;
    function somtOverridden(entry: SOMTMethodEntryC): CORBABoolean;
    function somtInherited(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAll(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNewNoProc(entry: SOMTEntryC): CORBABoolean;
    function somtPrivOrPub(entry: SOMTEntryC): CORBABoolean;
    function somtNewProc(entry: SOMTEntryC): CORBABoolean;
    function somtLink(entry: SOMTEntryC): CORBABoolean;
    function somtVA(entry: SOMTEntryC): CORBABoolean;
    function somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    procedure somtEmitFullPassthru(before: CORBABoolean; language: CORBAString);
    function somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstGlobalDefinition: SOMTEntryC;
    function somtGetNextGlobalDefinition: SOMTEntryC;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTemplate: SOMTTemplateOutputC read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: PSOM_FILE read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: SOMTClassEntryC read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: SOMTModuleEntryC read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: SOMTTargetTypeT read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: CORBAString read _get_somtEmitterName write _set_somtEmitterName;
  end;

  Context = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function set_one_value(prop_name: CORBAString; value: CORBAString): LongWord;
    function set_values(values: NVList): LongWord;
    function get_values(start_scope: CORBAString; op_flags: LongWord; prop_name: CORBAString; out values: NVList): LongWord;
    function delete_values(prop_name: CORBAString): LongWord;
    function create_child(ctx_name: CORBAString; out child_ctx: Context): LongWord;
    function destroy(flags: LongWord): LongWord;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  ConstantDef = class
    { Found item: ConstantDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type: TypeCode;
    procedure _set_type(type: TypeCode);
    function _get_value: any;
    procedure _set_value(value: any);
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property type: TypeCode read _get_type write _set_type;
    property value: any read _get_value write _set_value;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  PContained = ^Contained;
  _IDL_Sequence_Contained = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PContained;
  end;
  PUnresolved_ContainerDescription = ^Unresolved_ContainerDescription;
  _IDL_Sequence_Unresolved_ContainerDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PUnresolved_ContainerDescription;
  end;
  Container = class
    { Found item: InterfaceName }
    { Found item: ContainerDescription }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Unresolved_ContainerDescription;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  DirectToSomCpp = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate: SOMTTemplateOutputC;
    procedure _set_somtTemplate(somtTemplate: SOMTTemplateOutputC);
    function _get_somtTargetFile: PSOM_FILE;
    procedure _set_somtTargetFile(somtTargetFile: PSOM_FILE);
    function _get_somtTargetClass: SOMTClassEntryC;
    procedure _set_somtTargetClass(somtTargetClass: SOMTClassEntryC);
    function _get_somtTargetModule: SOMTModuleEntryC;
    procedure _set_somtTargetModule(somtTargetModule: SOMTModuleEntryC);
    function _get_somtTargetType: SOMTTargetTypeT;
    procedure _set_somtTargetType(somtTargetType: SOMTTargetTypeT);
    function _get_somtEmitterName: CORBAString;
    procedure _set_somtEmitterName(somtEmitterName: CORBAString);
  public
    procedure emitSectionForNamedEntry(entryName: CORBAString);
    procedure somtEmitDefinitionOfType(entry: SOMTUserDefinedTypeEntryC);
    procedure emitSectionForEntry(entry: SOMTEntryC);
    procedure emitTDIncludeForEntry(entry: SOMTEntryC);
    procedure emitSequenceTypedef(seq: SOMTSequenceEntryC; global: CORBABoolean);
    procedure chkUDA(entry: SOMTMethodEntryC);
    procedure chkOptDefaultCtor(entry: SOMTMethodEntryC);
    function somtGenerateSections: CORBABoolean;
    function somtOpenSymbolsFile(file: CORBAString; mode: CORBAString): PSOM_FILE;
    procedure somtSetPredefinedSymbols;
    procedure somtFileSymbols;
    procedure somtEmitProlog;
    procedure somtEmitBaseIncludesProlog;
    procedure somtEmitBaseIncludes(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseIncludesEpilog;
    procedure somtEmitMetaInclude;
    procedure somtEmitClass;
    procedure somtEmitMeta;
    procedure somtEmitBaseProlog;
    procedure somtEmitBase(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseEpilog;
    procedure somtEmitPassthruProlog;
    procedure somtEmitPassthru(entry: SOMTPassthruEntryC);
    procedure somtEmitPassthruEpilog;
    procedure somtEmitRelease;
    procedure somtEmitDataProlog;
    procedure somtEmitData(entry: SOMTDataEntryC);
    procedure somtEmitDataEpilog;
    procedure somtEmitAttributeProlog;
    procedure somtEmitAttribute(att: SOMTAttributeEntryC);
    procedure somtEmitAttributeEpilog;
    procedure somtEmitConstantProlog;
    procedure somtEmitConstant(con: SOMTConstEntryC);
    procedure somtEmitConstantEpilog;
    procedure somtEmitTypedefProlog;
    procedure somtEmitTypedef(td: SOMTTypedefEntryC);
    procedure somtEmitTypedefEpilog;
    procedure somtEmitStructProlog;
    procedure somtEmitStruct(struc: SOMTStructEntryC);
    procedure somtEmitStructEpilog;
    procedure somtEmitUnionProlog;
    procedure somtEmitUnion(un: SOMTUnionEntryC);
    procedure somtEmitUnionEpilog;
    procedure somtEmitEnumProlog;
    procedure somtEmitEnum(en: SOMTEnumEntryC);
    procedure somtEmitEnumEpilog;
    procedure somtEmitInterfaceProlog;
    procedure somtEmitInterface(intfc: SOMTClassEntryC);
    procedure somtEmitInterfaceEpilog;
    procedure somtEmitModuleProlog;
    procedure somtEmitModule(mod: SOMTModuleEntryC);
    procedure somtEmitModuleEpilog;
    procedure somtEmitMethodsProlog;
    procedure somtEmitMethods(method: SOMTMethodEntryC);
    procedure somtEmitMethodsEpilog;
    procedure somtEmitMethod(entry: SOMTMethodEntryC);
    procedure somtEmitEpilog;
    function somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNew(entry: SOMTMethodEntryC): CORBABoolean;
    function somtImplemented(entry: SOMTMethodEntryC): CORBABoolean;
    function somtOverridden(entry: SOMTMethodEntryC): CORBABoolean;
    function somtInherited(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAll(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNewNoProc(entry: SOMTEntryC): CORBABoolean;
    function somtPrivOrPub(entry: SOMTEntryC): CORBABoolean;
    function somtNewProc(entry: SOMTEntryC): CORBABoolean;
    function somtLink(entry: SOMTEntryC): CORBABoolean;
    function somtVA(entry: SOMTEntryC): CORBABoolean;
    function somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    procedure somtEmitFullPassthru(before: CORBABoolean; language: CORBAString);
    function somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstGlobalDefinition: SOMTEntryC;
    function somtGetNextGlobalDefinition: SOMTEntryC;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTemplate: SOMTTemplateOutputC read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: PSOM_FILE read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: SOMTClassEntryC read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: SOMTModuleEntryC read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: SOMTTargetTypeT read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: CORBAString read _get_somtEmitterName write _set_somtEmitterName;
  end;

  CTMEmitC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate: SOMTTemplateOutputC;
    procedure _set_somtTemplate(somtTemplate: SOMTTemplateOutputC);
    function _get_somtTargetFile: PSOM_FILE;
    procedure _set_somtTargetFile(somtTargetFile: PSOM_FILE);
    function _get_somtTargetClass: SOMTClassEntryC;
    procedure _set_somtTargetClass(somtTargetClass: SOMTClassEntryC);
    function _get_somtTargetModule: SOMTModuleEntryC;
    procedure _set_somtTargetModule(somtTargetModule: SOMTModuleEntryC);
    function _get_somtTargetType: SOMTTargetTypeT;
    procedure _set_somtTargetType(somtTargetType: SOMTTargetTypeT);
    function _get_somtEmitterName: CORBAString;
    procedure _set_somtEmitterName(somtEmitterName: CORBAString);
  public
    procedure emitModule(mod: SOMTModuleEntryC);
    procedure emitParentMethodCalls(method: SOMTMethodEntryC);
    procedure emitInitializerTemplate(method: SOMTMethodEntryC);
    procedure emitAssignmentOpTemplate(method: SOMTMethodEntryC);
    procedure emitDestructorTemplate(method: SOMTMethodEntryC);
    function somtGenerateSections: CORBABoolean;
    function somtOpenSymbolsFile(file: CORBAString; mode: CORBAString): PSOM_FILE;
    procedure somtSetPredefinedSymbols;
    procedure somtFileSymbols;
    procedure somtEmitProlog;
    procedure somtEmitBaseIncludesProlog;
    procedure somtEmitBaseIncludes(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseIncludesEpilog;
    procedure somtEmitMetaInclude;
    procedure somtEmitClass;
    procedure somtEmitMeta;
    procedure somtEmitBaseProlog;
    procedure somtEmitBase(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseEpilog;
    procedure somtEmitPassthruProlog;
    procedure somtEmitPassthru(entry: SOMTPassthruEntryC);
    procedure somtEmitPassthruEpilog;
    procedure somtEmitRelease;
    procedure somtEmitDataProlog;
    procedure somtEmitData(entry: SOMTDataEntryC);
    procedure somtEmitDataEpilog;
    procedure somtEmitAttributeProlog;
    procedure somtEmitAttribute(att: SOMTAttributeEntryC);
    procedure somtEmitAttributeEpilog;
    procedure somtEmitConstantProlog;
    procedure somtEmitConstant(con: SOMTConstEntryC);
    procedure somtEmitConstantEpilog;
    procedure somtEmitTypedefProlog;
    procedure somtEmitTypedef(td: SOMTTypedefEntryC);
    procedure somtEmitTypedefEpilog;
    procedure somtEmitStructProlog;
    procedure somtEmitStruct(struc: SOMTStructEntryC);
    procedure somtEmitStructEpilog;
    procedure somtEmitUnionProlog;
    procedure somtEmitUnion(un: SOMTUnionEntryC);
    procedure somtEmitUnionEpilog;
    procedure somtEmitEnumProlog;
    procedure somtEmitEnum(en: SOMTEnumEntryC);
    procedure somtEmitEnumEpilog;
    procedure somtEmitInterfaceProlog;
    procedure somtEmitInterface(intfc: SOMTClassEntryC);
    procedure somtEmitInterfaceEpilog;
    procedure somtEmitModuleProlog;
    procedure somtEmitModule(mod: SOMTModuleEntryC);
    procedure somtEmitModuleEpilog;
    procedure somtEmitMethodsProlog;
    procedure somtEmitMethods(method: SOMTMethodEntryC);
    procedure somtEmitMethodsEpilog;
    procedure somtEmitMethod(entry: SOMTMethodEntryC);
    procedure somtEmitEpilog;
    function somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNew(entry: SOMTMethodEntryC): CORBABoolean;
    function somtImplemented(entry: SOMTMethodEntryC): CORBABoolean;
    function somtOverridden(entry: SOMTMethodEntryC): CORBABoolean;
    function somtInherited(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAll(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNewNoProc(entry: SOMTEntryC): CORBABoolean;
    function somtPrivOrPub(entry: SOMTEntryC): CORBABoolean;
    function somtNewProc(entry: SOMTEntryC): CORBABoolean;
    function somtLink(entry: SOMTEntryC): CORBABoolean;
    function somtVA(entry: SOMTEntryC): CORBABoolean;
    function somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    procedure somtEmitFullPassthru(before: CORBABoolean; language: CORBAString);
    function somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstGlobalDefinition: SOMTEntryC;
    function somtGetNextGlobalDefinition: SOMTEntryC;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTemplate: SOMTTemplateOutputC read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: PSOM_FILE read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: SOMTClassEntryC read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: SOMTModuleEntryC read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: SOMTTargetTypeT read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: CORBAString read _get_somtEmitterName write _set_somtEmitterName;
  end;

  DTSImplTmpl = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate: SOMTTemplateOutputC;
    procedure _set_somtTemplate(somtTemplate: SOMTTemplateOutputC);
    function _get_somtTargetFile: PSOM_FILE;
    procedure _set_somtTargetFile(somtTargetFile: PSOM_FILE);
    function _get_somtTargetClass: SOMTClassEntryC;
    procedure _set_somtTargetClass(somtTargetClass: SOMTClassEntryC);
    function _get_somtTargetModule: SOMTModuleEntryC;
    procedure _set_somtTargetModule(somtTargetModule: SOMTModuleEntryC);
    function _get_somtTargetType: SOMTTargetTypeT;
    procedure _set_somtTargetType(somtTargetType: SOMTTargetTypeT);
    function _get_somtEmitterName: CORBAString;
    procedure _set_somtEmitterName(somtEmitterName: CORBAString);
  public
    procedure emitSectionForNamedEntry(entryName: CORBAString);
    function somtGenerateSections: CORBABoolean;
    function somtOpenSymbolsFile(file: CORBAString; mode: CORBAString): PSOM_FILE;
    procedure somtSetPredefinedSymbols;
    procedure somtFileSymbols;
    procedure somtEmitProlog;
    procedure somtEmitBaseIncludesProlog;
    procedure somtEmitBaseIncludes(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseIncludesEpilog;
    procedure somtEmitMetaInclude;
    procedure somtEmitClass;
    procedure somtEmitMeta;
    procedure somtEmitBaseProlog;
    procedure somtEmitBase(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseEpilog;
    procedure somtEmitPassthruProlog;
    procedure somtEmitPassthru(entry: SOMTPassthruEntryC);
    procedure somtEmitPassthruEpilog;
    procedure somtEmitRelease;
    procedure somtEmitDataProlog;
    procedure somtEmitData(entry: SOMTDataEntryC);
    procedure somtEmitDataEpilog;
    procedure somtEmitAttributeProlog;
    procedure somtEmitAttribute(att: SOMTAttributeEntryC);
    procedure somtEmitAttributeEpilog;
    procedure somtEmitConstantProlog;
    procedure somtEmitConstant(con: SOMTConstEntryC);
    procedure somtEmitConstantEpilog;
    procedure somtEmitTypedefProlog;
    procedure somtEmitTypedef(td: SOMTTypedefEntryC);
    procedure somtEmitTypedefEpilog;
    procedure somtEmitStructProlog;
    procedure somtEmitStruct(struc: SOMTStructEntryC);
    procedure somtEmitStructEpilog;
    procedure somtEmitUnionProlog;
    procedure somtEmitUnion(un: SOMTUnionEntryC);
    procedure somtEmitUnionEpilog;
    procedure somtEmitEnumProlog;
    procedure somtEmitEnum(en: SOMTEnumEntryC);
    procedure somtEmitEnumEpilog;
    procedure somtEmitInterfaceProlog;
    procedure somtEmitInterface(intfc: SOMTClassEntryC);
    procedure somtEmitInterfaceEpilog;
    procedure somtEmitModuleProlog;
    procedure somtEmitModule(mod: SOMTModuleEntryC);
    procedure somtEmitModuleEpilog;
    procedure somtEmitMethodsProlog;
    procedure somtEmitMethods(method: SOMTMethodEntryC);
    procedure somtEmitMethodsEpilog;
    procedure somtEmitMethod(entry: SOMTMethodEntryC);
    procedure somtEmitEpilog;
    function somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNew(entry: SOMTMethodEntryC): CORBABoolean;
    function somtImplemented(entry: SOMTMethodEntryC): CORBABoolean;
    function somtOverridden(entry: SOMTMethodEntryC): CORBABoolean;
    function somtInherited(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAll(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNewNoProc(entry: SOMTEntryC): CORBABoolean;
    function somtPrivOrPub(entry: SOMTEntryC): CORBABoolean;
    function somtNewProc(entry: SOMTEntryC): CORBABoolean;
    function somtLink(entry: SOMTEntryC): CORBABoolean;
    function somtVA(entry: SOMTEntryC): CORBABoolean;
    function somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    procedure somtEmitFullPassthru(before: CORBABoolean; language: CORBAString);
    function somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstGlobalDefinition: SOMTEntryC;
    function somtGetNextGlobalDefinition: SOMTEntryC;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTemplate: SOMTTemplateOutputC read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: PSOM_FILE read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: SOMTClassEntryC read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: SOMTModuleEntryC read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: SOMTTargetTypeT read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: CORBAString read _get_somtEmitterName write _set_somtEmitterName;
  end;

  ExceptionDef = class
    { Found item: ExceptionDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type: TypeCode;
    procedure _set_type(type: TypeCode);
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property type: TypeCode read _get_type write _set_type;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  PUnresolved_Property_struct = ^Unresolved_Property_struct;
  _IDL_Sequence_Unresolved_Property_struct = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PUnresolved_Property_struct;
  end;
  SOMDServer = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function somdRefFromSOMObj(somobj: SOMObject): SOMDObject;
    function somdSOMObjFromRef(objref: SOMDObject): SOMObject;
    procedure somdDispatchMethod(somobj: SOMObject; out retValue: Pointer; methodId: somId; ap: va_list);
    function somdCreateObj(objclass: CORBAString; hints: CORBAString): SOMObject;
    procedure somdDeleteObj(somobj: SOMObject);
    function somdGetClassObj(objclass: CORBAString): SOMClass;
    function somdObjReferencesCached: CORBABoolean;
    function somdCreateFactory(className: CORBAString; props: _IDL_Sequence_Unresolved_Property_struct): SOMObject;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMDForeignMarshaler = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure marshal(latent_param: CORBAString; dataPtr: Pointer; direction: Unresolved_marshaling_direction_t; function: Unresolved_marshaling_op_t; streamio: CosStream_StreamIO);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  somInitModEmitter = class
    { Found item: INIT_SUFFIX }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_targetDllName: CORBAString;
    procedure _set_targetDllName(targetDllName: CORBAString);
    function _get_targetFileName: CORBAString;
    procedure _set_targetFileName(targetFileName: CORBAString);
    function _get_symbolsFileName: CORBAString;
    procedure _set_symbolsFileName(symbolsFileName: CORBAString);
    function _get_somtTemplate: SOMTTemplateOutputC;
    procedure _set_somtTemplate(somtTemplate: SOMTTemplateOutputC);
    function _get_somtTargetFile: PSOM_FILE;
    procedure _set_somtTargetFile(somtTargetFile: PSOM_FILE);
    function _get_somtTargetClass: SOMTClassEntryC;
    procedure _set_somtTargetClass(somtTargetClass: SOMTClassEntryC);
    function _get_somtTargetModule: SOMTModuleEntryC;
    procedure _set_somtTargetModule(somtTargetModule: SOMTModuleEntryC);
    function _get_somtTargetType: SOMTTargetTypeT;
    procedure _set_somtTargetType(somtTargetType: SOMTTargetTypeT);
    function _get_somtEmitterName: CORBAString;
    procedure _set_somtEmitterName(somtEmitterName: CORBAString);
  public
    procedure somtAddClassEntry(cls: PPointer);
    function emitInitTermFunctions(file: CORBAString; ext: CORBAString): PSOM_FILE;
    function buildInitModFileName(fromFileName: CORBAString; suffix: CORBAString): CORBAString;
    function somtGenerateSections: CORBABoolean;
    function somtOpenSymbolsFile(file: CORBAString; mode: CORBAString): PSOM_FILE;
    procedure somtSetPredefinedSymbols;
    procedure somtFileSymbols;
    procedure somtEmitProlog;
    procedure somtEmitBaseIncludesProlog;
    procedure somtEmitBaseIncludes(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseIncludesEpilog;
    procedure somtEmitMetaInclude;
    procedure somtEmitClass;
    procedure somtEmitMeta;
    procedure somtEmitBaseProlog;
    procedure somtEmitBase(base: SOMTBaseClassEntryC);
    procedure somtEmitBaseEpilog;
    procedure somtEmitPassthruProlog;
    procedure somtEmitPassthru(entry: SOMTPassthruEntryC);
    procedure somtEmitPassthruEpilog;
    procedure somtEmitRelease;
    procedure somtEmitDataProlog;
    procedure somtEmitData(entry: SOMTDataEntryC);
    procedure somtEmitDataEpilog;
    procedure somtEmitAttributeProlog;
    procedure somtEmitAttribute(att: SOMTAttributeEntryC);
    procedure somtEmitAttributeEpilog;
    procedure somtEmitConstantProlog;
    procedure somtEmitConstant(con: SOMTConstEntryC);
    procedure somtEmitConstantEpilog;
    procedure somtEmitTypedefProlog;
    procedure somtEmitTypedef(td: SOMTTypedefEntryC);
    procedure somtEmitTypedefEpilog;
    procedure somtEmitStructProlog;
    procedure somtEmitStruct(struc: SOMTStructEntryC);
    procedure somtEmitStructEpilog;
    procedure somtEmitUnionProlog;
    procedure somtEmitUnion(un: SOMTUnionEntryC);
    procedure somtEmitUnionEpilog;
    procedure somtEmitEnumProlog;
    procedure somtEmitEnum(en: SOMTEnumEntryC);
    procedure somtEmitEnumEpilog;
    procedure somtEmitInterfaceProlog;
    procedure somtEmitInterface(intfc: SOMTClassEntryC);
    procedure somtEmitInterfaceEpilog;
    procedure somtEmitModuleProlog;
    procedure somtEmitModule(mod: SOMTModuleEntryC);
    procedure somtEmitModuleEpilog;
    procedure somtEmitMethodsProlog;
    procedure somtEmitMethods(method: SOMTMethodEntryC);
    procedure somtEmitMethodsEpilog;
    procedure somtEmitMethod(entry: SOMTMethodEntryC);
    procedure somtEmitEpilog;
    function somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNew(entry: SOMTMethodEntryC): CORBABoolean;
    function somtImplemented(entry: SOMTMethodEntryC): CORBABoolean;
    function somtOverridden(entry: SOMTMethodEntryC): CORBABoolean;
    function somtInherited(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean;
    function somtAll(entry: SOMTMethodEntryC): CORBABoolean;
    function somtNewNoProc(entry: SOMTEntryC): CORBABoolean;
    function somtPrivOrPub(entry: SOMTEntryC): CORBABoolean;
    function somtNewProc(entry: SOMTEntryC): CORBABoolean;
    function somtLink(entry: SOMTEntryC): CORBABoolean;
    function somtVA(entry: SOMTEntryC): CORBABoolean;
    function somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    function somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
    procedure somtEmitFullPassthru(before: CORBABoolean; language: CORBAString);
    function somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
    function somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstGlobalDefinition: SOMTEntryC;
    function somtGetNextGlobalDefinition: SOMTEntryC;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property targetDllName: CORBAString read _get_targetDllName write _set_targetDllName;
    property targetFileName: CORBAString read _get_targetFileName write _set_targetFileName;
    property symbolsFileName: CORBAString read _get_symbolsFileName write _set_symbolsFileName;
    property somtTemplate: SOMTTemplateOutputC read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: PSOM_FILE read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: SOMTClassEntryC read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: SOMTModuleEntryC read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: SOMTTargetTypeT read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: CORBAString read _get_somtEmitterName write _set_somtEmitterName;
  end;

  P_IDL_Sequence_Byte = ^_IDL_Sequence_Byte;
  PUnresolved_prot_response = ^Unresolved_prot_response;
  _IDL_Sequence_Unresolved_prot_response = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PUnresolved_prot_response;
  end;
  P_IDL_Sequence_Unresolved_prot_response = ^_IDL_Sequence_Unresolved_prot_response;
  ImplementationDef = class
    { Found item: SOMD_MAXLEN_IMPL_ID }
    { Found item: SOMD_MAXLEN_IMPL_ALIAS }
    { Found item: SOMD_MAXLEN_IMPL_PROGRAM }
    { Found item: SOMD_MAXLEN_FILENAME }
    { Found item: SOMD_MAXLEN_HOSTNAME }
    { Found item: SOMD_MAXLEN_CLASSNAME }
    { Found item: octet_seqP }
    { Found item: prot_response }
    { Found item: seq_prot_responses }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_impl_id: CORBAString;
    procedure _set_impl_id(impl_id: CORBAString);
    function _get_impl_alias: CORBAString;
    procedure _set_impl_alias(impl_alias: CORBAString);
    function _get_impl_program: CORBAString;
    procedure _set_impl_program(impl_program: CORBAString);
    function _get_impl_flags: LongWord;
    procedure _set_impl_flags(impl_flags: LongWord);
    function _get_impl_server_class: CORBAString;
    procedure _set_impl_server_class(impl_server_class: CORBAString);
    function _get_impl_refdata_file: CORBAString;
    procedure _set_impl_refdata_file(impl_refdata_file: CORBAString);
    function _get_impl_refdata_bkup: CORBAString;
    procedure _set_impl_refdata_bkup(impl_refdata_bkup: CORBAString);
    function _get_impl_hostname: CORBAString;
    procedure _set_impl_hostname(impl_hostname: CORBAString);
    function _get_config_file: CORBAString;
    procedure _set_config_file(config_file: CORBAString);
    function _get_impldef_class: CORBAString;
    procedure _set_impldef_class(impldef_class: CORBAString);
    function _get_svr_objref: P_IDL_Sequence_Byte;
    procedure _set_svr_objref(svr_objref: P_IDL_Sequence_Byte);
    function _get_protocols: CORBAString;
    procedure _set_protocols(protocols: CORBAString);
    function _get_registrar_resp: P_IDL_Sequence_Unresolved_prot_response;
    procedure _set_registrar_resp(registrar_resp: P_IDL_Sequence_Unresolved_prot_response);
    function _get_constant_random_id: LongWord;
  public
    procedure externalize_to_stream(stream: CosStream_StreamIO);
    procedure internalize_from_stream(stream: CosStream_StreamIO; ff: CosLifeCycle_FactoryFinder);
    function is_identical(other_object: CosObjectIdentity_IdentifiableObject): CORBABoolean;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property impl_id: CORBAString read _get_impl_id write _set_impl_id;
    property impl_alias: CORBAString read _get_impl_alias write _set_impl_alias;
    property impl_program: CORBAString read _get_impl_program write _set_impl_program;
    property impl_flags: LongWord read _get_impl_flags write _set_impl_flags;
    property impl_server_class: CORBAString read _get_impl_server_class write _set_impl_server_class;
    property impl_refdata_file: CORBAString read _get_impl_refdata_file write _set_impl_refdata_file;
    property impl_refdata_bkup: CORBAString read _get_impl_refdata_bkup write _set_impl_refdata_bkup;
    property impl_hostname: CORBAString read _get_impl_hostname write _set_impl_hostname;
    property config_file: CORBAString read _get_config_file write _set_config_file;
    property impldef_class: CORBAString read _get_impldef_class write _set_impldef_class;
    property svr_objref: P_IDL_Sequence_Byte read _get_svr_objref write _set_svr_objref;
    property protocols: CORBAString read _get_protocols write _set_protocols;
    property registrar_resp: P_IDL_Sequence_Unresolved_prot_response read _get_registrar_resp write _set_registrar_resp;
    property constant_random_id: LongWord read _get_constant_random_id write _set_constant_random_id;
  end;

  PCORBAString = ^CORBAString;
  _IDL_Sequence_CORBAString = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PCORBAString;
  end;
  PImplementationDef = ^ImplementationDef;
  _IDL_Sequence_ImplementationDef = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PImplementationDef;
  end;
  PUnresolved_PV = ^Unresolved_PV;
  _IDL_Sequence_Unresolved_PV = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PUnresolved_PV;
  end;
  ImplRepository = class
    { Found item: PV }
    { Found item: PropertyValue }
    { Found item: PVList }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function find_impldef(implid: CORBAString): ImplementationDef;
    function find_impldef_by_alias(alias_name: CORBAString): ImplementationDef;
    function find_all_aliases(out impl_aliases: _IDL_Sequence_CORBAString): LongWord;
    function find_all_impldefs(out outimpldefs: _IDL_Sequence_ImplementationDef): LongWord;
    function add_impldef(impldef: ImplementationDef): LongWord;
    function update_impldef(impldef: ImplementationDef): LongWord;
    function delete_impldef(implid: CORBAString): LongWord;
    function find_impldef_by_class(classname: CORBAString): _IDL_Sequence_ImplementationDef;
    procedure add_class_to_impldef(implid: CORBAString; classname: CORBAString);
    procedure remove_class_from_impldef(implid: CORBAString; classname: CORBAString);
    procedure remove_class_from_all(classname: CORBAString);
    function find_classes_by_impldef(implid: CORBAString): _IDL_Sequence_CORBAString;
    function add_class_to_all(classname: CORBAString): LongWord;
    function add_class_with_properties(implid: CORBAString; classname: CORBAString; pvl: _IDL_Sequence_Unresolved_PV): LongWord;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  InterfaceDef = class
    { Found item: FullInterfaceDescription }
    { Found item: InterfaceDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
    { Found item: InterfaceName }
    { Found item: ContainerDescription }
  private
    function _get_base_interfaces: _IDL_Sequence_CORBAString;
    procedure _set_base_interfaces(base_interfaces: _IDL_Sequence_CORBAString);
    function _get_instanceData: TypeCode;
    procedure _set_instanceData(instanceData: TypeCode);
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function describe_interface: Unresolved_FullInterfaceDescription;
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Unresolved_ContainerDescription;
    property base_interfaces: _IDL_Sequence_CORBAString read _get_base_interfaces write _set_base_interfaces;
    property instanceData: TypeCode read _get_instanceData write _set_instanceData;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  PUnresolved_NameComponent = ^Unresolved_NameComponent;
  _IDL_Sequence_Unresolved_NameComponent = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PUnresolved_NameComponent;
  end;
  LName = class
    { Found item: NoComponent }
    { Found item: OverFlow }
    { Found item: InvalidName }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function insert_component(i: LongWord; n: LNameComponent): LName;
    function get_component(i: LongWord): LNameComponent;
    function delete_component(i: LongWord): LNameComponent;
    function num_components: LongWord;
    function equal(ln: LName): CORBABoolean;
    function less_than(ln: LName): CORBABoolean;
    function to_idl_form: _IDL_Sequence_Unresolved_NameComponent;
    procedure from_idl_form(n: _IDL_Sequence_Unresolved_NameComponent);
    procedure destroy;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  LNameComponent = class
    { Found item: NotSet }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function get_id: CORBAString;
    procedure set_id(i: CORBAString);
    function get_kind: CORBAString;
    procedure set_kind(k: CORBAString);
    procedure destroy;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  ModuleDef = class
    { Found item: ModuleDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
    { Found item: InterfaceName }
    { Found item: ContainerDescription }
  private
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Unresolved_ContainerDescription;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  NVList = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function add_item(item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord;
    function free: LongWord;
    function free_memory: LongWord;
    function get_count(out count: LongInt): LongWord;
    function set_item(item_number: LongInt; item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord;
    function get_item(item_number: LongInt; out item_name: CORBAString; out item_type: TypeCode; out value: Pointer; out value_len: LongInt; out item_flags: LongWord): LongWord;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  ObjectMgr = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject;
    function somdGetIdFromObject(obj: SOMObject): CORBAString;
    function somdGetObjectFromId(id: CORBAString): SOMObject;
    procedure somdReleaseObject(obj: SOMObject);
    procedure somdDestroyObject(obj: SOMObject);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  OperationDef = class
    { Found item: OperationMode }
    { Found item: OperationDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
    { Found item: InterfaceName }
    { Found item: ContainerDescription }
  private
    function _get_result: TypeCode;
    procedure _set_result(result: TypeCode);
    function _get_mode: Unresolved_OperationMode;
    procedure _set_mode(mode: Unresolved_OperationMode);
    function _get_contexts: _IDL_Sequence_CORBAString;
    procedure _set_contexts(contexts: _IDL_Sequence_CORBAString);
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Unresolved_ContainerDescription;
    property result: TypeCode read _get_result write _set_result;
    property mode: Unresolved_OperationMode read _get_mode write _set_mode;
    property contexts: _IDL_Sequence_CORBAString read _get_contexts write _set_contexts;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  ORB = class
    { Found item: InvalidName }
    { Found item: ObjectId }
    { Found item: ObjectIdList }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_stringToObject30: CORBABoolean;
    procedure _set_stringToObject30(stringToObject30: CORBABoolean);
  public
    function object_to_string(obj: SOMObject): CORBAString;
    function string_to_object(str: CORBAString): SOMObject;
    function create_list(count: LongInt; out new_list: NVList): LongWord;
    function create_operation_list(oper: OperationDef; out new_list: NVList): LongWord;
    function get_default_context(out ctx: Context): LongWord;
    function list_initial_services: _IDL_Sequence_CORBAString;
    function resolve_initial_references(identifier: CORBAString): SOMObject;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property stringToObject30: CORBABoolean read _get_stringToObject30 write _set_stringToObject30;
  end;

  ParameterDef = class
    { Found item: ParameterMode }
    { Found item: ParameterDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type: TypeCode;
    procedure _set_type(type: TypeCode);
    function _get_mode: Unresolved_ParameterMode;
    procedure _set_mode(mode: Unresolved_ParameterMode);
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property type: TypeCode read _get_type write _set_type;
    property mode: Unresolved_ParameterMode read _get_mode write _set_mode;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  Principal = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_userName: CORBAString;
    procedure _set_userName(userName: CORBAString);
    function _get_hostName: CORBAString;
    procedure _set_hostName(hostName: CORBAString);
  public
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property userName: CORBAString read _get_userName write _set_userName;
    property hostName: CORBAString read _get_hostName write _set_hostName;
  end;

  Repository = class
    { Found item: RepositoryDescription }
    { Found item: irOpenErrorCodes }
    { Found item: irOpenError }
    { Found item: InterfaceName }
    { Found item: ContainerDescription }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function lookup_id(search_id: CORBAString): Contained;
    function lookup_modifier(name: CORBAString; modifier: CORBAString): CORBAString;
    procedure release_cache;
    function queryException: CORBABoolean;
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Unresolved_ContainerDescription;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  Request = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function add_arg(name: CORBAString; arg_type: TypeCode; value: Pointer; len: LongInt; arg_flags: LongWord): LongWord;
    function invoke(invoke_flags: LongWord): LongWord;
    function send(invoke_flags: LongWord): LongWord;
    function get_response(response_flags: LongWord): LongWord;
    function destroy: LongWord;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMTEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTAttributeEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtIsReadonly: CORBABoolean;
    function _get_somtAttribType: SOMTEntryC;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstAttributeDeclarator: SOMTDataEntryC;
    function somtGetNextAttributeDeclarator: SOMTDataEntryC;
    function somtGetFirstGetMethod: SOMTMethodEntryC;
    function somtGetNextGetMethod: SOMTMethodEntryC;
    function somtGetFirstSetMethod: SOMTMethodEntryC;
    function somtGetNextSetMethod: SOMTMethodEntryC;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtIsReadonly: CORBABoolean read _get_somtIsReadonly write _set_somtIsReadonly;
    property somtAttribType: SOMTEntryC read _get_somtAttribType write _set_somtAttribType;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTBaseClassEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtBaseClassDef: SOMTClassEntryC;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtBaseClassDef: SOMTClassEntryC read _get_somtBaseClassDef write _set_somtBaseClassDef;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTClassEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtSourceFileName: CORBAString;
    function _get_somtMetaClassEntry: SOMTMetaClassEntryC;
    function _get_somtClassModule: SOMTModuleEntryC;
    function _get_somtNewMethodCount: LongInt;
    function _get_somtLocalInclude: CORBABoolean;
    function _get_somtPrivateMethodCount: LongInt;
    function _get_somtStaticMethodCount: LongInt;
    function _get_somtOverrideMethodCount: LongInt;
    function _get_somtProcMethodCount: LongInt;
    function _get_somtVAMethodCount: LongInt;
    function _get_somtBaseCount: LongInt;
    function _get_somtExternalDataCount: LongInt;
    function _get_somtPublicDataCount: LongInt;
    function _get_somtPrivateDataCount: LongInt;
    function _get_somtMetaclassFor: SOMTClassEntryC;
    function _get_somtForwardRef: CORBABoolean;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstBaseClass: SOMTBaseClassEntryC;
    function somtGetNextBaseClass: SOMTBaseClassEntryC;
    function somtGetFirstReleaseName: CORBAString;
    function somtGetNextReleaseName: CORBAString;
    function somtGetReleaseNameList(buffer: CORBAString): LongInt;
    function somtGetFirstPassthru: SOMTPassthruEntryC;
    function somtGetNextPassthru: SOMTPassthruEntryC;
    function somtGetFirstData: SOMTDataEntryC;
    function somtGetNextData: SOMTDataEntryC;
    function somtGetFirstStaticData: SOMTDataEntryC;
    function somtGetNextStaticData: SOMTDataEntryC;
    function somtGetFirstMethod: SOMTMethodEntryC;
    function somtGetNextMethod: SOMTMethodEntryC;
    function somtGetFirstInheritedMethod: SOMTMethodEntryC;
    function somtGetNextInheritedMethod: SOMTMethodEntryC;
    function somtGetFirstAttribute: SOMTAttributeEntryC;
    function somtGetNextAttribute: SOMTAttributeEntryC;
    function somtGetFirstStruct: SOMTStructEntryC;
    function somtGetNextStruct: SOMTStructEntryC;
    function somtGetFirstTypedef: SOMTTypedefEntryC;
    function somtGetNextTypedef: SOMTTypedefEntryC;
    function somtGetFirstUnion: SOMTUnionEntryC;
    function somtGetNextUnion: SOMTUnionEntryC;
    function somtGetFirstEnum: SOMTEnumEntryC;
    function somtGetNextEnum: SOMTEnumEntryC;
    function somtGetFirstConstant: SOMTConstEntryC;
    function somtGetNextConstant: SOMTConstEntryC;
    function somtGetFirstSequence: SOMTSequenceEntryC;
    function somtGetNextSequence: SOMTSequenceEntryC;
    function somtGetFirstPubdef: SOMTEntryC;
    function somtGetNextPubdef: SOMTEntryC;
    function somtFilterNew(entry: SOMTMethodEntryC): CORBABoolean;
    function somtFilterOverridden(entry: SOMTMethodEntryC): CORBABoolean;
    function somtFilterPrivOrPub(entry: SOMTCommonEntryC): CORBABoolean;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtSourceFileName: CORBAString read _get_somtSourceFileName write _set_somtSourceFileName;
    property somtMetaClassEntry: SOMTMetaClassEntryC read _get_somtMetaClassEntry write _set_somtMetaClassEntry;
    property somtClassModule: SOMTModuleEntryC read _get_somtClassModule write _set_somtClassModule;
    property somtNewMethodCount: LongInt read _get_somtNewMethodCount write _set_somtNewMethodCount;
    property somtLocalInclude: CORBABoolean read _get_somtLocalInclude write _set_somtLocalInclude;
    property somtPrivateMethodCount: LongInt read _get_somtPrivateMethodCount write _set_somtPrivateMethodCount;
    property somtStaticMethodCount: LongInt read _get_somtStaticMethodCount write _set_somtStaticMethodCount;
    property somtOverrideMethodCount: LongInt read _get_somtOverrideMethodCount write _set_somtOverrideMethodCount;
    property somtProcMethodCount: LongInt read _get_somtProcMethodCount write _set_somtProcMethodCount;
    property somtVAMethodCount: LongInt read _get_somtVAMethodCount write _set_somtVAMethodCount;
    property somtBaseCount: LongInt read _get_somtBaseCount write _set_somtBaseCount;
    property somtExternalDataCount: LongInt read _get_somtExternalDataCount write _set_somtExternalDataCount;
    property somtPublicDataCount: LongInt read _get_somtPublicDataCount write _set_somtPublicDataCount;
    property somtPrivateDataCount: LongInt read _get_somtPrivateDataCount write _set_somtPrivateDataCount;
    property somtMetaclassFor: SOMTClassEntryC read _get_somtMetaclassFor write _set_somtMetaclassFor;
    property somtForwardRef: CORBABoolean read _get_somtForwardRef write _set_somtForwardRef;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTCommonEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTypeObj: SOMTEntryC;
    function _get_somtPtrs: CORBAString;
    function _get_somtArrayDimsString: CORBAString;
    function _get_somtSourceText: CORBAString;
    function _get_somtType: CORBAString;
    function _get_somtVisibility: somtVisibilityT;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstArrayDimension: LongWord;
    function somtGetNextArrayDimension: LongWord;
    function somtIsArray(out size: LongInt): CORBABoolean;
    function somtIsPointer: CORBABoolean;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText write _set_somtSourceText;
    property somtType: CORBAString read _get_somtType write _set_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTConstEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtConstTypeObj: SOMTEntryC;
    function _get_somtConstType: CORBAString;
    function _get_somtConstStringVal: CORBAString;
    function _get_somtConstNumVal: LongWord;
    function _get_somtConstNumNegVal: LongInt;
    function _get_somtConstIsNegative: CORBABoolean;
    function _get_somtConstVal: CORBAString;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtConstTypeObj: SOMTEntryC read _get_somtConstTypeObj write _set_somtConstTypeObj;
    property somtConstType: CORBAString read _get_somtConstType write _set_somtConstType;
    property somtConstStringVal: CORBAString read _get_somtConstStringVal write _set_somtConstStringVal;
    property somtConstNumVal: LongWord read _get_somtConstNumVal write _set_somtConstNumVal;
    property somtConstNumNegVal: LongInt read _get_somtConstNumNegVal write _set_somtConstNumNegVal;
    property somtConstIsNegative: CORBABoolean read _get_somtConstIsNegative write _set_somtConstIsNegative;
    property somtConstVal: CORBAString read _get_somtConstVal write _set_somtConstVal;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTDataEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtIsSelfRef: CORBABoolean;
    function _get_somtTypeObj: SOMTEntryC;
    function _get_somtPtrs: CORBAString;
    function _get_somtArrayDimsString: CORBAString;
    function _get_somtSourceText: CORBAString;
    function _get_somtType: CORBAString;
    function _get_somtVisibility: somtVisibilityT;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstArrayDimension: LongWord;
    function somtGetNextArrayDimension: LongWord;
    function somtIsArray(out size: LongInt): CORBABoolean;
    function somtIsPointer: CORBABoolean;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtIsSelfRef: CORBABoolean read _get_somtIsSelfRef write _set_somtIsSelfRef;
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText write _set_somtSourceText;
    property somtType: CORBAString read _get_somtType write _set_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTEnumEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstEnumName: SOMTEnumNameEntryC;
    function somtGetNextEnumName: SOMTEnumNameEntryC;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTEnumNameEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtEnumPtr: SOMTEnumEntryC;
    function _get_somtEnumVal: LongWord;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtEnumPtr: SOMTEnumEntryC read _get_somtEnumPtr write _set_somtEnumPtr;
    property somtEnumVal: LongWord read _get_somtEnumVal write _set_somtEnumVal;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTMetaClassEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtMetaFile: CORBAString;
    function _get_somtMetaClassDef: SOMTClassEntryC;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtMetaFile: CORBAString read _get_somtMetaFile write _set_somtMetaFile;
    property somtMetaClassDef: SOMTClassEntryC read _get_somtMetaClassDef write _set_somtMetaClassDef;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTMethodEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtIsVarargs: CORBABoolean;
    function _get_somtOriginalMethod: SOMTMethodEntryC;
    function _get_somtOriginalClass: SOMTClassEntryC;
    function _get_somtMethodGroup: SOMTEntryC;
    function _get_somtIsPrivateMethod: CORBABoolean;
    function _get_somtIsOneway: CORBABoolean;
    function _get_somtArgCount: SmallInt;
    function _get_somtContextArray: PCORBAString;
    function _get_somtCReturnType: CORBAString;
    function _get_somtTypeObj: SOMTEntryC;
    function _get_somtPtrs: CORBAString;
    function _get_somtArrayDimsString: CORBAString;
    function _get_somtSourceText: CORBAString;
    function _get_somtType: CORBAString;
    function _get_somtVisibility: somtVisibilityT;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstParameter: SOMTParameterEntryC;
    function somtGetNextParameter: SOMTParameterEntryC;
    function somtGetIDLParamList(buffer: CORBAString): CORBAString;
    function somtGetShortCParamList(buffer: CORBAString; selfParm: CORBAString; varargsParm: CORBAString): CORBAString;
    function somtGetFullCParamList(buffer: CORBAString; varargsParm: CORBAString): CORBAString;
    function somtGetShortParamNameList(buffer: CORBAString; selfParm: CORBAString; varargsParm: CORBAString): CORBAString;
    function somtGetFullParamNameList(buffer: CORBAString; varargsParm: CORBAString): CORBAString;
    function somtGetNthParameter(n: SmallInt): SOMTParameterEntryC;
    function somtGetFirstException: SOMTStructEntryC;
    function somtGetNextException: SOMTStructEntryC;
    function somtGetFirstArrayDimension: LongWord;
    function somtGetNextArrayDimension: LongWord;
    function somtIsArray(out size: LongInt): CORBABoolean;
    function somtIsPointer: CORBABoolean;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtIsVarargs: CORBABoolean read _get_somtIsVarargs write _set_somtIsVarargs;
    property somtOriginalMethod: SOMTMethodEntryC read _get_somtOriginalMethod write _set_somtOriginalMethod;
    property somtOriginalClass: SOMTClassEntryC read _get_somtOriginalClass write _set_somtOriginalClass;
    property somtMethodGroup: SOMTEntryC read _get_somtMethodGroup write _set_somtMethodGroup;
    property somtIsPrivateMethod: CORBABoolean read _get_somtIsPrivateMethod write _set_somtIsPrivateMethod;
    property somtIsOneway: CORBABoolean read _get_somtIsOneway write _set_somtIsOneway;
    property somtArgCount: SmallInt read _get_somtArgCount write _set_somtArgCount;
    property somtContextArray: PCORBAString read _get_somtContextArray write _set_somtContextArray;
    property somtCReturnType: CORBAString read _get_somtCReturnType write _set_somtCReturnType;
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText write _set_somtSourceText;
    property somtType: CORBAString read _get_somtType write _set_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTModuleEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtOuterModule: SOMTModuleEntryC;
    function _get_somtModuleFile: CORBAString;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstModuleStruct: SOMTStructEntryC;
    function somtGetNextModuleStruct: SOMTStructEntryC;
    function somtGetFirstModuleTypedef: SOMTTypedefEntryC;
    function somtGetNextModuleTypedef: SOMTTypedefEntryC;
    function somtGetFirstModuleUnion: SOMTUnionEntryC;
    function somtGetNextModuleUnion: SOMTUnionEntryC;
    function somtGetFirstModuleEnum: SOMTEnumEntryC;
    function somtGetNextModuleEnum: SOMTEnumEntryC;
    function somtGetFirstModuleConstant: SOMTConstEntryC;
    function somtGetNextModuleConstant: SOMTConstEntryC;
    function somtGetFirstModuleSequence: SOMTSequenceEntryC;
    function somtGetNextModuleSequence: SOMTSequenceEntryC;
    function somtGetFirstInterface: SOMTClassEntryC;
    function somtGetNextInterface: SOMTClassEntryC;
    function somtGetFirstModule: SOMTModuleEntryC;
    function somtGetNextModule: SOMTModuleEntryC;
    function somtGetFirstModuleDef: SOMTEntryC;
    function somtGetNextModuleDef: SOMTEntryC;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtOuterModule: SOMTModuleEntryC read _get_somtOuterModule write _set_somtOuterModule;
    property somtModuleFile: CORBAString read _get_somtModuleFile write _set_somtModuleFile;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTParameterEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtParameterDirection: somtParameterDirectionT;
    function _get_somtIDLParameterDeclaration: CORBAString;
    function _get_somtCParameterDeclaration: CORBAString;
    function _get_somtTypeObj: SOMTEntryC;
    function _get_somtPtrs: CORBAString;
    function _get_somtArrayDimsString: CORBAString;
    function _get_somtSourceText: CORBAString;
    function _get_somtType: CORBAString;
    function _get_somtVisibility: somtVisibilityT;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstArrayDimension: LongWord;
    function somtGetNextArrayDimension: LongWord;
    function somtIsArray(out size: LongInt): CORBABoolean;
    function somtIsPointer: CORBABoolean;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtParameterDirection: somtParameterDirectionT read _get_somtParameterDirection write _set_somtParameterDirection;
    property somtIDLParameterDeclaration: CORBAString read _get_somtIDLParameterDeclaration write _set_somtIDLParameterDeclaration;
    property somtCParameterDeclaration: CORBAString read _get_somtCParameterDeclaration write _set_somtCParameterDeclaration;
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText write _set_somtSourceText;
    property somtType: CORBAString read _get_somtType write _set_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTPassthruEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtPassthruBody: CORBAString;
    function _get_somtPassthruLanguage: CORBAString;
    function _get_somtPassthruTarget: CORBAString;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtIsBeforePassthru: CORBABoolean;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtPassthruBody: CORBAString read _get_somtPassthruBody write _set_somtPassthruBody;
    property somtPassthruLanguage: CORBAString read _get_somtPassthruLanguage write _set_somtPassthruLanguage;
    property somtPassthruTarget: CORBAString read _get_somtPassthruTarget write _set_somtPassthruTarget;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTSequenceEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtSeqLength: LongInt;
    function _get_somtSeqType: SOMTEntryC;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtSeqLength: LongInt read _get_somtSeqLength write _set_somtSeqLength;
    property somtSeqType: SOMTEntryC read _get_somtSeqType write _set_somtSeqType;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTStringEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtStringLength: LongInt;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtStringLength: LongInt read _get_somtStringLength write _set_somtStringLength;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTStructEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtStructClass: SOMTClassEntryC;
    function _get_somtIsException: CORBABoolean;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstMember: SOMTTypedefEntryC;
    function somtGetNextMember: SOMTTypedefEntryC;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtStructClass: SOMTClassEntryC read _get_somtStructClass write _set_somtStructClass;
    property somtIsException: CORBABoolean read _get_somtIsException write _set_somtIsException;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTTypedefEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTypedefType: SOMTEntryC;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstDeclarator: SOMTCommonEntryC;
    function somtGetNextDeclarator: SOMTCommonEntryC;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTypedefType: SOMTEntryC read _get_somtTypedefType write _set_somtTypedefType;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTTemplateOutputC = class
    { Found item: MAX_INPUT_LINE_LENGTH }
    { Found item: MAX_OUTPUT_LINE_LENGTH }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtCommentStyle: somtCommentStyleT;
    procedure _set_somtCommentStyle(somtCommentStyle: somtCommentStyleT);
    function _get_somtLineLength: LongInt;
    procedure _set_somtLineLength(somtLineLength: LongInt);
    function _get_somtCommentNewline: CORBABoolean;
    procedure _set_somtCommentNewline(somtCommentNewline: CORBABoolean);
  public
    function somtGetSymbol(name: CORBAString): CORBAString;
    procedure somtSetSymbol(name: CORBAString; value: CORBAString);
    procedure somtSetSymbolCopyName(name: CORBAString; value: CORBAString);
    procedure somtSetSymbolCopyValue(name: CORBAString; value: CORBAString);
    procedure somtSetSymbolCopyBoth(name: CORBAString; value: CORBAString);
    function somtCheckSymbol(name: CORBAString): CORBABoolean;
    procedure somtSetOutputFile(var fp: SOM_FILE);
    procedure somto(tmplt: CORBAString);
    procedure somtOutputComment(comment: CORBAString);
    procedure somtOutputSection(sectionName: CORBAString);
    procedure somtAddSectionDefinitions(defString: CORBAString);
    procedure somtReadSectionDefinitions(var fp: SOM_FILE);
    function somtExpandSymbol(s: CORBAString; buf: CORBAString): CORBAString;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtCommentStyle: somtCommentStyleT read _get_somtCommentStyle write _set_somtCommentStyle;
    property somtLineLength: LongInt read _get_somtLineLength write _set_somtLineLength;
    property somtCommentNewline: CORBABoolean read _get_somtCommentNewline write _set_somtCommentNewline;
  end;

  PUnresolved_somtCaseEntry = ^Unresolved_somtCaseEntry;
  SOMTUnionEntryC = class
    { Found item: somtLabelList }
    { Found item: somtCaseEntry }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtSwitchType: SOMTEntryC;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstCaseEntry: PUnresolved_somtCaseEntry;
    function somtGetNextCaseEntry: PUnresolved_somtCaseEntry;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtSwitchType: SOMTEntryC read _get_somtSwitchType write _set_somtSwitchType;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTUserDefinedTypeEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtOriginalTypedef: SOMTTypedefEntryC;
    function _get_somtBaseTypeObj: SOMTEntryC;
    function _get_somtTypeObj: SOMTEntryC;
    function _get_somtPtrs: CORBAString;
    function _get_somtArrayDimsString: CORBAString;
    function _get_somtSourceText: CORBAString;
    function _get_somtType: CORBAString;
    function _get_somtVisibility: somtVisibilityT;
    function _get_somtEntryName: CORBAString;
    procedure _set_somtEntryName(somtEntryName: CORBAString);
    function _get_somtElementType: LongWord;
    procedure _set_somtElementType(somtElementType: LongWord);
    function _get_somtElementTypeName: CORBAString;
    function _get_somtEntryComment: CORBAString;
    function _get_somtSourceLineNumber: LongWord;
    function _get_somtTypeCode: TypeCode;
    function _get_somtIsReference: CORBABoolean;
    function _get_somtIDLScopedName: CORBAString;
    function _get_somtCScopedName: CORBAString;
  public
    function somtGetFirstArrayDimension: LongWord;
    function somtGetNextArrayDimension: LongWord;
    function somtIsArray(out size: LongInt): CORBABoolean;
    function somtIsPointer: CORBABoolean;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtOriginalTypedef: SOMTTypedefEntryC read _get_somtOriginalTypedef write _set_somtOriginalTypedef;
    property somtBaseTypeObj: SOMTEntryC read _get_somtBaseTypeObj write _set_somtBaseTypeObj;
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText write _set_somtSourceText;
    property somtType: CORBAString read _get_somtType write _set_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMDServerMgr = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function somdShutdownServer(server_alias: CORBAString): LongWord;
    function somdShutdownImpl(impldef: ImplementationDef): LongWord;
    function somdStartServer(server_alias: CORBAString): LongWord;
    function somdRestartServer(server_alias: CORBAString): LongWord;
    function somdListServer(server_alias: CORBAString): LongWord;
    function somdDisableServer(server_alias: CORBAString): LongWord;
    function somdEnableServer(server_alias: CORBAString): LongWord;
    function somdIsServerEnabled(impldef: ImplementationDef): CORBABoolean;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  PUnresolved_somOffsetInfo = ^Unresolved_somOffsetInfo;
  _IDL_Sequence_Unresolved_somOffsetInfo = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PUnresolved_somOffsetInfo;
  end;
  PSOMClass = ^SOMClass;
  _IDL_Sequence_SOMClass = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PSOMClass;
  end;
  PsomMethodTab = ^somMethodTab;
  PsomMethodTabList = ^somMethodTabList;
  SOMClass = class
    { Found item: somTokenSequence }
    { Found item: SOMClassSequence }
    { Found item: somOffsetInfo }
    { Found item: somOffsets }
    { Found item: somIdSequence }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
  public
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): Pointer;
    procedure somDeallocate(memptr: Pointer);
    function somJoin(secondParent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somEndow(parent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somClassOfNewClassWithParents(newClassName: CORBAString; parents: _IDL_Sequence_SOMClass; explicitMeta: SOMClass): SOMClass;
    procedure somInitMIClass(inherit_vars: LongWord; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxNDMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; methodImpl: Pointer; applyStub: Pointer);
    function somGetName: CORBAString;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetInstanceSize: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetClassMtab: PsomMethodTab;
    function somGetClassData: Pointer;
    procedure somSetClassData(cds: Pointer);
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetMarshalPlan(methodId: somId): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somGetApplyStub(methodId: somId): Pointer;
    function somGetPClsMtab: PsomMethodTabList;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    function somMethodImplOwner(var md: somMethodDataStruct): SOMClass;
    function somGetRdStub(methodId: somId): PPointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  SOMMSingleInstance = class
    { Found item: somTokenSequence }
    { Found item: SOMClassSequence }
    { Found item: somOffsetInfo }
    { Found item: somOffsets }
    { Found item: somIdSequence }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
  public
    function sommGetSingleInstance: SOMObject;
    procedure sommFreeSingleInstance;
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): Pointer;
    procedure somDeallocate(memptr: Pointer);
    function somJoin(secondParent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somEndow(parent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somClassOfNewClassWithParents(newClassName: CORBAString; parents: _IDL_Sequence_SOMClass; explicitMeta: SOMClass): SOMClass;
    procedure somInitMIClass(inherit_vars: LongWord; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxNDMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; methodImpl: Pointer; applyStub: Pointer);
    function somGetName: CORBAString;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetInstanceSize: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetClassMtab: PsomMethodTab;
    function somGetClassData: Pointer;
    procedure somSetClassData(cds: Pointer);
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetMarshalPlan(methodId: somId): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somGetApplyStub(methodId: somId): Pointer;
    function somGetPClsMtab: PsomMethodTabList;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    function somMethodImplOwner(var md: somMethodDataStruct): SOMClass;
    function somGetRdStub(methodId: somId): PPointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  TypecodeDataManipulator = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMMBeforeAfter = class
    { Found item: somTokenSequence }
    { Found item: SOMClassSequence }
    { Found item: somOffsetInfo }
    { Found item: somOffsets }
    { Found item: somIdSequence }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
  public
    function sommBeforeMethod(object: SOMObject; methodId: somId; ap: va_list): CORBABoolean;
    procedure sommAfterMethod(object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list);
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): Pointer;
    procedure somDeallocate(memptr: Pointer);
    function somJoin(secondParent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somEndow(parent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somClassOfNewClassWithParents(newClassName: CORBAString; parents: _IDL_Sequence_SOMClass; explicitMeta: SOMClass): SOMClass;
    procedure somInitMIClass(inherit_vars: LongWord; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxNDMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; methodImpl: Pointer; applyStub: Pointer);
    function somGetName: CORBAString;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetInstanceSize: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetClassMtab: PsomMethodTab;
    function somGetClassData: Pointer;
    procedure somSetClassData(cds: Pointer);
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetMarshalPlan(methodId: somId): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somGetApplyStub(methodId: somId): Pointer;
    function somGetPClsMtab: PsomMethodTabList;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    function somMethodImplOwner(var md: somMethodDataStruct): SOMClass;
    function somGetRdStub(methodId: somId): PPointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  SOMClassMgr = class
    { Found item: SOMClassArray }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somInterfaceRepository: Repository;
    procedure _set_somInterfaceRepository(somInterfaceRepository: Repository);
    function _get_somRegisteredClasses: _IDL_Sequence_SOMClass;
  public
    function somLoadClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; file: CORBAString): SOMClass;
    function somLocateClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt): CORBAString;
    procedure somRegisterClass(classObj: SOMClass);
    procedure somRegisterClassLibrary(libraryName: CORBAString; libraryInitRtn: Pointer);
    procedure somUnregisterClassLibrary(libraryName: CORBAString);
    function somUnloadClassFile(classObj: SOMClass): LongInt;
    function somUnregisterClass(classObj: SOMClass): LongInt;
    procedure somBeginPersistentClasses;
    procedure somEndPersistentClasses;
    function somJoinAffinityGroup(newClass: SOMClass; affClass: SOMClass): CORBABoolean;
    function somGetInitFunction: CORBAString;
    function somGetRelatedClasses(classObj: SOMClass): PSOMClass;
    function somClassFromId(classId: somId): SOMClass;
    function somFindClass(classId: somId; majorVersion: LongInt; minorVersion: LongInt): SOMClass;
    function somFindClsInFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; file: CORBAString): SOMClass;
    procedure somMergeInto(targetObj: SOMObject);
    function somSubstituteClass(origClassName: CORBAString; newClassName: CORBAString): LongInt;
    function somImportObject(objToBeShared: SOMObject): CORBABoolean;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somInterfaceRepository: Repository read _get_somInterfaceRepository write _set_somInterfaceRepository;
    property somRegisteredClasses: _IDL_Sequence_SOMClass read _get_somRegisteredClasses write _set_somRegisteredClasses;
  end;

  SOMMProxyForObject = class
    { Found item: sommProxyDispatchInfo }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_sommProxyTarget: SOMObject;
    procedure _set_sommProxyTarget(sommProxyTarget: SOMObject);
  public
    function sommProxyDispatch(out returnBufferPointer: Pointer; dispatchInfo: Unresolved_sommProxyDispatchInfo; ap: va_list): CORBABoolean;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property sommProxyTarget: SOMObject read _get_sommProxyTarget write _set_sommProxyTarget;
  end;

  SOMDObject = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type_id: CORBAString;
    procedure _set_type_id(type_id: CORBAString);
  public
    function is_nil: CORBABoolean;
    function is_SOM_ref: CORBABoolean;
    function is_constant: CORBABoolean;
    function get_implementation: ImplementationDef;
    function get_interface: InterfaceDef;
    function is_proxy: CORBABoolean;
    function duplicate: SOMObject;
    procedure release;
    function create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var result: NamedValue; out request: Request; req_flags: LongWord): LongWord;
    function create_request_args(operation: CORBAString; out arg_list: NVList; out result: NamedValue): LongWord;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property type_id: CORBAString read _get_type_id write _set_type_id;
  end;

  SOMDClientProxy = class
    { Found item: sommProxyDispatchInfo }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_sommProxyTarget: SOMObject;
    procedure _set_sommProxyTarget(sommProxyTarget: SOMObject);
    function _get_type_id: CORBAString;
    procedure _set_type_id(type_id: CORBAString);
  public
    procedure somdTargetFree;
    function somdTargetGetClass: SOMClass;
    function somdTargetGetClassName: CORBAString;
    procedure somdProxyFree;
    function somdProxyGetClass: SOMClass;
    function somdProxyGetClassName: CORBAString;
    procedure somdReleaseResources;
    function sommProxyDispatch(out returnBufferPointer: Pointer; dispatchInfo: Unresolved_sommProxyDispatchInfo; ap: va_list): CORBABoolean;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    function is_nil: CORBABoolean;
    function is_SOM_ref: CORBABoolean;
    function is_constant: CORBABoolean;
    function get_implementation: ImplementationDef;
    function get_interface: InterfaceDef;
    function is_proxy: CORBABoolean;
    function duplicate: SOMObject;
    procedure release;
    function create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var result: NamedValue; out request: Request; req_flags: LongWord): LongWord;
    function create_request_args(operation: CORBAString; out arg_list: NVList; out result: NamedValue): LongWord;
    property sommProxyTarget: SOMObject read _get_sommProxyTarget write _set_sommProxyTarget;
    property type_id: CORBAString read _get_type_id write _set_type_id;
  end;

  PSOMDServer = ^SOMDServer;
  _IDL_Sequence_SOMDServer = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PSOMDServer;
  end;
  SOMDObjectMgr = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somd21somFree: CORBABoolean;
    procedure _set_somd21somFree(somd21somFree: CORBABoolean);
  public
    function somdFindServer(serverid: CORBAString): SOMDServer;
    function somdFindServerByName(servername: CORBAString): SOMDServer;
    function somdFindServersByClass(objclass: CORBAString): _IDL_Sequence_SOMDServer;
    function somdFindAnyServerByClass(objclass: CORBAString): SOMDServer;
    function somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject;
    function somdGetIdFromObject(obj: SOMObject): CORBAString;
    function somdGetObjectFromId(id: CORBAString): SOMObject;
    procedure somdReleaseObject(obj: SOMObject);
    procedure somdDestroyObject(obj: SOMObject);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somd21somFree: CORBABoolean read _get_somd21somFree write _set_somd21somFree;
  end;

  SOMUTId = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure somutSetIdId(otherId: SOMUTId);
    function somutEqualsId(otherId: SOMUTId): CORBABoolean;
    function somutCompareId(otherId: SOMUTId): SmallInt;
    function somutHashId: LongWord;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  PUnresolved_SOMDServiceContext = ^Unresolved_SOMDServiceContext;
  _IDL_Sequence_Unresolved_SOMDServiceContext = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PUnresolved_SOMDServiceContext;
  end;
  SOMOA = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function execute_next_request(waitFlag: LongWord): LongWord;
    function execute_request_loop(waitFlag: LongWord): LongWord;
    procedure change_id(objref: SOMDObject; id: _IDL_Sequence_Byte);
    function create_constant(id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject;
    function create_SOM_ref(somobj: SOMObject; impl: ImplementationDef): SOMDObject;
    function get_SOM_object(somref: SOMDObject): SOMObject;
    procedure activate_impl_failed(impl: ImplementationDef; rc: LongWord);
    procedure interrupt_server;
    function get_service_contexts(obj: SOMDObject): _IDL_Sequence_Unresolved_SOMDServiceContext;
    function create(id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject;
    procedure dispose(obj: SOMDObject);
    function get_id(obj: SOMDObject): _IDL_Sequence_Byte;
    function get_principal(obj: SOMDObject; req_ev: Environment): Principal;
    procedure set_exception(major: exception_type; userid: CORBAString; param: Pointer);
    procedure impl_is_ready(impl: ImplementationDef);
    procedure deactivate_impl(impl: ImplementationDef);
    procedure change_implementation(obj: SOMDObject; impl: ImplementationDef);
    procedure obj_is_ready(obj: SOMDObject; impl: ImplementationDef);
    procedure deactivate_obj(obj: SOMDObject);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMParentDerived = class
    { Found item: somTokenSequence }
    { Found item: SOMClassSequence }
    { Found item: somOffsetInfo }
    { Found item: somOffsets }
    { Found item: somIdSequence }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
  public
    procedure somwpclsInitData;
    procedure somwpclsUninitData;
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): Pointer;
    procedure somDeallocate(memptr: Pointer);
    function somJoin(secondParent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somEndow(parent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somClassOfNewClassWithParents(newClassName: CORBAString; parents: _IDL_Sequence_SOMClass; explicitMeta: SOMClass): SOMClass;
    procedure somInitMIClass(inherit_vars: LongWord; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxNDMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; methodImpl: Pointer; applyStub: Pointer);
    function somGetName: CORBAString;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetInstanceSize: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetClassMtab: PsomMethodTab;
    function somGetClassData: Pointer;
    procedure somSetClassData(cds: Pointer);
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetMarshalPlan(methodId: somId): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somGetApplyStub(methodId: somId): Pointer;
    function somGetPClsMtab: PsomMethodTabList;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    function somMethodImplOwner(var md: somMethodDataStruct): SOMClass;
    function somGetRdStub(methodId: somId): PPointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  SOMParentDerivedMetaclass = class
    { Found item: somTokenSequence }
    { Found item: SOMClassSequence }
    { Found item: somOffsetInfo }
    { Found item: somOffsets }
    { Found item: somIdSequence }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somNonDerivedFrontier: _IDL_Sequence_SOMClass;
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
  public
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): Pointer;
    procedure somDeallocate(memptr: Pointer);
    function somJoin(secondParent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somEndow(parent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somClassOfNewClassWithParents(newClassName: CORBAString; parents: _IDL_Sequence_SOMClass; explicitMeta: SOMClass): SOMClass;
    procedure somInitMIClass(inherit_vars: LongWord; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxNDMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; methodImpl: Pointer; applyStub: Pointer);
    function somGetName: CORBAString;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetInstanceSize: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetClassMtab: PsomMethodTab;
    function somGetClassData: Pointer;
    procedure somSetClassData(cds: Pointer);
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetMarshalPlan(methodId: somId): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somGetApplyStub(methodId: somId): Pointer;
    function somGetPClsMtab: PsomMethodTabList;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    function somMethodImplOwner(var md: somMethodDataStruct): SOMClass;
    function somGetRdStub(methodId: somId): PPointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somNonDerivedFrontier: _IDL_Sequence_SOMClass read _get_somNonDerivedFrontier write _set_somNonDerivedFrontier;
    property somDataAlignment: LongInt read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  SOMMProxyFor = class
    { Found item: somTokenSequence }
    { Found item: SOMClassSequence }
    { Found item: somOffsetInfo }
    { Found item: somOffsets }
    { Found item: somIdSequence }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
  public
    function sommMakeProxyClass(targetClass: SOMClass; className: CORBAString): SOMClass;
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): Pointer;
    procedure somDeallocate(memptr: Pointer);
    function somJoin(secondParent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somEndow(parent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somClassOfNewClassWithParents(newClassName: CORBAString; parents: _IDL_Sequence_SOMClass; explicitMeta: SOMClass): SOMClass;
    procedure somInitMIClass(inherit_vars: LongWord; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxNDMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; methodImpl: Pointer; applyStub: Pointer);
    function somGetName: CORBAString;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetInstanceSize: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetClassMtab: PsomMethodTab;
    function somGetClassData: Pointer;
    procedure somSetClassData(cds: Pointer);
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetMarshalPlan(methodId: somId): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somGetApplyStub(methodId: somId): Pointer;
    function somGetPClsMtab: PsomMethodTabList;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    function somMethodImplOwner(var md: somMethodDataStruct): SOMClass;
    function somGetRdStub(methodId: somId): PPointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  SOMUTStringId = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function somutSetIdString(IdString: CORBAString): LongInt;
    function somutGetIdString(toBuffer: CORBAString): CORBAString;
    function somutGetIdStringLen: LongInt;
    function somutEqualsString(IdString: CORBAString): CORBABoolean;
    function somutCompareString(IdString: CORBAString): SmallInt;
    procedure somutSetIdId(otherId: SOMUTId);
    function somutEqualsId(otherId: SOMUTId): CORBABoolean;
    function somutCompareId(otherId: SOMUTId): SmallInt;
    function somutHashId: LongWord;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMStringTableC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somstTargetCapacity: LongWord;
    procedure _set_somstTargetCapacity(somstTargetCapacity: LongWord);
    function _get_somstAssociationsCount: LongWord;
  public
    function somstAssociate(key: CORBAString; value: CORBAString): SmallInt;
    function somstAssociateCopyKey(key: CORBAString; value: CORBAString): SmallInt;
    function somstAssociateCopyValue(key: CORBAString; value: CORBAString): SmallInt;
    function somstAssociateCopyBoth(key: CORBAString; value: CORBAString): SmallInt;
    function somstGetAssociation(key: CORBAString): CORBAString;
    function somstClearAssociation(key: CORBAString): CORBABoolean;
    function somstGetIthKey(i: LongWord): CORBAString;
    function somstGetIthValue(i: LongWord): CORBAString;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somstTargetCapacity: LongWord read _get_somstTargetCapacity write _set_somstTargetCapacity;
    property somstAssociationsCount: LongWord read _get_somstAssociationsCount write _set_somstAssociationsCount;
  end;

  SOMMTraced = class
    { Found item: somTokenSequence }
    { Found item: SOMClassSequence }
    { Found item: somOffsetInfo }
    { Found item: somOffsets }
    { Found item: somIdSequence }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_sommTraceIsOn: CORBABoolean;
    procedure _set_sommTraceIsOn(sommTraceIsOn: CORBABoolean);
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
  public
    function sommBeforeMethod(object: SOMObject; methodId: somId; ap: va_list): CORBABoolean;
    procedure sommAfterMethod(object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list);
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): Pointer;
    procedure somDeallocate(memptr: Pointer);
    function somJoin(secondParent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somEndow(parent: SOMClass; nameOfNewClass: CORBAString): SOMClass;
    function somClassOfNewClassWithParents(newClassName: CORBAString; parents: _IDL_Sequence_SOMClass; explicitMeta: SOMClass): SOMClass;
    procedure somInitMIClass(inherit_vars: LongWord; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxNDMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; methodImpl: Pointer; applyStub: Pointer);
    function somGetName: CORBAString;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetInstanceSize: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetClassMtab: PsomMethodTab;
    function somGetClassData: Pointer;
    procedure somSetClassData(cds: Pointer);
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetMarshalPlan(methodId: somId): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somGetApplyStub(methodId: somId): Pointer;
    function somGetPClsMtab: PsomMethodTabList;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    function somMethodImplOwner(var md: somMethodDataStruct): SOMClass;
    function somGetRdStub(methodId: somId): PPointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property sommTraceIsOn: CORBABoolean read _get_sommTraceIsOn write _set_sommTraceIsOn;
    property somDataAlignment: LongInt read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_Unresolved_somOffsetInfo read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  TSIdentification = class
    { Found item: NotAvailable }
    { Found item: AlreadyIdentified }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_sender: TSPortability_Sender;
    function _get_receiver: TSPortability_Receiver;
  public
    procedure identify_sender(sender: TSPortability_Sender);
    procedure identify_receiver(receiver: TSPortability_Receiver);
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property sender: TSPortability_Sender read _get_sender write _set_sender;
    property receiver: TSPortability_Receiver read _get_receiver write _set_receiver;
  end;

  TypeDef = class
    { Found item: TypeDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type: TypeCode;
    procedure _set_type(type: TypeCode);
    function _get_name: CORBAString;
    procedure _set_name(name: CORBAString);
    function _get_id: CORBAString;
    procedure _set_id(id: CORBAString);
    function _get_defined_in: CORBAString;
    procedure _set_defined_in(defined_in: CORBAString);
    function _get_somModifiers: _IDL_Sequence_somModifier;
    procedure _set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
  public
    function within: _IDL_Sequence_Container;
    function describe: Unresolved_Description;
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property type: TypeCode read _get_type write _set_type;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  SysAdminException = class
    { Found item: Exception }
    { Found item: MsgContext }
    { Found item: ExException }
    { Found item: ExFailed }
    { Found item: ExInvalid }
    { Found item: ExNotFound }
    { Found item: ExExists }
    { Found item: ExFileIO }
    { Found item: ExObjNotFound }
    { Found item: ExNoMoreMemory }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure somDefaultInit(ctrl: PsomGenericCtrl);
    procedure somDestruct(doFree: Byte; ctrl: PsomGenericCtrl);
    procedure somDefaultCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(ctrl: PsomGenericCtrl; fromObj: SOMObject);
    function somDefaultConstAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(ctrl: PsomGenericCtrl; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somUninit;
    procedure somFree;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(castedCls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

{ Found item: bhany }

{ Found item: CosNaming }

{ Found item: Biter }

{ Found item: SOMD }

{ Found item: ExtendedNaming }

{ Found item: IIOP }

{ Found item: IOR }

{ Found item: CosObjectIdentity }

{ Found item: somOS }

{ Found item: CosLifeCycle }

{ Found item: CosStream }

{ Found item: somStream }

{ Found item: somAttributePersistence }

{ Found item: StExcep }

{ Found item: TSPortability }

{ Found item: FileXNaming }

implementation

end.
