unit SOMIRTest.DumpOut;

{$WARN UNSAFE_TYPE OFF}

{$IF CompilerVersion >= 17.0}
  {$DEFINE DELPHI_HAS_INLINE}
{$IFEND}

interface

uses
  SysUtils;

type
  { Hardwired definitions }
  CORBAString = PAnsiChar;
  CORBABoolean = ByteBool;
  any = type Int64; { returned in edx:eax by vanilla IBM SOM, but passed via hidden pointer by Delphi when record }
  TypeCode = Pointer;
  TAnyRecord = record
    _type: TypeCode;
    _value: Pointer;
  end;

  { Forward definitions }
  SOMObject = class;
  Contained = class;
  AttributeDef = class;
  BOA = class;
  SOMEEvent = class;
  SOMEClientEvent = class;
  Context = class;
  ConstantDef = class;
  Container = class;
  SOMEEMan = class;
  SOMEEMRegisterData = class;
  ExceptionDef = class;
  ImplementationDef = class;
  ImplRepository = class;
  InterfaceDef = class;
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
  SOMTEmitC = class;
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
  SOMESinkEvent = class;
  SOMClass = class;
  SOMMSingleInstance = class;
  SOMMBeforeAfter = class;
  SOMClassMgr = class;
  SOMDObject = class;
  SOMDClientProxy = class;
  SOMDMetaproxy = class;
  SOMDObjectMgr = class;
  SOMDServer = class;
  SOMUTId = class;
  SOMOA = class;
  Sockets = class;
  SOMStringTableC = class;
  SOMMTraced = class;
  SOMETimerEvent = class;
  TSIdentification = class;
  TypeDef = class;
  SOMEWorkProcEvent = class;

  { Foreign types }
  somId = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };
  va_list = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };
  Sockets_in_addr = Pointer { WARNING: foreign type, size may be different than SizeOf(Pointer) };

  { Data types }
  int = LongInt;
  uchar_t = Byte;
  size_t = LongWord;
  SOMFOREIGN = Pointer;
  somToken = Pointer;
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
  somMToken = Pointer;
  somMLocator = Pointer;
  somDToken = Pointer;
  somDLocator = Pointer;
  somClassInfo = Pointer;
  SOMTokBuf = Pointer;
  somInitCtrl = Pointer;
  somInitInfo = Pointer;
  somDestructCtrl = Pointer;
  somDestructInfo = Pointer;
  somAssignCtrl = Pointer;
  somAssignInfo = Pointer;
  somRdAppType = LongWord;
  PsomClassList = ^somClassList;
  somClasses = ^somClassList;
  somObjects = Pointer;
  PsomMethodTab = ^somMethodTab;
  PsomMethodTabList = ^somMethodTabList;
  somMethodTabs = ^somMethodTabList;
  somParentMtabStructPtr = ^somMethodTabList;
  _IDL_Array1Of_Pointer = array[0 .. 0] of Pointer;
  somCClassDataStructurePtr = ^somCClassDataStructure;
  somBooleanVector = ^Byte;
  exception_type = type LongWord;
  Identifier = CORBAString;
  RepositoryId = CORBAString;
  P_IDL_ArrayOf_SOMObject = ^_IDL_ArrayOf_SOMObject;
  _IDL_Sequence_SOMObject = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_SOMObject;
  end;
  SOMObject_SOMObjectSequence = _IDL_Sequence_SOMObject;
  P_IDL_ArrayOf_Byte = ^_IDL_ArrayOf_Byte;
  _IDL_Sequence_Byte = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_Byte;
  end;
  SOMObject_BooleanSequence = _IDL_Sequence_Byte;
  P_IDL_ArrayOf_SOMObject_somObjectOffset = ^_IDL_ArrayOf_SOMObject_somObjectOffset;
  _IDL_Sequence_SOMObject_somObjectOffset = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_SOMObject_somObjectOffset;
  end;
  SOMObject_somObjectOffsets = _IDL_Sequence_SOMObject_somObjectOffset;
  Contained_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  Contained_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  Contained_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  AttributeDef_AttributeMode = type LongWord;
  AttributeDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  AttributeDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  AttributeDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  completion_status = type LongWord;
  ORBStatus = LongWord;
  ReferenceData = _IDL_Sequence_Byte;
  Flags = LongWord;
  ImplId = CORBAString;
  BOA_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  BOA_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  BOA_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMEEvent_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMEEvent_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMEEvent_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMEClientEvent_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMEClientEvent_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMEClientEvent_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  Context_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  Context_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  Context_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  ConstantDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  ConstantDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  ConstantDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  Container_InterfaceName = CORBAString;
  Container_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  Container_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  Container_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  EMRegProc = Pointer;
  EMMethodProc = Pointer;
  EMMethodProcEv = Pointer;
  SOMEEMan_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMEEMan_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMEEMan_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMEEMRegisterData_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMEEMRegisterData_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMEEMRegisterData_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  ExceptionDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  ExceptionDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  ExceptionDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  ImplementationDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  ImplementationDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  ImplementationDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  ImplRepository_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  ImplRepository_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  ImplRepository_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  ContextIdentifier = CORBAString;
  InterfaceDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  InterfaceDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  InterfaceDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  InterfaceDef_InterfaceName = { inherited } Container_InterfaceName;
  ModuleDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  ModuleDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  ModuleDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  ModuleDef_InterfaceName = { inherited } Container_InterfaceName;
  NVList_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  NVList_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  NVList_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  ObjectMgr_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  ObjectMgr_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  ObjectMgr_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  OperationDef_OperationMode = type LongWord;
  OperationDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  OperationDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  OperationDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  OperationDef_InterfaceName = { inherited } Container_InterfaceName;
  ORB_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  ORB_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  ORB_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  ParameterDef_ParameterMode = type LongWord;
  ParameterDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  ParameterDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  ParameterDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  Principal_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  Principal_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  Principal_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  Repository_irOpenErrorCodes = type LongWord;
  Repository_InterfaceName = { inherited } Container_InterfaceName;
  Repository_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  Repository_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  Repository_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  Request_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  Request_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  Request_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  Entry = Pointer;
  Mlist = Pointer;
  AttList = Pointer;
  NumberList = Pointer;
  SwitchBody = Pointer;
  SOMTTargetTypeT = type LongWord;
  SOMTTypes = LongWord;
  SOMTEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTAttributeEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTAttributeEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTAttributeEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTBaseClassEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTBaseClassEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTBaseClassEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTClassEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTClassEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTClassEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  somtVisibilityT = type LongWord;
  SOMTCommonEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTCommonEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTCommonEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTConstEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTConstEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTConstEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTDataEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTDataEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTDataEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  somtCommentStyleT = type LongWord;
  SOMTEmitC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTEmitC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTEmitC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTEnumEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTEnumEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTEnumEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTEnumNameEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTEnumNameEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTEnumNameEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTMetaClassEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTMetaClassEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTMetaClassEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTMethodEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTMethodEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTMethodEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTModuleEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTModuleEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTModuleEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  somtParameterDirectionT = type LongWord;
  SOMTParameterEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTParameterEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTParameterEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTPassthruEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTPassthruEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTPassthruEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTSequenceEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTSequenceEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTSequenceEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTStringEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTStringEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTStringEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTStructEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTStructEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTStructEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTTypedefEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTTypedefEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTTypedefEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTTemplateOutputC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTTemplateOutputC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTTemplateOutputC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTUnionEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTUnionEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTUnionEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMTUserDefinedTypeEntryC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMTUserDefinedTypeEntryC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMTUserDefinedTypeEntryC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMDServerMgr_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMDServerMgr_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMDServerMgr_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMESinkEvent_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMESinkEvent_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMESinkEvent_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  P_IDL_ArrayOf_Pointer = ^_IDL_ArrayOf_Pointer;
  _IDL_Sequence_Pointer = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_Pointer;
  end;
  SOMClass_somTokenSequence = _IDL_Sequence_Pointer;
  P_IDL_ArrayOf_SOMClass = ^_IDL_ArrayOf_SOMClass;
  _IDL_Sequence_SOMClass = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_SOMClass;
  end;
  SOMClass_SOMClassSequence = _IDL_Sequence_SOMClass;
  P_IDL_ArrayOf_SOMClass_somOffsetInfo = ^_IDL_ArrayOf_SOMClass_somOffsetInfo;
  _IDL_Sequence_SOMClass_somOffsetInfo = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_SOMClass_somOffsetInfo;
  end;
  SOMClass_somOffsets = _IDL_Sequence_SOMClass_somOffsetInfo;
  P_IDL_ArrayOf_somId = ^_IDL_ArrayOf_somId;
  _IDL_Sequence_somId = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_somId;
  end;
  SOMClass_somIdSequence = _IDL_Sequence_somId;
  SOMClass_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMClass_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMClass_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMMSingleInstance_somTokenSequence = { inherited } SOMClass_somTokenSequence;
  SOMMSingleInstance_SOMClassSequence = { inherited } SOMClass_SOMClassSequence;
  SOMMSingleInstance_somOffsets = { inherited } SOMClass_somOffsets;
  SOMMSingleInstance_somIdSequence = { inherited } SOMClass_somIdSequence;
  SOMMSingleInstance_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMMSingleInstance_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMMSingleInstance_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMMBeforeAfter_somTokenSequence = { inherited } SOMClass_somTokenSequence;
  SOMMBeforeAfter_SOMClassSequence = { inherited } SOMClass_SOMClassSequence;
  SOMMBeforeAfter_somOffsets = { inherited } SOMClass_somOffsets;
  SOMMBeforeAfter_somIdSequence = { inherited } SOMClass_somIdSequence;
  SOMMBeforeAfter_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMMBeforeAfter_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMMBeforeAfter_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMClassMgr_SOMClassArray = ^SOMClass;
  SOMClassMgr_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMClassMgr_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMClassMgr_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMDObject_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMDObject_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMDObject_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMDClientProxy_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMDClientProxy_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMDClientProxy_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMDMetaproxy_somTokenSequence = { inherited } SOMClass_somTokenSequence;
  SOMDMetaproxy_SOMClassSequence = { inherited } SOMClass_SOMClassSequence;
  SOMDMetaproxy_somOffsets = { inherited } SOMClass_somOffsets;
  SOMDMetaproxy_somIdSequence = { inherited } SOMClass_somIdSequence;
  SOMDMetaproxy_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMDMetaproxy_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMDMetaproxy_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMDObjectMgr_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMDObjectMgr_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMDObjectMgr_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMDServer_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMDServer_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMDServer_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMUTId_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMUTId_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMUTId_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMOA_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMOA_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMOA_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  Sockets_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  Sockets_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  Sockets_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  PentryT = ^entryT;
  PPentryT = ^PentryT;
  tablePT = ^PPentryT;
  SOMStringTableC_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMStringTableC_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMStringTableC_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMMTraced_somTokenSequence = { inherited } SOMClass_somTokenSequence;
  SOMMTraced_SOMClassSequence = { inherited } SOMClass_SOMClassSequence;
  SOMMTraced_somOffsets = { inherited } SOMClass_somOffsets;
  SOMMTraced_somIdSequence = { inherited } SOMClass_somIdSequence;
  SOMMTraced_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMMTraced_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMMTraced_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMETimerEvent_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMETimerEvent_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMETimerEvent_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  TSIdentification_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  TSIdentification_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  TSIdentification_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  TypeDef_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  TypeDef_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  TypeDef_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;
  SOMEWorkProcEvent_SOMObjectSequence = { inherited } SOMObject_SOMObjectSequence;
  SOMEWorkProcEvent_BooleanSequence = { inherited } SOMObject_BooleanSequence;
  SOMEWorkProcEvent_somObjectOffsets = { inherited } SOMObject_somObjectOffsets;

  { Records }
  somMethodTab = record
    classObject: SOMClass;
  end;
  SOMAny = record
    mtab: PsomMethodTab;
  end;
  somMethodInfo = record
    callType: LongWord;
    va_listSize: LongInt;
    float_map: PLongWord;
  end;
  somMethodDataStruct = record
    id: somId;
    SOM_type: LongInt;
    descriptor: somId;
    mToken: Pointer;
    method: Pointer;
    shared: PPointer;
  end;
  somMethodData = record
    id: somId;
    SOM_type: LongInt;
    descriptor: somId;
    mToken: Pointer;
    method: Pointer;
    shared: PPointer;
  end;
  somClassList = record
    cls: SOMClass;
    next: PsomClassList;
  end;
  somMethodTabList = record
    mtab: PsomMethodTab;
    next: PsomMethodTabList;
  end;
  somClassDataStructure = record
    classObject: SOMClass;
    tokens: _IDL_Array1Of_Pointer;
  end;
  somCClassDataStructure = record
    parentMtab: PsomMethodTabList;
    instanceDataToken: Pointer;
    ptrs: _IDL_Array1Of_Pointer;
  end;
  _IDL_Array12Of_Byte = array[0 .. 11] of Byte;
  Environment = record
    major: exception_type;
    opaque_data: _IDL_Array12Of_Byte;
  end;
  somModifier = record
    name: CORBAString;
    value: CORBAString;
  end;
  SOMObject_somObjectOffset = record
    obj: SOMObject;
    offset: LongInt;
  end;
  Contained_Description = record
    name: CORBAString;
    value: any;
  end;
  Contained_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  AttributeDef_AttributeDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
    SOM_type: TypeCode;
    mode: AttributeDef_AttributeMode;
  end;
  AttributeDef_Description = { inherited } Contained_Description;
  AttributeDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  NamedValue = record
    name: CORBAString;
    argument: any;
    len: LongInt;
    arg_modes: LongWord;
  end;
  BOA_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMEEvent_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMEClientEvent_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  Context_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  ConstantDef_ConstantDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
    SOM_type: TypeCode;
    value: any;
  end;
  ConstantDef_Description = { inherited } Contained_Description;
  ConstantDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  Container_ContainerDescription = record
    contained_object: Contained;
    name: CORBAString;
    value: any;
  end;
  Container_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMEEMan_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMEEMRegisterData_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  ExceptionDef_ExceptionDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
    SOM_type: TypeCode;
  end;
  ExceptionDef_Description = { inherited } Contained_Description;
  ExceptionDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  ImplementationDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  ImplRepository_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  P_IDL_ArrayOf_CORBAString = ^_IDL_ArrayOf_CORBAString;
  _IDL_Sequence_CORBAString = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_CORBAString;
  end;
  P_IDL_ArrayOf_ParameterDef_ParameterDescription = ^_IDL_ArrayOf_ParameterDef_ParameterDescription;
  _IDL_Sequence_ParameterDef_ParameterDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_ParameterDef_ParameterDescription;
  end;
  P_IDL_ArrayOf_ExceptionDef_ExceptionDescription = ^_IDL_ArrayOf_ExceptionDef_ExceptionDescription;
  _IDL_Sequence_ExceptionDef_ExceptionDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_ExceptionDef_ExceptionDescription;
  end;
  P_IDL_ArrayOf_OperationDef_OperationDescription = ^_IDL_ArrayOf_OperationDef_OperationDescription;
  _IDL_Sequence_OperationDef_OperationDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_OperationDef_OperationDescription;
  end;
  P_IDL_ArrayOf_AttributeDef_AttributeDescription = ^_IDL_ArrayOf_AttributeDef_AttributeDescription;
  _IDL_Sequence_AttributeDef_AttributeDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_AttributeDef_AttributeDescription;
  end;
  InterfaceDef_FullInterfaceDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
    operation: _IDL_Sequence_OperationDef_OperationDescription;
    attributes: _IDL_Sequence_AttributeDef_AttributeDescription;
  end;
  InterfaceDef_InterfaceDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
  end;
  InterfaceDef_Description = { inherited } Contained_Description;
  InterfaceDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  InterfaceDef_ContainerDescription = { inherited } Container_ContainerDescription;
  ModuleDef_ModuleDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
  end;
  ModuleDef_Description = { inherited } Contained_Description;
  ModuleDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  ModuleDef_ContainerDescription = { inherited } Container_ContainerDescription;
  NVList_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  ObjectMgr_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  OperationDef_OperationDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
    SOM_result: TypeCode;
    mode: OperationDef_OperationMode;
    contexts: _IDL_Sequence_CORBAString;
    parameter: _IDL_Sequence_ParameterDef_ParameterDescription;
    exceptions: _IDL_Sequence_ExceptionDef_ExceptionDescription;
  end;
  OperationDef_Description = { inherited } Contained_Description;
  OperationDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  OperationDef_ContainerDescription = { inherited } Container_ContainerDescription;
  ORB_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  ParameterDef_ParameterDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
    SOM_type: TypeCode;
    mode: ParameterDef_ParameterMode;
  end;
  ParameterDef_Description = { inherited } Contained_Description;
  ParameterDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  Principal_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  Repository_RepositoryDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
  end;
  Repository_irOpenError = { exception } record
    errorCode: Repository_irOpenErrorCodes;
    fileName: CORBAString;
  end;
  Repository_ContainerDescription = { inherited } Container_ContainerDescription;
  Repository_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  Request_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTAttributeEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTBaseClassEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTClassEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTCommonEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTConstEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTDataEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTEmitC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTEnumEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTEnumNameEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTMetaClassEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTMethodEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTModuleEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTParameterEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTPassthruEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTSequenceEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTStringEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTStructEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTTypedefEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTTemplateOutputC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  PSOMTUnionEntryC_somtLabelList = ^SOMTUnionEntryC_somtLabelList;
  SOMTUnionEntryC_somtLabelList = record
    SOM_label: CORBAString;
    nextLabel: PSOMTUnionEntryC_somtLabelList;
  end;
  SOMTUnionEntryC_somtCaseEntry = record
    caseLabels: PSOMTUnionEntryC_somtLabelList;
    memberType: SOMTEntryC;
    memberDeclarator: SOMTDataEntryC;
  end;
  SOMTUnionEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMTUserDefinedTypeEntryC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMDServerMgr_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMESinkEvent_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMClass_somOffsetInfo = record
    cls: SOMClass;
    offset: LongInt;
  end;
  SOMClass_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMMSingleInstance_somOffsetInfo = { inherited } SOMClass_somOffsetInfo;
  SOMMSingleInstance_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMMBeforeAfter_somOffsetInfo = { inherited } SOMClass_somOffsetInfo;
  SOMMBeforeAfter_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMClassMgr_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMDObject_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMDClientProxy_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMDMetaproxy_somOffsetInfo = { inherited } SOMClass_somOffsetInfo;
  SOMDMetaproxy_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMDObjectMgr_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMDServer_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMUTId_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMOA_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  Sockets_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  entryT = record
    key: CORBAString;
    value: CORBAString;
    next: PentryT;
  end;
  SOMStringTableC_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMMTraced_somOffsetInfo = { inherited } SOMClass_somOffsetInfo;
  SOMMTraced_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  StExcep_UNKNOWN = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_BAD_PARAM = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_NO_MEMORY = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_IMP_LIMIT = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_COMM_FAILURE = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_INV_OBJREF = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_NO_PERMISSION = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_INTERNAL = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_MARSHAL = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_INITIALIZE = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_NO_IMPLEMENT = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_BAD_TYPECODE = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_BAD_OPERATION = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_NO_RESOURCES = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_NO_RESPONSE = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_PERSIST_STORE = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_BAD_INV_ORDER = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_TRANSIENT = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_FREE_MEM = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_INV_IDENT = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_INV_FLAG = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_INTF_REPOS = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_CONTEXT = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_OBJ_ADAPTER = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_DATA_CONVERSION = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_OPSYS = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_WMQUIT = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_DISPATCH = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_TransactionRequired = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_TransactionRolledBack = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_InvalidTransaction = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  StExcep_WrongTransaction = { exception } record
    minor: LongWord;
    completed: completion_status;
  end;
  SOMETimerEvent_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  TSIdentification_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  TypeDef_TypeDescription = record
    name: CORBAString;
    id: CORBAString;
    defined_in: CORBAString;
    SOM_type: TypeCode;
  end;
  TypeDef_Description = { inherited } Contained_Description;
  TypeDef_somObjectOffset = { inherited } SOMObject_somObjectOffset;
  SOMEWorkProcEvent_somObjectOffset = { inherited } SOMObject_somObjectOffset;

  { Classes }
  SOMObjectBase = class
  private
    { hide TObject methods }
    procedure Create; reintroduce;
    procedure Destroy; reintroduce;
  public
    function As_SOMObject: SOMObject;
  end;

  SOMObject = class(SOMObjectBase)
  public
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  P_IDL_ArrayOf_somModifier = ^_IDL_ArrayOf_somModifier;
  _IDL_Sequence_somModifier = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_somModifier;
  end;
  P_IDL_ArrayOf_Container = ^_IDL_ArrayOf_Container;
  _IDL_Sequence_Container = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_Container;
  end;
  Contained = class(SOMObjectBase)
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
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  AttributeDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode;
    procedure _set_type(SOM_type: TypeCode);
    function _get_mode: AttributeDef_AttributeMode;
    procedure _set_mode(mode: AttributeDef_AttributeMode);
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
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property SOM_type: TypeCode read _get_type write _set_type;
    property mode: AttributeDef_AttributeMode read _get_mode write _set_mode;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  BOA = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMEEvent = class(SOMObjectBase)
  public
    function somevGetEventTime: LongWord;
    function somevGetEventType: LongWord;
    procedure somevSetEventTime(time: LongWord);
    procedure somevSetEventType(SOM_type: LongWord);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMEClientEvent = class(SOMObjectBase)
  public
    function somevGetEventClientData: Pointer;
    function somevGetEventClientType: CORBAString;
    procedure somevSetEventClientData(clientData: Pointer);
    procedure somevSetEventClientType(clientType: CORBAString);
    function somevGetEventTime: LongWord;
    function somevGetEventType: LongWord;
    procedure somevSetEventTime(time: LongWord);
    procedure somevSetEventType(SOM_type: LongWord);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  Context = class(SOMObjectBase)
  public
    function set_one_value(prop_name: CORBAString; value: CORBAString): LongWord;
    function set_values(values: NVList): LongWord;
    function get_values(start_scope: CORBAString; op_flags: LongWord; prop_name: CORBAString; out values: NVList): LongWord;
    function delete_values(prop_name: CORBAString): LongWord;
    function create_child(ctx_name: CORBAString; out child_ctx: Context): LongWord;
    function destroy(flags: LongWord): LongWord;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  ConstantDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode;
    procedure _set_type(SOM_type: TypeCode);
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
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property SOM_type: TypeCode read _get_type write _set_type;
    property value: any read _get_value write _set_value;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  P_IDL_ArrayOf_Contained = ^_IDL_ArrayOf_Contained;
  _IDL_Sequence_Contained = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_Contained;
  end;
  P_IDL_ArrayOf_Container_ContainerDescription = ^_IDL_ArrayOf_Container_ContainerDescription;
  _IDL_Sequence_Container_ContainerDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_Container_ContainerDescription;
  end;
  Container = class(SOMObjectBase)
  public
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMEEMan = class(SOMObjectBase)
  public
    procedure someGetEManSem;
    procedure someReleaseEManSem;
    procedure someChangeRegData(registrationId: LongInt; registerData: SOMEEMRegisterData);
    procedure someProcessEvent(mask: LongWord);
    procedure someProcessEvents;
    procedure someQueueEvent(event: SOMEClientEvent);
    function someRegister(registerData: SOMEEMRegisterData; targetObject: SOMObject; targetMethod: CORBAString; targetData: Pointer): LongInt;
    function someRegisterEv(registerData: SOMEEMRegisterData; targetObject: SOMObject; var callbackEv: Environment; targetMethod: CORBAString; targetData: Pointer): LongInt;
    function someRegisterProc(registerData: SOMEEMRegisterData; targetProcedure: PPointer; targetData: Pointer): LongInt;
    procedure someShutdown;
    procedure someUnRegister(registrationId: LongInt);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMEEMRegisterData = class(SOMObjectBase)
  public
    procedure someClearRegData;
    procedure someSetRegDataClientType(clientType: CORBAString);
    procedure someSetRegDataEventMask(eventType: LongInt; ap: va_list);
    procedure someSetRegDataSink(sink: LongInt);
    procedure someSetRegDataSinkMask(sinkMask: LongWord);
    procedure someSetRegDataTimerCount(count: LongInt);
    procedure someSetRegDataTimerInterval(interval: LongInt);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  ExceptionDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode;
    procedure _set_type(SOM_type: TypeCode);
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
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property SOM_type: TypeCode read _get_type write _set_type;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  ImplementationDef = class(SOMObjectBase)
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
  public
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
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
  end;

  P_IDL_ArrayOf_ImplementationDef = ^_IDL_ArrayOf_ImplementationDef;
  _IDL_Sequence_ImplementationDef = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_ImplementationDef;
  end;
  ImplRepository = class(SOMObjectBase)
  public
    function find_impldef(implid: CORBAString): ImplementationDef;
    function find_impldef_by_alias(alias_name: CORBAString): ImplementationDef;
    function find_all_impldefs(out outimpldefs: _IDL_Sequence_ImplementationDef): LongWord;
    function find_impldef_by_class(classname: CORBAString): _IDL_Sequence_ImplementationDef;
    procedure add_impldef(impldef: ImplementationDef);
    procedure update_impldef(impldef: ImplementationDef);
    procedure delete_impldef(implid: CORBAString);
    procedure add_class_to_impldef(implid: CORBAString; classname: CORBAString);
    procedure remove_class_from_impldef(implid: CORBAString; classname: CORBAString);
    procedure remove_class_from_all(classname: CORBAString);
    function find_classes_by_impldef(implid: CORBAString): _IDL_Sequence_CORBAString;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  InterfaceDef = class(SOMObjectBase)
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
    function describe_interface: InterfaceDef_FullInterfaceDescription;
    function within: _IDL_Sequence_Container;
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
    property base_interfaces: _IDL_Sequence_CORBAString read _get_base_interfaces write _set_base_interfaces;
    property instanceData: TypeCode read _get_instanceData write _set_instanceData;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  ModuleDef = class(SOMObjectBase)
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
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  NVList = class(SOMObjectBase)
  public
    function add_item(item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord;
    function free: LongWord;
    function free_memory: LongWord;
    function get_count(out count: LongInt): LongWord;
    function set_item(item_number: LongInt; item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord;
    function get_item(item_number: LongInt; out item_name: CORBAString; out item_type: TypeCode; out value: Pointer; out value_len: LongInt; out item_flags: LongWord): LongWord;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  ObjectMgr = class(SOMObjectBase)
  public
    function somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject;
    function somdGetIdFromObject(obj: SOMObject): CORBAString;
    function somdGetObjectFromId(id: CORBAString): SOMObject;
    procedure somdReleaseObject(obj: SOMObject);
    procedure somdDestroyObject(obj: SOMObject);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  OperationDef = class(SOMObjectBase)
  private
    function _get_result: TypeCode;
    procedure _set_result(SOM_result: TypeCode);
    function _get_mode: OperationDef_OperationMode;
    procedure _set_mode(mode: OperationDef_OperationMode);
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
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
    property SOM_result: TypeCode read _get_result write _set_result;
    property mode: OperationDef_OperationMode read _get_mode write _set_mode;
    property contexts: _IDL_Sequence_CORBAString read _get_contexts write _set_contexts;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  ORB = class(SOMObjectBase)
  public
    function object_to_string(obj: SOMDObject): CORBAString;
    function string_to_object(str: CORBAString): SOMDObject;
    function create_list(count: LongInt; out new_list: NVList): LongWord;
    function create_operation_list(oper: OperationDef; out new_list: NVList): LongWord;
    function get_default_context(out ctx: Context): LongWord;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  ParameterDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode;
    procedure _set_type(SOM_type: TypeCode);
    function _get_mode: ParameterDef_ParameterMode;
    procedure _set_mode(mode: ParameterDef_ParameterMode);
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
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property SOM_type: TypeCode read _get_type write _set_type;
    property mode: ParameterDef_ParameterMode read _get_mode write _set_mode;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  Principal = class(SOMObjectBase)
  private
    function _get_userName: CORBAString;
    procedure _set_userName(userName: CORBAString);
    function _get_hostName: CORBAString;
    procedure _set_hostName(hostName: CORBAString);
  public
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property userName: CORBAString read _get_userName write _set_userName;
    property hostName: CORBAString read _get_hostName write _set_hostName;
  end;

  Repository = class(SOMObjectBase)
  public
    function lookup_id(search_id: CORBAString): Contained;
    function lookup_modifier(name: CORBAString; modifier: CORBAString): CORBAString;
    procedure release_cache;
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  Request = class(SOMObjectBase)
  public
    function add_arg(name: CORBAString; arg_type: TypeCode; value: Pointer; len: LongInt; arg_flags: LongWord): LongWord;
    function invoke(invoke_flags: LongWord): LongWord;
    function send(invoke_flags: LongWord): LongWord;
    function get_response(response_flags: LongWord): LongWord;
    function destroy: LongWord;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMTEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTAttributeEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtIsReadonly: CORBABoolean read _get_somtIsReadonly;
    property somtAttribType: SOMTEntryC read _get_somtAttribType;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTBaseClassEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtBaseClassDef: SOMTClassEntryC read _get_somtBaseClassDef;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTClassEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtSourceFileName: CORBAString read _get_somtSourceFileName;
    property somtMetaClassEntry: SOMTMetaClassEntryC read _get_somtMetaClassEntry;
    property somtClassModule: SOMTModuleEntryC read _get_somtClassModule;
    property somtNewMethodCount: LongInt read _get_somtNewMethodCount;
    property somtLocalInclude: CORBABoolean read _get_somtLocalInclude;
    property somtPrivateMethodCount: LongInt read _get_somtPrivateMethodCount;
    property somtStaticMethodCount: LongInt read _get_somtStaticMethodCount;
    property somtOverrideMethodCount: LongInt read _get_somtOverrideMethodCount;
    property somtProcMethodCount: LongInt read _get_somtProcMethodCount;
    property somtVAMethodCount: LongInt read _get_somtVAMethodCount;
    property somtBaseCount: LongInt read _get_somtBaseCount;
    property somtExternalDataCount: LongInt read _get_somtExternalDataCount;
    property somtPublicDataCount: LongInt read _get_somtPublicDataCount;
    property somtPrivateDataCount: LongInt read _get_somtPrivateDataCount;
    property somtMetaclassFor: SOMTClassEntryC read _get_somtMetaclassFor;
    property somtForwardRef: CORBABoolean read _get_somtForwardRef;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTCommonEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText;
    property somtType: CORBAString read _get_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTConstEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtConstTypeObj: SOMTEntryC read _get_somtConstTypeObj;
    property somtConstType: CORBAString read _get_somtConstType;
    property somtConstStringVal: CORBAString read _get_somtConstStringVal;
    property somtConstNumVal: LongWord read _get_somtConstNumVal;
    property somtConstNumNegVal: LongInt read _get_somtConstNumNegVal;
    property somtConstIsNegative: CORBABoolean read _get_somtConstIsNegative;
    property somtConstVal: CORBAString read _get_somtConstVal;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTDataEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtIsSelfRef: CORBABoolean read _get_somtIsSelfRef;
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText;
    property somtType: CORBAString read _get_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  PSOM_FILE = Pointer{ opaque ^SOM_FILE };
  SOMTEmitC = class(SOMObjectBase)
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
    function somtOpenSymbolsFile(SOM_file: CORBAString; mode: CORBAString): PSOM_FILE;
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
    procedure somtEmitModule(SOM_mod: SOMTModuleEntryC);
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
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

  SOMTEnumEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTEnumNameEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtEnumPtr: SOMTEnumEntryC read _get_somtEnumPtr;
    property somtEnumVal: LongWord read _get_somtEnumVal;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTMetaClassEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtMetaFile: CORBAString read _get_somtMetaFile;
    property somtMetaClassDef: SOMTClassEntryC read _get_somtMetaClassDef;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  PCORBAString = ^CORBAString;
  SOMTMethodEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtIsVarargs: CORBABoolean read _get_somtIsVarargs;
    property somtOriginalMethod: SOMTMethodEntryC read _get_somtOriginalMethod;
    property somtOriginalClass: SOMTClassEntryC read _get_somtOriginalClass;
    property somtMethodGroup: SOMTEntryC read _get_somtMethodGroup;
    property somtIsPrivateMethod: CORBABoolean read _get_somtIsPrivateMethod;
    property somtIsOneway: CORBABoolean read _get_somtIsOneway;
    property somtArgCount: SmallInt read _get_somtArgCount;
    property somtContextArray: PCORBAString read _get_somtContextArray;
    property somtCReturnType: CORBAString read _get_somtCReturnType;
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText;
    property somtType: CORBAString read _get_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTModuleEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtOuterModule: SOMTModuleEntryC read _get_somtOuterModule;
    property somtModuleFile: CORBAString read _get_somtModuleFile;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTParameterEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtParameterDirection: somtParameterDirectionT read _get_somtParameterDirection;
    property somtIDLParameterDeclaration: CORBAString read _get_somtIDLParameterDeclaration;
    property somtCParameterDeclaration: CORBAString read _get_somtCParameterDeclaration;
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText;
    property somtType: CORBAString read _get_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTPassthruEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtPassthruBody: CORBAString read _get_somtPassthruBody;
    property somtPassthruLanguage: CORBAString read _get_somtPassthruLanguage;
    property somtPassthruTarget: CORBAString read _get_somtPassthruTarget;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTSequenceEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtSeqLength: LongInt read _get_somtSeqLength;
    property somtSeqType: SOMTEntryC read _get_somtSeqType;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTStringEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtStringLength: LongInt read _get_somtStringLength;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTStructEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtStructClass: SOMTClassEntryC read _get_somtStructClass;
    property somtIsException: CORBABoolean read _get_somtIsException;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTTypedefEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtTypedefType: SOMTEntryC read _get_somtTypedefType;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTTemplateOutputC = class(SOMObjectBase)
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
    procedure somtSetOutputFile(var fp{: opaque SOM_FILE});
    procedure somto(tmplt: CORBAString);
    procedure somtOutputComment(comment: CORBAString);
    procedure somtOutputSection(sectionName: CORBAString);
    procedure somtAddSectionDefinitions(defString: CORBAString);
    procedure somtReadSectionDefinitions(var fp{: opaque SOM_FILE});
    function somtExpandSymbol(s: CORBAString; buf: CORBAString): CORBAString;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtCommentStyle: somtCommentStyleT read _get_somtCommentStyle write _set_somtCommentStyle;
    property somtLineLength: LongInt read _get_somtLineLength write _set_somtLineLength;
    property somtCommentNewline: CORBABoolean read _get_somtCommentNewline write _set_somtCommentNewline;
  end;

  PSOMTUnionEntryC_somtCaseEntry = ^SOMTUnionEntryC_somtCaseEntry;
  SOMTUnionEntryC = class(SOMObjectBase)
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
    function somtGetFirstCaseEntry: PSOMTUnionEntryC_somtCaseEntry;
    function somtGetNextCaseEntry: PSOMTUnionEntryC_somtCaseEntry;
    function somtGetModifierValue(modifierName: CORBAString): CORBAString;
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
    function somtGetModifierList(buffer: CORBAString): LongInt;
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
    procedure somtSetEntryStruct(var es: Pointer);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtSwitchType: SOMTEntryC read _get_somtSwitchType;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMTUserDefinedTypeEntryC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somtOriginalTypedef: SOMTTypedefEntryC read _get_somtOriginalTypedef;
    property somtBaseTypeObj: SOMTEntryC read _get_somtBaseTypeObj;
    property somtTypeObj: SOMTEntryC read _get_somtTypeObj;
    property somtPtrs: CORBAString read _get_somtPtrs;
    property somtArrayDimsString: CORBAString read _get_somtArrayDimsString;
    property somtSourceText: CORBAString read _get_somtSourceText;
    property somtType: CORBAString read _get_somtType;
    property somtVisibility: somtVisibilityT read _get_somtVisibility;
    property somtEntryName: CORBAString read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: LongWord read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: CORBAString read _get_somtElementTypeName;
    property somtEntryComment: CORBAString read _get_somtEntryComment;
    property somtSourceLineNumber: LongWord read _get_somtSourceLineNumber;
    property somtTypeCode: TypeCode read _get_somtTypeCode;
    property somtIsReference: CORBABoolean read _get_somtIsReference;
    property somtIDLScopedName: CORBAString read _get_somtIDLScopedName;
    property somtCScopedName: CORBAString read _get_somtCScopedName;
  end;

  SOMDServerMgr = class(SOMObjectBase)
  public
    function somdShutdownServer(server_alias: CORBAString): LongWord;
    function somdStartServer(server_alias: CORBAString): LongWord;
    function somdRestartServer(server_alias: CORBAString): LongWord;
    function somdListServer(server_alias: CORBAString): LongWord;
    function somdDisableServer(server_alias: CORBAString): LongWord;
    function somdEnableServer(server_alias: CORBAString): LongWord;
    function somdIsServerEnabled(impldef: ImplementationDef): CORBABoolean;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMESinkEvent = class(SOMObjectBase)
  public
    function somevGetEventSink: LongInt;
    procedure somevSetEventSink(sink: LongInt);
    function somevGetEventTime: LongWord;
    function somevGetEventType: LongWord;
    procedure somevSetEventTime(time: LongWord);
    procedure somevSetEventType(SOM_type: LongWord);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  PsomClassDataStructure = ^somClassDataStructure;
  SOMClass = class(SOMObjectBase)
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
    procedure _set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
    function _get_somClassAllocate: PPointer;
    function _get_somClassDeallocate: PPointer;
  public
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): CORBAString;
    procedure somDeallocate(memptr: CORBAString);
    function somGetInstanceInitMask(out ctrl: Pointer): PByte;
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    function somGetClassData: PsomClassDataStructure;
    procedure somSetClassData(cds: somClassDataStructure);
    function somGetClassMtab: PsomMethodTab;
    function somGetInstanceOffset: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetRdStub(methodId: somId): PPointer;
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetName: CORBAString;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParent: SOMClass;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetPClsMtab: PsomMethodTabList;
    function somGetPClsMtabs: PsomMethodTabList;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  SOMMSingleInstance = class(SOMObjectBase)
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
    procedure _set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
    function _get_somClassAllocate: PPointer;
    function _get_somClassDeallocate: PPointer;
  public
    function sommGetSingleInstance: SOMObject;
    procedure sommFreeSingleInstance;
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): CORBAString;
    procedure somDeallocate(memptr: CORBAString);
    function somGetInstanceInitMask(out ctrl: Pointer): PByte;
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    function somGetClassData: PsomClassDataStructure;
    procedure somSetClassData(cds: somClassDataStructure);
    function somGetClassMtab: PsomMethodTab;
    function somGetInstanceOffset: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetRdStub(methodId: somId): PPointer;
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetName: CORBAString;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParent: SOMClass;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetPClsMtab: PsomMethodTabList;
    function somGetPClsMtabs: PsomMethodTabList;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  SOMMBeforeAfter = class(SOMObjectBase)
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
    procedure _set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
    function _get_somClassAllocate: PPointer;
    function _get_somClassDeallocate: PPointer;
  public
    function sommBeforeMethod(SOM_object: SOMObject; methodId: somId; ap: va_list): CORBABoolean;
    procedure sommAfterMethod(SOM_object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list);
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): CORBAString;
    procedure somDeallocate(memptr: CORBAString);
    function somGetInstanceInitMask(out ctrl: Pointer): PByte;
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    function somGetClassData: PsomClassDataStructure;
    procedure somSetClassData(cds: somClassDataStructure);
    function somGetClassMtab: PsomMethodTab;
    function somGetInstanceOffset: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetRdStub(methodId: somId): PPointer;
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetName: CORBAString;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParent: SOMClass;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetPClsMtab: PsomMethodTabList;
    function somGetPClsMtabs: PsomMethodTabList;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  PSOMClass = ^SOMClass;
  SOMClassMgr = class(SOMObjectBase)
  private
    function _get_somInterfaceRepository: Repository;
    procedure _set_somInterfaceRepository(somInterfaceRepository: Repository);
    function _get_somRegisteredClasses: _IDL_Sequence_SOMClass;
  public
    function somLoadClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; SOM_file: CORBAString): SOMClass;
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
    function somFindClsInFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; SOM_file: CORBAString): SOMClass;
    procedure somMergeInto(targetObj: SOMObject);
    function somSubstituteClass(origClassName: CORBAString; newClassName: CORBAString): LongInt;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somInterfaceRepository: Repository read _get_somInterfaceRepository write _set_somInterfaceRepository;
    property somRegisteredClasses: _IDL_Sequence_SOMClass read _get_somRegisteredClasses;
  end;

  SOMDObject = class(SOMObjectBase)
  public
    function get_implementation: ImplementationDef;
    function get_interface: InterfaceDef;
    function is_nil: CORBABoolean;
    function is_SOM_ref: CORBABoolean;
    function is_constant: CORBABoolean;
    function is_proxy: CORBABoolean;
    function duplicate: SOMDObject;
    procedure release;
    function create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var SOM_result: NamedValue; out request: Request; req_flags: LongWord): LongWord;
    function create_request_args(operation: CORBAString; out arg_list: NVList; out SOM_result: NamedValue): LongWord;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMDClientProxy = class(SOMObjectBase)
  public
    procedure somdTargetFree;
    function somdTargetGetClass: SOMClass;
    function somdTargetGetClassName: CORBAString;
    procedure somdProxyFree;
    function somdProxyGetClass: SOMClass;
    function somdProxyGetClassName: CORBAString;
    procedure somdReleaseResources;
    function get_implementation: ImplementationDef;
    function get_interface: InterfaceDef;
    function is_nil: CORBABoolean;
    function is_SOM_ref: CORBABoolean;
    function is_constant: CORBABoolean;
    function is_proxy: CORBABoolean;
    function duplicate: SOMDObject;
    procedure release;
    function create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var SOM_result: NamedValue; out request: Request; req_flags: LongWord): LongWord;
    function create_request_args(operation: CORBAString; out arg_list: NVList; out SOM_result: NamedValue): LongWord;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMDMetaproxy = class(SOMObjectBase)
  private
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
    procedure _set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
    function _get_somClassAllocate: PPointer;
    function _get_somClassDeallocate: PPointer;
  public
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): CORBAString;
    procedure somDeallocate(memptr: CORBAString);
    function somGetInstanceInitMask(out ctrl: Pointer): PByte;
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    function somGetClassData: PsomClassDataStructure;
    procedure somSetClassData(cds: somClassDataStructure);
    function somGetClassMtab: PsomMethodTab;
    function somGetInstanceOffset: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetRdStub(methodId: somId): PPointer;
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetName: CORBAString;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParent: SOMClass;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetPClsMtab: PsomMethodTabList;
    function somGetPClsMtabs: PsomMethodTabList;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  P_IDL_ArrayOf_SOMDServer = ^_IDL_ArrayOf_SOMDServer;
  _IDL_Sequence_SOMDServer = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: P_IDL_ArrayOf_SOMDServer;
  end;
  SOMDObjectMgr = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somd21somFree: CORBABoolean read _get_somd21somFree write _set_somd21somFree;
  end;

  SOMDServer = class(SOMObjectBase)
  public
    function somdRefFromSOMObj(somobj: SOMObject): SOMDObject;
    function somdSOMObjFromRef(objref: SOMDObject): SOMObject;
    procedure somdDispatchMethod(somobj: SOMObject; out retValue: Pointer; methodId: somId; ap: va_list);
    function somdCreateObj(objclass: CORBAString; hints: CORBAString): SOMObject;
    procedure somdDeleteObj(somobj: SOMObject);
    function somdGetClassObj(objclass: CORBAString): SOMClass;
    function somdObjReferencesCached: CORBABoolean;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMUTId = class(SOMObjectBase)
  public
    procedure somutSetIdId(otherId: SOMUTId);
    function somutEqualsId(otherId: SOMUTId): CORBABoolean;
    function somutCompareId(otherId: SOMUTId): SmallInt;
    function somutHashId: LongWord;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  SOMOA = class(SOMObjectBase)
  public
    function execute_next_request(waitFlag: LongWord): LongWord;
    function execute_request_loop(waitFlag: LongWord): LongWord;
    procedure change_id(objref: SOMDObject; id: _IDL_Sequence_Byte);
    function create_constant(id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject;
    function create_SOM_ref(somobj: SOMObject; impl: ImplementationDef): SOMDObject;
    function get_SOM_object(somref: SOMDObject): SOMObject;
    procedure activate_impl_failed(impl: ImplementationDef; rc: LongWord);
    procedure interrupt_server;
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  PSockets_hostent = Pointer{ opaque ^Sockets_hostent };
  PSockets_servent = Pointer{ opaque ^Sockets_servent };
  Sockets = class(SOMObjectBase)
  private
    function _get_serrno: LongInt;
    procedure _set_serrno(serrno: LongInt);
  public
    function somsAccept(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt;
    function somsBind(s: LongInt; var name{: opaque Sockets_sockaddr}; namelen: LongInt): LongInt;
    function somsConnect(s: LongInt; var name{: opaque Sockets_sockaddr}; namelen: LongInt): LongInt;
    function somsGethostbyaddr(addr: PShortInt; addrlen: LongInt; domain: LongInt): PSockets_hostent;
    function somsGethostbyname(name: CORBAString): PSockets_hostent;
    function somsGethostent: PSockets_hostent;
    function somsGethostid: LongWord;
    function somsGethostname(name: CORBAString; namelength: LongInt): LongInt;
    function somsGetpeername(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt;
    function somsGetservbyname(name: CORBAString; protocol: CORBAString): PSockets_servent;
    function somsGetsockname(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt;
    function somsGetsockopt(s: LongInt; level: LongInt; optname: LongInt; optval: PShortInt; out option: LongInt): LongInt;
    function somsHtonl(a: LongWord): LongWord;
    function somsHtons(a: Word): Word;
    function somsIoctl(s: LongInt; cmd: LongInt; data: PShortInt; length: LongInt): LongInt;
    function somsInet_addr(cp: CORBAString): LongWord;
    function somsInet_lnaof(addr: Sockets_in_addr): LongWord;
    function somsInet_makeaddr(net: LongWord; lna: LongWord): Sockets_in_addr;
    function somsInet_netof(addr: Sockets_in_addr): LongWord;
    function somsInet_network(cp: CORBAString): LongWord;
    function somsInet_ntoa(addr: Sockets_in_addr): CORBAString;
    function somsListen(s: LongInt; backlog: LongInt): LongInt;
    function somsNtohl(a: LongWord): LongWord;
    function somsNtohs(a: Word): Word;
    function somsReadv(s: LongInt; var iov{: opaque Sockets_iovec}; iovcnt: LongInt): LongInt;
    function somsRecv(s: LongInt; buf: PShortInt; len: LongInt; flags: LongInt): LongInt;
    function somsRecvfrom(s: LongInt; buf: PShortInt; len: LongInt; flags: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt;
    function somsRecvmsg(s: LongInt; var msg{: opaque Sockets_msghdr}; flags: LongInt): LongInt;
    function somsSelect(nfds: LongInt; var readfds{: opaque Sockets_fd_set}; var writefds{: opaque Sockets_fd_set}; var exceptfds{: opaque Sockets_fd_set}; var timeout{: opaque Sockets_timeval}): LongInt;
    function somsSend(s: LongInt; msg: PShortInt; len: LongInt; flags: LongInt): LongInt;
    function somsSendmsg(s: LongInt; var msg{: opaque Sockets_msghdr}; flags: LongInt): LongInt;
    function somsSendto(s: LongInt; var msg: ShortInt; len: LongInt; flags: LongInt; var SOM_to{: opaque Sockets_sockaddr}; tolen: LongInt): LongInt;
    function somsSetsockopt(s: LongInt; level: LongInt; optname: LongInt; optval: PShortInt; optlen: LongInt): LongInt;
    function somsShutdown(s: LongInt; how: LongInt): LongInt;
    function somsSocket(domain: LongInt; SOM_type: LongInt; protocol: LongInt): LongInt;
    function somsSoclose(s: LongInt): LongInt;
    function somsWritev(s: LongInt; var iov{: opaque Sockets_iovec}; iovcnt: LongInt): LongInt;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property serrno: LongInt read _get_serrno write _set_serrno;
  end;

  SOMStringTableC = class(SOMObjectBase)
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
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property somstTargetCapacity: LongWord read _get_somstTargetCapacity write _set_somstTargetCapacity;
    property somstAssociationsCount: LongWord read _get_somstAssociationsCount;
  end;

  SOMMTraced = class(SOMObjectBase)
  private
    function _get_sommTraceIsOn: CORBABoolean;
    procedure _set_sommTraceIsOn(sommTraceIsOn: CORBABoolean);
    function _get_somDataAlignment: LongInt;
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass;
    procedure _set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
    function _get_somClassAllocate: PPointer;
    function _get_somClassDeallocate: PPointer;
  public
    function sommBeforeMethod(SOM_object: SOMObject; methodId: somId; ap: va_list): CORBABoolean;
    procedure sommAfterMethod(SOM_object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list);
    function somNew: SOMObject;
    function somNewNoInit: SOMObject;
    function somRenew(obj: Pointer): SOMObject;
    function somRenewNoInit(obj: Pointer): SOMObject;
    function somRenewNoZero(obj: Pointer): SOMObject;
    function somRenewNoInitNoZero(obj: Pointer): SOMObject;
    function somAllocate(size: LongInt): CORBAString;
    procedure somDeallocate(memptr: CORBAString);
    function somGetInstanceInitMask(out ctrl: Pointer): PByte;
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
    procedure somOverrideSMethod(methodId: somId; method: Pointer);
    procedure somClassReady;
    function somGetClassData: PsomClassDataStructure;
    procedure somSetClassData(cds: somClassDataStructure);
    function somGetClassMtab: PsomMethodTab;
    function somGetInstanceOffset: LongInt;
    function somGetInstancePartSize: LongInt;
    function somGetInstanceSize: LongInt;
    function somGetInstanceToken: Pointer;
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
    function somGetRdStub(methodId: somId): PPointer;
    function somGetMethodDescriptor(methodId: somId): somId;
    function somGetMethodIndex(id: somId): LongInt;
    function somGetMethodToken(methodId: somId): Pointer;
    function somGetName: CORBAString;
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
    function somGetNumMethods: LongInt;
    function somGetNumStaticMethods: LongInt;
    function somGetParent: SOMClass;
    function somGetParents: _IDL_Sequence_SOMClass;
    function somGetPClsMtab: PsomMethodTabList;
    function somGetPClsMtabs: PsomMethodTabList;
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
    function somFindSMethod(methodId: somId): Pointer;
    function somFindSMethodOk(methodId: somId): Pointer;
    function somLookupMethod(methodId: somId): Pointer;
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
    function somSupportsMethod(mId: somId): CORBABoolean;
    function somDefinedMethod(method: Pointer): Pointer;
    procedure somOverrideMtab;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property sommTraceIsOn: CORBABoolean read _get_sommTraceIsOn write _set_sommTraceIsOn;
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  SOMETimerEvent = class(SOMObjectBase)
  public
    function somevGetEventInterval: LongInt;
    procedure somevSetEventInterval(interval: LongInt);
    function somevGetEventTime: LongWord;
    function somevGetEventType: LongWord;
    procedure somevSetEventTime(time: LongWord);
    procedure somevSetEventType(SOM_type: LongWord);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  TSPortability_Sender = class(SOMObjectBase) { unresolved class name };
  TSPortability_Receiver = class(SOMObjectBase) { unresolved class name };
  TSIdentification = class(SOMObjectBase)
  private
    function _get_sender: TSPortability_Sender;
    function _get_receiver: TSPortability_Receiver;
  public
    procedure identify_sender(sender: TSPortability_Sender);
    procedure identify_receiver(receiver: TSPortability_Receiver);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property sender: TSPortability_Sender read _get_sender;
    property receiver: TSPortability_Receiver read _get_receiver;
  end;

  TypeDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode;
    procedure _set_type(SOM_type: TypeCode);
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
    function describe: Contained_Description;
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
    property SOM_type: TypeCode read _get_type write _set_type;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  SOMEWorkProcEvent = class(SOMObjectBase)
  public
    function somevGetEventTime: LongWord;
    function somevGetEventType: LongWord;
    procedure somevSetEventTime(time: LongWord);
    procedure somevSetEventType(SOM_type: LongWord);
    procedure somDefaultInit(var ctrl: Pointer);
    procedure somDestruct(doFree: Byte; var ctrl: Pointer);
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
    procedure somInit;
    procedure somFree;
    procedure somUninit;
    function somGetClass: SOMClass;
    function somGetClassName: CORBAString;
    function somGetSize: LongInt;
    function somIsA(aClassObj: SOMClass): CORBABoolean;
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
    function somRespondsTo(mId: somId): CORBABoolean;
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
    function somCastObj(cls: SOMClass): CORBABoolean;
    function somResetObj: CORBABoolean;
    function somPrintSelf: SOMObject;
    procedure somDumpSelf(level: LongInt);
    procedure somDumpSelfInt(level: LongInt);
  end;

  { Arrays }
  _IDL_ArrayOf_SOMObject = array[0 .. (MaxLongInt div (Abs(SizeOf(SOMObject) - 1) + 1)) - 1] of SOMObject;
  _IDL_ArrayOf_Byte = array[0 .. (MaxLongInt div (Abs(SizeOf(Byte) - 1) + 1)) - 1] of Byte;
  _IDL_ArrayOf_SOMObject_somObjectOffset = array[0 .. (MaxLongInt div (Abs(SizeOf(SOMObject_somObjectOffset) - 1) + 1)) - 1] of SOMObject_somObjectOffset;
  _IDL_ArrayOf_Pointer = array[0 .. (MaxLongInt div (Abs(SizeOf(Pointer) - 1) + 1)) - 1] of Pointer;
  _IDL_ArrayOf_SOMClass = array[0 .. (MaxLongInt div (Abs(SizeOf(SOMClass) - 1) + 1)) - 1] of SOMClass;
  _IDL_ArrayOf_SOMClass_somOffsetInfo = array[0 .. (MaxLongInt div (Abs(SizeOf(SOMClass_somOffsetInfo) - 1) + 1)) - 1] of SOMClass_somOffsetInfo;
  _IDL_ArrayOf_somId = array[0 .. (MaxLongInt div (Abs(SizeOf(somId) - 1) + 1)) - 1] of somId;
  _IDL_ArrayOf_CORBAString = array[0 .. (MaxLongInt div (Abs(SizeOf(CORBAString) - 1) + 1)) - 1] of CORBAString;
  _IDL_ArrayOf_ParameterDef_ParameterDescription = array[0 .. (MaxLongInt div (Abs(SizeOf(ParameterDef_ParameterDescription) - 1) + 1)) - 1] of ParameterDef_ParameterDescription;
  _IDL_ArrayOf_ExceptionDef_ExceptionDescription = array[0 .. (MaxLongInt div (Abs(SizeOf(ExceptionDef_ExceptionDescription) - 1) + 1)) - 1] of ExceptionDef_ExceptionDescription;
  _IDL_ArrayOf_OperationDef_OperationDescription = array[0 .. (MaxLongInt div (Abs(SizeOf(OperationDef_OperationDescription) - 1) + 1)) - 1] of OperationDef_OperationDescription;
  _IDL_ArrayOf_AttributeDef_AttributeDescription = array[0 .. (MaxLongInt div (Abs(SizeOf(AttributeDef_AttributeDescription) - 1) + 1)) - 1] of AttributeDef_AttributeDescription;
  _IDL_ArrayOf_somModifier = array[0 .. (MaxLongInt div (Abs(SizeOf(somModifier) - 1) + 1)) - 1] of somModifier;
  _IDL_ArrayOf_Container = array[0 .. (MaxLongInt div (Abs(SizeOf(Container) - 1) + 1)) - 1] of Container;
  _IDL_ArrayOf_Contained = array[0 .. (MaxLongInt div (Abs(SizeOf(Contained) - 1) + 1)) - 1] of Contained;
  _IDL_ArrayOf_Container_ContainerDescription = array[0 .. (MaxLongInt div (Abs(SizeOf(Container_ContainerDescription) - 1) + 1)) - 1] of Container_ContainerDescription;
  _IDL_ArrayOf_ImplementationDef = array[0 .. (MaxLongInt div (Abs(SizeOf(ImplementationDef) - 1) + 1)) - 1] of ImplementationDef;
  _IDL_ArrayOf_SOMDServer = array[0 .. (MaxLongInt div (Abs(SizeOf(SOMDServer) - 1) + 1)) - 1] of SOMDServer;

{ Constants }

const
  tk_null = TCKind(0);
  tk_void = TCKind(1);
  tk_short = TCKind(2);
  tk_long = TCKind(3);
  tk_ushort = TCKind(4);
  tk_ulong = TCKind(5);
  tk_float = TCKind(6);
  tk_double = TCKind(7);
  tk_boolean = TCKind(8);
  tk_char = TCKind(9);
  tk_octet = TCKind(10);
  tk_any = TCKind(11);
  tk_TypeCode = TCKind(12);
  tk_Principal = TCKind(13);
  tk_objref = TCKind(14);
  tk_struct = TCKind(15);
  tk_union = TCKind(16);
  tk_enum = TCKind(17);
  tk_string = TCKind(18);
  tk_sequence = TCKind(19);
  tk_array = TCKind(20);
  tk_pointer = TCKind(101);
  tk_self = TCKind(102);
  tk_foreign = TCKind(103);
  NO_EXCEPTION = exception_type(0);
  USER_EXCEPTION = exception_type(1);
  SYSTEM_EXCEPTION = exception_type(2);
  AttributeDef_NORMAL = AttributeDef_AttributeMode(0);
  AttributeDef_READONLY = AttributeDef_AttributeMode(1);
  YES = completion_status(0);
  NO = completion_status(1);
  MAYBE = completion_status(2);
  SOMD_SOMDVersion = '2.1';
  OperationDef_NORMAL = OperationDef_OperationMode(0);
  OperationDef_ONEWAY = OperationDef_OperationMode(1);
  ParameterDef_IN = ParameterDef_ParameterMode(0);
  ParameterDef_OUT = ParameterDef_ParameterMode(1);
  ParameterDef_INOUT = ParameterDef_ParameterMode(2);
  Repository_NOACCESS = Repository_irOpenErrorCodes(0);
  Repository_BADMAGICNUMBER = Repository_irOpenErrorCodes(1);
  Repository_MISSINGVERSIONINFO = Repository_irOpenErrorCodes(2);
  Repository_IOERROR = Repository_irOpenErrorCodes(3);
  Repository_VERSIONMISMATCH = Repository_irOpenErrorCodes(4);
  ex_Repository_irOpenError = '::Repository::irOpenError';
  somtPrivateE = SOMTTargetTypeT(0);
  somtPublicE = SOMTTargetTypeT(1);
  somtImplementationE = SOMTTargetTypeT(2);
  somtAllE = SOMTTargetTypeT(3);
  somtInternalVE = somtVisibilityT(0);
  somtPublicVE = somtVisibilityT(1);
  somtPrivateVE = somtVisibilityT(2);
  somtDashesE = somtCommentStyleT(0);
  somtCPPE = somtCommentStyleT(1);
  somtCSimpleE = somtCommentStyleT(2);
  somtCBlockE = somtCommentStyleT(3);
  somtInE = somtParameterDirectionT(0);
  somtOutE = somtParameterDirectionT(1);
  somtInOutE = somtParameterDirectionT(2);
  SOMTTemplateOutputC_MAX_INPUT_LINE_LENGTH = 1024;
  SOMTTemplateOutputC_MAX_OUTPUT_LINE_LENGTH = 4096;
  ex_StExcep_UNKNOWN = '::StExcep::UNKNOWN';
  ex_StExcep_BAD_PARAM = '::StExcep::BAD_PARAM';
  ex_StExcep_NO_MEMORY = '::StExcep::NO_MEMORY';
  ex_StExcep_IMP_LIMIT = '::StExcep::IMP_LIMIT';
  ex_StExcep_COMM_FAILURE = '::StExcep::COMM_FAILURE';
  ex_StExcep_INV_OBJREF = '::StExcep::INV_OBJREF';
  ex_StExcep_NO_PERMISSION = '::StExcep::NO_PERMISSION';
  ex_StExcep_INTERNAL = '::StExcep::INTERNAL';
  ex_StExcep_MARSHAL = '::StExcep::MARSHAL';
  ex_StExcep_INITIALIZE = '::StExcep::INITIALIZE';
  ex_StExcep_NO_IMPLEMENT = '::StExcep::NO_IMPLEMENT';
  ex_StExcep_BAD_TYPECODE = '::StExcep::BAD_TYPECODE';
  ex_StExcep_BAD_OPERATION = '::StExcep::BAD_OPERATION';
  ex_StExcep_NO_RESOURCES = '::StExcep::NO_RESOURCES';
  ex_StExcep_NO_RESPONSE = '::StExcep::NO_RESPONSE';
  ex_StExcep_PERSIST_STORE = '::StExcep::PERSIST_STORE';
  ex_StExcep_BAD_INV_ORDER = '::StExcep::BAD_INV_ORDER';
  ex_StExcep_TRANSIENT = '::StExcep::TRANSIENT';
  ex_StExcep_FREE_MEM = '::StExcep::FREE_MEM';
  ex_StExcep_INV_IDENT = '::StExcep::INV_IDENT';
  ex_StExcep_INV_FLAG = '::StExcep::INV_FLAG';
  ex_StExcep_INTF_REPOS = '::StExcep::INTF_REPOS';
  ex_StExcep_CONTEXT = '::StExcep::CONTEXT';
  ex_StExcep_OBJ_ADAPTER = '::StExcep::OBJ_ADAPTER';
  ex_StExcep_DATA_CONVERSION = '::StExcep::DATA_CONVERSION';
  ex_StExcep_OPSYS = '::StExcep::OPSYS';
  ex_StExcep_WMQUIT = '::StExcep::WMQUIT';
  ex_StExcep_DISPATCH = '::StExcep::DISPATCH';
  ex_StExcep_TransactionRequired = '::StExcep::TransactionRequired';
  ex_StExcep_TransactionRolledBack = '::StExcep::TransactionRolledBack';
  ex_StExcep_InvalidTransaction = '::StExcep::InvalidTransaction';
  ex_StExcep_WrongTransaction = '::StExcep::WrongTransaction';
  ex_TSIdentification_NotAvailable = '::TSIdentification::NotAvailable';
  ex_TSIdentification_AlreadyIdentified = '::TSIdentification::AlreadyIdentified';

implementation

procedure SOMObjectBase.Create;
begin
  { hide this method }
end;

procedure SOMObjectBase.Destroy;
begin
  { hide this method }
end;

function SOMObjectBase.As_SOMObject;
begin
  Result := SOMObject(Self); { upcast }
end;


procedure SOMObject.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMObject.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMObject.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMObject.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMObject.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMObject.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMObject.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMObject.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMObject.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMObject.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMObject.somInit;
begin
  { ... }
end;

procedure SOMObject.somFree;
begin
  { ... }
end;

procedure SOMObject.somUninit;
begin
  { ... }
end;

function SOMObject.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMObject.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMObject.somGetSize: LongInt;
begin
  { ... }
end;

function SOMObject.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMObject.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMObject.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMObject.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMObject.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMObject.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMObject.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMObject.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMObject.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMObject.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function Contained._get_name: CORBAString;
begin
  { ... }
end;

procedure Contained._set_name(name: CORBAString);
begin
  { ... }
end;

function Contained._get_id: CORBAString;
begin
  { ... }
end;

procedure Contained._set_id(id: CORBAString);
begin
  { ... }
end;

function Contained._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure Contained._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function Contained._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure Contained._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function Contained.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function Contained.describe: Contained_Description;
begin
  { ... }
end;

procedure Contained.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure Contained.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure Contained.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Contained.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Contained.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Contained.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Contained.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Contained.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Contained.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Contained.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Contained.somInit;
begin
  { ... }
end;

procedure Contained.somFree;
begin
  { ... }
end;

procedure Contained.somUninit;
begin
  { ... }
end;

function Contained.somGetClass: SOMClass;
begin
  { ... }
end;

function Contained.somGetClassName: CORBAString;
begin
  { ... }
end;

function Contained.somGetSize: LongInt;
begin
  { ... }
end;

function Contained.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Contained.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Contained.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function Contained.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Contained.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Contained.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Contained.somResetObj: CORBABoolean;
begin
  { ... }
end;

function Contained.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure Contained.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure Contained.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function AttributeDef._get_type: TypeCode;
begin
  { ... }
end;

procedure AttributeDef._set_type(SOM_type: TypeCode);
begin
  { ... }
end;

function AttributeDef._get_mode: AttributeDef_AttributeMode;
begin
  { ... }
end;

procedure AttributeDef._set_mode(mode: AttributeDef_AttributeMode);
begin
  { ... }
end;

function AttributeDef._get_name: CORBAString;
begin
  { ... }
end;

procedure AttributeDef._set_name(name: CORBAString);
begin
  { ... }
end;

function AttributeDef._get_id: CORBAString;
begin
  { ... }
end;

procedure AttributeDef._set_id(id: CORBAString);
begin
  { ... }
end;

function AttributeDef._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure AttributeDef._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function AttributeDef._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure AttributeDef._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function AttributeDef.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function AttributeDef.describe: Contained_Description;
begin
  { ... }
end;

procedure AttributeDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure AttributeDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure AttributeDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function AttributeDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure AttributeDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure AttributeDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure AttributeDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function AttributeDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function AttributeDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function AttributeDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure AttributeDef.somInit;
begin
  { ... }
end;

procedure AttributeDef.somFree;
begin
  { ... }
end;

procedure AttributeDef.somUninit;
begin
  { ... }
end;

function AttributeDef.somGetClass: SOMClass;
begin
  { ... }
end;

function AttributeDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function AttributeDef.somGetSize: LongInt;
begin
  { ... }
end;

function AttributeDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function AttributeDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function AttributeDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function AttributeDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function AttributeDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function AttributeDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function AttributeDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function AttributeDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure AttributeDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure AttributeDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function BOA.create(id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject;
begin
  { ... }
end;

procedure BOA.dispose(obj: SOMDObject);
begin
  { ... }
end;

function BOA.get_id(obj: SOMDObject): _IDL_Sequence_Byte;
begin
  { ... }
end;

function BOA.get_principal(obj: SOMDObject; req_ev: Environment): Principal;
begin
  { ... }
end;

procedure BOA.set_exception(major: exception_type; userid: CORBAString; param: Pointer);
begin
  { ... }
end;

procedure BOA.impl_is_ready(impl: ImplementationDef);
begin
  { ... }
end;

procedure BOA.deactivate_impl(impl: ImplementationDef);
begin
  { ... }
end;

procedure BOA.change_implementation(obj: SOMDObject; impl: ImplementationDef);
begin
  { ... }
end;

procedure BOA.obj_is_ready(obj: SOMDObject; impl: ImplementationDef);
begin
  { ... }
end;

procedure BOA.deactivate_obj(obj: SOMDObject);
begin
  { ... }
end;

procedure BOA.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure BOA.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure BOA.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function BOA.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure BOA.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure BOA.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure BOA.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function BOA.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function BOA.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function BOA.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure BOA.somInit;
begin
  { ... }
end;

procedure BOA.somFree;
begin
  { ... }
end;

procedure BOA.somUninit;
begin
  { ... }
end;

function BOA.somGetClass: SOMClass;
begin
  { ... }
end;

function BOA.somGetClassName: CORBAString;
begin
  { ... }
end;

function BOA.somGetSize: LongInt;
begin
  { ... }
end;

function BOA.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function BOA.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function BOA.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function BOA.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function BOA.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function BOA.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function BOA.somResetObj: CORBABoolean;
begin
  { ... }
end;

function BOA.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure BOA.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure BOA.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMEEvent.somevGetEventTime: LongWord;
begin
  { ... }
end;

function SOMEEvent.somevGetEventType: LongWord;
begin
  { ... }
end;

procedure SOMEEvent.somevSetEventTime(time: LongWord);
begin
  { ... }
end;

procedure SOMEEvent.somevSetEventType(SOM_type: LongWord);
begin
  { ... }
end;

procedure SOMEEvent.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEEvent.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEEvent.somInit;
begin
  { ... }
end;

procedure SOMEEvent.somFree;
begin
  { ... }
end;

procedure SOMEEvent.somUninit;
begin
  { ... }
end;

function SOMEEvent.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMEEvent.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMEEvent.somGetSize: LongInt;
begin
  { ... }
end;

function SOMEEvent.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEvent.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMEEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEEvent.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEvent.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMEEvent.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMEEvent.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMEEvent.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMEClientEvent.somevGetEventClientData: Pointer;
begin
  { ... }
end;

function SOMEClientEvent.somevGetEventClientType: CORBAString;
begin
  { ... }
end;

procedure SOMEClientEvent.somevSetEventClientData(clientData: Pointer);
begin
  { ... }
end;

procedure SOMEClientEvent.somevSetEventClientType(clientType: CORBAString);
begin
  { ... }
end;

function SOMEClientEvent.somevGetEventTime: LongWord;
begin
  { ... }
end;

function SOMEClientEvent.somevGetEventType: LongWord;
begin
  { ... }
end;

procedure SOMEClientEvent.somevSetEventTime(time: LongWord);
begin
  { ... }
end;

procedure SOMEClientEvent.somevSetEventType(SOM_type: LongWord);
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEClientEvent.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEClientEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEClientEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEClientEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEClientEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEClientEvent.somInit;
begin
  { ... }
end;

procedure SOMEClientEvent.somFree;
begin
  { ... }
end;

procedure SOMEClientEvent.somUninit;
begin
  { ... }
end;

function SOMEClientEvent.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMEClientEvent.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMEClientEvent.somGetSize: LongInt;
begin
  { ... }
end;

function SOMEClientEvent.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEClientEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEClientEvent.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMEClientEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEClientEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEClientEvent.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEClientEvent.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMEClientEvent.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMEClientEvent.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMEClientEvent.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function Context.set_one_value(prop_name: CORBAString; value: CORBAString): LongWord;
begin
  { ... }
end;

function Context.set_values(values: NVList): LongWord;
begin
  { ... }
end;

function Context.get_values(start_scope: CORBAString; op_flags: LongWord; prop_name: CORBAString; out values: NVList): LongWord;
begin
  { ... }
end;

function Context.delete_values(prop_name: CORBAString): LongWord;
begin
  { ... }
end;

function Context.create_child(ctx_name: CORBAString; out child_ctx: Context): LongWord;
begin
  { ... }
end;

function Context.destroy(flags: LongWord): LongWord;
begin
  { ... }
end;

procedure Context.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure Context.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure Context.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Context.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Context.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Context.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Context.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Context.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Context.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Context.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Context.somInit;
begin
  { ... }
end;

procedure Context.somFree;
begin
  { ... }
end;

procedure Context.somUninit;
begin
  { ... }
end;

function Context.somGetClass: SOMClass;
begin
  { ... }
end;

function Context.somGetClassName: CORBAString;
begin
  { ... }
end;

function Context.somGetSize: LongInt;
begin
  { ... }
end;

function Context.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Context.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Context.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function Context.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Context.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Context.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Context.somResetObj: CORBABoolean;
begin
  { ... }
end;

function Context.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure Context.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure Context.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function ConstantDef._get_type: TypeCode;
begin
  { ... }
end;

procedure ConstantDef._set_type(SOM_type: TypeCode);
begin
  { ... }
end;

function ConstantDef._get_value: any;
begin
  { ... }
end;

procedure ConstantDef._set_value(value: any);
begin
  { ... }
end;

function ConstantDef._get_name: CORBAString;
begin
  { ... }
end;

procedure ConstantDef._set_name(name: CORBAString);
begin
  { ... }
end;

function ConstantDef._get_id: CORBAString;
begin
  { ... }
end;

procedure ConstantDef._set_id(id: CORBAString);
begin
  { ... }
end;

function ConstantDef._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure ConstantDef._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function ConstantDef._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure ConstantDef._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function ConstantDef.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function ConstantDef.describe: Contained_Description;
begin
  { ... }
end;

procedure ConstantDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure ConstantDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure ConstantDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ConstantDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ConstantDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ConstantDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ConstantDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ConstantDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ConstantDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ConstantDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ConstantDef.somInit;
begin
  { ... }
end;

procedure ConstantDef.somFree;
begin
  { ... }
end;

procedure ConstantDef.somUninit;
begin
  { ... }
end;

function ConstantDef.somGetClass: SOMClass;
begin
  { ... }
end;

function ConstantDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function ConstantDef.somGetSize: LongInt;
begin
  { ... }
end;

function ConstantDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ConstantDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ConstantDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function ConstantDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ConstantDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ConstantDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ConstantDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function ConstantDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure ConstantDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure ConstantDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function Container.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function Container.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function Container.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
begin
  { ... }
end;

procedure Container.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure Container.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure Container.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Container.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Container.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Container.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Container.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Container.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Container.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Container.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Container.somInit;
begin
  { ... }
end;

procedure Container.somFree;
begin
  { ... }
end;

procedure Container.somUninit;
begin
  { ... }
end;

function Container.somGetClass: SOMClass;
begin
  { ... }
end;

function Container.somGetClassName: CORBAString;
begin
  { ... }
end;

function Container.somGetSize: LongInt;
begin
  { ... }
end;

function Container.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Container.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Container.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function Container.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Container.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Container.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Container.somResetObj: CORBABoolean;
begin
  { ... }
end;

function Container.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure Container.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure Container.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


procedure SOMEEMan.someGetEManSem;
begin
  { ... }
end;

procedure SOMEEMan.someReleaseEManSem;
begin
  { ... }
end;

procedure SOMEEMan.someChangeRegData(registrationId: LongInt; registerData: SOMEEMRegisterData);
begin
  { ... }
end;

procedure SOMEEMan.someProcessEvent(mask: LongWord);
begin
  { ... }
end;

procedure SOMEEMan.someProcessEvents;
begin
  { ... }
end;

procedure SOMEEMan.someQueueEvent(event: SOMEClientEvent);
begin
  { ... }
end;

function SOMEEMan.someRegister(registerData: SOMEEMRegisterData; targetObject: SOMObject; targetMethod: CORBAString; targetData: Pointer): LongInt;
begin
  { ... }
end;

function SOMEEMan.someRegisterEv(registerData: SOMEEMRegisterData; targetObject: SOMObject; var callbackEv: Environment; targetMethod: CORBAString; targetData: Pointer): LongInt;
begin
  { ... }
end;

function SOMEEMan.someRegisterProc(registerData: SOMEEMRegisterData; targetProcedure: PPointer; targetData: Pointer): LongInt;
begin
  { ... }
end;

procedure SOMEEMan.someShutdown;
begin
  { ... }
end;

procedure SOMEEMan.someUnRegister(registrationId: LongInt);
begin
  { ... }
end;

procedure SOMEEMan.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEEMan.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEEMan.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEEMan.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEEMan.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEEMan.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEEMan.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEEMan.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEEMan.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEEMan.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEEMan.somInit;
begin
  { ... }
end;

procedure SOMEEMan.somFree;
begin
  { ... }
end;

procedure SOMEEMan.somUninit;
begin
  { ... }
end;

function SOMEEMan.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMEEMan.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMEEMan.somGetSize: LongInt;
begin
  { ... }
end;

function SOMEEMan.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEMan.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEMan.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMEEMan.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEEMan.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEEMan.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEMan.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMEEMan.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMEEMan.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMEEMan.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


procedure SOMEEMRegisterData.someClearRegData;
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataClientType(clientType: CORBAString);
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataEventMask(eventType: LongInt; ap: va_list);
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataSink(sink: LongInt);
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataSinkMask(sinkMask: LongWord);
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataTimerCount(count: LongInt);
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataTimerInterval(interval: LongInt);
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEEMRegisterData.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEEMRegisterData.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEEMRegisterData.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEEMRegisterData.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEEMRegisterData.somInit;
begin
  { ... }
end;

procedure SOMEEMRegisterData.somFree;
begin
  { ... }
end;

procedure SOMEEMRegisterData.somUninit;
begin
  { ... }
end;

function SOMEEMRegisterData.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMEEMRegisterData.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMEEMRegisterData.somGetSize: LongInt;
begin
  { ... }
end;

function SOMEEMRegisterData.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEMRegisterData.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEMRegisterData.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMEEMRegisterData.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEEMRegisterData.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEEMRegisterData.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEEMRegisterData.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMEEMRegisterData.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function ExceptionDef._get_type: TypeCode;
begin
  { ... }
end;

procedure ExceptionDef._set_type(SOM_type: TypeCode);
begin
  { ... }
end;

function ExceptionDef._get_name: CORBAString;
begin
  { ... }
end;

procedure ExceptionDef._set_name(name: CORBAString);
begin
  { ... }
end;

function ExceptionDef._get_id: CORBAString;
begin
  { ... }
end;

procedure ExceptionDef._set_id(id: CORBAString);
begin
  { ... }
end;

function ExceptionDef._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure ExceptionDef._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function ExceptionDef._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure ExceptionDef._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function ExceptionDef.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function ExceptionDef.describe: Contained_Description;
begin
  { ... }
end;

procedure ExceptionDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure ExceptionDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure ExceptionDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ExceptionDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ExceptionDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ExceptionDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ExceptionDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ExceptionDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ExceptionDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ExceptionDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ExceptionDef.somInit;
begin
  { ... }
end;

procedure ExceptionDef.somFree;
begin
  { ... }
end;

procedure ExceptionDef.somUninit;
begin
  { ... }
end;

function ExceptionDef.somGetClass: SOMClass;
begin
  { ... }
end;

function ExceptionDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function ExceptionDef.somGetSize: LongInt;
begin
  { ... }
end;

function ExceptionDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ExceptionDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ExceptionDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function ExceptionDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ExceptionDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ExceptionDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ExceptionDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function ExceptionDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure ExceptionDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure ExceptionDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function ImplementationDef._get_impl_id: CORBAString;
begin
  { ... }
end;

procedure ImplementationDef._set_impl_id(impl_id: CORBAString);
begin
  { ... }
end;

function ImplementationDef._get_impl_alias: CORBAString;
begin
  { ... }
end;

procedure ImplementationDef._set_impl_alias(impl_alias: CORBAString);
begin
  { ... }
end;

function ImplementationDef._get_impl_program: CORBAString;
begin
  { ... }
end;

procedure ImplementationDef._set_impl_program(impl_program: CORBAString);
begin
  { ... }
end;

function ImplementationDef._get_impl_flags: LongWord;
begin
  { ... }
end;

procedure ImplementationDef._set_impl_flags(impl_flags: LongWord);
begin
  { ... }
end;

function ImplementationDef._get_impl_server_class: CORBAString;
begin
  { ... }
end;

procedure ImplementationDef._set_impl_server_class(impl_server_class: CORBAString);
begin
  { ... }
end;

function ImplementationDef._get_impl_refdata_file: CORBAString;
begin
  { ... }
end;

procedure ImplementationDef._set_impl_refdata_file(impl_refdata_file: CORBAString);
begin
  { ... }
end;

function ImplementationDef._get_impl_refdata_bkup: CORBAString;
begin
  { ... }
end;

procedure ImplementationDef._set_impl_refdata_bkup(impl_refdata_bkup: CORBAString);
begin
  { ... }
end;

function ImplementationDef._get_impl_hostname: CORBAString;
begin
  { ... }
end;

procedure ImplementationDef._set_impl_hostname(impl_hostname: CORBAString);
begin
  { ... }
end;

procedure ImplementationDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure ImplementationDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure ImplementationDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ImplementationDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ImplementationDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ImplementationDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ImplementationDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ImplementationDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ImplementationDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ImplementationDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ImplementationDef.somInit;
begin
  { ... }
end;

procedure ImplementationDef.somFree;
begin
  { ... }
end;

procedure ImplementationDef.somUninit;
begin
  { ... }
end;

function ImplementationDef.somGetClass: SOMClass;
begin
  { ... }
end;

function ImplementationDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function ImplementationDef.somGetSize: LongInt;
begin
  { ... }
end;

function ImplementationDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ImplementationDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ImplementationDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function ImplementationDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ImplementationDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ImplementationDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ImplementationDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function ImplementationDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure ImplementationDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure ImplementationDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function ImplRepository.find_impldef(implid: CORBAString): ImplementationDef;
begin
  { ... }
end;

function ImplRepository.find_impldef_by_alias(alias_name: CORBAString): ImplementationDef;
begin
  { ... }
end;

function ImplRepository.find_all_impldefs(out outimpldefs: _IDL_Sequence_ImplementationDef): LongWord;
begin
  { ... }
end;

function ImplRepository.find_impldef_by_class(classname: CORBAString): _IDL_Sequence_ImplementationDef;
begin
  { ... }
end;

procedure ImplRepository.add_impldef(impldef: ImplementationDef);
begin
  { ... }
end;

procedure ImplRepository.update_impldef(impldef: ImplementationDef);
begin
  { ... }
end;

procedure ImplRepository.delete_impldef(implid: CORBAString);
begin
  { ... }
end;

procedure ImplRepository.add_class_to_impldef(implid: CORBAString; classname: CORBAString);
begin
  { ... }
end;

procedure ImplRepository.remove_class_from_impldef(implid: CORBAString; classname: CORBAString);
begin
  { ... }
end;

procedure ImplRepository.remove_class_from_all(classname: CORBAString);
begin
  { ... }
end;

function ImplRepository.find_classes_by_impldef(implid: CORBAString): _IDL_Sequence_CORBAString;
begin
  { ... }
end;

procedure ImplRepository.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure ImplRepository.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure ImplRepository.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ImplRepository.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ImplRepository.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ImplRepository.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ImplRepository.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ImplRepository.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ImplRepository.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ImplRepository.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ImplRepository.somInit;
begin
  { ... }
end;

procedure ImplRepository.somFree;
begin
  { ... }
end;

procedure ImplRepository.somUninit;
begin
  { ... }
end;

function ImplRepository.somGetClass: SOMClass;
begin
  { ... }
end;

function ImplRepository.somGetClassName: CORBAString;
begin
  { ... }
end;

function ImplRepository.somGetSize: LongInt;
begin
  { ... }
end;

function ImplRepository.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ImplRepository.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ImplRepository.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function ImplRepository.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ImplRepository.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ImplRepository.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ImplRepository.somResetObj: CORBABoolean;
begin
  { ... }
end;

function ImplRepository.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure ImplRepository.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure ImplRepository.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function InterfaceDef._get_base_interfaces: _IDL_Sequence_CORBAString;
begin
  { ... }
end;

procedure InterfaceDef._set_base_interfaces(base_interfaces: _IDL_Sequence_CORBAString);
begin
  { ... }
end;

function InterfaceDef._get_instanceData: TypeCode;
begin
  { ... }
end;

procedure InterfaceDef._set_instanceData(instanceData: TypeCode);
begin
  { ... }
end;

function InterfaceDef._get_name: CORBAString;
begin
  { ... }
end;

procedure InterfaceDef._set_name(name: CORBAString);
begin
  { ... }
end;

function InterfaceDef._get_id: CORBAString;
begin
  { ... }
end;

procedure InterfaceDef._set_id(id: CORBAString);
begin
  { ... }
end;

function InterfaceDef._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure InterfaceDef._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function InterfaceDef._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure InterfaceDef._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function InterfaceDef.describe_interface: InterfaceDef_FullInterfaceDescription;
begin
  { ... }
end;

function InterfaceDef.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function InterfaceDef.describe: Contained_Description;
begin
  { ... }
end;

procedure InterfaceDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure InterfaceDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure InterfaceDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function InterfaceDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure InterfaceDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure InterfaceDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure InterfaceDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function InterfaceDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function InterfaceDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function InterfaceDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure InterfaceDef.somInit;
begin
  { ... }
end;

procedure InterfaceDef.somFree;
begin
  { ... }
end;

procedure InterfaceDef.somUninit;
begin
  { ... }
end;

function InterfaceDef.somGetClass: SOMClass;
begin
  { ... }
end;

function InterfaceDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function InterfaceDef.somGetSize: LongInt;
begin
  { ... }
end;

function InterfaceDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function InterfaceDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function InterfaceDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function InterfaceDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function InterfaceDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function InterfaceDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function InterfaceDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function InterfaceDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure InterfaceDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure InterfaceDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;

function InterfaceDef.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function InterfaceDef.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function InterfaceDef.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
begin
  { ... }
end;


function ModuleDef._get_name: CORBAString;
begin
  { ... }
end;

procedure ModuleDef._set_name(name: CORBAString);
begin
  { ... }
end;

function ModuleDef._get_id: CORBAString;
begin
  { ... }
end;

procedure ModuleDef._set_id(id: CORBAString);
begin
  { ... }
end;

function ModuleDef._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure ModuleDef._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function ModuleDef._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure ModuleDef._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function ModuleDef.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function ModuleDef.describe: Contained_Description;
begin
  { ... }
end;

procedure ModuleDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure ModuleDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure ModuleDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ModuleDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ModuleDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ModuleDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ModuleDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ModuleDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ModuleDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ModuleDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ModuleDef.somInit;
begin
  { ... }
end;

procedure ModuleDef.somFree;
begin
  { ... }
end;

procedure ModuleDef.somUninit;
begin
  { ... }
end;

function ModuleDef.somGetClass: SOMClass;
begin
  { ... }
end;

function ModuleDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function ModuleDef.somGetSize: LongInt;
begin
  { ... }
end;

function ModuleDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ModuleDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ModuleDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function ModuleDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ModuleDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ModuleDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ModuleDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function ModuleDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure ModuleDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure ModuleDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;

function ModuleDef.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function ModuleDef.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function ModuleDef.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
begin
  { ... }
end;


function NVList.add_item(item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord;
begin
  { ... }
end;

function NVList.free: LongWord;
begin
  { ... }
end;

function NVList.free_memory: LongWord;
begin
  { ... }
end;

function NVList.get_count(out count: LongInt): LongWord;
begin
  { ... }
end;

function NVList.set_item(item_number: LongInt; item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord;
begin
  { ... }
end;

function NVList.get_item(item_number: LongInt; out item_name: CORBAString; out item_type: TypeCode; out value: Pointer; out value_len: LongInt; out item_flags: LongWord): LongWord;
begin
  { ... }
end;

procedure NVList.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure NVList.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure NVList.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function NVList.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure NVList.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure NVList.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure NVList.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function NVList.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function NVList.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function NVList.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure NVList.somInit;
begin
  { ... }
end;

procedure NVList.somFree;
begin
  { ... }
end;

procedure NVList.somUninit;
begin
  { ... }
end;

function NVList.somGetClass: SOMClass;
begin
  { ... }
end;

function NVList.somGetClassName: CORBAString;
begin
  { ... }
end;

function NVList.somGetSize: LongInt;
begin
  { ... }
end;

function NVList.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function NVList.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function NVList.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function NVList.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function NVList.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function NVList.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function NVList.somResetObj: CORBABoolean;
begin
  { ... }
end;

function NVList.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure NVList.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure NVList.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function ObjectMgr.somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject;
begin
  { ... }
end;

function ObjectMgr.somdGetIdFromObject(obj: SOMObject): CORBAString;
begin
  { ... }
end;

function ObjectMgr.somdGetObjectFromId(id: CORBAString): SOMObject;
begin
  { ... }
end;

procedure ObjectMgr.somdReleaseObject(obj: SOMObject);
begin
  { ... }
end;

procedure ObjectMgr.somdDestroyObject(obj: SOMObject);
begin
  { ... }
end;

procedure ObjectMgr.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure ObjectMgr.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure ObjectMgr.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ObjectMgr.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ObjectMgr.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ObjectMgr.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ObjectMgr.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ObjectMgr.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ObjectMgr.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ObjectMgr.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ObjectMgr.somInit;
begin
  { ... }
end;

procedure ObjectMgr.somFree;
begin
  { ... }
end;

procedure ObjectMgr.somUninit;
begin
  { ... }
end;

function ObjectMgr.somGetClass: SOMClass;
begin
  { ... }
end;

function ObjectMgr.somGetClassName: CORBAString;
begin
  { ... }
end;

function ObjectMgr.somGetSize: LongInt;
begin
  { ... }
end;

function ObjectMgr.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ObjectMgr.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ObjectMgr.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function ObjectMgr.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ObjectMgr.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ObjectMgr.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ObjectMgr.somResetObj: CORBABoolean;
begin
  { ... }
end;

function ObjectMgr.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure ObjectMgr.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure ObjectMgr.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function OperationDef._get_result: TypeCode;
begin
  { ... }
end;

procedure OperationDef._set_result(SOM_result: TypeCode);
begin
  { ... }
end;

function OperationDef._get_mode: OperationDef_OperationMode;
begin
  { ... }
end;

procedure OperationDef._set_mode(mode: OperationDef_OperationMode);
begin
  { ... }
end;

function OperationDef._get_contexts: _IDL_Sequence_CORBAString;
begin
  { ... }
end;

procedure OperationDef._set_contexts(contexts: _IDL_Sequence_CORBAString);
begin
  { ... }
end;

function OperationDef._get_name: CORBAString;
begin
  { ... }
end;

procedure OperationDef._set_name(name: CORBAString);
begin
  { ... }
end;

function OperationDef._get_id: CORBAString;
begin
  { ... }
end;

procedure OperationDef._set_id(id: CORBAString);
begin
  { ... }
end;

function OperationDef._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure OperationDef._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function OperationDef._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure OperationDef._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function OperationDef.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function OperationDef.describe: Contained_Description;
begin
  { ... }
end;

procedure OperationDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure OperationDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure OperationDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function OperationDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure OperationDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure OperationDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure OperationDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function OperationDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function OperationDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function OperationDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure OperationDef.somInit;
begin
  { ... }
end;

procedure OperationDef.somFree;
begin
  { ... }
end;

procedure OperationDef.somUninit;
begin
  { ... }
end;

function OperationDef.somGetClass: SOMClass;
begin
  { ... }
end;

function OperationDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function OperationDef.somGetSize: LongInt;
begin
  { ... }
end;

function OperationDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function OperationDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function OperationDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function OperationDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function OperationDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function OperationDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function OperationDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function OperationDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure OperationDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure OperationDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;

function OperationDef.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function OperationDef.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function OperationDef.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
begin
  { ... }
end;


function ORB.object_to_string(obj: SOMDObject): CORBAString;
begin
  { ... }
end;

function ORB.string_to_object(str: CORBAString): SOMDObject;
begin
  { ... }
end;

function ORB.create_list(count: LongInt; out new_list: NVList): LongWord;
begin
  { ... }
end;

function ORB.create_operation_list(oper: OperationDef; out new_list: NVList): LongWord;
begin
  { ... }
end;

function ORB.get_default_context(out ctx: Context): LongWord;
begin
  { ... }
end;

procedure ORB.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure ORB.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure ORB.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ORB.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ORB.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ORB.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ORB.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ORB.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ORB.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ORB.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ORB.somInit;
begin
  { ... }
end;

procedure ORB.somFree;
begin
  { ... }
end;

procedure ORB.somUninit;
begin
  { ... }
end;

function ORB.somGetClass: SOMClass;
begin
  { ... }
end;

function ORB.somGetClassName: CORBAString;
begin
  { ... }
end;

function ORB.somGetSize: LongInt;
begin
  { ... }
end;

function ORB.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ORB.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ORB.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function ORB.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ORB.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ORB.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ORB.somResetObj: CORBABoolean;
begin
  { ... }
end;

function ORB.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure ORB.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure ORB.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function ParameterDef._get_type: TypeCode;
begin
  { ... }
end;

procedure ParameterDef._set_type(SOM_type: TypeCode);
begin
  { ... }
end;

function ParameterDef._get_mode: ParameterDef_ParameterMode;
begin
  { ... }
end;

procedure ParameterDef._set_mode(mode: ParameterDef_ParameterMode);
begin
  { ... }
end;

function ParameterDef._get_name: CORBAString;
begin
  { ... }
end;

procedure ParameterDef._set_name(name: CORBAString);
begin
  { ... }
end;

function ParameterDef._get_id: CORBAString;
begin
  { ... }
end;

procedure ParameterDef._set_id(id: CORBAString);
begin
  { ... }
end;

function ParameterDef._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure ParameterDef._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function ParameterDef._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure ParameterDef._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function ParameterDef.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function ParameterDef.describe: Contained_Description;
begin
  { ... }
end;

procedure ParameterDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure ParameterDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure ParameterDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ParameterDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ParameterDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ParameterDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure ParameterDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function ParameterDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ParameterDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function ParameterDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure ParameterDef.somInit;
begin
  { ... }
end;

procedure ParameterDef.somFree;
begin
  { ... }
end;

procedure ParameterDef.somUninit;
begin
  { ... }
end;

function ParameterDef.somGetClass: SOMClass;
begin
  { ... }
end;

function ParameterDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function ParameterDef.somGetSize: LongInt;
begin
  { ... }
end;

function ParameterDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ParameterDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ParameterDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function ParameterDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ParameterDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function ParameterDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function ParameterDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function ParameterDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure ParameterDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure ParameterDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function Principal._get_userName: CORBAString;
begin
  { ... }
end;

procedure Principal._set_userName(userName: CORBAString);
begin
  { ... }
end;

function Principal._get_hostName: CORBAString;
begin
  { ... }
end;

procedure Principal._set_hostName(hostName: CORBAString);
begin
  { ... }
end;

procedure Principal.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure Principal.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure Principal.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Principal.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Principal.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Principal.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Principal.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Principal.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Principal.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Principal.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Principal.somInit;
begin
  { ... }
end;

procedure Principal.somFree;
begin
  { ... }
end;

procedure Principal.somUninit;
begin
  { ... }
end;

function Principal.somGetClass: SOMClass;
begin
  { ... }
end;

function Principal.somGetClassName: CORBAString;
begin
  { ... }
end;

function Principal.somGetSize: LongInt;
begin
  { ... }
end;

function Principal.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Principal.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Principal.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function Principal.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Principal.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Principal.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Principal.somResetObj: CORBABoolean;
begin
  { ... }
end;

function Principal.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure Principal.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure Principal.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function Repository.lookup_id(search_id: CORBAString): Contained;
begin
  { ... }
end;

function Repository.lookup_modifier(name: CORBAString; modifier: CORBAString): CORBAString;
begin
  { ... }
end;

procedure Repository.release_cache;
begin
  { ... }
end;

function Repository.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function Repository.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained;
begin
  { ... }
end;

function Repository.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription;
begin
  { ... }
end;

procedure Repository.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure Repository.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure Repository.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Repository.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Repository.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Repository.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Repository.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Repository.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Repository.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Repository.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Repository.somInit;
begin
  { ... }
end;

procedure Repository.somFree;
begin
  { ... }
end;

procedure Repository.somUninit;
begin
  { ... }
end;

function Repository.somGetClass: SOMClass;
begin
  { ... }
end;

function Repository.somGetClassName: CORBAString;
begin
  { ... }
end;

function Repository.somGetSize: LongInt;
begin
  { ... }
end;

function Repository.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Repository.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Repository.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function Repository.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Repository.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Repository.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Repository.somResetObj: CORBABoolean;
begin
  { ... }
end;

function Repository.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure Repository.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure Repository.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function Request.add_arg(name: CORBAString; arg_type: TypeCode; value: Pointer; len: LongInt; arg_flags: LongWord): LongWord;
begin
  { ... }
end;

function Request.invoke(invoke_flags: LongWord): LongWord;
begin
  { ... }
end;

function Request.send(invoke_flags: LongWord): LongWord;
begin
  { ... }
end;

function Request.get_response(response_flags: LongWord): LongWord;
begin
  { ... }
end;

function Request.destroy: LongWord;
begin
  { ... }
end;

procedure Request.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure Request.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure Request.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Request.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Request.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Request.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Request.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Request.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Request.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Request.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Request.somInit;
begin
  { ... }
end;

procedure Request.somFree;
begin
  { ... }
end;

procedure Request.somUninit;
begin
  { ... }
end;

function Request.somGetClass: SOMClass;
begin
  { ... }
end;

function Request.somGetClassName: CORBAString;
begin
  { ... }
end;

function Request.somGetSize: LongInt;
begin
  { ... }
end;

function Request.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Request.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Request.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function Request.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Request.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Request.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Request.somResetObj: CORBABoolean;
begin
  { ... }
end;

function Request.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure Request.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure Request.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTEntryC.somInit;
begin
  { ... }
end;

procedure SOMTEntryC.somFree;
begin
  { ... }
end;

procedure SOMTEntryC.somUninit;
begin
  { ... }
end;

function SOMTEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTAttributeEntryC._get_somtIsReadonly: CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtAttribType: SOMTEntryC;
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTAttributeEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTAttributeEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetFirstAttributeDeclarator: SOMTDataEntryC;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetNextAttributeDeclarator: SOMTDataEntryC;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetFirstGetMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetNextGetMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetFirstSetMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetNextSetMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTAttributeEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTAttributeEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTAttributeEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTAttributeEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTAttributeEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somInit;
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somFree;
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somUninit;
begin
  { ... }
end;

function SOMTAttributeEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTAttributeEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTAttributeEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTAttributeEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTAttributeEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTBaseClassEntryC._get_somtBaseClassDef: SOMTClassEntryC;
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTBaseClassEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTBaseClassEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somInit;
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somFree;
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somUninit;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTBaseClassEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTClassEntryC._get_somtSourceFileName: CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtMetaClassEntry: SOMTMetaClassEntryC;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtClassModule: SOMTModuleEntryC;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtNewMethodCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtLocalInclude: CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtPrivateMethodCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtStaticMethodCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtOverrideMethodCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtProcMethodCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtVAMethodCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtBaseCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtExternalDataCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtPublicDataCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtPrivateDataCount: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtMetaclassFor: SOMTClassEntryC;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtForwardRef: CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTClassEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTClassEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTClassEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTClassEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstBaseClass: SOMTBaseClassEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextBaseClass: SOMTBaseClassEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstReleaseName: CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextReleaseName: CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetReleaseNameList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstPassthru: SOMTPassthruEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextPassthru: SOMTPassthruEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstData: SOMTDataEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextData: SOMTDataEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstStaticData: SOMTDataEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextStaticData: SOMTDataEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstInheritedMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextInheritedMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstAttribute: SOMTAttributeEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextAttribute: SOMTAttributeEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstStruct: SOMTStructEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextStruct: SOMTStructEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstTypedef: SOMTTypedefEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextTypedef: SOMTTypedefEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstUnion: SOMTUnionEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextUnion: SOMTUnionEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstEnum: SOMTEnumEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextEnum: SOMTEnumEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstConstant: SOMTConstEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextConstant: SOMTConstEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstSequence: SOMTSequenceEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextSequence: SOMTSequenceEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstPubdef: SOMTEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextPubdef: SOMTEntryC;
begin
  { ... }
end;

function SOMTClassEntryC.somtFilterNew(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somtFilterOverridden(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somtFilterPrivOrPub(entry: SOMTCommonEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTClassEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTClassEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTClassEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTClassEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTClassEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTClassEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTClassEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTClassEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTClassEntryC.somInit;
begin
  { ... }
end;

procedure SOMTClassEntryC.somFree;
begin
  { ... }
end;

procedure SOMTClassEntryC.somUninit;
begin
  { ... }
end;

function SOMTClassEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTClassEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTClassEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTClassEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTClassEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTClassEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTClassEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTCommonEntryC._get_somtTypeObj: SOMTEntryC;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtPtrs: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtArrayDimsString: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtSourceText: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtType: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtVisibility: somtVisibilityT;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTCommonEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTCommonEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetFirstArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetNextArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTCommonEntryC.somtIsArray(out size: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somtIsPointer: CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTCommonEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTCommonEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTCommonEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTCommonEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTCommonEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTCommonEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTCommonEntryC.somInit;
begin
  { ... }
end;

procedure SOMTCommonEntryC.somFree;
begin
  { ... }
end;

procedure SOMTCommonEntryC.somUninit;
begin
  { ... }
end;

function SOMTCommonEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTCommonEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTCommonEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTCommonEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTCommonEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTConstEntryC._get_somtConstTypeObj: SOMTEntryC;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstType: CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstStringVal: CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstNumVal: LongWord;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstNumNegVal: LongInt;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstIsNegative: CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstVal: CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTConstEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTConstEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTConstEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTConstEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTConstEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTConstEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTConstEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTConstEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTConstEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTConstEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTConstEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTConstEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTConstEntryC.somInit;
begin
  { ... }
end;

procedure SOMTConstEntryC.somFree;
begin
  { ... }
end;

procedure SOMTConstEntryC.somUninit;
begin
  { ... }
end;

function SOMTConstEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTConstEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTConstEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTConstEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTConstEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTConstEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTConstEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTDataEntryC._get_somtIsSelfRef: CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtTypeObj: SOMTEntryC;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtPtrs: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtArrayDimsString: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtSourceText: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtType: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtVisibility: somtVisibilityT;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTDataEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTDataEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTDataEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTDataEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC.somtGetFirstArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTDataEntryC.somtGetNextArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTDataEntryC.somtIsArray(out size: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somtIsPointer: CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTDataEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTDataEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTDataEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTDataEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTDataEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTDataEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTDataEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTDataEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTDataEntryC.somInit;
begin
  { ... }
end;

procedure SOMTDataEntryC.somFree;
begin
  { ... }
end;

procedure SOMTDataEntryC.somUninit;
begin
  { ... }
end;

function SOMTDataEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTDataEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTDataEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTDataEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTDataEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTDataEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTDataEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTEmitC._get_somtTemplate: SOMTTemplateOutputC;
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTemplate(somtTemplate: SOMTTemplateOutputC);
begin
  { ... }
end;

function SOMTEmitC._get_somtTargetFile: PSOM_FILE;
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTargetFile(somtTargetFile: PSOM_FILE);
begin
  { ... }
end;

function SOMTEmitC._get_somtTargetClass: SOMTClassEntryC;
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTargetClass(somtTargetClass: SOMTClassEntryC);
begin
  { ... }
end;

function SOMTEmitC._get_somtTargetModule: SOMTModuleEntryC;
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTargetModule(somtTargetModule: SOMTModuleEntryC);
begin
  { ... }
end;

function SOMTEmitC._get_somtTargetType: SOMTTargetTypeT;
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTargetType(somtTargetType: SOMTTargetTypeT);
begin
  { ... }
end;

function SOMTEmitC._get_somtEmitterName: CORBAString;
begin
  { ... }
end;

procedure SOMTEmitC._set_somtEmitterName(somtEmitterName: CORBAString);
begin
  { ... }
end;

function SOMTEmitC.somtGenerateSections: CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtOpenSymbolsFile(SOM_file: CORBAString; mode: CORBAString): PSOM_FILE;
begin
  { ... }
end;

procedure SOMTEmitC.somtSetPredefinedSymbols;
begin
  { ... }
end;

procedure SOMTEmitC.somtFileSymbols;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseIncludesProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseIncludes(base: SOMTBaseClassEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseIncludesEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMetaInclude;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitClass;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMeta;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBase(base: SOMTBaseClassEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitPassthruProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitPassthru(entry: SOMTPassthruEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitPassthruEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitRelease;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitDataProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitData(entry: SOMTDataEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitDataEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitAttributeProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitAttribute(att: SOMTAttributeEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitAttributeEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitConstantProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitConstant(con: SOMTConstEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitConstantEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitTypedefProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitTypedef(td: SOMTTypedefEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitTypedefEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitStructProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitStruct(struc: SOMTStructEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitStructEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitUnionProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitUnion(un: SOMTUnionEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitUnionEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitEnumProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitEnum(en: SOMTEnumEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitEnumEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitInterfaceProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitInterface(intfc: SOMTClassEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitInterfaceEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitModuleProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitModule(SOM_mod: SOMTModuleEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitModuleEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMethodsProlog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMethods(method: SOMTMethodEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMethodsEpilog;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMethod(entry: SOMTMethodEntryC);
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitEpilog;
begin
  { ... }
end;

function SOMTEmitC.somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtNew(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtImplemented(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtOverridden(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtInherited(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtAll(entry: SOMTMethodEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtNewNoProc(entry: SOMTEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtPrivOrPub(entry: SOMTEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtNewProc(entry: SOMTEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtLink(entry: SOMTEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtVA(entry: SOMTEntryC): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean;
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitFullPassthru(before: CORBABoolean; language: CORBAString);
begin
  { ... }
end;

function SOMTEmitC.somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTEmitC.somtGetFirstGlobalDefinition: SOMTEntryC;
begin
  { ... }
end;

function SOMTEmitC.somtGetNextGlobalDefinition: SOMTEntryC;
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTEmitC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTEmitC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTEmitC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTEmitC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTEmitC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTEmitC.somInit;
begin
  { ... }
end;

procedure SOMTEmitC.somFree;
begin
  { ... }
end;

procedure SOMTEmitC.somUninit;
begin
  { ... }
end;

function SOMTEmitC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTEmitC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTEmitC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTEmitC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTEmitC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTEmitC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTEmitC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTEnumEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTEnumEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTEnumEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetFirstEnumName: SOMTEnumNameEntryC;
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetNextEnumName: SOMTEnumNameEntryC;
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTEnumEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTEnumEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTEnumEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTEnumEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTEnumEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTEnumEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTEnumEntryC.somInit;
begin
  { ... }
end;

procedure SOMTEnumEntryC.somFree;
begin
  { ... }
end;

procedure SOMTEnumEntryC.somUninit;
begin
  { ... }
end;

function SOMTEnumEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTEnumEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTEnumEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTEnumEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTEnumEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTEnumNameEntryC._get_somtEnumPtr: SOMTEnumEntryC;
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtEnumVal: LongWord;
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTEnumNameEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTEnumNameEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somInit;
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somFree;
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somUninit;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTEnumNameEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTMetaClassEntryC._get_somtMetaFile: CORBAString;
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtMetaClassDef: SOMTClassEntryC;
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTMetaClassEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTMetaClassEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somInit;
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somFree;
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somUninit;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTMetaClassEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTMethodEntryC._get_somtIsVarargs: CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtOriginalMethod: SOMTMethodEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtOriginalClass: SOMTClassEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtMethodGroup: SOMTEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtIsPrivateMethod: CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtIsOneway: CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtArgCount: SmallInt;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtContextArray: PCORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtCReturnType: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtTypeObj: SOMTEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtPtrs: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtArrayDimsString: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtSourceText: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtType: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtVisibility: somtVisibilityT;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTMethodEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTMethodEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFirstParameter: SOMTParameterEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNextParameter: SOMTParameterEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetIDLParamList(buffer: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetShortCParamList(buffer: CORBAString; selfParm: CORBAString; varargsParm: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFullCParamList(buffer: CORBAString; varargsParm: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetShortParamNameList(buffer: CORBAString; selfParm: CORBAString; varargsParm: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFullParamNameList(buffer: CORBAString; varargsParm: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNthParameter(n: SmallInt): SOMTParameterEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFirstException: SOMTStructEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNextException: SOMTStructEntryC;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFirstArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNextArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTMethodEntryC.somtIsArray(out size: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somtIsPointer: CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTMethodEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTMethodEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTMethodEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTMethodEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTMethodEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTMethodEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTMethodEntryC.somInit;
begin
  { ... }
end;

procedure SOMTMethodEntryC.somFree;
begin
  { ... }
end;

procedure SOMTMethodEntryC.somUninit;
begin
  { ... }
end;

function SOMTMethodEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTMethodEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTMethodEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTMethodEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTMethodEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTModuleEntryC._get_somtOuterModule: SOMTModuleEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtModuleFile: CORBAString;
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTModuleEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTModuleEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleStruct: SOMTStructEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleStruct: SOMTStructEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleTypedef: SOMTTypedefEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleTypedef: SOMTTypedefEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleUnion: SOMTUnionEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleUnion: SOMTUnionEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleEnum: SOMTEnumEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleEnum: SOMTEnumEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleConstant: SOMTConstEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleConstant: SOMTConstEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleSequence: SOMTSequenceEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleSequence: SOMTSequenceEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstInterface: SOMTClassEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextInterface: SOMTClassEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModule: SOMTModuleEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModule: SOMTModuleEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleDef: SOMTEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleDef: SOMTEntryC;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTModuleEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTModuleEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTModuleEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTModuleEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTModuleEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTModuleEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTModuleEntryC.somInit;
begin
  { ... }
end;

procedure SOMTModuleEntryC.somFree;
begin
  { ... }
end;

procedure SOMTModuleEntryC.somUninit;
begin
  { ... }
end;

function SOMTModuleEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTModuleEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTModuleEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTModuleEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTModuleEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTParameterEntryC._get_somtParameterDirection: somtParameterDirectionT;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtIDLParameterDeclaration: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtCParameterDeclaration: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtTypeObj: SOMTEntryC;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtPtrs: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtArrayDimsString: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtSourceText: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtType: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtVisibility: somtVisibilityT;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTParameterEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTParameterEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetFirstArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetNextArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTParameterEntryC.somtIsArray(out size: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somtIsPointer: CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTParameterEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTParameterEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTParameterEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTParameterEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTParameterEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTParameterEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTParameterEntryC.somInit;
begin
  { ... }
end;

procedure SOMTParameterEntryC.somFree;
begin
  { ... }
end;

procedure SOMTParameterEntryC.somUninit;
begin
  { ... }
end;

function SOMTParameterEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTParameterEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTParameterEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTParameterEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTParameterEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTPassthruEntryC._get_somtPassthruBody: CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtPassthruLanguage: CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtPassthruTarget: CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTPassthruEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTPassthruEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC.somtIsBeforePassthru: CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTPassthruEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTPassthruEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTPassthruEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTPassthruEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTPassthruEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTPassthruEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somInit;
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somFree;
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somUninit;
begin
  { ... }
end;

function SOMTPassthruEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTPassthruEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTPassthruEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTPassthruEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTPassthruEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTSequenceEntryC._get_somtSeqLength: LongInt;
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtSeqType: SOMTEntryC;
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTSequenceEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTSequenceEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTSequenceEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTSequenceEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTSequenceEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTSequenceEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTSequenceEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTSequenceEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTSequenceEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTSequenceEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somInit;
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somFree;
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somUninit;
begin
  { ... }
end;

function SOMTSequenceEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTSequenceEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTSequenceEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTSequenceEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTSequenceEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTStringEntryC._get_somtStringLength: LongInt;
begin
  { ... }
end;

function SOMTStringEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTStringEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTStringEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTStringEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTStringEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTStringEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTStringEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTStringEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTStringEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTStringEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTStringEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTStringEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTStringEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTStringEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTStringEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTStringEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTStringEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTStringEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTStringEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTStringEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTStringEntryC.somInit;
begin
  { ... }
end;

procedure SOMTStringEntryC.somFree;
begin
  { ... }
end;

procedure SOMTStringEntryC.somUninit;
begin
  { ... }
end;

function SOMTStringEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTStringEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTStringEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTStringEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTStringEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTStringEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTStringEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTStructEntryC._get_somtStructClass: SOMTClassEntryC;
begin
  { ... }
end;

function SOMTStructEntryC._get_somtIsException: CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTStructEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTStructEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTStructEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTStructEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTStructEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTStructEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTStructEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTStructEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTStructEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTStructEntryC.somtGetFirstMember: SOMTTypedefEntryC;
begin
  { ... }
end;

function SOMTStructEntryC.somtGetNextMember: SOMTTypedefEntryC;
begin
  { ... }
end;

function SOMTStructEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTStructEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTStructEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTStructEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTStructEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTStructEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTStructEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTStructEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTStructEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTStructEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTStructEntryC.somInit;
begin
  { ... }
end;

procedure SOMTStructEntryC.somFree;
begin
  { ... }
end;

procedure SOMTStructEntryC.somUninit;
begin
  { ... }
end;

function SOMTStructEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTStructEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTStructEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTStructEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTStructEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTStructEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTStructEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTTypedefEntryC._get_somtTypedefType: SOMTEntryC;
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTTypedefEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTTypedefEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetFirstDeclarator: SOMTCommonEntryC;
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetNextDeclarator: SOMTCommonEntryC;
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTTypedefEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTTypedefEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTTypedefEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTTypedefEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTTypedefEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somInit;
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somFree;
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somUninit;
begin
  { ... }
end;

function SOMTTypedefEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTTypedefEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTTypedefEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTTypedefEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTTypedefEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTTemplateOutputC._get_somtCommentStyle: somtCommentStyleT;
begin
  { ... }
end;

procedure SOMTTemplateOutputC._set_somtCommentStyle(somtCommentStyle: somtCommentStyleT);
begin
  { ... }
end;

function SOMTTemplateOutputC._get_somtLineLength: LongInt;
begin
  { ... }
end;

procedure SOMTTemplateOutputC._set_somtLineLength(somtLineLength: LongInt);
begin
  { ... }
end;

function SOMTTemplateOutputC._get_somtCommentNewline: CORBABoolean;
begin
  { ... }
end;

procedure SOMTTemplateOutputC._set_somtCommentNewline(somtCommentNewline: CORBABoolean);
begin
  { ... }
end;

function SOMTTemplateOutputC.somtGetSymbol(name: CORBAString): CORBAString;
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetSymbol(name: CORBAString; value: CORBAString);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetSymbolCopyName(name: CORBAString; value: CORBAString);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetSymbolCopyValue(name: CORBAString; value: CORBAString);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetSymbolCopyBoth(name: CORBAString; value: CORBAString);
begin
  { ... }
end;

function SOMTTemplateOutputC.somtCheckSymbol(name: CORBAString): CORBABoolean;
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetOutputFile(var fp{: opaque SOM_FILE});
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somto(tmplt: CORBAString);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtOutputComment(comment: CORBAString);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtOutputSection(sectionName: CORBAString);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtAddSectionDefinitions(defString: CORBAString);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtReadSectionDefinitions(var fp{: opaque SOM_FILE});
begin
  { ... }
end;

function SOMTTemplateOutputC.somtExpandSymbol(s: CORBAString; buf: CORBAString): CORBAString;
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTTemplateOutputC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTTemplateOutputC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTTemplateOutputC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTTemplateOutputC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somInit;
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somFree;
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somUninit;
begin
  { ... }
end;

function SOMTTemplateOutputC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTTemplateOutputC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTTemplateOutputC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTTemplateOutputC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTTemplateOutputC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTTemplateOutputC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTTemplateOutputC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTTemplateOutputC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTTemplateOutputC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTTemplateOutputC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTTemplateOutputC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTUnionEntryC._get_somtSwitchType: SOMTEntryC;
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTUnionEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTUnionEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetFirstCaseEntry: PSOMTUnionEntryC_somtCaseEntry;
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetNextCaseEntry: PSOMTUnionEntryC_somtCaseEntry;
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTUnionEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTUnionEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTUnionEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTUnionEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTUnionEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTUnionEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTUnionEntryC.somInit;
begin
  { ... }
end;

procedure SOMTUnionEntryC.somFree;
begin
  { ... }
end;

procedure SOMTUnionEntryC.somUninit;
begin
  { ... }
end;

function SOMTUnionEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTUnionEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTUnionEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTUnionEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTUnionEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMTUserDefinedTypeEntryC._get_somtOriginalTypedef: SOMTTypedefEntryC;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtBaseTypeObj: SOMTEntryC;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtTypeObj: SOMTEntryC;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtPtrs: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtArrayDimsString: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtSourceText: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtType: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtVisibility: somtVisibilityT;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtEntryName: CORBAString;
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC._set_somtEntryName(somtEntryName: CORBAString);
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtElementType: LongWord;
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC._set_somtElementType(somtElementType: LongWord);
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtElementTypeName: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtEntryComment: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtSourceLineNumber: LongWord;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtTypeCode: TypeCode;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtIsReference: CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtIDLScopedName: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtCScopedName: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetFirstArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetNextArrayDimension: LongWord;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtIsArray(out size: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtIsPointer: CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetModifierList(buffer: CORBAString): LongInt;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somtSetEntryStruct(var es: Pointer);
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somInit;
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somFree;
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somUninit;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMDServerMgr.somdShutdownServer(server_alias: CORBAString): LongWord;
begin
  { ... }
end;

function SOMDServerMgr.somdStartServer(server_alias: CORBAString): LongWord;
begin
  { ... }
end;

function SOMDServerMgr.somdRestartServer(server_alias: CORBAString): LongWord;
begin
  { ... }
end;

function SOMDServerMgr.somdListServer(server_alias: CORBAString): LongWord;
begin
  { ... }
end;

function SOMDServerMgr.somdDisableServer(server_alias: CORBAString): LongWord;
begin
  { ... }
end;

function SOMDServerMgr.somdEnableServer(server_alias: CORBAString): LongWord;
begin
  { ... }
end;

function SOMDServerMgr.somdIsServerEnabled(impldef: ImplementationDef): CORBABoolean;
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDServerMgr.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDServerMgr.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDServerMgr.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDServerMgr.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDServerMgr.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDServerMgr.somInit;
begin
  { ... }
end;

procedure SOMDServerMgr.somFree;
begin
  { ... }
end;

procedure SOMDServerMgr.somUninit;
begin
  { ... }
end;

function SOMDServerMgr.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMDServerMgr.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMDServerMgr.somGetSize: LongInt;
begin
  { ... }
end;

function SOMDServerMgr.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDServerMgr.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDServerMgr.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMDServerMgr.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDServerMgr.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDServerMgr.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDServerMgr.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMDServerMgr.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMDServerMgr.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMDServerMgr.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMESinkEvent.somevGetEventSink: LongInt;
begin
  { ... }
end;

procedure SOMESinkEvent.somevSetEventSink(sink: LongInt);
begin
  { ... }
end;

function SOMESinkEvent.somevGetEventTime: LongWord;
begin
  { ... }
end;

function SOMESinkEvent.somevGetEventType: LongWord;
begin
  { ... }
end;

procedure SOMESinkEvent.somevSetEventTime(time: LongWord);
begin
  { ... }
end;

procedure SOMESinkEvent.somevSetEventType(SOM_type: LongWord);
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMESinkEvent.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMESinkEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMESinkEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMESinkEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMESinkEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMESinkEvent.somInit;
begin
  { ... }
end;

procedure SOMESinkEvent.somFree;
begin
  { ... }
end;

procedure SOMESinkEvent.somUninit;
begin
  { ... }
end;

function SOMESinkEvent.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMESinkEvent.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMESinkEvent.somGetSize: LongInt;
begin
  { ... }
end;

function SOMESinkEvent.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMESinkEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMESinkEvent.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMESinkEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMESinkEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMESinkEvent.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMESinkEvent.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMESinkEvent.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMESinkEvent.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMESinkEvent.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMClass._get_somDataAlignment: LongInt;
begin
  { ... }
end;

function SOMClass._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
begin
  { ... }
end;

function SOMClass._get_somDirectInitClasses: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

procedure SOMClass._set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
begin
  { ... }
end;

function SOMClass._get_somClassAllocate: PPointer;
begin
  { ... }
end;

function SOMClass._get_somClassDeallocate: PPointer;
begin
  { ... }
end;

function SOMClass.somNew: SOMObject;
begin
  { ... }
end;

function SOMClass.somNewNoInit: SOMObject;
begin
  { ... }
end;

function SOMClass.somRenew(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMClass.somRenewNoInit(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMClass.somRenewNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMClass.somRenewNoInitNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMClass.somAllocate(size: LongInt): CORBAString;
begin
  { ... }
end;

procedure SOMClass.somDeallocate(memptr: CORBAString);
begin
  { ... }
end;

function SOMClass.somGetInstanceInitMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMClass.somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMClass.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

procedure SOMClass.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

procedure SOMClass.somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

function SOMClass.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMClass.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
begin
  { ... }
end;

procedure SOMClass.somOverrideSMethod(methodId: somId; method: Pointer);
begin
  { ... }
end;

procedure SOMClass.somClassReady;
begin
  { ... }
end;

function SOMClass.somGetClassData: PsomClassDataStructure;
begin
  { ... }
end;

procedure SOMClass.somSetClassData(cds: somClassDataStructure);
begin
  { ... }
end;

function SOMClass.somGetClassMtab: PsomMethodTab;
begin
  { ... }
end;

function SOMClass.somGetInstanceOffset: LongInt;
begin
  { ... }
end;

function SOMClass.somGetInstancePartSize: LongInt;
begin
  { ... }
end;

function SOMClass.somGetInstanceSize: LongInt;
begin
  { ... }
end;

function SOMClass.somGetInstanceToken: Pointer;
begin
  { ... }
end;

function SOMClass.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
begin
  { ... }
end;

function SOMClass.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somGetRdStub(methodId: somId): PPointer;
begin
  { ... }
end;

function SOMClass.somGetMethodDescriptor(methodId: somId): somId;
begin
  { ... }
end;

function SOMClass.somGetMethodIndex(id: somId): LongInt;
begin
  { ... }
end;

function SOMClass.somGetMethodToken(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMClass.somGetName: CORBAString;
begin
  { ... }
end;

function SOMClass.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
begin
  { ... }
end;

function SOMClass.somGetNumMethods: LongInt;
begin
  { ... }
end;

function SOMClass.somGetNumStaticMethods: LongInt;
begin
  { ... }
end;

function SOMClass.somGetParent: SOMClass;
begin
  { ... }
end;

function SOMClass.somGetParents: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

function SOMClass.somGetPClsMtab: PsomMethodTabList;
begin
  { ... }
end;

function SOMClass.somGetPClsMtabs: PsomMethodTabList;
begin
  { ... }
end;

procedure SOMClass.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
begin
  { ... }
end;

function SOMClass.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somFindSMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMClass.somFindSMethodOk(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMClass.somLookupMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMClass.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somSupportsMethod(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somDefinedMethod(method: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMClass.somOverrideMtab;
begin
  { ... }
end;

procedure SOMClass.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMClass.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMClass.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMClass.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMClass.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMClass.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMClass.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMClass.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMClass.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMClass.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMClass.somInit;
begin
  { ... }
end;

procedure SOMClass.somFree;
begin
  { ... }
end;

procedure SOMClass.somUninit;
begin
  { ... }
end;

function SOMClass.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMClass.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMClass.somGetSize: LongInt;
begin
  { ... }
end;

function SOMClass.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMClass.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMClass.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMClass.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMClass.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMMSingleInstance._get_somDataAlignment: LongInt;
begin
  { ... }
end;

function SOMMSingleInstance._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
begin
  { ... }
end;

function SOMMSingleInstance._get_somDirectInitClasses: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

procedure SOMMSingleInstance._set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
begin
  { ... }
end;

function SOMMSingleInstance._get_somClassAllocate: PPointer;
begin
  { ... }
end;

function SOMMSingleInstance._get_somClassDeallocate: PPointer;
begin
  { ... }
end;

function SOMMSingleInstance.sommGetSingleInstance: SOMObject;
begin
  { ... }
end;

procedure SOMMSingleInstance.sommFreeSingleInstance;
begin
  { ... }
end;

function SOMMSingleInstance.somNew: SOMObject;
begin
  { ... }
end;

function SOMMSingleInstance.somNewNoInit: SOMObject;
begin
  { ... }
end;

function SOMMSingleInstance.somRenew(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMSingleInstance.somRenewNoInit(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMSingleInstance.somRenewNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMSingleInstance.somRenewNoInitNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMSingleInstance.somAllocate(size: LongInt): CORBAString;
begin
  { ... }
end;

procedure SOMMSingleInstance.somDeallocate(memptr: CORBAString);
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceInitMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

procedure SOMMSingleInstance.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

procedure SOMMSingleInstance.somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

function SOMMSingleInstance.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMMSingleInstance.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
begin
  { ... }
end;

procedure SOMMSingleInstance.somOverrideSMethod(methodId: somId; method: Pointer);
begin
  { ... }
end;

procedure SOMMSingleInstance.somClassReady;
begin
  { ... }
end;

function SOMMSingleInstance.somGetClassData: PsomClassDataStructure;
begin
  { ... }
end;

procedure SOMMSingleInstance.somSetClassData(cds: somClassDataStructure);
begin
  { ... }
end;

function SOMMSingleInstance.somGetClassMtab: PsomMethodTab;
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceOffset: LongInt;
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstancePartSize: LongInt;
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceSize: LongInt;
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceToken: Pointer;
begin
  { ... }
end;

function SOMMSingleInstance.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
begin
  { ... }
end;

function SOMMSingleInstance.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somGetRdStub(methodId: somId): PPointer;
begin
  { ... }
end;

function SOMMSingleInstance.somGetMethodDescriptor(methodId: somId): somId;
begin
  { ... }
end;

function SOMMSingleInstance.somGetMethodIndex(id: somId): LongInt;
begin
  { ... }
end;

function SOMMSingleInstance.somGetMethodToken(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMSingleInstance.somGetName: CORBAString;
begin
  { ... }
end;

function SOMMSingleInstance.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
begin
  { ... }
end;

function SOMMSingleInstance.somGetNumMethods: LongInt;
begin
  { ... }
end;

function SOMMSingleInstance.somGetNumStaticMethods: LongInt;
begin
  { ... }
end;

function SOMMSingleInstance.somGetParent: SOMClass;
begin
  { ... }
end;

function SOMMSingleInstance.somGetParents: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

function SOMMSingleInstance.somGetPClsMtab: PsomMethodTabList;
begin
  { ... }
end;

function SOMMSingleInstance.somGetPClsMtabs: PsomMethodTabList;
begin
  { ... }
end;

procedure SOMMSingleInstance.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
begin
  { ... }
end;

function SOMMSingleInstance.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somFindSMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMSingleInstance.somFindSMethodOk(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMSingleInstance.somLookupMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMSingleInstance.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somSupportsMethod(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somDefinedMethod(method: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMMSingleInstance.somOverrideMtab;
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMMSingleInstance.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMMSingleInstance.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMMSingleInstance.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMMSingleInstance.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMMSingleInstance.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMMSingleInstance.somInit;
begin
  { ... }
end;

procedure SOMMSingleInstance.somFree;
begin
  { ... }
end;

procedure SOMMSingleInstance.somUninit;
begin
  { ... }
end;

function SOMMSingleInstance.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMMSingleInstance.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMMSingleInstance.somGetSize: LongInt;
begin
  { ... }
end;

function SOMMSingleInstance.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMMSingleInstance.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMMSingleInstance.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMMSingleInstance.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMMBeforeAfter._get_somDataAlignment: LongInt;
begin
  { ... }
end;

function SOMMBeforeAfter._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
begin
  { ... }
end;

function SOMMBeforeAfter._get_somDirectInitClasses: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

procedure SOMMBeforeAfter._set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
begin
  { ... }
end;

function SOMMBeforeAfter._get_somClassAllocate: PPointer;
begin
  { ... }
end;

function SOMMBeforeAfter._get_somClassDeallocate: PPointer;
begin
  { ... }
end;

function SOMMBeforeAfter.sommBeforeMethod(SOM_object: SOMObject; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

procedure SOMMBeforeAfter.sommAfterMethod(SOM_object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list);
begin
  { ... }
end;

function SOMMBeforeAfter.somNew: SOMObject;
begin
  { ... }
end;

function SOMMBeforeAfter.somNewNoInit: SOMObject;
begin
  { ... }
end;

function SOMMBeforeAfter.somRenew(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMBeforeAfter.somRenewNoInit(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMBeforeAfter.somRenewNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMBeforeAfter.somRenewNoInitNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMBeforeAfter.somAllocate(size: LongInt): CORBAString;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDeallocate(memptr: CORBAString);
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceInitMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

procedure SOMMBeforeAfter.somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

function SOMMBeforeAfter.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
begin
  { ... }
end;

procedure SOMMBeforeAfter.somOverrideSMethod(methodId: somId; method: Pointer);
begin
  { ... }
end;

procedure SOMMBeforeAfter.somClassReady;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetClassData: PsomClassDataStructure;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somSetClassData(cds: somClassDataStructure);
begin
  { ... }
end;

function SOMMBeforeAfter.somGetClassMtab: PsomMethodTab;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceOffset: LongInt;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstancePartSize: LongInt;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceSize: LongInt;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceToken: Pointer;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetRdStub(methodId: somId): PPointer;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMethodDescriptor(methodId: somId): somId;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMethodIndex(id: somId): LongInt;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMethodToken(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetName: CORBAString;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetNumMethods: LongInt;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetNumStaticMethods: LongInt;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetParent: SOMClass;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetParents: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetPClsMtab: PsomMethodTabList;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetPClsMtabs: PsomMethodTabList;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
begin
  { ... }
end;

function SOMMBeforeAfter.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somFindSMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMBeforeAfter.somFindSMethodOk(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMBeforeAfter.somLookupMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMBeforeAfter.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somSupportsMethod(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somDefinedMethod(method: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somOverrideMtab;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMMBeforeAfter.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMMBeforeAfter.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMMBeforeAfter.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMMBeforeAfter.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somInit;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somFree;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somUninit;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMMBeforeAfter.somGetSize: LongInt;
begin
  { ... }
end;

function SOMMBeforeAfter.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMMBeforeAfter.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMClassMgr._get_somInterfaceRepository: Repository;
begin
  { ... }
end;

procedure SOMClassMgr._set_somInterfaceRepository(somInterfaceRepository: Repository);
begin
  { ... }
end;

function SOMClassMgr._get_somRegisteredClasses: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

function SOMClassMgr.somLoadClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; SOM_file: CORBAString): SOMClass;
begin
  { ... }
end;

function SOMClassMgr.somLocateClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt): CORBAString;
begin
  { ... }
end;

procedure SOMClassMgr.somRegisterClass(classObj: SOMClass);
begin
  { ... }
end;

procedure SOMClassMgr.somRegisterClassLibrary(libraryName: CORBAString; libraryInitRtn: Pointer);
begin
  { ... }
end;

procedure SOMClassMgr.somUnregisterClassLibrary(libraryName: CORBAString);
begin
  { ... }
end;

function SOMClassMgr.somUnloadClassFile(classObj: SOMClass): LongInt;
begin
  { ... }
end;

function SOMClassMgr.somUnregisterClass(classObj: SOMClass): LongInt;
begin
  { ... }
end;

procedure SOMClassMgr.somBeginPersistentClasses;
begin
  { ... }
end;

procedure SOMClassMgr.somEndPersistentClasses;
begin
  { ... }
end;

function SOMClassMgr.somJoinAffinityGroup(newClass: SOMClass; affClass: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMClassMgr.somGetInitFunction: CORBAString;
begin
  { ... }
end;

function SOMClassMgr.somGetRelatedClasses(classObj: SOMClass): PSOMClass;
begin
  { ... }
end;

function SOMClassMgr.somClassFromId(classId: somId): SOMClass;
begin
  { ... }
end;

function SOMClassMgr.somFindClass(classId: somId; majorVersion: LongInt; minorVersion: LongInt): SOMClass;
begin
  { ... }
end;

function SOMClassMgr.somFindClsInFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; SOM_file: CORBAString): SOMClass;
begin
  { ... }
end;

procedure SOMClassMgr.somMergeInto(targetObj: SOMObject);
begin
  { ... }
end;

function SOMClassMgr.somSubstituteClass(origClassName: CORBAString; newClassName: CORBAString): LongInt;
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMClassMgr.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMClassMgr.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMClassMgr.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMClassMgr.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMClassMgr.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMClassMgr.somInit;
begin
  { ... }
end;

procedure SOMClassMgr.somFree;
begin
  { ... }
end;

procedure SOMClassMgr.somUninit;
begin
  { ... }
end;

function SOMClassMgr.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMClassMgr.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMClassMgr.somGetSize: LongInt;
begin
  { ... }
end;

function SOMClassMgr.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMClassMgr.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMClassMgr.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMClassMgr.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMClassMgr.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMClassMgr.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMClassMgr.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMClassMgr.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMClassMgr.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMClassMgr.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMDObject.get_implementation: ImplementationDef;
begin
  { ... }
end;

function SOMDObject.get_interface: InterfaceDef;
begin
  { ... }
end;

function SOMDObject.is_nil: CORBABoolean;
begin
  { ... }
end;

function SOMDObject.is_SOM_ref: CORBABoolean;
begin
  { ... }
end;

function SOMDObject.is_constant: CORBABoolean;
begin
  { ... }
end;

function SOMDObject.is_proxy: CORBABoolean;
begin
  { ... }
end;

function SOMDObject.duplicate: SOMDObject;
begin
  { ... }
end;

procedure SOMDObject.release;
begin
  { ... }
end;

function SOMDObject.create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var SOM_result: NamedValue; out request: Request; req_flags: LongWord): LongWord;
begin
  { ... }
end;

function SOMDObject.create_request_args(operation: CORBAString; out arg_list: NVList; out SOM_result: NamedValue): LongWord;
begin
  { ... }
end;

procedure SOMDObject.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDObject.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDObject.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDObject.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDObject.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDObject.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDObject.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDObject.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDObject.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDObject.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDObject.somInit;
begin
  { ... }
end;

procedure SOMDObject.somFree;
begin
  { ... }
end;

procedure SOMDObject.somUninit;
begin
  { ... }
end;

function SOMDObject.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMDObject.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMDObject.somGetSize: LongInt;
begin
  { ... }
end;

function SOMDObject.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDObject.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDObject.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMDObject.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDObject.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDObject.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDObject.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMDObject.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMDObject.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMDObject.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


procedure SOMDClientProxy.somdTargetFree;
begin
  { ... }
end;

function SOMDClientProxy.somdTargetGetClass: SOMClass;
begin
  { ... }
end;

function SOMDClientProxy.somdTargetGetClassName: CORBAString;
begin
  { ... }
end;

procedure SOMDClientProxy.somdProxyFree;
begin
  { ... }
end;

function SOMDClientProxy.somdProxyGetClass: SOMClass;
begin
  { ... }
end;

function SOMDClientProxy.somdProxyGetClassName: CORBAString;
begin
  { ... }
end;

procedure SOMDClientProxy.somdReleaseResources;
begin
  { ... }
end;

function SOMDClientProxy.get_implementation: ImplementationDef;
begin
  { ... }
end;

function SOMDClientProxy.get_interface: InterfaceDef;
begin
  { ... }
end;

function SOMDClientProxy.is_nil: CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.is_SOM_ref: CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.is_constant: CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.is_proxy: CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.duplicate: SOMDObject;
begin
  { ... }
end;

procedure SOMDClientProxy.release;
begin
  { ... }
end;

function SOMDClientProxy.create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var SOM_result: NamedValue; out request: Request; req_flags: LongWord): LongWord;
begin
  { ... }
end;

function SOMDClientProxy.create_request_args(operation: CORBAString; out arg_list: NVList; out SOM_result: NamedValue): LongWord;
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDClientProxy.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDClientProxy.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDClientProxy.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDClientProxy.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDClientProxy.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDClientProxy.somInit;
begin
  { ... }
end;

procedure SOMDClientProxy.somFree;
begin
  { ... }
end;

procedure SOMDClientProxy.somUninit;
begin
  { ... }
end;

function SOMDClientProxy.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMDClientProxy.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMDClientProxy.somGetSize: LongInt;
begin
  { ... }
end;

function SOMDClientProxy.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMDClientProxy.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMDClientProxy.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMDClientProxy.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMDMetaproxy._get_somDataAlignment: LongInt;
begin
  { ... }
end;

function SOMDMetaproxy._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
begin
  { ... }
end;

function SOMDMetaproxy._get_somDirectInitClasses: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

procedure SOMDMetaproxy._set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
begin
  { ... }
end;

function SOMDMetaproxy._get_somClassAllocate: PPointer;
begin
  { ... }
end;

function SOMDMetaproxy._get_somClassDeallocate: PPointer;
begin
  { ... }
end;

function SOMDMetaproxy.somNew: SOMObject;
begin
  { ... }
end;

function SOMDMetaproxy.somNewNoInit: SOMObject;
begin
  { ... }
end;

function SOMDMetaproxy.somRenew(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMDMetaproxy.somRenewNoInit(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMDMetaproxy.somRenewNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMDMetaproxy.somRenewNoInitNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMDMetaproxy.somAllocate(size: LongInt): CORBAString;
begin
  { ... }
end;

procedure SOMDMetaproxy.somDeallocate(memptr: CORBAString);
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceInitMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

procedure SOMDMetaproxy.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

procedure SOMDMetaproxy.somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

function SOMDMetaproxy.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMDMetaproxy.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
begin
  { ... }
end;

procedure SOMDMetaproxy.somOverrideSMethod(methodId: somId; method: Pointer);
begin
  { ... }
end;

procedure SOMDMetaproxy.somClassReady;
begin
  { ... }
end;

function SOMDMetaproxy.somGetClassData: PsomClassDataStructure;
begin
  { ... }
end;

procedure SOMDMetaproxy.somSetClassData(cds: somClassDataStructure);
begin
  { ... }
end;

function SOMDMetaproxy.somGetClassMtab: PsomMethodTab;
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceOffset: LongInt;
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstancePartSize: LongInt;
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceSize: LongInt;
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceToken: Pointer;
begin
  { ... }
end;

function SOMDMetaproxy.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
begin
  { ... }
end;

function SOMDMetaproxy.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somGetRdStub(methodId: somId): PPointer;
begin
  { ... }
end;

function SOMDMetaproxy.somGetMethodDescriptor(methodId: somId): somId;
begin
  { ... }
end;

function SOMDMetaproxy.somGetMethodIndex(id: somId): LongInt;
begin
  { ... }
end;

function SOMDMetaproxy.somGetMethodToken(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMDMetaproxy.somGetName: CORBAString;
begin
  { ... }
end;

function SOMDMetaproxy.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
begin
  { ... }
end;

function SOMDMetaproxy.somGetNumMethods: LongInt;
begin
  { ... }
end;

function SOMDMetaproxy.somGetNumStaticMethods: LongInt;
begin
  { ... }
end;

function SOMDMetaproxy.somGetParent: SOMClass;
begin
  { ... }
end;

function SOMDMetaproxy.somGetParents: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

function SOMDMetaproxy.somGetPClsMtab: PsomMethodTabList;
begin
  { ... }
end;

function SOMDMetaproxy.somGetPClsMtabs: PsomMethodTabList;
begin
  { ... }
end;

procedure SOMDMetaproxy.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
begin
  { ... }
end;

function SOMDMetaproxy.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somFindSMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMDMetaproxy.somFindSMethodOk(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMDMetaproxy.somLookupMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMDMetaproxy.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somSupportsMethod(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somDefinedMethod(method: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMDMetaproxy.somOverrideMtab;
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDMetaproxy.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDMetaproxy.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDMetaproxy.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDMetaproxy.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDMetaproxy.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDMetaproxy.somInit;
begin
  { ... }
end;

procedure SOMDMetaproxy.somFree;
begin
  { ... }
end;

procedure SOMDMetaproxy.somUninit;
begin
  { ... }
end;

function SOMDMetaproxy.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMDMetaproxy.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMDMetaproxy.somGetSize: LongInt;
begin
  { ... }
end;

function SOMDMetaproxy.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMDMetaproxy.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMDMetaproxy.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMDMetaproxy.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMDObjectMgr._get_somd21somFree: CORBABoolean;
begin
  { ... }
end;

procedure SOMDObjectMgr._set_somd21somFree(somd21somFree: CORBABoolean);
begin
  { ... }
end;

function SOMDObjectMgr.somdFindServer(serverid: CORBAString): SOMDServer;
begin
  { ... }
end;

function SOMDObjectMgr.somdFindServerByName(servername: CORBAString): SOMDServer;
begin
  { ... }
end;

function SOMDObjectMgr.somdFindServersByClass(objclass: CORBAString): _IDL_Sequence_SOMDServer;
begin
  { ... }
end;

function SOMDObjectMgr.somdFindAnyServerByClass(objclass: CORBAString): SOMDServer;
begin
  { ... }
end;

function SOMDObjectMgr.somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject;
begin
  { ... }
end;

function SOMDObjectMgr.somdGetIdFromObject(obj: SOMObject): CORBAString;
begin
  { ... }
end;

function SOMDObjectMgr.somdGetObjectFromId(id: CORBAString): SOMObject;
begin
  { ... }
end;

procedure SOMDObjectMgr.somdReleaseObject(obj: SOMObject);
begin
  { ... }
end;

procedure SOMDObjectMgr.somdDestroyObject(obj: SOMObject);
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDObjectMgr.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDObjectMgr.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDObjectMgr.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDObjectMgr.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDObjectMgr.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDObjectMgr.somInit;
begin
  { ... }
end;

procedure SOMDObjectMgr.somFree;
begin
  { ... }
end;

procedure SOMDObjectMgr.somUninit;
begin
  { ... }
end;

function SOMDObjectMgr.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMDObjectMgr.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMDObjectMgr.somGetSize: LongInt;
begin
  { ... }
end;

function SOMDObjectMgr.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDObjectMgr.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDObjectMgr.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMDObjectMgr.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDObjectMgr.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDObjectMgr.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDObjectMgr.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMDObjectMgr.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMDObjectMgr.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMDObjectMgr.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMDServer.somdRefFromSOMObj(somobj: SOMObject): SOMDObject;
begin
  { ... }
end;

function SOMDServer.somdSOMObjFromRef(objref: SOMDObject): SOMObject;
begin
  { ... }
end;

procedure SOMDServer.somdDispatchMethod(somobj: SOMObject; out retValue: Pointer; methodId: somId; ap: va_list);
begin
  { ... }
end;

function SOMDServer.somdCreateObj(objclass: CORBAString; hints: CORBAString): SOMObject;
begin
  { ... }
end;

procedure SOMDServer.somdDeleteObj(somobj: SOMObject);
begin
  { ... }
end;

function SOMDServer.somdGetClassObj(objclass: CORBAString): SOMClass;
begin
  { ... }
end;

function SOMDServer.somdObjReferencesCached: CORBABoolean;
begin
  { ... }
end;

procedure SOMDServer.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDServer.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMDServer.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDServer.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDServer.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDServer.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMDServer.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMDServer.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDServer.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMDServer.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMDServer.somInit;
begin
  { ... }
end;

procedure SOMDServer.somFree;
begin
  { ... }
end;

procedure SOMDServer.somUninit;
begin
  { ... }
end;

function SOMDServer.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMDServer.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMDServer.somGetSize: LongInt;
begin
  { ... }
end;

function SOMDServer.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDServer.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDServer.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMDServer.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDServer.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMDServer.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMDServer.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMDServer.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMDServer.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMDServer.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


procedure SOMUTId.somutSetIdId(otherId: SOMUTId);
begin
  { ... }
end;

function SOMUTId.somutEqualsId(otherId: SOMUTId): CORBABoolean;
begin
  { ... }
end;

function SOMUTId.somutCompareId(otherId: SOMUTId): SmallInt;
begin
  { ... }
end;

function SOMUTId.somutHashId: LongWord;
begin
  { ... }
end;

procedure SOMUTId.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMUTId.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMUTId.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMUTId.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMUTId.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMUTId.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMUTId.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMUTId.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMUTId.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMUTId.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMUTId.somInit;
begin
  { ... }
end;

procedure SOMUTId.somFree;
begin
  { ... }
end;

procedure SOMUTId.somUninit;
begin
  { ... }
end;

function SOMUTId.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMUTId.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMUTId.somGetSize: LongInt;
begin
  { ... }
end;

function SOMUTId.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMUTId.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMUTId.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMUTId.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMUTId.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMUTId.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMUTId.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMUTId.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMUTId.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMUTId.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMOA.execute_next_request(waitFlag: LongWord): LongWord;
begin
  { ... }
end;

function SOMOA.execute_request_loop(waitFlag: LongWord): LongWord;
begin
  { ... }
end;

procedure SOMOA.change_id(objref: SOMDObject; id: _IDL_Sequence_Byte);
begin
  { ... }
end;

function SOMOA.create_constant(id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject;
begin
  { ... }
end;

function SOMOA.create_SOM_ref(somobj: SOMObject; impl: ImplementationDef): SOMDObject;
begin
  { ... }
end;

function SOMOA.get_SOM_object(somref: SOMDObject): SOMObject;
begin
  { ... }
end;

procedure SOMOA.activate_impl_failed(impl: ImplementationDef; rc: LongWord);
begin
  { ... }
end;

procedure SOMOA.interrupt_server;
begin
  { ... }
end;

function SOMOA.create(id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject;
begin
  { ... }
end;

procedure SOMOA.dispose(obj: SOMDObject);
begin
  { ... }
end;

function SOMOA.get_id(obj: SOMDObject): _IDL_Sequence_Byte;
begin
  { ... }
end;

function SOMOA.get_principal(obj: SOMDObject; req_ev: Environment): Principal;
begin
  { ... }
end;

procedure SOMOA.set_exception(major: exception_type; userid: CORBAString; param: Pointer);
begin
  { ... }
end;

procedure SOMOA.impl_is_ready(impl: ImplementationDef);
begin
  { ... }
end;

procedure SOMOA.deactivate_impl(impl: ImplementationDef);
begin
  { ... }
end;

procedure SOMOA.change_implementation(obj: SOMDObject; impl: ImplementationDef);
begin
  { ... }
end;

procedure SOMOA.obj_is_ready(obj: SOMDObject; impl: ImplementationDef);
begin
  { ... }
end;

procedure SOMOA.deactivate_obj(obj: SOMDObject);
begin
  { ... }
end;

procedure SOMOA.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMOA.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMOA.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMOA.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMOA.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMOA.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMOA.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMOA.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMOA.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMOA.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMOA.somInit;
begin
  { ... }
end;

procedure SOMOA.somFree;
begin
  { ... }
end;

procedure SOMOA.somUninit;
begin
  { ... }
end;

function SOMOA.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMOA.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMOA.somGetSize: LongInt;
begin
  { ... }
end;

function SOMOA.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMOA.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMOA.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMOA.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMOA.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMOA.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMOA.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMOA.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMOA.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMOA.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function Sockets._get_serrno: LongInt;
begin
  { ... }
end;

procedure Sockets._set_serrno(serrno: LongInt);
begin
  { ... }
end;

function Sockets.somsAccept(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsBind(s: LongInt; var name{: opaque Sockets_sockaddr}; namelen: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsConnect(s: LongInt; var name{: opaque Sockets_sockaddr}; namelen: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsGethostbyaddr(addr: PShortInt; addrlen: LongInt; domain: LongInt): PSockets_hostent;
begin
  { ... }
end;

function Sockets.somsGethostbyname(name: CORBAString): PSockets_hostent;
begin
  { ... }
end;

function Sockets.somsGethostent: PSockets_hostent;
begin
  { ... }
end;

function Sockets.somsGethostid: LongWord;
begin
  { ... }
end;

function Sockets.somsGethostname(name: CORBAString; namelength: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsGetpeername(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsGetservbyname(name: CORBAString; protocol: CORBAString): PSockets_servent;
begin
  { ... }
end;

function Sockets.somsGetsockname(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsGetsockopt(s: LongInt; level: LongInt; optname: LongInt; optval: PShortInt; out option: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsHtonl(a: LongWord): LongWord;
begin
  { ... }
end;

function Sockets.somsHtons(a: Word): Word;
begin
  { ... }
end;

function Sockets.somsIoctl(s: LongInt; cmd: LongInt; data: PShortInt; length: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsInet_addr(cp: CORBAString): LongWord;
begin
  { ... }
end;

function Sockets.somsInet_lnaof(addr: Sockets_in_addr): LongWord;
begin
  { ... }
end;

function Sockets.somsInet_makeaddr(net: LongWord; lna: LongWord): Sockets_in_addr;
begin
  { ... }
end;

function Sockets.somsInet_netof(addr: Sockets_in_addr): LongWord;
begin
  { ... }
end;

function Sockets.somsInet_network(cp: CORBAString): LongWord;
begin
  { ... }
end;

function Sockets.somsInet_ntoa(addr: Sockets_in_addr): CORBAString;
begin
  { ... }
end;

function Sockets.somsListen(s: LongInt; backlog: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsNtohl(a: LongWord): LongWord;
begin
  { ... }
end;

function Sockets.somsNtohs(a: Word): Word;
begin
  { ... }
end;

function Sockets.somsReadv(s: LongInt; var iov{: opaque Sockets_iovec}; iovcnt: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsRecv(s: LongInt; buf: PShortInt; len: LongInt; flags: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsRecvfrom(s: LongInt; buf: PShortInt; len: LongInt; flags: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsRecvmsg(s: LongInt; var msg{: opaque Sockets_msghdr}; flags: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsSelect(nfds: LongInt; var readfds{: opaque Sockets_fd_set}; var writefds{: opaque Sockets_fd_set}; var exceptfds{: opaque Sockets_fd_set}; var timeout{: opaque Sockets_timeval}): LongInt;
begin
  { ... }
end;

function Sockets.somsSend(s: LongInt; msg: PShortInt; len: LongInt; flags: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsSendmsg(s: LongInt; var msg{: opaque Sockets_msghdr}; flags: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsSendto(s: LongInt; var msg: ShortInt; len: LongInt; flags: LongInt; var SOM_to{: opaque Sockets_sockaddr}; tolen: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsSetsockopt(s: LongInt; level: LongInt; optname: LongInt; optval: PShortInt; optlen: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsShutdown(s: LongInt; how: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsSocket(domain: LongInt; SOM_type: LongInt; protocol: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsSoclose(s: LongInt): LongInt;
begin
  { ... }
end;

function Sockets.somsWritev(s: LongInt; var iov{: opaque Sockets_iovec}; iovcnt: LongInt): LongInt;
begin
  { ... }
end;

procedure Sockets.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure Sockets.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure Sockets.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Sockets.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Sockets.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Sockets.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure Sockets.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function Sockets.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Sockets.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function Sockets.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure Sockets.somInit;
begin
  { ... }
end;

procedure Sockets.somFree;
begin
  { ... }
end;

procedure Sockets.somUninit;
begin
  { ... }
end;

function Sockets.somGetClass: SOMClass;
begin
  { ... }
end;

function Sockets.somGetClassName: CORBAString;
begin
  { ... }
end;

function Sockets.somGetSize: LongInt;
begin
  { ... }
end;

function Sockets.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Sockets.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Sockets.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function Sockets.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Sockets.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function Sockets.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function Sockets.somResetObj: CORBABoolean;
begin
  { ... }
end;

function Sockets.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure Sockets.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure Sockets.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMStringTableC._get_somstTargetCapacity: LongWord;
begin
  { ... }
end;

procedure SOMStringTableC._set_somstTargetCapacity(somstTargetCapacity: LongWord);
begin
  { ... }
end;

function SOMStringTableC._get_somstAssociationsCount: LongWord;
begin
  { ... }
end;

function SOMStringTableC.somstAssociate(key: CORBAString; value: CORBAString): SmallInt;
begin
  { ... }
end;

function SOMStringTableC.somstAssociateCopyKey(key: CORBAString; value: CORBAString): SmallInt;
begin
  { ... }
end;

function SOMStringTableC.somstAssociateCopyValue(key: CORBAString; value: CORBAString): SmallInt;
begin
  { ... }
end;

function SOMStringTableC.somstAssociateCopyBoth(key: CORBAString; value: CORBAString): SmallInt;
begin
  { ... }
end;

function SOMStringTableC.somstGetAssociation(key: CORBAString): CORBAString;
begin
  { ... }
end;

function SOMStringTableC.somstClearAssociation(key: CORBAString): CORBABoolean;
begin
  { ... }
end;

function SOMStringTableC.somstGetIthKey(i: LongWord): CORBAString;
begin
  { ... }
end;

function SOMStringTableC.somstGetIthValue(i: LongWord): CORBAString;
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMStringTableC.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMStringTableC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMStringTableC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMStringTableC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMStringTableC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMStringTableC.somInit;
begin
  { ... }
end;

procedure SOMStringTableC.somFree;
begin
  { ... }
end;

procedure SOMStringTableC.somUninit;
begin
  { ... }
end;

function SOMStringTableC.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMStringTableC.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMStringTableC.somGetSize: LongInt;
begin
  { ... }
end;

function SOMStringTableC.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMStringTableC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMStringTableC.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMStringTableC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMStringTableC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMStringTableC.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMStringTableC.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMStringTableC.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMStringTableC.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMStringTableC.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMMTraced._get_sommTraceIsOn: CORBABoolean;
begin
  { ... }
end;

procedure SOMMTraced._set_sommTraceIsOn(sommTraceIsOn: CORBABoolean);
begin
  { ... }
end;

function SOMMTraced._get_somDataAlignment: LongInt;
begin
  { ... }
end;

function SOMMTraced._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo;
begin
  { ... }
end;

function SOMMTraced._get_somDirectInitClasses: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

procedure SOMMTraced._set_somDirectInitClasses(somDirectInitClasses: _IDL_Sequence_SOMClass);
begin
  { ... }
end;

function SOMMTraced._get_somClassAllocate: PPointer;
begin
  { ... }
end;

function SOMMTraced._get_somClassDeallocate: PPointer;
begin
  { ... }
end;

function SOMMTraced.sommBeforeMethod(SOM_object: SOMObject; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

procedure SOMMTraced.sommAfterMethod(SOM_object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list);
begin
  { ... }
end;

function SOMMTraced.somNew: SOMObject;
begin
  { ... }
end;

function SOMMTraced.somNewNoInit: SOMObject;
begin
  { ... }
end;

function SOMMTraced.somRenew(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMTraced.somRenewNoInit(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMTraced.somRenewNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMTraced.somRenewNoInitNoZero(obj: Pointer): SOMObject;
begin
  { ... }
end;

function SOMMTraced.somAllocate(size: LongInt): CORBAString;
begin
  { ... }
end;

procedure SOMMTraced.somDeallocate(memptr: CORBAString);
begin
  { ... }
end;

function SOMMTraced.somGetInstanceInitMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMMTraced.somGetInstanceDestructionMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

function SOMMTraced.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte;
begin
  { ... }
end;

procedure SOMMTraced.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

procedure SOMMTraced.somInitMIClass(inherit_vars: LongInt; className: CORBAString; parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt);
begin
  { ... }
end;

function SOMMTraced.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMMTraced.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer);
begin
  { ... }
end;

procedure SOMMTraced.somOverrideSMethod(methodId: somId; method: Pointer);
begin
  { ... }
end;

procedure SOMMTraced.somClassReady;
begin
  { ... }
end;

function SOMMTraced.somGetClassData: PsomClassDataStructure;
begin
  { ... }
end;

procedure SOMMTraced.somSetClassData(cds: somClassDataStructure);
begin
  { ... }
end;

function SOMMTraced.somGetClassMtab: PsomMethodTab;
begin
  { ... }
end;

function SOMMTraced.somGetInstanceOffset: LongInt;
begin
  { ... }
end;

function SOMMTraced.somGetInstancePartSize: LongInt;
begin
  { ... }
end;

function SOMMTraced.somGetInstanceSize: LongInt;
begin
  { ... }
end;

function SOMMTraced.somGetInstanceToken: Pointer;
begin
  { ... }
end;

function SOMMTraced.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer;
begin
  { ... }
end;

function SOMMTraced.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somGetRdStub(methodId: somId): PPointer;
begin
  { ... }
end;

function SOMMTraced.somGetMethodDescriptor(methodId: somId): somId;
begin
  { ... }
end;

function SOMMTraced.somGetMethodIndex(id: somId): LongInt;
begin
  { ... }
end;

function SOMMTraced.somGetMethodToken(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMTraced.somGetName: CORBAString;
begin
  { ... }
end;

function SOMMTraced.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId;
begin
  { ... }
end;

function SOMMTraced.somGetNumMethods: LongInt;
begin
  { ... }
end;

function SOMMTraced.somGetNumStaticMethods: LongInt;
begin
  { ... }
end;

function SOMMTraced.somGetParent: SOMClass;
begin
  { ... }
end;

function SOMMTraced.somGetParents: _IDL_Sequence_SOMClass;
begin
  { ... }
end;

function SOMMTraced.somGetPClsMtab: PsomMethodTabList;
begin
  { ... }
end;

function SOMMTraced.somGetPClsMtabs: PsomMethodTabList;
begin
  { ... }
end;

procedure SOMMTraced.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt);
begin
  { ... }
end;

function SOMMTraced.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somFindSMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMTraced.somFindSMethodOk(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMTraced.somLookupMethod(methodId: somId): Pointer;
begin
  { ... }
end;

function SOMMTraced.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somDescendedFrom(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somSupportsMethod(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somDefinedMethod(method: Pointer): Pointer;
begin
  { ... }
end;

procedure SOMMTraced.somOverrideMtab;
begin
  { ... }
end;

procedure SOMMTraced.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMMTraced.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMMTraced.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMMTraced.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMMTraced.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMMTraced.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMMTraced.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMMTraced.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMMTraced.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMMTraced.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMMTraced.somInit;
begin
  { ... }
end;

procedure SOMMTraced.somFree;
begin
  { ... }
end;

procedure SOMMTraced.somUninit;
begin
  { ... }
end;

function SOMMTraced.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMMTraced.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMMTraced.somGetSize: LongInt;
begin
  { ... }
end;

function SOMMTraced.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMMTraced.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMMTraced.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMMTraced.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMETimerEvent.somevGetEventInterval: LongInt;
begin
  { ... }
end;

procedure SOMETimerEvent.somevSetEventInterval(interval: LongInt);
begin
  { ... }
end;

function SOMETimerEvent.somevGetEventTime: LongWord;
begin
  { ... }
end;

function SOMETimerEvent.somevGetEventType: LongWord;
begin
  { ... }
end;

procedure SOMETimerEvent.somevSetEventTime(time: LongWord);
begin
  { ... }
end;

procedure SOMETimerEvent.somevSetEventType(SOM_type: LongWord);
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMETimerEvent.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMETimerEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMETimerEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMETimerEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMETimerEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMETimerEvent.somInit;
begin
  { ... }
end;

procedure SOMETimerEvent.somFree;
begin
  { ... }
end;

procedure SOMETimerEvent.somUninit;
begin
  { ... }
end;

function SOMETimerEvent.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMETimerEvent.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMETimerEvent.somGetSize: LongInt;
begin
  { ... }
end;

function SOMETimerEvent.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMETimerEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMETimerEvent.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMETimerEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMETimerEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMETimerEvent.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMETimerEvent.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMETimerEvent.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMETimerEvent.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMETimerEvent.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function TSIdentification._get_sender: TSPortability_Sender;
begin
  { ... }
end;

function TSIdentification._get_receiver: TSPortability_Receiver;
begin
  { ... }
end;

procedure TSIdentification.identify_sender(sender: TSPortability_Sender);
begin
  { ... }
end;

procedure TSIdentification.identify_receiver(receiver: TSPortability_Receiver);
begin
  { ... }
end;

procedure TSIdentification.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure TSIdentification.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure TSIdentification.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function TSIdentification.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure TSIdentification.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure TSIdentification.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure TSIdentification.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function TSIdentification.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function TSIdentification.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function TSIdentification.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure TSIdentification.somInit;
begin
  { ... }
end;

procedure TSIdentification.somFree;
begin
  { ... }
end;

procedure TSIdentification.somUninit;
begin
  { ... }
end;

function TSIdentification.somGetClass: SOMClass;
begin
  { ... }
end;

function TSIdentification.somGetClassName: CORBAString;
begin
  { ... }
end;

function TSIdentification.somGetSize: LongInt;
begin
  { ... }
end;

function TSIdentification.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function TSIdentification.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function TSIdentification.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function TSIdentification.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function TSIdentification.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function TSIdentification.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function TSIdentification.somResetObj: CORBABoolean;
begin
  { ... }
end;

function TSIdentification.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure TSIdentification.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure TSIdentification.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function TypeDef._get_type: TypeCode;
begin
  { ... }
end;

procedure TypeDef._set_type(SOM_type: TypeCode);
begin
  { ... }
end;

function TypeDef._get_name: CORBAString;
begin
  { ... }
end;

procedure TypeDef._set_name(name: CORBAString);
begin
  { ... }
end;

function TypeDef._get_id: CORBAString;
begin
  { ... }
end;

procedure TypeDef._set_id(id: CORBAString);
begin
  { ... }
end;

function TypeDef._get_defined_in: CORBAString;
begin
  { ... }
end;

procedure TypeDef._set_defined_in(defined_in: CORBAString);
begin
  { ... }
end;

function TypeDef._get_somModifiers: _IDL_Sequence_somModifier;
begin
  { ... }
end;

procedure TypeDef._set_somModifiers(somModifiers: _IDL_Sequence_somModifier);
begin
  { ... }
end;

function TypeDef.within: _IDL_Sequence_Container;
begin
  { ... }
end;

function TypeDef.describe: Contained_Description;
begin
  { ... }
end;

procedure TypeDef.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure TypeDef.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure TypeDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function TypeDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure TypeDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure TypeDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure TypeDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function TypeDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function TypeDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function TypeDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure TypeDef.somInit;
begin
  { ... }
end;

procedure TypeDef.somFree;
begin
  { ... }
end;

procedure TypeDef.somUninit;
begin
  { ... }
end;

function TypeDef.somGetClass: SOMClass;
begin
  { ... }
end;

function TypeDef.somGetClassName: CORBAString;
begin
  { ... }
end;

function TypeDef.somGetSize: LongInt;
begin
  { ... }
end;

function TypeDef.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function TypeDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function TypeDef.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function TypeDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function TypeDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function TypeDef.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function TypeDef.somResetObj: CORBABoolean;
begin
  { ... }
end;

function TypeDef.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure TypeDef.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure TypeDef.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;


function SOMEWorkProcEvent.somevGetEventTime: LongWord;
begin
  { ... }
end;

function SOMEWorkProcEvent.somevGetEventType: LongWord;
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somevSetEventTime(time: LongWord);
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somevSetEventType(SOM_type: LongWord);
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultInit(var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDestruct(doFree: Byte; var ctrl: Pointer);
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEWorkProcEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject);
begin
  { ... }
end;

function SOMEWorkProcEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEWorkProcEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

function SOMEWorkProcEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject;
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somInit;
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somFree;
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somUninit;
begin
  { ... }
end;

function SOMEWorkProcEvent.somGetClass: SOMClass;
begin
  { ... }
end;

function SOMEWorkProcEvent.somGetClassName: CORBAString;
begin
  { ... }
end;

function SOMEWorkProcEvent.somGetSize: LongInt;
begin
  { ... }
end;

function SOMEWorkProcEvent.somIsA(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEWorkProcEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEWorkProcEvent.somRespondsTo(mId: somId): CORBABoolean;
begin
  { ... }
end;

function SOMEWorkProcEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEWorkProcEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean;
begin
  { ... }
end;

function SOMEWorkProcEvent.somCastObj(cls: SOMClass): CORBABoolean;
begin
  { ... }
end;

function SOMEWorkProcEvent.somResetObj: CORBABoolean;
begin
  { ... }
end;

function SOMEWorkProcEvent.somPrintSelf: SOMObject;
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDumpSelf(level: LongInt);
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDumpSelfInt(level: LongInt);
begin
  { ... }
end;

end.
