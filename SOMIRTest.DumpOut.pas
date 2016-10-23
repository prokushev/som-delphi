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
  TypeCode = Pointer;
  any = record
    _type: TypeCode;
    _value: Pointer;
  end;
  TAnyResult = type Int64; { returned in edx:eax by vanilla IBM SOM, but passed via hidden pointer by Delphi when record }

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
    function As_SOMObject: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMObject = class(SOMObjectBase)
  public
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  AttributeDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_mode: AttributeDef_AttributeMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_mode(mode: AttributeDef_AttributeMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property SOM_type: TypeCode read _get_type write _set_type;
    property mode: AttributeDef_AttributeMode read _get_mode write _set_mode;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  BOA = class(SOMObjectBase)
  public
    function create(const id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure dispose(obj: SOMDObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_id(obj: SOMDObject): _IDL_Sequence_Byte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_principal(obj: SOMDObject; const req_ev: Environment): Principal; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure set_exception(major: exception_type; userid: CORBAString; param: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure impl_is_ready(impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure deactivate_impl(impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure change_implementation(obj: SOMDObject; impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure obj_is_ready(obj: SOMDObject; impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure deactivate_obj(obj: SOMDObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMEEvent = class(SOMObjectBase)
  public
    function somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMEClientEvent = class(SOMObjectBase)
  public
    function somevGetEventClientData: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventClientType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventClientData(clientData: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventClientType(clientType: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  Context = class(SOMObjectBase)
  public
    function set_one_value(prop_name: CORBAString; value: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function set_values(values: NVList): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_values(start_scope: CORBAString; op_flags: LongWord; prop_name: CORBAString; out values: NVList): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function delete_values(prop_name: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_child(ctx_name: CORBAString; out child_ctx: Context): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function destroy(flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  ConstantDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_value: any; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_value(const value: any); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMEEMan = class(SOMObjectBase)
  public
    procedure someGetEManSem; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someReleaseEManSem; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someChangeRegData(registrationId: LongInt; registerData: SOMEEMRegisterData); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someProcessEvent(mask: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someProcessEvents; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someQueueEvent(event: SOMEClientEvent); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function someRegister(registerData: SOMEEMRegisterData; targetObject: SOMObject; targetMethod: CORBAString; targetData: Pointer): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function someRegisterEv(registerData: SOMEEMRegisterData; targetObject: SOMObject; var callbackEv: Environment; targetMethod: CORBAString; targetData: Pointer): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function someRegisterProc(registerData: SOMEEMRegisterData; targetProcedure: PPointer; targetData: Pointer): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someShutdown; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someUnRegister(registrationId: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMEEMRegisterData = class(SOMObjectBase)
  public
    procedure someClearRegData; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someSetRegDataClientType(clientType: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someSetRegDataEventMask(eventType: LongInt; ap: va_list); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someSetRegDataSink(sink: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someSetRegDataSinkMask(sinkMask: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someSetRegDataTimerCount(count: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure someSetRegDataTimerInterval(interval: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  ExceptionDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property SOM_type: TypeCode read _get_type write _set_type;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  ImplementationDef = class(SOMObjectBase)
  private
    function _get_impl_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_impl_id(impl_id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_impl_alias: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_impl_alias(impl_alias: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_impl_program: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_impl_program(impl_program: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_impl_flags: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_impl_flags(impl_flags: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_impl_server_class: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_impl_server_class(impl_server_class: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_impl_refdata_file: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_impl_refdata_file(impl_refdata_file: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_impl_refdata_bkup: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_impl_refdata_bkup(impl_refdata_bkup: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_impl_hostname: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_impl_hostname(impl_hostname: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function find_impldef(implid: CORBAString): ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function find_impldef_by_alias(alias_name: CORBAString): ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function find_all_impldefs(out outimpldefs: _IDL_Sequence_ImplementationDef): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function find_impldef_by_class(classname: CORBAString): _IDL_Sequence_ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure add_impldef(impldef: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure update_impldef(impldef: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure delete_impldef(implid: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure add_class_to_impldef(implid: CORBAString; classname: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure remove_class_from_impldef(implid: CORBAString; classname: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure remove_class_from_all(classname: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function find_classes_by_impldef(implid: CORBAString): _IDL_Sequence_CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  InterfaceDef = class(SOMObjectBase)
  private
    function _get_base_interfaces: _IDL_Sequence_CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_base_interfaces(const base_interfaces: _IDL_Sequence_CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_instanceData: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_instanceData(instanceData: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function describe_interface: InterfaceDef_FullInterfaceDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property base_interfaces: _IDL_Sequence_CORBAString read _get_base_interfaces write _set_base_interfaces;
    property instanceData: TypeCode read _get_instanceData write _set_instanceData;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  ModuleDef = class(SOMObjectBase)
  private
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  NVList = class(SOMObjectBase)
  public
    function add_item(item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function free: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function free_memory: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_count(out count: LongInt): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function set_item(item_number: LongInt; item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_item(item_number: LongInt; out item_name: CORBAString; out item_type: TypeCode; out value: Pointer; out value_len: LongInt; out item_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  ObjectMgr = class(SOMObjectBase)
  public
    function somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdGetIdFromObject(obj: SOMObject): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdGetObjectFromId(id: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somdReleaseObject(obj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somdDestroyObject(obj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  OperationDef = class(SOMObjectBase)
  private
    function _get_result: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_result(SOM_result: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_mode: OperationDef_OperationMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_mode(mode: OperationDef_OperationMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_contexts: _IDL_Sequence_CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_contexts(const contexts: _IDL_Sequence_CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function object_to_string(obj: SOMDObject): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function string_to_object(str: CORBAString): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_list(count: LongInt; out new_list: NVList): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_operation_list(oper: OperationDef; out new_list: NVList): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_default_context(out ctx: Context): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  ParameterDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_mode: ParameterDef_ParameterMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_mode(mode: ParameterDef_ParameterMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property SOM_type: TypeCode read _get_type write _set_type;
    property mode: ParameterDef_ParameterMode read _get_mode write _set_mode;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  Principal = class(SOMObjectBase)
  private
    function _get_userName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_userName(userName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_hostName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_hostName(hostName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property userName: CORBAString read _get_userName write _set_userName;
    property hostName: CORBAString read _get_hostName write _set_hostName;
  end;

  Repository = class(SOMObjectBase)
  public
    function lookup_id(search_id: CORBAString): Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function lookup_modifier(name: CORBAString; modifier: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure release_cache; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  Request = class(SOMObjectBase)
  public
    function add_arg(name: CORBAString; arg_type: TypeCode; value: Pointer; len: LongInt; arg_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function invoke(invoke_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function send(invoke_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_response(response_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function destroy: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMTEntryC = class(SOMObjectBase)
  private
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtIsReadonly: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtAttribType: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstAttributeDeclarator: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextAttributeDeclarator: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstGetMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextGetMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstSetMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextSetMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtBaseClassDef: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtSourceFileName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtMetaClassEntry: SOMTMetaClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtClassModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtNewMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtLocalInclude: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPrivateMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtStaticMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtOverrideMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtProcMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtVAMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtBaseCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtExternalDataCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPublicDataCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPrivateDataCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtMetaclassFor: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtForwardRef: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstBaseClass: SOMTBaseClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextBaseClass: SOMTBaseClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstReleaseName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextReleaseName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetReleaseNameList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstPassthru: SOMTPassthruEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextPassthru: SOMTPassthruEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstData: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextData: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstStaticData: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextStaticData: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstInheritedMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextInheritedMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstAttribute: SOMTAttributeEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextAttribute: SOMTAttributeEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstStruct: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextStruct: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstUnion: SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextUnion: SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstEnum: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextEnum: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstConstant: SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextConstant: SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstSequence: SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextSequence: SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstPubdef: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextPubdef: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFilterNew(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFilterOverridden(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFilterPrivOrPub(entry: SOMTCommonEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtConstTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtConstType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtConstStringVal: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtConstNumVal: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtConstNumNegVal: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtConstIsNegative: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtConstVal: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtIsSelfRef: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtTemplate: SOMTTemplateOutputC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtTemplate(somtTemplate: SOMTTemplateOutputC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTargetFile: PSOM_FILE; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtTargetFile(somtTargetFile: PSOM_FILE); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTargetClass: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtTargetClass(somtTargetClass: SOMTClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTargetModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtTargetModule(somtTargetModule: SOMTModuleEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTargetType: SOMTTargetTypeT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtTargetType(somtTargetType: SOMTTargetTypeT); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEmitterName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEmitterName(somtEmitterName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGenerateSections: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtOpenSymbolsFile(SOM_file: CORBAString; mode: CORBAString): PSOM_FILE; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetPredefinedSymbols; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtFileSymbols; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitBaseIncludesProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitBaseIncludes(base: SOMTBaseClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitBaseIncludesEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitMetaInclude; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitMeta; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitBaseProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitBase(base: SOMTBaseClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitBaseEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitPassthruProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitPassthru(entry: SOMTPassthruEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitPassthruEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitRelease; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitDataProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitData(entry: SOMTDataEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitDataEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitAttributeProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitAttribute(att: SOMTAttributeEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitAttributeEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitConstantProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitConstant(con: SOMTConstEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitConstantEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitTypedefProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitTypedef(td: SOMTTypedefEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitTypedefEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitStructProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitStruct(struc: SOMTStructEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitStructEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitUnionProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitUnion(un: SOMTUnionEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitUnionEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitEnumProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitEnum(en: SOMTEnumEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitEnumEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitInterfaceProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitInterface(intfc: SOMTClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitInterfaceEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitModuleProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitModule(SOM_mod: SOMTModuleEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitModuleEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitMethodsProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitMethods(method: SOMTMethodEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitMethodsEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitMethod(entry: SOMTMethodEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtNew(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtImplemented(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtOverridden(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtInherited(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtAll(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtNewNoProc(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtPrivOrPub(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtNewProc(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtLink(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtVA(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtEmitFullPassthru(before: CORBABoolean; language: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstGlobalDefinition: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextGlobalDefinition: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property somtTemplate: SOMTTemplateOutputC read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: PSOM_FILE read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: SOMTClassEntryC read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: SOMTModuleEntryC read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: SOMTTargetTypeT read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: CORBAString read _get_somtEmitterName write _set_somtEmitterName;
  end;

  SOMTEnumEntryC = class(SOMObjectBase)
  private
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstEnumName: SOMTEnumNameEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextEnumName: SOMTEnumNameEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtEnumPtr: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEnumVal: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtMetaFile: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtMetaClassDef: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtIsVarargs: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtOriginalMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtOriginalClass: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtMethodGroup: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsPrivateMethod: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsOneway: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtArgCount: SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtContextArray: PCORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCReturnType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstParameter: SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextParameter: SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetIDLParamList(buffer: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetShortCParamList(buffer: CORBAString; selfParm: CORBAString; varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFullCParamList(buffer: CORBAString; varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetShortParamNameList(buffer: CORBAString; selfParm: CORBAString; varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFullParamNameList(buffer: CORBAString; varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNthParameter(n: SmallInt): SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstException: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextException: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtOuterModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtModuleFile: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstModuleStruct: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModuleStruct: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModuleTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModuleTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModuleUnion: SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModuleUnion: SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModuleEnum: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModuleEnum: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModuleConstant: SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModuleConstant: SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModuleSequence: SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModuleSequence: SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstInterface: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextInterface: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModuleDef: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModuleDef: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtParameterDirection: somtParameterDirectionT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLParameterDeclaration: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCParameterDeclaration: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtPassthruBody: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPassthruLanguage: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPassthruTarget: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtIsBeforePassthru: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtSeqLength: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSeqType: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtStringLength: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtStructClass: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsException: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstMember: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextMember: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtTypedefType: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstDeclarator: SOMTCommonEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextDeclarator: SOMTCommonEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtCommentStyle: somtCommentStyleT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtCommentStyle(somtCommentStyle: somtCommentStyleT); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtLineLength: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtLineLength(somtLineLength: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCommentNewline: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtCommentNewline(somtCommentNewline: CORBABoolean); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetSymbol(name: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetSymbol(name: CORBAString; value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetSymbolCopyName(name: CORBAString; value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetSymbolCopyValue(name: CORBAString; value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetSymbolCopyBoth(name: CORBAString; value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtCheckSymbol(name: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetOutputFile(var fp{: opaque SOM_FILE}); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somto(tmplt: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtOutputComment(comment: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtOutputSection(sectionName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtAddSectionDefinitions(defString: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtReadSectionDefinitions(var fp{: opaque SOM_FILE}); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtExpandSymbol(s: CORBAString; buf: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property somtCommentStyle: somtCommentStyleT read _get_somtCommentStyle write _set_somtCommentStyle;
    property somtLineLength: LongInt read _get_somtLineLength write _set_somtLineLength;
    property somtCommentNewline: CORBABoolean read _get_somtCommentNewline write _set_somtCommentNewline;
  end;

  PSOMTUnionEntryC_somtCaseEntry = ^SOMTUnionEntryC_somtCaseEntry;
  SOMTUnionEntryC = class(SOMObjectBase)
  private
    function _get_somtSwitchType: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstCaseEntry: PSOMTUnionEntryC_somtCaseEntry; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextCaseEntry: PSOMTUnionEntryC_somtCaseEntry; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somtOriginalTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtBaseTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function somdShutdownServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdStartServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdRestartServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdListServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdDisableServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdEnableServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdIsServerEnabled(impldef: ImplementationDef): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMESinkEvent = class(SOMObjectBase)
  public
    function somevGetEventSink: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventSink(sink: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  PsomClassDataStructure = ^somClassDataStructure;
  SOMClass = class(SOMObjectBase)
  private
    function _get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  SOMMSingleInstance = class(SOMObjectBase)
  private
    function _get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function sommGetSingleInstance: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure sommFreeSingleInstance; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  SOMMBeforeAfter = class(SOMObjectBase)
  private
    function _get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function sommBeforeMethod(SOM_object: SOMObject; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure sommAfterMethod(SOM_object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  PSOMClass = ^SOMClass;
  SOMClassMgr = class(SOMObjectBase)
  private
    function _get_somInterfaceRepository: Repository; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somInterfaceRepository(somInterfaceRepository: Repository); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somRegisteredClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somLoadClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; SOM_file: CORBAString): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somLocateClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somRegisterClass(classObj: SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somRegisterClassLibrary(libraryName: CORBAString; libraryInitRtn: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUnregisterClassLibrary(libraryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somUnloadClassFile(classObj: SOMClass): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somUnregisterClass(classObj: SOMClass): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somBeginPersistentClasses; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somEndPersistentClasses; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somJoinAffinityGroup(newClass: SOMClass; affClass: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInitFunction: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetRelatedClasses(classObj: SOMClass): PSOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassFromId(classId: somId): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindClass(classId: somId; majorVersion: LongInt; minorVersion: LongInt): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindClsInFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; SOM_file: CORBAString): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somMergeInto(targetObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSubstituteClass(origClassName: CORBAString; newClassName: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property somInterfaceRepository: Repository read _get_somInterfaceRepository write _set_somInterfaceRepository;
    property somRegisteredClasses: _IDL_Sequence_SOMClass read _get_somRegisteredClasses;
  end;

  SOMDObject = class(SOMObjectBase)
  public
    function get_implementation: ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_interface: InterfaceDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function is_nil: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function is_SOM_ref: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function is_constant: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function is_proxy: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function duplicate: SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure release; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var SOM_result: NamedValue; out request: Request; req_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_request_args(operation: CORBAString; out arg_list: NVList; out SOM_result: NamedValue): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMDClientProxy = class(SOMObjectBase)
  public
    procedure somdTargetFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdTargetGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdTargetGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somdProxyFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdProxyGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdProxyGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somdReleaseResources; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_implementation: ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_interface: InterfaceDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function is_nil: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function is_SOM_ref: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function is_constant: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function is_proxy: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function duplicate: SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure release; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var SOM_result: NamedValue; out request: Request; req_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_request_args(operation: CORBAString; out arg_list: NVList; out SOM_result: NamedValue): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMDMetaproxy = class(SOMObjectBase)
  private
    function _get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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
    function _get_somd21somFree: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somd21somFree(somd21somFree: CORBABoolean); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somdFindServer(serverid: CORBAString): SOMDServer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdFindServerByName(servername: CORBAString): SOMDServer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdFindServersByClass(objclass: CORBAString): _IDL_Sequence_SOMDServer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdFindAnyServerByClass(objclass: CORBAString): SOMDServer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdGetIdFromObject(obj: SOMObject): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdGetObjectFromId(id: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somdReleaseObject(obj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somdDestroyObject(obj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property somd21somFree: CORBABoolean read _get_somd21somFree write _set_somd21somFree;
  end;

  SOMDServer = class(SOMObjectBase)
  public
    function somdRefFromSOMObj(somobj: SOMObject): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdSOMObjFromRef(objref: SOMDObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somdDispatchMethod(somobj: SOMObject; out retValue: Pointer; methodId: somId; ap: va_list); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdCreateObj(objclass: CORBAString; hints: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somdDeleteObj(somobj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdGetClassObj(objclass: CORBAString): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somdObjReferencesCached: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMUTId = class(SOMObjectBase)
  public
    procedure somutSetIdId(otherId: SOMUTId); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somutEqualsId(otherId: SOMUTId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somutCompareId(otherId: SOMUTId): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somutHashId: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  SOMOA = class(SOMObjectBase)
  public
    function execute_next_request(waitFlag: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function execute_request_loop(waitFlag: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure change_id(objref: SOMDObject; const id: _IDL_Sequence_Byte); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_constant(const id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create_SOM_ref(somobj: SOMObject; impl: ImplementationDef): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_SOM_object(somref: SOMDObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure activate_impl_failed(impl: ImplementationDef; rc: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure interrupt_server; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function create(const id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure dispose(obj: SOMDObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_id(obj: SOMDObject): _IDL_Sequence_Byte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function get_principal(obj: SOMDObject; const req_ev: Environment): Principal; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure set_exception(major: exception_type; userid: CORBAString; param: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure impl_is_ready(impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure deactivate_impl(impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure change_implementation(obj: SOMDObject; impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure obj_is_ready(obj: SOMDObject; impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure deactivate_obj(obj: SOMDObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  PSockets_hostent = Pointer{ opaque ^Sockets_hostent };
  PSockets_servent = Pointer{ opaque ^Sockets_servent };
  Sockets = class(SOMObjectBase)
  private
    function _get_serrno: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_serrno(serrno: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somsAccept(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsBind(s: LongInt; var name{: opaque Sockets_sockaddr}; namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsConnect(s: LongInt; var name{: opaque Sockets_sockaddr}; namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGethostbyaddr(addr: PShortInt; addrlen: LongInt; domain: LongInt): PSockets_hostent; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGethostbyname(name: CORBAString): PSockets_hostent; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGethostent: PSockets_hostent; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGethostid: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGethostname(name: CORBAString; namelength: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGetpeername(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGetservbyname(name: CORBAString; protocol: CORBAString): PSockets_servent; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGetsockname(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsGetsockopt(s: LongInt; level: LongInt; optname: LongInt; optval: PShortInt; out option: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsHtonl(a: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsHtons(a: Word): Word; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsIoctl(s: LongInt; cmd: LongInt; data: PShortInt; length: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsInet_addr(cp: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsInet_lnaof(addr: Sockets_in_addr): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsInet_makeaddr(net: LongWord; lna: LongWord): Sockets_in_addr; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsInet_netof(addr: Sockets_in_addr): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsInet_network(cp: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsInet_ntoa(addr: Sockets_in_addr): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsListen(s: LongInt; backlog: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsNtohl(a: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsNtohs(a: Word): Word; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsReadv(s: LongInt; var iov{: opaque Sockets_iovec}; iovcnt: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsRecv(s: LongInt; buf: PShortInt; len: LongInt; flags: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsRecvfrom(s: LongInt; buf: PShortInt; len: LongInt; flags: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsRecvmsg(s: LongInt; var msg{: opaque Sockets_msghdr}; flags: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsSelect(nfds: LongInt; var readfds{: opaque Sockets_fd_set}; var writefds{: opaque Sockets_fd_set}; var exceptfds{: opaque Sockets_fd_set}; var timeout{: opaque Sockets_timeval}): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsSend(s: LongInt; msg: PShortInt; len: LongInt; flags: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsSendmsg(s: LongInt; var msg{: opaque Sockets_msghdr}; flags: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsSendto(s: LongInt; var msg: ShortInt; len: LongInt; flags: LongInt; var SOM_to{: opaque Sockets_sockaddr}; tolen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsSetsockopt(s: LongInt; level: LongInt; optname: LongInt; optval: PShortInt; optlen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsShutdown(s: LongInt; how: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsSocket(domain: LongInt; SOM_type: LongInt; protocol: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsSoclose(s: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somsWritev(s: LongInt; var iov{: opaque Sockets_iovec}; iovcnt: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property serrno: LongInt read _get_serrno write _set_serrno;
  end;

  SOMStringTableC = class(SOMObjectBase)
  private
    function _get_somstTargetCapacity: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somstTargetCapacity(somstTargetCapacity: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somstAssociationsCount: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function somstAssociate(key: CORBAString; value: CORBAString): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somstAssociateCopyKey(key: CORBAString; value: CORBAString): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somstAssociateCopyValue(key: CORBAString; value: CORBAString): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somstAssociateCopyBoth(key: CORBAString; value: CORBAString): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somstGetAssociation(key: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somstClearAssociation(key: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somstGetIthKey(i: LongWord): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somstGetIthValue(i: LongWord): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property somstTargetCapacity: LongWord read _get_somstTargetCapacity write _set_somstTargetCapacity;
    property somstAssociationsCount: LongWord read _get_somstAssociationsCount;
  end;

  SOMMTraced = class(SOMObjectBase)
  private
    function _get_sommTraceIsOn: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_sommTraceIsOn(sommTraceIsOn: CORBABoolean); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function sommBeforeMethod(SOM_object: SOMObject; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure sommAfterMethod(SOM_object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property sommTraceIsOn: CORBABoolean read _get_sommTraceIsOn write _set_sommTraceIsOn;
    property somDataAlignment: LongInt read _get_somDataAlignment;
    property somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo read _get_somInstanceDataOffsets;
    property somDirectInitClasses: _IDL_Sequence_SOMClass read _get_somDirectInitClasses write _set_somDirectInitClasses;
    property somClassAllocate: PPointer read _get_somClassAllocate;
    property somClassDeallocate: PPointer read _get_somClassDeallocate;
  end;

  SOMETimerEvent = class(SOMObjectBase)
  public
    function somevGetEventInterval: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventInterval(interval: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  end;

  TSPortability_Sender = class(SOMObjectBase) { unresolved class name };
  TSPortability_Receiver = class(SOMObjectBase) { unresolved class name };
  TSIdentification = class(SOMObjectBase)
  private
    function _get_sender: TSPortability_Sender; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_receiver: TSPortability_Receiver; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    procedure identify_sender(sender: TSPortability_Sender); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure identify_receiver(receiver: TSPortability_Receiver); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property sender: TSPortability_Sender read _get_sender;
    property receiver: TSPortability_Receiver read _get_receiver;
  end;

  TypeDef = class(SOMObjectBase)
  private
    function _get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function _get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure _set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
  public
    function within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    property SOM_type: TypeCode read _get_type write _set_type;
    property name: CORBAString read _get_name write _set_name;
    property id: CORBAString read _get_id write _set_id;
    property defined_in: CORBAString read _get_defined_in write _set_defined_in;
    property somModifiers: _IDL_Sequence_somModifier read _get_somModifiers write _set_somModifiers;
  end;

  SOMEWorkProcEvent = class(SOMObjectBase)
  public
    function somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    function somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
    procedure somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
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

uses
  Windows;

var
  DLLLoad_CriticalSection : Windows.TRTLCriticalSection;

procedure SOMObjectBase.Create;
begin
  { hide this method }
end;

procedure SOMObjectBase.Destroy;
begin
  { hide this method }
end;

function SOMObjectBase.As_SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMObject(Self); { upcast }
end;

const
  SOM_DLL_Name = 'som.dll';

var
  SOM_DLL: System.HMODULE = 0;

procedure SOM_DLL_Load_Variable(var V_Pointer; const Var_Name: AnsiString);
begin
  if SOM_DLL = 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    if SOM_DLL = 0 then
      SOM_DLL := Windows.LoadLibraryW(SOM_DLL_Name);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  if SOM_DLL <> 0 then
    Pointer(V_Pointer) := Windows.GetProcAddress(SOM_DLL, PAnsiChar(Var_Name));
end;

const
  SOMObject_MajorVersion = 1;
  SOMObject_MinorVersion = 4;

(*
 * Declare the class creation procedure
 *)
function SOMObjectNewClass(
  somtmajorVersion: integer4 = SOMObject_MajorVersion;
  somtminorVersion: integer4 = SOMObject_MinorVersion):
  SOMClass; stdcall; external SOM_DLL_Name name 'SOMObjectNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMObjectClassDataStructure = record
    classObject: SOMClass;
    somInit,somUninit,somFree,somDefaultVCopyInit,somGetClassName,somGetClass,somIsA,somRespondsTo,somIsInstanceOf,somGetSize,somDumpSelf,somDumpSelfInt,somPrintSelf,somDefaultConstVCopyInit,somDispatchV,somDispatchL,somDispatchA,somDispatchD,somDispatch,somClassDispatch,somCastObj,somResetObj,somDefaultInit,somDestruct,somPrivate1,somPrivate2,somDefaultCopyInit,somDefaultConstCopyInit,somDefaultAssign,somDefaultConstAssign,somDefaultVAssign,somDefaultConstVAssign: somMToken;
  end;
  PSOMObjectClassDataStructure = ^SOMObjectClassDataStructure;

var
  SOM_DLL_SOMObjectClassData: PSOMObjectClassDataStructure = nil;

function SOMObjectClassData: PSOMObjectClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMObjectClassData) then
    Result := SOM_DLL_SOMObjectClassData
  else
  begin
    SOMIR_Load_Variable(SOM_DLL_SOMObjectClassData, 'SOMObjectClassData');
    Result := SOM_DLL_SOMObjectClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMObjectCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMObjectCClassDataStructure = ^SOMObjectCClassDataStructure;

var
  SOM_DLL_SOMObjectCClassData: PSOMObjectCClassDataStructure = nil;

function SOMObjectCClassData: PSOMObjectCClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMObjectCClassData) then
    Result := SOM_DLL_SOMObjectCClassData
  else
  begin
    SOMIR_Load_Variable(SOM_DLL_SOMObjectCClassData, 'SOMObjectCClassData');
    Result := SOM_DLL_SOMObjectCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMObject: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMObjectClassData.classObject;
end;


procedure SOMObject.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMObject.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMObject.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMIR_DLL_Name = 'somir.dll';

var
  SOMIR_DLL: System.HMODULE = 0;

procedure SOMIR_DLL_Load_Variable(var V_Pointer; const Var_Name: AnsiString);
begin
  if SOMIR_DLL = 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    if SOMIR_DLL = 0 then
      SOMIR_DLL := Windows.LoadLibraryW(SOMIR_DLL_Name);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  if SOMIR_DLL <> 0 then
    Pointer(V_Pointer) := Windows.GetProcAddress(SOMIR_DLL, PAnsiChar(Var_Name));
end;

const
  Contained_MajorVersion = 2;
  Contained_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ContainedNewClass(
  somtmajorVersion: integer4 = Contained_MajorVersion;
  somtminorVersion: integer4 = Contained_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'ContainedNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ContainedClassDataStructure = record
    classObject: SOMClass;
    within,describe,_get_name,_set_name,_get_id,_set_id,_get_defined_in,_set_defined_in,_get_somModifiers,_set_somModifiers: somMToken;
  end;
  PContainedClassDataStructure = ^ContainedClassDataStructure;

var
  SOMIR_DLL_ContainedClassData: PContainedClassDataStructure = nil;

function ContainedClassData: PContainedClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ContainedClassData) then
    Result := SOMIR_DLL_ContainedClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ContainedClassData, 'ContainedClassData');
    Result := SOMIR_DLL_ContainedClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ContainedCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PContainedCClassDataStructure = ^ContainedCClassDataStructure;

var
  SOMIR_DLL_ContainedCClassData: PContainedCClassDataStructure = nil;

function ContainedCClassData: PContainedCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ContainedCClassData) then
    Result := SOMIR_DLL_ContainedCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ContainedCClassData, 'ContainedCClassData');
    Result := SOMIR_DLL_ContainedCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Contained: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ContainedClassData.classObject;
end;


function Contained._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Contained.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Contained.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  AttributeDef_MajorVersion = 2;
  AttributeDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function AttributeDefNewClass(
  somtmajorVersion: integer4 = AttributeDef_MajorVersion;
  somtminorVersion: integer4 = AttributeDef_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'AttributeDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  AttributeDefClassDataStructure = record
    classObject: SOMClass;
    _get_type,_set_type,_get_mode,_set_mode: somMToken;
  end;
  PAttributeDefClassDataStructure = ^AttributeDefClassDataStructure;

var
  SOMIR_DLL_AttributeDefClassData: PAttributeDefClassDataStructure = nil;

function AttributeDefClassData: PAttributeDefClassDataStructure;
begin
  if Assigned(SOMIR_DLL_AttributeDefClassData) then
    Result := SOMIR_DLL_AttributeDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_AttributeDefClassData, 'AttributeDefClassData');
    Result := SOMIR_DLL_AttributeDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  AttributeDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PAttributeDefCClassDataStructure = ^AttributeDefCClassDataStructure;

var
  SOMIR_DLL_AttributeDefCClassData: PAttributeDefCClassDataStructure = nil;

function AttributeDefCClassData: PAttributeDefCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_AttributeDefCClassData) then
    Result := SOMIR_DLL_AttributeDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_AttributeDefCClassData, 'AttributeDefCClassData');
    Result := SOMIR_DLL_AttributeDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_AttributeDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := AttributeDefClassData.classObject;
end;


function AttributeDef._get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef._set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef._get_mode: AttributeDef_AttributeMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef._set_mode(mode: AttributeDef_AttributeMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function AttributeDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure AttributeDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMD_DLL_Name = 'somd.dll';

var
  SOMD_DLL: System.HMODULE = 0;

procedure SOMD_DLL_Load_Variable(var V_Pointer; const Var_Name: AnsiString);
begin
  if SOMD_DLL = 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    if SOMD_DLL = 0 then
      SOMD_DLL := Windows.LoadLibraryW(SOMD_DLL_Name);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  if SOMD_DLL <> 0 then
    Pointer(V_Pointer) := Windows.GetProcAddress(SOMD_DLL, PAnsiChar(Var_Name));
end;

const
  BOA_MajorVersion = 2;
  BOA_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function BOANewClass(
  somtmajorVersion: integer4 = BOA_MajorVersion;
  somtminorVersion: integer4 = BOA_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'BOANewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  BOAClassDataStructure = record
    classObject: SOMClass;
    create,dispose,get_id,change_implementation,get_principal,set_exception,impl_is_ready,deactivate_impl,obj_is_ready,deactivate_obj,activate_impl,activate_obj: somMToken;
  end;
  PBOAClassDataStructure = ^BOAClassDataStructure;

var
  SOMD_DLL_BOAClassData: PBOAClassDataStructure = nil;

function BOAClassData: PBOAClassDataStructure;
begin
  if Assigned(SOMD_DLL_BOAClassData) then
    Result := SOMD_DLL_BOAClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_BOAClassData, 'BOAClassData');
    Result := SOMD_DLL_BOAClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  BOACClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PBOACClassDataStructure = ^BOACClassDataStructure;

var
  SOMD_DLL_BOACClassData: PBOACClassDataStructure = nil;

function BOACClassData: PBOACClassDataStructure;
begin
  if Assigned(SOMD_DLL_BOACClassData) then
    Result := SOMD_DLL_BOACClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_BOACClassData, 'BOACClassData');
    Result := SOMD_DLL_BOACClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_BOA: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := BOAClassData.classObject;
end;


function BOA.create(const id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.dispose(obj: SOMDObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.get_id(obj: SOMDObject): _IDL_Sequence_Byte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.get_principal(obj: SOMDObject; const req_ev: Environment): Principal; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.set_exception(major: exception_type; userid: CORBAString; param: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.impl_is_ready(impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.deactivate_impl(impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.change_implementation(obj: SOMDObject; impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.obj_is_ready(obj: SOMDObject; impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.deactivate_obj(obj: SOMDObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function BOA.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure BOA.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  _Name = '';

var
  : System.HMODULE = 0;

procedure _Load_Variable(var V_Pointer; const Var_Name: AnsiString);
begin
  if  = 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    if  = 0 then
       := Windows.LoadLibraryW(_Name);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
  if  <> 0 then
    Pointer(V_Pointer) := Windows.GetProcAddress(, PAnsiChar(Var_Name));
end;

const
  SOMEEvent_MajorVersion = 2;
  SOMEEvent_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMEEventNewClass(
  somtmajorVersion: integer4 = SOMEEvent_MajorVersion;
  somtminorVersion: integer4 = SOMEEvent_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMEEventNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMEEventClassDataStructure = record
    classObject: SOMClass;
    somevGetEventTime,somevGetEventType,somevSetEventTime,somevSetEventType: somMToken;
  end;
  PSOMEEventClassDataStructure = ^SOMEEventClassDataStructure;

var
  _SOMEEventClassData: PSOMEEventClassDataStructure = nil;

function SOMEEventClassData: PSOMEEventClassDataStructure;
begin
  if Assigned(_SOMEEventClassData) then
    Result := _SOMEEventClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEEventClassData, 'SOMEEventClassData');
    Result := _SOMEEventClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMEEventCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMEEventCClassDataStructure = ^SOMEEventCClassDataStructure;

var
  _SOMEEventCClassData: PSOMEEventCClassDataStructure = nil;

function SOMEEventCClassData: PSOMEEventCClassDataStructure;
begin
  if Assigned(_SOMEEventCClassData) then
    Result := _SOMEEventCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEEventCClassData, 'SOMEEventCClassData');
    Result := _SOMEEventCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMEEvent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMEEventClassData.classObject;
end;


function SOMEEvent.somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEvent.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEvent.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMEClientEvent_MajorVersion = 2;
  SOMEClientEvent_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMEClientEventNewClass(
  somtmajorVersion: integer4 = SOMEClientEvent_MajorVersion;
  somtminorVersion: integer4 = SOMEClientEvent_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMEClientEventNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMEClientEventClassDataStructure = record
    classObject: SOMClass;
    somevGetEventClientData,somevGetEventClientType,somevSetEventClientData,somevSetEventClientType: somMToken;
  end;
  PSOMEClientEventClassDataStructure = ^SOMEClientEventClassDataStructure;

var
  _SOMEClientEventClassData: PSOMEClientEventClassDataStructure = nil;

function SOMEClientEventClassData: PSOMEClientEventClassDataStructure;
begin
  if Assigned(_SOMEClientEventClassData) then
    Result := _SOMEClientEventClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEClientEventClassData, 'SOMEClientEventClassData');
    Result := _SOMEClientEventClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMEClientEventCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMEClientEventCClassDataStructure = ^SOMEClientEventCClassDataStructure;

var
  _SOMEClientEventCClassData: PSOMEClientEventCClassDataStructure = nil;

function SOMEClientEventCClassData: PSOMEClientEventCClassDataStructure;
begin
  if Assigned(_SOMEClientEventCClassData) then
    Result := _SOMEClientEventCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEClientEventCClassData, 'SOMEClientEventCClassData');
    Result := _SOMEClientEventCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMEClientEvent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMEClientEventClassData.classObject;
end;


function SOMEClientEvent.somevGetEventClientData: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somevGetEventClientType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somevSetEventClientData(clientData: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somevSetEventClientType(clientType: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEClientEvent.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEClientEvent.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  Context_MajorVersion = 2;
  Context_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ContextNewClass(
  somtmajorVersion: integer4 = Context_MajorVersion;
  somtminorVersion: integer4 = Context_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'ContextNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ContextClassDataStructure = record
    classObject: SOMClass;
    set_one_value,set_values,get_values,delete_values,create_child,destroy,_get_context_name,_set_context_name,_get_context_parent,_set_context_parent,_get_properties,_set_properties: somMToken;
  end;
  PContextClassDataStructure = ^ContextClassDataStructure;

var
  SOMD_DLL_ContextClassData: PContextClassDataStructure = nil;

function ContextClassData: PContextClassDataStructure;
begin
  if Assigned(SOMD_DLL_ContextClassData) then
    Result := SOMD_DLL_ContextClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ContextClassData, 'ContextClassData');
    Result := SOMD_DLL_ContextClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ContextCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PContextCClassDataStructure = ^ContextCClassDataStructure;

var
  SOMD_DLL_ContextCClassData: PContextCClassDataStructure = nil;

function ContextCClassData: PContextCClassDataStructure;
begin
  if Assigned(SOMD_DLL_ContextCClassData) then
    Result := SOMD_DLL_ContextCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ContextCClassData, 'ContextCClassData');
    Result := SOMD_DLL_ContextCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Context: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ContextClassData.classObject;
end;


function Context.set_one_value(prop_name: CORBAString; value: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.set_values(values: NVList): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.get_values(start_scope: CORBAString; op_flags: LongWord; prop_name: CORBAString; out values: NVList): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.delete_values(prop_name: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.create_child(ctx_name: CORBAString; out child_ctx: Context): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.destroy(flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Context.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Context.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  ConstantDef_MajorVersion = 2;
  ConstantDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ConstantDefNewClass(
  somtmajorVersion: integer4 = ConstantDef_MajorVersion;
  somtminorVersion: integer4 = ConstantDef_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'ConstantDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ConstantDefClassDataStructure = record
    classObject: SOMClass;
    _get_type,_set_type,_get_value,_set_value: somMToken;
  end;
  PConstantDefClassDataStructure = ^ConstantDefClassDataStructure;

var
  SOMIR_DLL_ConstantDefClassData: PConstantDefClassDataStructure = nil;

function ConstantDefClassData: PConstantDefClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ConstantDefClassData) then
    Result := SOMIR_DLL_ConstantDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ConstantDefClassData, 'ConstantDefClassData');
    Result := SOMIR_DLL_ConstantDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ConstantDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PConstantDefCClassDataStructure = ^ConstantDefCClassDataStructure;

var
  SOMIR_DLL_ConstantDefCClassData: PConstantDefCClassDataStructure = nil;

function ConstantDefCClassData: PConstantDefCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ConstantDefCClassData) then
    Result := SOMIR_DLL_ConstantDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ConstantDefCClassData, 'ConstantDefCClassData');
    Result := SOMIR_DLL_ConstantDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ConstantDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ConstantDefClassData.classObject;
end;


function ConstantDef._get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef._set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef._get_value: any; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef._set_value(const value: any); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ConstantDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ConstantDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  Container_MajorVersion = 2;
  Container_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ContainerNewClass(
  somtmajorVersion: integer4 = Container_MajorVersion;
  somtminorVersion: integer4 = Container_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'ContainerNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ContainerClassDataStructure = record
    classObject: SOMClass;
    contents,lookup_name,describe_contents: somMToken;
  end;
  PContainerClassDataStructure = ^ContainerClassDataStructure;

var
  SOMIR_DLL_ContainerClassData: PContainerClassDataStructure = nil;

function ContainerClassData: PContainerClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ContainerClassData) then
    Result := SOMIR_DLL_ContainerClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ContainerClassData, 'ContainerClassData');
    Result := SOMIR_DLL_ContainerClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ContainerCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PContainerCClassDataStructure = ^ContainerCClassDataStructure;

var
  SOMIR_DLL_ContainerCClassData: PContainerCClassDataStructure = nil;

function ContainerCClassData: PContainerCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ContainerCClassData) then
    Result := SOMIR_DLL_ContainerCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ContainerCClassData, 'ContainerCClassData');
    Result := SOMIR_DLL_ContainerCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Container: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ContainerClassData.classObject;
end;


function Container.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Container.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Container.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMEEMan_MajorVersion = 2;
  SOMEEMan_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMEEManNewClass(
  somtmajorVersion: integer4 = SOMEEMan_MajorVersion;
  somtminorVersion: integer4 = SOMEEMan_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMEEManNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMEEManClassDataStructure = record
    classObject: SOMClass;
    someGetEManSem,someReleaseEManSem,someChangeRegData,someProcessEvent,someProcessEvents,someQueueEvent,someRegister,someRegisterEv,someRegisterProc,someShutdown,someUnRegister: somMToken;
  end;
  PSOMEEManClassDataStructure = ^SOMEEManClassDataStructure;

var
  _SOMEEManClassData: PSOMEEManClassDataStructure = nil;

function SOMEEManClassData: PSOMEEManClassDataStructure;
begin
  if Assigned(_SOMEEManClassData) then
    Result := _SOMEEManClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEEManClassData, 'SOMEEManClassData');
    Result := _SOMEEManClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMEEManCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMEEManCClassDataStructure = ^SOMEEManCClassDataStructure;

var
  _SOMEEManCClassData: PSOMEEManCClassDataStructure = nil;

function SOMEEManCClassData: PSOMEEManCClassDataStructure;
begin
  if Assigned(_SOMEEManCClassData) then
    Result := _SOMEEManCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEEManCClassData, 'SOMEEManCClassData');
    Result := _SOMEEManCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMEEMan: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMEEManClassData.classObject;
end;


procedure SOMEEMan.someGetEManSem; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.someReleaseEManSem; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.someChangeRegData(registrationId: LongInt; registerData: SOMEEMRegisterData); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.someProcessEvent(mask: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.someProcessEvents; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.someQueueEvent(event: SOMEClientEvent); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.someRegister(registerData: SOMEEMRegisterData; targetObject: SOMObject; targetMethod: CORBAString; targetData: Pointer): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.someRegisterEv(registerData: SOMEEMRegisterData; targetObject: SOMObject; var callbackEv: Environment; targetMethod: CORBAString; targetData: Pointer): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.someRegisterProc(registerData: SOMEEMRegisterData; targetProcedure: PPointer; targetData: Pointer): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.someShutdown; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.someUnRegister(registrationId: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMan.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMan.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMEEMRegisterData_MajorVersion = 2;
  SOMEEMRegisterData_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMEEMRegisterDataNewClass(
  somtmajorVersion: integer4 = SOMEEMRegisterData_MajorVersion;
  somtminorVersion: integer4 = SOMEEMRegisterData_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMEEMRegisterDataNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMEEMRegisterDataClassDataStructure = record
    classObject: SOMClass;
    someClearRegData,someSetRegDataClientType,someSetRegDataEventMask,someSetRegDataSink,someSetRegDataSinkMask,someSetRegDataTimerCount,someSetRegDataTimerInterval: somMToken;
  end;
  PSOMEEMRegisterDataClassDataStructure = ^SOMEEMRegisterDataClassDataStructure;

var
  _SOMEEMRegisterDataClassData: PSOMEEMRegisterDataClassDataStructure = nil;

function SOMEEMRegisterDataClassData: PSOMEEMRegisterDataClassDataStructure;
begin
  if Assigned(_SOMEEMRegisterDataClassData) then
    Result := _SOMEEMRegisterDataClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEEMRegisterDataClassData, 'SOMEEMRegisterDataClassData');
    Result := _SOMEEMRegisterDataClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMEEMRegisterDataCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMEEMRegisterDataCClassDataStructure = ^SOMEEMRegisterDataCClassDataStructure;

var
  _SOMEEMRegisterDataCClassData: PSOMEEMRegisterDataCClassDataStructure = nil;

function SOMEEMRegisterDataCClassData: PSOMEEMRegisterDataCClassDataStructure;
begin
  if Assigned(_SOMEEMRegisterDataCClassData) then
    Result := _SOMEEMRegisterDataCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEEMRegisterDataCClassData, 'SOMEEMRegisterDataCClassData');
    Result := _SOMEEMRegisterDataCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMEEMRegisterData: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMEEMRegisterDataClassData.classObject;
end;


procedure SOMEEMRegisterData.someClearRegData; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataClientType(clientType: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataEventMask(eventType: LongInt; ap: va_list); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataSink(sink: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataSinkMask(sinkMask: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataTimerCount(count: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.someSetRegDataTimerInterval(interval: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEEMRegisterData.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEEMRegisterData.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  ExceptionDef_MajorVersion = 2;
  ExceptionDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ExceptionDefNewClass(
  somtmajorVersion: integer4 = ExceptionDef_MajorVersion;
  somtminorVersion: integer4 = ExceptionDef_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'ExceptionDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ExceptionDefClassDataStructure = record
    classObject: SOMClass;
    _get_type,_set_type: somMToken;
  end;
  PExceptionDefClassDataStructure = ^ExceptionDefClassDataStructure;

var
  SOMIR_DLL_ExceptionDefClassData: PExceptionDefClassDataStructure = nil;

function ExceptionDefClassData: PExceptionDefClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ExceptionDefClassData) then
    Result := SOMIR_DLL_ExceptionDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ExceptionDefClassData, 'ExceptionDefClassData');
    Result := SOMIR_DLL_ExceptionDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ExceptionDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PExceptionDefCClassDataStructure = ^ExceptionDefCClassDataStructure;

var
  SOMIR_DLL_ExceptionDefCClassData: PExceptionDefCClassDataStructure = nil;

function ExceptionDefCClassData: PExceptionDefCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ExceptionDefCClassData) then
    Result := SOMIR_DLL_ExceptionDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ExceptionDefCClassData, 'ExceptionDefCClassData');
    Result := SOMIR_DLL_ExceptionDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ExceptionDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ExceptionDefClassData.classObject;
end;


function ExceptionDef._get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef._set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ExceptionDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ExceptionDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  ImplementationDef_MajorVersion = 2;
  ImplementationDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ImplementationDefNewClass(
  somtmajorVersion: integer4 = ImplementationDef_MajorVersion;
  somtminorVersion: integer4 = ImplementationDef_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'ImplementationDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ImplementationDefClassDataStructure = record
    classObject: SOMClass;
    _set_impl_id,_get_impl_id,_set_impl_alias,_get_impl_alias,_set_impl_program,_get_impl_program,_set_impl_flags,_get_impl_flags,_set_impl_server_class,_get_impl_server_class,_set_impl_socket_class,_get_impl_socket_class,_set_impl_refdata_file,_get_impl_refdata_file,_set_impl_refdata_bkup,_get_impl_refdata_bkup,_set_impl_hostname,_get_impl_hostname,_set_impl_def_struct,_get_impl_def_struct,get_impl_winserver_handle: somMToken;
  end;
  PImplementationDefClassDataStructure = ^ImplementationDefClassDataStructure;

var
  SOMD_DLL_ImplementationDefClassData: PImplementationDefClassDataStructure = nil;

function ImplementationDefClassData: PImplementationDefClassDataStructure;
begin
  if Assigned(SOMD_DLL_ImplementationDefClassData) then
    Result := SOMD_DLL_ImplementationDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ImplementationDefClassData, 'ImplementationDefClassData');
    Result := SOMD_DLL_ImplementationDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ImplementationDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PImplementationDefCClassDataStructure = ^ImplementationDefCClassDataStructure;

var
  SOMD_DLL_ImplementationDefCClassData: PImplementationDefCClassDataStructure = nil;

function ImplementationDefCClassData: PImplementationDefCClassDataStructure;
begin
  if Assigned(SOMD_DLL_ImplementationDefCClassData) then
    Result := SOMD_DLL_ImplementationDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ImplementationDefCClassData, 'ImplementationDefCClassData');
    Result := SOMD_DLL_ImplementationDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ImplementationDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ImplementationDefClassData.classObject;
end;


function ImplementationDef._get_impl_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef._set_impl_id(impl_id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef._get_impl_alias: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef._set_impl_alias(impl_alias: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef._get_impl_program: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef._set_impl_program(impl_program: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef._get_impl_flags: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef._set_impl_flags(impl_flags: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef._get_impl_server_class: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef._set_impl_server_class(impl_server_class: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef._get_impl_refdata_file: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef._set_impl_refdata_file(impl_refdata_file: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef._get_impl_refdata_bkup: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef._set_impl_refdata_bkup(impl_refdata_bkup: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef._get_impl_hostname: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef._set_impl_hostname(impl_hostname: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplementationDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplementationDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  ImplRepository_MajorVersion = 2;
  ImplRepository_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ImplRepositoryNewClass(
  somtmajorVersion: integer4 = ImplRepository_MajorVersion;
  somtminorVersion: integer4 = ImplRepository_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'ImplRepositoryNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ImplRepositoryClassDataStructure = record
    classObject: SOMClass;
    find_impldef,find_impldef_by_alias,find_impldef2,find_impldef_by_alias2,find_impldef_by_class,add_impldef,update_impldef,delete_impldef,add_class_to_impldef,remove_class_from_impldef,remove_class_from_all,find_classes_by_impldef,implr_get_impl,implr_search_impl,implr_search_class,implr_update_impl,find_all_impldefs: somMToken;
  end;
  PImplRepositoryClassDataStructure = ^ImplRepositoryClassDataStructure;

var
  SOMD_DLL_ImplRepositoryClassData: PImplRepositoryClassDataStructure = nil;

function ImplRepositoryClassData: PImplRepositoryClassDataStructure;
begin
  if Assigned(SOMD_DLL_ImplRepositoryClassData) then
    Result := SOMD_DLL_ImplRepositoryClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ImplRepositoryClassData, 'ImplRepositoryClassData');
    Result := SOMD_DLL_ImplRepositoryClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ImplRepositoryCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PImplRepositoryCClassDataStructure = ^ImplRepositoryCClassDataStructure;

var
  SOMD_DLL_ImplRepositoryCClassData: PImplRepositoryCClassDataStructure = nil;

function ImplRepositoryCClassData: PImplRepositoryCClassDataStructure;
begin
  if Assigned(SOMD_DLL_ImplRepositoryCClassData) then
    Result := SOMD_DLL_ImplRepositoryCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ImplRepositoryCClassData, 'ImplRepositoryCClassData');
    Result := SOMD_DLL_ImplRepositoryCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ImplRepository: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ImplRepositoryClassData.classObject;
end;


function ImplRepository.find_impldef(implid: CORBAString): ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.find_impldef_by_alias(alias_name: CORBAString): ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.find_all_impldefs(out outimpldefs: _IDL_Sequence_ImplementationDef): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.find_impldef_by_class(classname: CORBAString): _IDL_Sequence_ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.add_impldef(impldef: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.update_impldef(impldef: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.delete_impldef(implid: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.add_class_to_impldef(implid: CORBAString; classname: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.remove_class_from_impldef(implid: CORBAString; classname: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.remove_class_from_all(classname: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.find_classes_by_impldef(implid: CORBAString): _IDL_Sequence_CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ImplRepository.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ImplRepository.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  InterfaceDef_MajorVersion = 2;
  InterfaceDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function InterfaceDefNewClass(
  somtmajorVersion: integer4 = InterfaceDef_MajorVersion;
  somtminorVersion: integer4 = InterfaceDef_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'InterfaceDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  InterfaceDefClassDataStructure = record
    classObject: SOMClass;
    describe_interface,_get_base_interfaces,_set_base_interfaces,_get_instanceData,_set_instanceData: somMToken;
  end;
  PInterfaceDefClassDataStructure = ^InterfaceDefClassDataStructure;

var
  SOMIR_DLL_InterfaceDefClassData: PInterfaceDefClassDataStructure = nil;

function InterfaceDefClassData: PInterfaceDefClassDataStructure;
begin
  if Assigned(SOMIR_DLL_InterfaceDefClassData) then
    Result := SOMIR_DLL_InterfaceDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_InterfaceDefClassData, 'InterfaceDefClassData');
    Result := SOMIR_DLL_InterfaceDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  InterfaceDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PInterfaceDefCClassDataStructure = ^InterfaceDefCClassDataStructure;

var
  SOMIR_DLL_InterfaceDefCClassData: PInterfaceDefCClassDataStructure = nil;

function InterfaceDefCClassData: PInterfaceDefCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_InterfaceDefCClassData) then
    Result := SOMIR_DLL_InterfaceDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_InterfaceDefCClassData, 'InterfaceDefCClassData');
    Result := SOMIR_DLL_InterfaceDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_InterfaceDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := InterfaceDefClassData.classObject;
end;


function InterfaceDef._get_base_interfaces: _IDL_Sequence_CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef._set_base_interfaces(const base_interfaces: _IDL_Sequence_CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef._get_instanceData: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef._set_instanceData(instanceData: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.describe_interface: InterfaceDef_FullInterfaceDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure InterfaceDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function InterfaceDef.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  ModuleDef_MajorVersion = 2;
  ModuleDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ModuleDefNewClass(
  somtmajorVersion: integer4 = ModuleDef_MajorVersion;
  somtminorVersion: integer4 = ModuleDef_MinorVersion):
  SOMClass; stdcall; external _Name name 'ModuleDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ModuleDefClassDataStructure = record
    classObject: SOMClass;
    : somMToken;
  end;
  PModuleDefClassDataStructure = ^ModuleDefClassDataStructure;

var
  _ModuleDefClassData: PModuleDefClassDataStructure = nil;

function ModuleDefClassData: PModuleDefClassDataStructure;
begin
  if Assigned(_ModuleDefClassData) then
    Result := _ModuleDefClassData
  else
  begin
    SOMIR_Load_Variable(_ModuleDefClassData, 'ModuleDefClassData');
    Result := _ModuleDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ModuleDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PModuleDefCClassDataStructure = ^ModuleDefCClassDataStructure;

var
  _ModuleDefCClassData: PModuleDefCClassDataStructure = nil;

function ModuleDefCClassData: PModuleDefCClassDataStructure;
begin
  if Assigned(_ModuleDefCClassData) then
    Result := _ModuleDefCClassData
  else
  begin
    SOMIR_Load_Variable(_ModuleDefCClassData, 'ModuleDefCClassData');
    Result := _ModuleDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ModuleDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ModuleDefClassData.classObject;
end;


function ModuleDef._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ModuleDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ModuleDef.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  NVList_MajorVersion = 2;
  NVList_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function NVListNewClass(
  somtmajorVersion: integer4 = NVList_MajorVersion;
  somtminorVersion: integer4 = NVList_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'NVListNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  NVListClassDataStructure = record
    classObject: SOMClass;
    add_item,remove_item,free,free_memory,get_count,set_item,get_item,get_item_by_name: somMToken;
  end;
  PNVListClassDataStructure = ^NVListClassDataStructure;

var
  SOMD_DLL_NVListClassData: PNVListClassDataStructure = nil;

function NVListClassData: PNVListClassDataStructure;
begin
  if Assigned(SOMD_DLL_NVListClassData) then
    Result := SOMD_DLL_NVListClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_NVListClassData, 'NVListClassData');
    Result := SOMD_DLL_NVListClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  NVListCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PNVListCClassDataStructure = ^NVListCClassDataStructure;

var
  SOMD_DLL_NVListCClassData: PNVListCClassDataStructure = nil;

function NVListCClassData: PNVListCClassDataStructure;
begin
  if Assigned(SOMD_DLL_NVListCClassData) then
    Result := SOMD_DLL_NVListCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_NVListCClassData, 'NVListCClassData');
    Result := SOMD_DLL_NVListCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_NVList: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := NVListClassData.classObject;
end;


function NVList.add_item(item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.free: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.free_memory: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.get_count(out count: LongInt): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.set_item(item_number: LongInt; item_name: CORBAString; item_type: TypeCode; value: Pointer; value_len: LongInt; item_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.get_item(item_number: LongInt; out item_name: CORBAString; out item_type: TypeCode; out value: Pointer; out value_len: LongInt; out item_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function NVList.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure NVList.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  ObjectMgr_MajorVersion = 2;
  ObjectMgr_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ObjectMgrNewClass(
  somtmajorVersion: integer4 = ObjectMgr_MajorVersion;
  somtminorVersion: integer4 = ObjectMgr_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'ObjectMgrNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ObjectMgrClassDataStructure = record
    classObject: SOMClass;
    somdNewObject,somdGetIdFromObject,somdGetObjectFromId,somdReleaseObject,somdDestroyObject: somMToken;
  end;
  PObjectMgrClassDataStructure = ^ObjectMgrClassDataStructure;

var
  SOMD_DLL_ObjectMgrClassData: PObjectMgrClassDataStructure = nil;

function ObjectMgrClassData: PObjectMgrClassDataStructure;
begin
  if Assigned(SOMD_DLL_ObjectMgrClassData) then
    Result := SOMD_DLL_ObjectMgrClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ObjectMgrClassData, 'ObjectMgrClassData');
    Result := SOMD_DLL_ObjectMgrClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ObjectMgrCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PObjectMgrCClassDataStructure = ^ObjectMgrCClassDataStructure;

var
  SOMD_DLL_ObjectMgrCClassData: PObjectMgrCClassDataStructure = nil;

function ObjectMgrCClassData: PObjectMgrCClassDataStructure;
begin
  if Assigned(SOMD_DLL_ObjectMgrCClassData) then
    Result := SOMD_DLL_ObjectMgrCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ObjectMgrCClassData, 'ObjectMgrCClassData');
    Result := SOMD_DLL_ObjectMgrCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ObjectMgr: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ObjectMgrClassData.classObject;
end;


function ObjectMgr.somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somdGetIdFromObject(obj: SOMObject): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somdGetObjectFromId(id: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somdReleaseObject(obj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somdDestroyObject(obj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ObjectMgr.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ObjectMgr.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  OperationDef_MajorVersion = 2;
  OperationDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function OperationDefNewClass(
  somtmajorVersion: integer4 = OperationDef_MajorVersion;
  somtminorVersion: integer4 = OperationDef_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'OperationDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  OperationDefClassDataStructure = record
    classObject: SOMClass;
    _get_result,_set_result,_get_mode,_set_mode,_get_contexts,_set_contexts: somMToken;
  end;
  POperationDefClassDataStructure = ^OperationDefClassDataStructure;

var
  SOMIR_DLL_OperationDefClassData: POperationDefClassDataStructure = nil;

function OperationDefClassData: POperationDefClassDataStructure;
begin
  if Assigned(SOMIR_DLL_OperationDefClassData) then
    Result := SOMIR_DLL_OperationDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_OperationDefClassData, 'OperationDefClassData');
    Result := SOMIR_DLL_OperationDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  OperationDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  POperationDefCClassDataStructure = ^OperationDefCClassDataStructure;

var
  SOMIR_DLL_OperationDefCClassData: POperationDefCClassDataStructure = nil;

function OperationDefCClassData: POperationDefCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_OperationDefCClassData) then
    Result := SOMIR_DLL_OperationDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_OperationDefCClassData, 'OperationDefCClassData');
    Result := SOMIR_DLL_OperationDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_OperationDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := OperationDefClassData.classObject;
end;


function OperationDef._get_result: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef._set_result(SOM_result: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef._get_mode: OperationDef_OperationMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef._set_mode(mode: OperationDef_OperationMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef._get_contexts: _IDL_Sequence_CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef._set_contexts(const contexts: _IDL_Sequence_CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure OperationDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function OperationDef.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  ORB_MajorVersion = 2;
  ORB_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ORBNewClass(
  somtmajorVersion: integer4 = ORB_MajorVersion;
  somtminorVersion: integer4 = ORB_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'ORBNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ORBClassDataStructure = record
    classObject: SOMClass;
    object_to_string,string_to_object,create_list,create_operation_list,get_default_context,object_to_binary,binary_to_object: somMToken;
  end;
  PORBClassDataStructure = ^ORBClassDataStructure;

var
  SOMD_DLL_ORBClassData: PORBClassDataStructure = nil;

function ORBClassData: PORBClassDataStructure;
begin
  if Assigned(SOMD_DLL_ORBClassData) then
    Result := SOMD_DLL_ORBClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ORBClassData, 'ORBClassData');
    Result := SOMD_DLL_ORBClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ORBCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PORBCClassDataStructure = ^ORBCClassDataStructure;

var
  SOMD_DLL_ORBCClassData: PORBCClassDataStructure = nil;

function ORBCClassData: PORBCClassDataStructure;
begin
  if Assigned(SOMD_DLL_ORBCClassData) then
    Result := SOMD_DLL_ORBCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_ORBCClassData, 'ORBCClassData');
    Result := SOMD_DLL_ORBCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ORB: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ORBClassData.classObject;
end;


function ORB.object_to_string(obj: SOMDObject): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.string_to_object(str: CORBAString): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.create_list(count: LongInt; out new_list: NVList): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.create_operation_list(oper: OperationDef; out new_list: NVList): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.get_default_context(out ctx: Context): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ORB.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ORB.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  ParameterDef_MajorVersion = 2;
  ParameterDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function ParameterDefNewClass(
  somtmajorVersion: integer4 = ParameterDef_MajorVersion;
  somtminorVersion: integer4 = ParameterDef_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'ParameterDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  ParameterDefClassDataStructure = record
    classObject: SOMClass;
    _get_type,_set_type,_get_mode,_set_mode: somMToken;
  end;
  PParameterDefClassDataStructure = ^ParameterDefClassDataStructure;

var
  SOMIR_DLL_ParameterDefClassData: PParameterDefClassDataStructure = nil;

function ParameterDefClassData: PParameterDefClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ParameterDefClassData) then
    Result := SOMIR_DLL_ParameterDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ParameterDefClassData, 'ParameterDefClassData');
    Result := SOMIR_DLL_ParameterDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  ParameterDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PParameterDefCClassDataStructure = ^ParameterDefCClassDataStructure;

var
  SOMIR_DLL_ParameterDefCClassData: PParameterDefCClassDataStructure = nil;

function ParameterDefCClassData: PParameterDefCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ParameterDefCClassData) then
    Result := SOMIR_DLL_ParameterDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ParameterDefCClassData, 'ParameterDefCClassData');
    Result := SOMIR_DLL_ParameterDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ParameterDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ParameterDefClassData.classObject;
end;


function ParameterDef._get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef._set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef._get_mode: ParameterDef_ParameterMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef._set_mode(mode: ParameterDef_ParameterMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function ParameterDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure ParameterDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  Principal_MajorVersion = 1;
  Principal_MinorVersion = 0;

(*
 * Declare the class creation procedure
 *)
function PrincipalNewClass(
  somtmajorVersion: integer4 = Principal_MajorVersion;
  somtminorVersion: integer4 = Principal_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'PrincipalNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  PrincipalClassDataStructure = record
    classObject: SOMClass;
    _set_userName,_get_userName,_set_hostName,_get_hostName: somMToken;
  end;
  PPrincipalClassDataStructure = ^PrincipalClassDataStructure;

var
  SOMD_DLL_PrincipalClassData: PPrincipalClassDataStructure = nil;

function PrincipalClassData: PPrincipalClassDataStructure;
begin
  if Assigned(SOMD_DLL_PrincipalClassData) then
    Result := SOMD_DLL_PrincipalClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_PrincipalClassData, 'PrincipalClassData');
    Result := SOMD_DLL_PrincipalClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  PrincipalCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PPrincipalCClassDataStructure = ^PrincipalCClassDataStructure;

var
  SOMD_DLL_PrincipalCClassData: PPrincipalCClassDataStructure = nil;

function PrincipalCClassData: PPrincipalCClassDataStructure;
begin
  if Assigned(SOMD_DLL_PrincipalCClassData) then
    Result := SOMD_DLL_PrincipalCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_PrincipalCClassData, 'PrincipalCClassData');
    Result := SOMD_DLL_PrincipalCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Principal: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := PrincipalClassData.classObject;
end;


function Principal._get_userName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal._set_userName(userName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal._get_hostName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal._set_hostName(hostName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Principal.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Principal.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  Repository_MajorVersion = 2;
  Repository_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function RepositoryNewClass(
  somtmajorVersion: integer4 = Repository_MajorVersion;
  somtminorVersion: integer4 = Repository_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'RepositoryNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  RepositoryClassDataStructure = record
    classObject: SOMClass;
    lookup_id,lookup_modifier,release_cache: somMToken;
  end;
  PRepositoryClassDataStructure = ^RepositoryClassDataStructure;

var
  SOMIR_DLL_RepositoryClassData: PRepositoryClassDataStructure = nil;

function RepositoryClassData: PRepositoryClassDataStructure;
begin
  if Assigned(SOMIR_DLL_RepositoryClassData) then
    Result := SOMIR_DLL_RepositoryClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_RepositoryClassData, 'RepositoryClassData');
    Result := SOMIR_DLL_RepositoryClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  RepositoryCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PRepositoryCClassDataStructure = ^RepositoryCClassDataStructure;

var
  SOMIR_DLL_RepositoryCClassData: PRepositoryCClassDataStructure = nil;

function RepositoryCClassData: PRepositoryCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_RepositoryCClassData) then
    Result := SOMIR_DLL_RepositoryCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_RepositoryCClassData, 'RepositoryCClassData');
    Result := SOMIR_DLL_RepositoryCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Repository: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := RepositoryClassData.classObject;
end;


function Repository.lookup_id(search_id: CORBAString): Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.lookup_modifier(name: CORBAString; modifier: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.release_cache; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.contents(limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.lookup_name(search_name: CORBAString; levels_to_search: LongInt; limit_type: CORBAString; exclude_inherited: CORBABoolean): _IDL_Sequence_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.describe_contents(limit_type: CORBAString; exclude_inherited: CORBABoolean; max_returned_objs: LongInt): _IDL_Sequence_Container_ContainerDescription; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Repository.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Repository.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  Request_MajorVersion = 2;
  Request_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function RequestNewClass(
  somtmajorVersion: integer4 = Request_MajorVersion;
  somtminorVersion: integer4 = Request_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'RequestNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  RequestClassDataStructure = record
    classObject: SOMClass;
    add_arg,invoke,send,get_response,destroy,_get_objref,_set_objref,_get_ctx,_set_ctx,_get_operation,_set_operation,_get_argument_list,_set_argument_list,_get_return_result,_set_return_result,_get_req_flags,_set_req_flags,_get_env,_set_env: somMToken;
  end;
  PRequestClassDataStructure = ^RequestClassDataStructure;

var
  SOMD_DLL_RequestClassData: PRequestClassDataStructure = nil;

function RequestClassData: PRequestClassDataStructure;
begin
  if Assigned(SOMD_DLL_RequestClassData) then
    Result := SOMD_DLL_RequestClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_RequestClassData, 'RequestClassData');
    Result := SOMD_DLL_RequestClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  RequestCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PRequestCClassDataStructure = ^RequestCClassDataStructure;

var
  SOMD_DLL_RequestCClassData: PRequestCClassDataStructure = nil;

function RequestCClassData: PRequestCClassDataStructure;
begin
  if Assigned(SOMD_DLL_RequestCClassData) then
    Result := SOMD_DLL_RequestCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_RequestCClassData, 'RequestCClassData');
    Result := SOMD_DLL_RequestCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Request: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := RequestClassData.classObject;
end;


function Request.add_arg(name: CORBAString; arg_type: TypeCode; value: Pointer; len: LongInt; arg_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.invoke(invoke_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.send(invoke_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.get_response(response_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.destroy: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Request.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Request.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTEntryC_MajorVersion = 2;
  SOMTEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTEntryCNewClass(
  somtmajorVersion: integer4 = SOMTEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtEntryName,_set_somtEntryName,_get_somtElementType,_set_somtElementType,_get_somtEntryComment,_get_somtSourceLineNumber,_get_somtTypeCode,_get_somtIsReference,somtGetModifierValue,somtGetFirstModifier,somtGetNextModifier,somtFormatModifier,somtGetModifierList,somtSetSymbolsOnEntry,somtSetEntryStruct,_get_somtEntryStruct,somtShowAssocEntry,_get_somtCScopedName,_get_somtIDLScopedName,_get_somtElementTypeName: somMToken;
  end;
  PSOMTEntryCClassDataStructure = ^SOMTEntryCClassDataStructure;

var
  _SOMTEntryCClassData: PSOMTEntryCClassDataStructure = nil;

function SOMTEntryCClassData: PSOMTEntryCClassDataStructure;
begin
  if Assigned(_SOMTEntryCClassData) then
    Result := _SOMTEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTEntryCClassData, 'SOMTEntryCClassData');
    Result := _SOMTEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTEntryCCClassDataStructure = ^SOMTEntryCCClassDataStructure;

var
  _SOMTEntryCCClassData: PSOMTEntryCCClassDataStructure = nil;

function SOMTEntryCCClassData: PSOMTEntryCCClassDataStructure;
begin
  if Assigned(_SOMTEntryCCClassData) then
    Result := _SOMTEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTEntryCCClassData, 'SOMTEntryCCClassData');
    Result := _SOMTEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTEntryCClassData.classObject;
end;


function SOMTEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTAttributeEntryC_MajorVersion = 2;
  SOMTAttributeEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTAttributeEntryCNewClass(
  somtmajorVersion: integer4 = SOMTAttributeEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTAttributeEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTAttributeEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTAttributeEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtIsReadonly,_get_somtAttribType,somtGetFirstAttributeDeclarator,somtGetNextAttributeDeclarator,somtGetFirstGetMethod,somtGetNextGetMethod,somtGetFirstSetMethod,somtGetNextSetMethod: somMToken;
  end;
  PSOMTAttributeEntryCClassDataStructure = ^SOMTAttributeEntryCClassDataStructure;

var
  _SOMTAttributeEntryCClassData: PSOMTAttributeEntryCClassDataStructure = nil;

function SOMTAttributeEntryCClassData: PSOMTAttributeEntryCClassDataStructure;
begin
  if Assigned(_SOMTAttributeEntryCClassData) then
    Result := _SOMTAttributeEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTAttributeEntryCClassData, 'SOMTAttributeEntryCClassData');
    Result := _SOMTAttributeEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTAttributeEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTAttributeEntryCCClassDataStructure = ^SOMTAttributeEntryCCClassDataStructure;

var
  _SOMTAttributeEntryCCClassData: PSOMTAttributeEntryCCClassDataStructure = nil;

function SOMTAttributeEntryCCClassData: PSOMTAttributeEntryCCClassDataStructure;
begin
  if Assigned(_SOMTAttributeEntryCCClassData) then
    Result := _SOMTAttributeEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTAttributeEntryCCClassData, 'SOMTAttributeEntryCCClassData');
    Result := _SOMTAttributeEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTAttributeEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTAttributeEntryCClassData.classObject;
end;


function SOMTAttributeEntryC._get_somtIsReadonly: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtAttribType: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetFirstAttributeDeclarator: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetNextAttributeDeclarator: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetFirstGetMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetNextGetMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetFirstSetMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetNextSetMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTAttributeEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTAttributeEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTBaseClassEntryC_MajorVersion = 2;
  SOMTBaseClassEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTBaseClassEntryCNewClass(
  somtmajorVersion: integer4 = SOMTBaseClassEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTBaseClassEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTBaseClassEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTBaseClassEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtBaseClassDef: somMToken;
  end;
  PSOMTBaseClassEntryCClassDataStructure = ^SOMTBaseClassEntryCClassDataStructure;

var
  _SOMTBaseClassEntryCClassData: PSOMTBaseClassEntryCClassDataStructure = nil;

function SOMTBaseClassEntryCClassData: PSOMTBaseClassEntryCClassDataStructure;
begin
  if Assigned(_SOMTBaseClassEntryCClassData) then
    Result := _SOMTBaseClassEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTBaseClassEntryCClassData, 'SOMTBaseClassEntryCClassData');
    Result := _SOMTBaseClassEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTBaseClassEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTBaseClassEntryCCClassDataStructure = ^SOMTBaseClassEntryCCClassDataStructure;

var
  _SOMTBaseClassEntryCCClassData: PSOMTBaseClassEntryCCClassDataStructure = nil;

function SOMTBaseClassEntryCCClassData: PSOMTBaseClassEntryCCClassDataStructure;
begin
  if Assigned(_SOMTBaseClassEntryCCClassData) then
    Result := _SOMTBaseClassEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTBaseClassEntryCCClassData, 'SOMTBaseClassEntryCCClassData');
    Result := _SOMTBaseClassEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTBaseClassEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTBaseClassEntryCClassData.classObject;
end;


function SOMTBaseClassEntryC._get_somtBaseClassDef: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTBaseClassEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTBaseClassEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTClassEntryC_MajorVersion = 2;
  SOMTClassEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTClassEntryCNewClass(
  somtmajorVersion: integer4 = SOMTClassEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTClassEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTClassEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTClassEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtSourceFileName,_get_somtMetaClassEntry,_get_somtNewMethodCount,_get_somtLocalInclude,_get_somtPrivateMethodCount,_get_somtStaticMethodCount,_get_somtOverrideMethodCount,_get_somtProcMethodCount,_get_somtVAMethodCount,_get_somtBaseCount,_get_somtExternalDataCount,_get_somtPublicDataCount,_get_somtPrivateDataCount,somtGetFirstBaseClass,somtGetNextBaseClass,somtGetFirstReleaseName,somtGetNextReleaseName,somtGetReleaseNameList,somtGetFirstPassthru,somtGetNextPassthru,somtGetFirstData,somtGetNextData,somtGetFirstMethod,somtGetNextMethod,somtGetFirstInheritedMethod,somtGetNextInheritedMethod,somtFilterNew,somtFilterOverridden,somtFilterPrivOrPub,_get_somtMetaclassFor,_get_somtForwardRef,somtGetFirstAttribute,somtGetNextAttribute,somtGetFirstStruct,somtGetNextStruct,somtGetFirstTypedef,somtGetNextTypedef,somtGetFirstUnion,somtGetNextUnion,somtGetFirstEnum,somtGetNextEnum,somtGetFirstConstant,somtGetNextConstant,somtGetFirstSequence,somtGetNextSequence,_get_somtClassModule,somtGetFirstPubdef,somtGetNextPubdef,somtGetFirstStaticData,somtGetNextStaticData: somMToken;
  end;
  PSOMTClassEntryCClassDataStructure = ^SOMTClassEntryCClassDataStructure;

var
  _SOMTClassEntryCClassData: PSOMTClassEntryCClassDataStructure = nil;

function SOMTClassEntryCClassData: PSOMTClassEntryCClassDataStructure;
begin
  if Assigned(_SOMTClassEntryCClassData) then
    Result := _SOMTClassEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTClassEntryCClassData, 'SOMTClassEntryCClassData');
    Result := _SOMTClassEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTClassEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTClassEntryCCClassDataStructure = ^SOMTClassEntryCCClassDataStructure;

var
  _SOMTClassEntryCCClassData: PSOMTClassEntryCCClassDataStructure = nil;

function SOMTClassEntryCCClassData: PSOMTClassEntryCCClassDataStructure;
begin
  if Assigned(_SOMTClassEntryCCClassData) then
    Result := _SOMTClassEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTClassEntryCCClassData, 'SOMTClassEntryCCClassData');
    Result := _SOMTClassEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTClassEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTClassEntryCClassData.classObject;
end;


function SOMTClassEntryC._get_somtSourceFileName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtMetaClassEntry: SOMTMetaClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtClassModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtNewMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtLocalInclude: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtPrivateMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtStaticMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtOverrideMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtProcMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtVAMethodCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtBaseCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtExternalDataCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtPublicDataCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtPrivateDataCount: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtMetaclassFor: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtForwardRef: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstBaseClass: SOMTBaseClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextBaseClass: SOMTBaseClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstReleaseName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextReleaseName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetReleaseNameList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstPassthru: SOMTPassthruEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextPassthru: SOMTPassthruEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstData: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextData: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstStaticData: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextStaticData: SOMTDataEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstInheritedMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextInheritedMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstAttribute: SOMTAttributeEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextAttribute: SOMTAttributeEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstStruct: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextStruct: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstUnion: SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextUnion: SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstEnum: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextEnum: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstConstant: SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextConstant: SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstSequence: SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextSequence: SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstPubdef: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextPubdef: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtFilterNew(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtFilterOverridden(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtFilterPrivOrPub(entry: SOMTCommonEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTClassEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTClassEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTCommonEntryC_MajorVersion = 2;
  SOMTCommonEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTCommonEntryCNewClass(
  somtmajorVersion: integer4 = SOMTCommonEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTCommonEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTCommonEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTCommonEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtSourceText,_get_somtType,_get_somtVisibility,somtIsArray,somtIsPointer,somtIsArrayDominant,_get_somtTypeObj,_get_somtPtrs,_get_somtArrayDimsString,somtGetFirstArrayDimension,somtGetNextArrayDimension: somMToken;
  end;
  PSOMTCommonEntryCClassDataStructure = ^SOMTCommonEntryCClassDataStructure;

var
  _SOMTCommonEntryCClassData: PSOMTCommonEntryCClassDataStructure = nil;

function SOMTCommonEntryCClassData: PSOMTCommonEntryCClassDataStructure;
begin
  if Assigned(_SOMTCommonEntryCClassData) then
    Result := _SOMTCommonEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTCommonEntryCClassData, 'SOMTCommonEntryCClassData');
    Result := _SOMTCommonEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTCommonEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTCommonEntryCCClassDataStructure = ^SOMTCommonEntryCCClassDataStructure;

var
  _SOMTCommonEntryCCClassData: PSOMTCommonEntryCCClassDataStructure = nil;

function SOMTCommonEntryCCClassData: PSOMTCommonEntryCCClassDataStructure;
begin
  if Assigned(_SOMTCommonEntryCCClassData) then
    Result := _SOMTCommonEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTCommonEntryCCClassData, 'SOMTCommonEntryCCClassData');
    Result := _SOMTCommonEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTCommonEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTCommonEntryCClassData.classObject;
end;


function SOMTCommonEntryC._get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTCommonEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTCommonEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTConstEntryC_MajorVersion = 2;
  SOMTConstEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTConstEntryCNewClass(
  somtmajorVersion: integer4 = SOMTConstEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTConstEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTConstEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTConstEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtConstStringVal,_get_somtConstNumVal,_get_somtConstType,_get_somtConstTypeObj,_get_somtConstVal,_get_somtConstNumNegVal,_get_somtConstIsNegative: somMToken;
  end;
  PSOMTConstEntryCClassDataStructure = ^SOMTConstEntryCClassDataStructure;

var
  _SOMTConstEntryCClassData: PSOMTConstEntryCClassDataStructure = nil;

function SOMTConstEntryCClassData: PSOMTConstEntryCClassDataStructure;
begin
  if Assigned(_SOMTConstEntryCClassData) then
    Result := _SOMTConstEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTConstEntryCClassData, 'SOMTConstEntryCClassData');
    Result := _SOMTConstEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTConstEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTConstEntryCCClassDataStructure = ^SOMTConstEntryCCClassDataStructure;

var
  _SOMTConstEntryCCClassData: PSOMTConstEntryCCClassDataStructure = nil;

function SOMTConstEntryCCClassData: PSOMTConstEntryCCClassDataStructure;
begin
  if Assigned(_SOMTConstEntryCCClassData) then
    Result := _SOMTConstEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTConstEntryCCClassData, 'SOMTConstEntryCCClassData');
    Result := _SOMTConstEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTConstEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTConstEntryCClassData.classObject;
end;


function SOMTConstEntryC._get_somtConstTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstStringVal: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstNumVal: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstNumNegVal: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstIsNegative: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtConstVal: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTConstEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTConstEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTDataEntryC_MajorVersion = 2;
  SOMTDataEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTDataEntryCNewClass(
  somtmajorVersion: integer4 = SOMTDataEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTDataEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTDataEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTDataEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtIsSelfRef: somMToken;
  end;
  PSOMTDataEntryCClassDataStructure = ^SOMTDataEntryCClassDataStructure;

var
  _SOMTDataEntryCClassData: PSOMTDataEntryCClassDataStructure = nil;

function SOMTDataEntryCClassData: PSOMTDataEntryCClassDataStructure;
begin
  if Assigned(_SOMTDataEntryCClassData) then
    Result := _SOMTDataEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTDataEntryCClassData, 'SOMTDataEntryCClassData');
    Result := _SOMTDataEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTDataEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTDataEntryCCClassDataStructure = ^SOMTDataEntryCCClassDataStructure;

var
  _SOMTDataEntryCCClassData: PSOMTDataEntryCCClassDataStructure = nil;

function SOMTDataEntryCCClassData: PSOMTDataEntryCCClassDataStructure;
begin
  if Assigned(_SOMTDataEntryCCClassData) then
    Result := _SOMTDataEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTDataEntryCCClassData, 'SOMTDataEntryCCClassData');
    Result := _SOMTDataEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTDataEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTDataEntryCClassData.classObject;
end;


function SOMTDataEntryC._get_somtIsSelfRef: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTDataEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTDataEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTEmitC_MajorVersion = 2;
  SOMTEmitC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTEmitCNewClass(
  somtmajorVersion: integer4 = SOMTEmitC_MajorVersion;
  somtminorVersion: integer4 = SOMTEmitC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTEmitCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTEmitCClassDataStructure = record
    classObject: SOMClass;
    _get_somtTemplate,_get_somtTargetFile,_set_somtTargetFile,_get_somtTargetClass,_set_somtTargetClass,_get_somtTargetModule,_set_somtTargetModule,_get_somtTargetType,_set_somtTargetType,somtGenerateSections,somtOpenSymbolsFile,somtSetPredefinedSymbols,somtFileSymbols,somtEmitProlog,somtEmitBaseIncludesProlog,somtEmitBaseIncludes,somtEmitBaseIncludesEpilog,somtEmitMetaInclude,somtEmitClass,somtEmitMeta,somtEmitBaseProlog,somtEmitBase,somtEmitBaseEpilog,somtEmitPassthruProlog,somtEmitPassthru,somtEmitPassthruEpilog,somtEmitRelease,somtEmitDataProlog,somtEmitData,somtEmitDataEpilog,somtEmitMethodsProlog,somtEmitMethods,somtEmitMethodsEpilog,somtEmitMethod,somtEmitEpilog,somtScanBases,somtScanConstants,somtCheckVisibility,somtNew,somtImplemented,somtOverridden,somtInherited,somtAllVisible,somtAll,somtNewNoProc,somtPrivOrPub,somtNewProc,somtLink,somtVA,somtScanMethods,somtScanData,somtScanPassthru,somtEmitFullPassthru,somtScanDataF,somtScanBasesF,_set_somtTemplate,_set_somtEmitterName,_get_somtEmitterName,somtEmitAttributeProlog,somtEmitAttribute,somtEmitAttributeEpilog,somtEmitConstantProlog,somtEmitConstant,somtEmitConstantEpilog,somtEmitTypedefProlog,somtEmitTypedef,somtEmitTypedefEpilog,somtEmitStructProlog,somtEmitStruct,somtEmitStructEpilog,somtEmitUnionProlog,somtEmitUnion,somtEmitUnionEpilog,somtEmitEnumProlog,somtEmitEnum,somtEmitEnumEpilog,somtEmitInterfaceProlog,somtEmitInterface,somtEmitInterfaceEpilog,somtEmitModuleProlog,somtEmitModule,somtEmitModuleEpilog,somtScanAttributes,somtScanTypedefs,somtScanStructs,somtScanUnions,somtScanEnums,somtScanInterfaces,somtScanModules,somtGetGlobalModifierValue,somtGetFirstGlobalDefinition,somtGetNextGlobalDefinition: somMToken;
  end;
  PSOMTEmitCClassDataStructure = ^SOMTEmitCClassDataStructure;

var
  _SOMTEmitCClassData: PSOMTEmitCClassDataStructure = nil;

function SOMTEmitCClassData: PSOMTEmitCClassDataStructure;
begin
  if Assigned(_SOMTEmitCClassData) then
    Result := _SOMTEmitCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTEmitCClassData, 'SOMTEmitCClassData');
    Result := _SOMTEmitCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTEmitCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTEmitCCClassDataStructure = ^SOMTEmitCCClassDataStructure;

var
  _SOMTEmitCCClassData: PSOMTEmitCCClassDataStructure = nil;

function SOMTEmitCCClassData: PSOMTEmitCCClassDataStructure;
begin
  if Assigned(_SOMTEmitCCClassData) then
    Result := _SOMTEmitCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTEmitCCClassData, 'SOMTEmitCCClassData');
    Result := _SOMTEmitCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTEmitC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTEmitCClassData.classObject;
end;


function SOMTEmitC._get_somtTemplate: SOMTTemplateOutputC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTemplate(somtTemplate: SOMTTemplateOutputC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC._get_somtTargetFile: PSOM_FILE; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTargetFile(somtTargetFile: PSOM_FILE); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC._get_somtTargetClass: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTargetClass(somtTargetClass: SOMTClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC._get_somtTargetModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTargetModule(somtTargetModule: SOMTModuleEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC._get_somtTargetType: SOMTTargetTypeT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC._set_somtTargetType(somtTargetType: SOMTTargetTypeT); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC._get_somtEmitterName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC._set_somtEmitterName(somtEmitterName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtGenerateSections: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtOpenSymbolsFile(SOM_file: CORBAString; mode: CORBAString): PSOM_FILE; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtSetPredefinedSymbols; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtFileSymbols; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseIncludesProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseIncludes(base: SOMTBaseClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseIncludesEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMetaInclude; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMeta; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBase(base: SOMTBaseClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitBaseEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitPassthruProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitPassthru(entry: SOMTPassthruEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitPassthruEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitRelease; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitDataProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitData(entry: SOMTDataEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitDataEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitAttributeProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitAttribute(att: SOMTAttributeEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitAttributeEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitConstantProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitConstant(con: SOMTConstEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitConstantEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitTypedefProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitTypedef(td: SOMTTypedefEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitTypedefEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitStructProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitStruct(struc: SOMTStructEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitStructEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitUnionProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitUnion(un: SOMTUnionEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitUnionEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitEnumProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitEnum(en: SOMTEnumEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitEnumEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitInterfaceProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitInterface(intfc: SOMTClassEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitInterfaceEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitModuleProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitModule(SOM_mod: SOMTModuleEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitModuleEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMethodsProlog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMethods(method: SOMTMethodEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMethodsEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitMethod(entry: SOMTMethodEntryC); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitEpilog; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanBases(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtCheckVisibility(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtNew(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtImplemented(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtOverridden(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtInherited(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtAllVisible(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtAll(entry: SOMTMethodEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtNewNoProc(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtPrivOrPub(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtNewProc(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtLink(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtVA(entry: SOMTEntryC): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanMethods(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanConstants(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanTypedefs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanStructs(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanUnions(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanEnums(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanData(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanAttributes(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanInterfaces(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanModules(prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanPassthru(before: CORBABoolean; prolog: CORBAString; each: CORBAString; epilog: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somtEmitFullPassthru(before: CORBABoolean; language: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanDataF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtScanBasesF(filter: CORBAString; prolog: CORBAString; each: CORBAString; epilog: CORBAString; forceProlog: CORBABoolean): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtGetGlobalModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtGetFirstGlobalDefinition: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somtGetNextGlobalDefinition: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEmitC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEmitC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTEnumEntryC_MajorVersion = 2;
  SOMTEnumEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTEnumEntryCNewClass(
  somtmajorVersion: integer4 = SOMTEnumEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTEnumEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTEnumEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTEnumEntryCClassDataStructure = record
    classObject: SOMClass;
    somtGetFirstEnumName,somtGetNextEnumName: somMToken;
  end;
  PSOMTEnumEntryCClassDataStructure = ^SOMTEnumEntryCClassDataStructure;

var
  _SOMTEnumEntryCClassData: PSOMTEnumEntryCClassDataStructure = nil;

function SOMTEnumEntryCClassData: PSOMTEnumEntryCClassDataStructure;
begin
  if Assigned(_SOMTEnumEntryCClassData) then
    Result := _SOMTEnumEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTEnumEntryCClassData, 'SOMTEnumEntryCClassData');
    Result := _SOMTEnumEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTEnumEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTEnumEntryCCClassDataStructure = ^SOMTEnumEntryCCClassDataStructure;

var
  _SOMTEnumEntryCCClassData: PSOMTEnumEntryCCClassDataStructure = nil;

function SOMTEnumEntryCCClassData: PSOMTEnumEntryCCClassDataStructure;
begin
  if Assigned(_SOMTEnumEntryCCClassData) then
    Result := _SOMTEnumEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTEnumEntryCCClassData, 'SOMTEnumEntryCCClassData');
    Result := _SOMTEnumEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTEnumEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTEnumEntryCClassData.classObject;
end;


function SOMTEnumEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetFirstEnumName: SOMTEnumNameEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetNextEnumName: SOMTEnumNameEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTEnumNameEntryC_MajorVersion = 2;
  SOMTEnumNameEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTEnumNameEntryCNewClass(
  somtmajorVersion: integer4 = SOMTEnumNameEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTEnumNameEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTEnumNameEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTEnumNameEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtEnumPtr,_get_somtEnumVal: somMToken;
  end;
  PSOMTEnumNameEntryCClassDataStructure = ^SOMTEnumNameEntryCClassDataStructure;

var
  _SOMTEnumNameEntryCClassData: PSOMTEnumNameEntryCClassDataStructure = nil;

function SOMTEnumNameEntryCClassData: PSOMTEnumNameEntryCClassDataStructure;
begin
  if Assigned(_SOMTEnumNameEntryCClassData) then
    Result := _SOMTEnumNameEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTEnumNameEntryCClassData, 'SOMTEnumNameEntryCClassData');
    Result := _SOMTEnumNameEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTEnumNameEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTEnumNameEntryCCClassDataStructure = ^SOMTEnumNameEntryCCClassDataStructure;

var
  _SOMTEnumNameEntryCCClassData: PSOMTEnumNameEntryCCClassDataStructure = nil;

function SOMTEnumNameEntryCCClassData: PSOMTEnumNameEntryCCClassDataStructure;
begin
  if Assigned(_SOMTEnumNameEntryCCClassData) then
    Result := _SOMTEnumNameEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTEnumNameEntryCCClassData, 'SOMTEnumNameEntryCCClassData');
    Result := _SOMTEnumNameEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTEnumNameEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTEnumNameEntryCClassData.classObject;
end;


function SOMTEnumNameEntryC._get_somtEnumPtr: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtEnumVal: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTEnumNameEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTEnumNameEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTMetaClassEntryC_MajorVersion = 2;
  SOMTMetaClassEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTMetaClassEntryCNewClass(
  somtmajorVersion: integer4 = SOMTMetaClassEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTMetaClassEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTMetaClassEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTMetaClassEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtMetaFile,_get_somtMetaClassDef: somMToken;
  end;
  PSOMTMetaClassEntryCClassDataStructure = ^SOMTMetaClassEntryCClassDataStructure;

var
  _SOMTMetaClassEntryCClassData: PSOMTMetaClassEntryCClassDataStructure = nil;

function SOMTMetaClassEntryCClassData: PSOMTMetaClassEntryCClassDataStructure;
begin
  if Assigned(_SOMTMetaClassEntryCClassData) then
    Result := _SOMTMetaClassEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTMetaClassEntryCClassData, 'SOMTMetaClassEntryCClassData');
    Result := _SOMTMetaClassEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTMetaClassEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTMetaClassEntryCCClassDataStructure = ^SOMTMetaClassEntryCCClassDataStructure;

var
  _SOMTMetaClassEntryCCClassData: PSOMTMetaClassEntryCCClassDataStructure = nil;

function SOMTMetaClassEntryCCClassData: PSOMTMetaClassEntryCCClassDataStructure;
begin
  if Assigned(_SOMTMetaClassEntryCCClassData) then
    Result := _SOMTMetaClassEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTMetaClassEntryCCClassData, 'SOMTMetaClassEntryCCClassData');
    Result := _SOMTMetaClassEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTMetaClassEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTMetaClassEntryCClassData.classObject;
end;


function SOMTMetaClassEntryC._get_somtMetaFile: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtMetaClassDef: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMetaClassEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMetaClassEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTMethodEntryC_MajorVersion = 2;
  SOMTMethodEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTMethodEntryCNewClass(
  somtmajorVersion: integer4 = SOMTMethodEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTMethodEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTMethodEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTMethodEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtIsVarargs,_get_somtOriginalMethod,_get_somtOriginalClass,_get_somtMethodGroup,somtGetFirstParameter,somtGetNextParameter,somtGetArgList,somtGetParmList,_get_somtIsPrivateMethod,_get_somtIsOneway,_get_somtArgCount,somtGetFirstException,somtGetNextException,_get_somtContextArray,somtGetShortCPrototype,somtGetFullCPrototype,somtGetShortParmList,somtGetFullParmList,somtGetNthParameter,_get_somtCReturnType,somtGetIDLParamList,somtGetShortCParamList,somtGetFullCParamList,somtGetShortParamNameList,somtGetFullParamNameList: somMToken;
  end;
  PSOMTMethodEntryCClassDataStructure = ^SOMTMethodEntryCClassDataStructure;

var
  _SOMTMethodEntryCClassData: PSOMTMethodEntryCClassDataStructure = nil;

function SOMTMethodEntryCClassData: PSOMTMethodEntryCClassDataStructure;
begin
  if Assigned(_SOMTMethodEntryCClassData) then
    Result := _SOMTMethodEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTMethodEntryCClassData, 'SOMTMethodEntryCClassData');
    Result := _SOMTMethodEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTMethodEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTMethodEntryCCClassDataStructure = ^SOMTMethodEntryCCClassDataStructure;

var
  _SOMTMethodEntryCCClassData: PSOMTMethodEntryCCClassDataStructure = nil;

function SOMTMethodEntryCCClassData: PSOMTMethodEntryCCClassDataStructure;
begin
  if Assigned(_SOMTMethodEntryCCClassData) then
    Result := _SOMTMethodEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTMethodEntryCCClassData, 'SOMTMethodEntryCCClassData');
    Result := _SOMTMethodEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTMethodEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTMethodEntryCClassData.classObject;
end;


function SOMTMethodEntryC._get_somtIsVarargs: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtOriginalMethod: SOMTMethodEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtOriginalClass: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtMethodGroup: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtIsPrivateMethod: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtIsOneway: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtArgCount: SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtContextArray: PCORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtCReturnType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFirstParameter: SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNextParameter: SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetIDLParamList(buffer: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetShortCParamList(buffer: CORBAString; selfParm: CORBAString; varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFullCParamList(buffer: CORBAString; varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetShortParamNameList(buffer: CORBAString; selfParm: CORBAString; varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFullParamNameList(buffer: CORBAString; varargsParm: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNthParameter(n: SmallInt): SOMTParameterEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFirstException: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNextException: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTMethodEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTMethodEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTModuleEntryC_MajorVersion = 2;
  SOMTModuleEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTModuleEntryCNewClass(
  somtmajorVersion: integer4 = SOMTModuleEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTModuleEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTModuleEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTModuleEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtOuterModule,somtGetFirstModuleStruct,somtGetNextModuleStruct,somtGetFirstModuleTypedef,somtGetNextModuleTypedef,somtGetFirstModuleUnion,somtGetNextModuleUnion,somtGetFirstModuleEnum,somtGetNextModuleEnum,somtGetFirstModuleConstant,somtGetNextModuleConstant,somtGetFirstModuleSequence,somtGetNextModuleSequence,somtGetFirstInterface,somtGetNextInterface,somtGetFirstModule,somtGetNextModule,somtGetFirstModuleDef,somtGetNextModuleDef,_get_somtModuleFile: somMToken;
  end;
  PSOMTModuleEntryCClassDataStructure = ^SOMTModuleEntryCClassDataStructure;

var
  _SOMTModuleEntryCClassData: PSOMTModuleEntryCClassDataStructure = nil;

function SOMTModuleEntryCClassData: PSOMTModuleEntryCClassDataStructure;
begin
  if Assigned(_SOMTModuleEntryCClassData) then
    Result := _SOMTModuleEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTModuleEntryCClassData, 'SOMTModuleEntryCClassData');
    Result := _SOMTModuleEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTModuleEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTModuleEntryCCClassDataStructure = ^SOMTModuleEntryCCClassDataStructure;

var
  _SOMTModuleEntryCCClassData: PSOMTModuleEntryCCClassDataStructure = nil;

function SOMTModuleEntryCCClassData: PSOMTModuleEntryCCClassDataStructure;
begin
  if Assigned(_SOMTModuleEntryCCClassData) then
    Result := _SOMTModuleEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTModuleEntryCCClassData, 'SOMTModuleEntryCCClassData');
    Result := _SOMTModuleEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTModuleEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTModuleEntryCClassData.classObject;
end;


function SOMTModuleEntryC._get_somtOuterModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtModuleFile: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleStruct: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleStruct: SOMTStructEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleUnion: SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleUnion: SOMTUnionEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleEnum: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleEnum: SOMTEnumEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleConstant: SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleConstant: SOMTConstEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleSequence: SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleSequence: SOMTSequenceEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstInterface: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextInterface: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModule: SOMTModuleEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModuleDef: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModuleDef: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTModuleEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTModuleEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTParameterEntryC_MajorVersion = 2;
  SOMTParameterEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTParameterEntryCNewClass(
  somtmajorVersion: integer4 = SOMTParameterEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTParameterEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTParameterEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTParameterEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtParameterDirection,_get_somtCParameterDeclaration,_get_somtIDLParameterDeclaration: somMToken;
  end;
  PSOMTParameterEntryCClassDataStructure = ^SOMTParameterEntryCClassDataStructure;

var
  _SOMTParameterEntryCClassData: PSOMTParameterEntryCClassDataStructure = nil;

function SOMTParameterEntryCClassData: PSOMTParameterEntryCClassDataStructure;
begin
  if Assigned(_SOMTParameterEntryCClassData) then
    Result := _SOMTParameterEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTParameterEntryCClassData, 'SOMTParameterEntryCClassData');
    Result := _SOMTParameterEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTParameterEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTParameterEntryCCClassDataStructure = ^SOMTParameterEntryCCClassDataStructure;

var
  _SOMTParameterEntryCCClassData: PSOMTParameterEntryCCClassDataStructure = nil;

function SOMTParameterEntryCCClassData: PSOMTParameterEntryCCClassDataStructure;
begin
  if Assigned(_SOMTParameterEntryCCClassData) then
    Result := _SOMTParameterEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTParameterEntryCCClassData, 'SOMTParameterEntryCCClassData');
    Result := _SOMTParameterEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTParameterEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTParameterEntryCClassData.classObject;
end;


function SOMTParameterEntryC._get_somtParameterDirection: somtParameterDirectionT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtIDLParameterDeclaration: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtCParameterDeclaration: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTParameterEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTParameterEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTPassthruEntryC_MajorVersion = 2;
  SOMTPassthruEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTPassthruEntryCNewClass(
  somtmajorVersion: integer4 = SOMTPassthruEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTPassthruEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTPassthruEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTPassthruEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtPassthruBody,_get_somtPassthruTarget,_get_somtPassthruLanguage,somtIsBeforePassthru: somMToken;
  end;
  PSOMTPassthruEntryCClassDataStructure = ^SOMTPassthruEntryCClassDataStructure;

var
  _SOMTPassthruEntryCClassData: PSOMTPassthruEntryCClassDataStructure = nil;

function SOMTPassthruEntryCClassData: PSOMTPassthruEntryCClassDataStructure;
begin
  if Assigned(_SOMTPassthruEntryCClassData) then
    Result := _SOMTPassthruEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTPassthruEntryCClassData, 'SOMTPassthruEntryCClassData');
    Result := _SOMTPassthruEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTPassthruEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTPassthruEntryCCClassDataStructure = ^SOMTPassthruEntryCCClassDataStructure;

var
  _SOMTPassthruEntryCCClassData: PSOMTPassthruEntryCCClassDataStructure = nil;

function SOMTPassthruEntryCCClassData: PSOMTPassthruEntryCCClassDataStructure;
begin
  if Assigned(_SOMTPassthruEntryCCClassData) then
    Result := _SOMTPassthruEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTPassthruEntryCCClassData, 'SOMTPassthruEntryCCClassData');
    Result := _SOMTPassthruEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTPassthruEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTPassthruEntryCClassData.classObject;
end;


function SOMTPassthruEntryC._get_somtPassthruBody: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtPassthruLanguage: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtPassthruTarget: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somtIsBeforePassthru: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTPassthruEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTPassthruEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTSequenceEntryC_MajorVersion = 2;
  SOMTSequenceEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTSequenceEntryCNewClass(
  somtmajorVersion: integer4 = SOMTSequenceEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTSequenceEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTSequenceEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTSequenceEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtSeqLength,_get_somtSeqType,_get_somtSeqTypedef: somMToken;
  end;
  PSOMTSequenceEntryCClassDataStructure = ^SOMTSequenceEntryCClassDataStructure;

var
  _SOMTSequenceEntryCClassData: PSOMTSequenceEntryCClassDataStructure = nil;

function SOMTSequenceEntryCClassData: PSOMTSequenceEntryCClassDataStructure;
begin
  if Assigned(_SOMTSequenceEntryCClassData) then
    Result := _SOMTSequenceEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTSequenceEntryCClassData, 'SOMTSequenceEntryCClassData');
    Result := _SOMTSequenceEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTSequenceEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTSequenceEntryCCClassDataStructure = ^SOMTSequenceEntryCCClassDataStructure;

var
  _SOMTSequenceEntryCCClassData: PSOMTSequenceEntryCCClassDataStructure = nil;

function SOMTSequenceEntryCCClassData: PSOMTSequenceEntryCCClassDataStructure;
begin
  if Assigned(_SOMTSequenceEntryCCClassData) then
    Result := _SOMTSequenceEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTSequenceEntryCCClassData, 'SOMTSequenceEntryCCClassData');
    Result := _SOMTSequenceEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTSequenceEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTSequenceEntryCClassData.classObject;
end;


function SOMTSequenceEntryC._get_somtSeqLength: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtSeqType: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTSequenceEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTSequenceEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTStringEntryC_MajorVersion = 2;
  SOMTStringEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTStringEntryCNewClass(
  somtmajorVersion: integer4 = SOMTStringEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTStringEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTStringEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTStringEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtStringLength: somMToken;
  end;
  PSOMTStringEntryCClassDataStructure = ^SOMTStringEntryCClassDataStructure;

var
  _SOMTStringEntryCClassData: PSOMTStringEntryCClassDataStructure = nil;

function SOMTStringEntryCClassData: PSOMTStringEntryCClassDataStructure;
begin
  if Assigned(_SOMTStringEntryCClassData) then
    Result := _SOMTStringEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTStringEntryCClassData, 'SOMTStringEntryCClassData');
    Result := _SOMTStringEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTStringEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTStringEntryCCClassDataStructure = ^SOMTStringEntryCCClassDataStructure;

var
  _SOMTStringEntryCCClassData: PSOMTStringEntryCCClassDataStructure = nil;

function SOMTStringEntryCCClassData: PSOMTStringEntryCCClassDataStructure;
begin
  if Assigned(_SOMTStringEntryCCClassData) then
    Result := _SOMTStringEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTStringEntryCCClassData, 'SOMTStringEntryCCClassData');
    Result := _SOMTStringEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTStringEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTStringEntryCClassData.classObject;
end;


function SOMTStringEntryC._get_somtStringLength: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStringEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStringEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTStructEntryC_MajorVersion = 2;
  SOMTStructEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTStructEntryCNewClass(
  somtmajorVersion: integer4 = SOMTStructEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTStructEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTStructEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTStructEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtStructClass,_get_somtIsException,somtGetFirstMember,somtGetNextMember: somMToken;
  end;
  PSOMTStructEntryCClassDataStructure = ^SOMTStructEntryCClassDataStructure;

var
  _SOMTStructEntryCClassData: PSOMTStructEntryCClassDataStructure = nil;

function SOMTStructEntryCClassData: PSOMTStructEntryCClassDataStructure;
begin
  if Assigned(_SOMTStructEntryCClassData) then
    Result := _SOMTStructEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTStructEntryCClassData, 'SOMTStructEntryCClassData');
    Result := _SOMTStructEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTStructEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTStructEntryCCClassDataStructure = ^SOMTStructEntryCCClassDataStructure;

var
  _SOMTStructEntryCCClassData: PSOMTStructEntryCCClassDataStructure = nil;

function SOMTStructEntryCCClassData: PSOMTStructEntryCCClassDataStructure;
begin
  if Assigned(_SOMTStructEntryCCClassData) then
    Result := _SOMTStructEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTStructEntryCCClassData, 'SOMTStructEntryCCClassData');
    Result := _SOMTStructEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTStructEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTStructEntryCClassData.classObject;
end;


function SOMTStructEntryC._get_somtStructClass: SOMTClassEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtIsException: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somtGetFirstMember: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somtGetNextMember: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTStructEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTStructEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTTypedefEntryC_MajorVersion = 2;
  SOMTTypedefEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTTypedefEntryCNewClass(
  somtmajorVersion: integer4 = SOMTTypedefEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTTypedefEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTTypedefEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTTypedefEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtTypedefType,somtGetFirstDeclarator,somtGetNextDeclarator: somMToken;
  end;
  PSOMTTypedefEntryCClassDataStructure = ^SOMTTypedefEntryCClassDataStructure;

var
  _SOMTTypedefEntryCClassData: PSOMTTypedefEntryCClassDataStructure = nil;

function SOMTTypedefEntryCClassData: PSOMTTypedefEntryCClassDataStructure;
begin
  if Assigned(_SOMTTypedefEntryCClassData) then
    Result := _SOMTTypedefEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTTypedefEntryCClassData, 'SOMTTypedefEntryCClassData');
    Result := _SOMTTypedefEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTTypedefEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTTypedefEntryCCClassDataStructure = ^SOMTTypedefEntryCCClassDataStructure;

var
  _SOMTTypedefEntryCCClassData: PSOMTTypedefEntryCCClassDataStructure = nil;

function SOMTTypedefEntryCCClassData: PSOMTTypedefEntryCCClassDataStructure;
begin
  if Assigned(_SOMTTypedefEntryCCClassData) then
    Result := _SOMTTypedefEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTTypedefEntryCCClassData, 'SOMTTypedefEntryCCClassData');
    Result := _SOMTTypedefEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTTypedefEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTTypedefEntryCClassData.classObject;
end;


function SOMTTypedefEntryC._get_somtTypedefType: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetFirstDeclarator: SOMTCommonEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetNextDeclarator: SOMTCommonEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTypedefEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTypedefEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTTemplateOutputC_MajorVersion = 2;
  SOMTTemplateOutputC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTTemplateOutputCNewClass(
  somtmajorVersion: integer4 = SOMTTemplateOutputC_MajorVersion;
  somtminorVersion: integer4 = SOMTTemplateOutputC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTTemplateOutputCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTTemplateOutputCClassDataStructure = record
    classObject: SOMClass;
    _get_somtCommentStyle,_set_somtCommentStyle,_get_somtLineLength,_set_somtLineLength,_set_somtCommentNewline,_get_somtCommentNewline,somtGetSymbol,somtSetSymbol,somtSetSymbolCopyName,somtSetSymbolCopyValue,somtSetSymbolCopyBoth,somtCheckSymbol,somtSetOutputFile,somto,somtOutputComment,somtOutputSection,somtAddSectionDefinitions,somtReadSectionDefinitions,somtExpandSymbol: somMToken;
  end;
  PSOMTTemplateOutputCClassDataStructure = ^SOMTTemplateOutputCClassDataStructure;

var
  _SOMTTemplateOutputCClassData: PSOMTTemplateOutputCClassDataStructure = nil;

function SOMTTemplateOutputCClassData: PSOMTTemplateOutputCClassDataStructure;
begin
  if Assigned(_SOMTTemplateOutputCClassData) then
    Result := _SOMTTemplateOutputCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTTemplateOutputCClassData, 'SOMTTemplateOutputCClassData');
    Result := _SOMTTemplateOutputCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTTemplateOutputCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTTemplateOutputCCClassDataStructure = ^SOMTTemplateOutputCCClassDataStructure;

var
  _SOMTTemplateOutputCCClassData: PSOMTTemplateOutputCCClassDataStructure = nil;

function SOMTTemplateOutputCCClassData: PSOMTTemplateOutputCCClassDataStructure;
begin
  if Assigned(_SOMTTemplateOutputCCClassData) then
    Result := _SOMTTemplateOutputCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTTemplateOutputCCClassData, 'SOMTTemplateOutputCCClassData');
    Result := _SOMTTemplateOutputCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTTemplateOutputC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTTemplateOutputCClassData.classObject;
end;


function SOMTTemplateOutputC._get_somtCommentStyle: somtCommentStyleT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC._set_somtCommentStyle(somtCommentStyle: somtCommentStyleT); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC._get_somtLineLength: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC._set_somtLineLength(somtLineLength: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC._get_somtCommentNewline: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC._set_somtCommentNewline(somtCommentNewline: CORBABoolean); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somtGetSymbol(name: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetSymbol(name: CORBAString; value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetSymbolCopyName(name: CORBAString; value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetSymbolCopyValue(name: CORBAString; value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetSymbolCopyBoth(name: CORBAString; value: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somtCheckSymbol(name: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtSetOutputFile(var fp{: opaque SOM_FILE}); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somto(tmplt: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtOutputComment(comment: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtOutputSection(sectionName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtAddSectionDefinitions(defString: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somtReadSectionDefinitions(var fp{: opaque SOM_FILE}); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somtExpandSymbol(s: CORBAString; buf: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTTemplateOutputC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTTemplateOutputC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTUnionEntryC_MajorVersion = 2;
  SOMTUnionEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTUnionEntryCNewClass(
  somtmajorVersion: integer4 = SOMTUnionEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTUnionEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTUnionEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTUnionEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtSwitchType,somtGetFirstCaseEntry,somtGetNextCaseEntry: somMToken;
  end;
  PSOMTUnionEntryCClassDataStructure = ^SOMTUnionEntryCClassDataStructure;

var
  _SOMTUnionEntryCClassData: PSOMTUnionEntryCClassDataStructure = nil;

function SOMTUnionEntryCClassData: PSOMTUnionEntryCClassDataStructure;
begin
  if Assigned(_SOMTUnionEntryCClassData) then
    Result := _SOMTUnionEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTUnionEntryCClassData, 'SOMTUnionEntryCClassData');
    Result := _SOMTUnionEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTUnionEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTUnionEntryCCClassDataStructure = ^SOMTUnionEntryCCClassDataStructure;

var
  _SOMTUnionEntryCCClassData: PSOMTUnionEntryCCClassDataStructure = nil;

function SOMTUnionEntryCCClassData: PSOMTUnionEntryCCClassDataStructure;
begin
  if Assigned(_SOMTUnionEntryCCClassData) then
    Result := _SOMTUnionEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTUnionEntryCCClassData, 'SOMTUnionEntryCCClassData');
    Result := _SOMTUnionEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTUnionEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTUnionEntryCClassData.classObject;
end;


function SOMTUnionEntryC._get_somtSwitchType: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetFirstCaseEntry: PSOMTUnionEntryC_somtCaseEntry; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetNextCaseEntry: PSOMTUnionEntryC_somtCaseEntry; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUnionEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUnionEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMTUserDefinedTypeEntryC_MajorVersion = 2;
  SOMTUserDefinedTypeEntryC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMTUserDefinedTypeEntryCNewClass(
  somtmajorVersion: integer4 = SOMTUserDefinedTypeEntryC_MajorVersion;
  somtminorVersion: integer4 = SOMTUserDefinedTypeEntryC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMTUserDefinedTypeEntryCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMTUserDefinedTypeEntryCClassDataStructure = record
    classObject: SOMClass;
    _get_somtOriginalTypedef,_get_somtBaseTypeObj: somMToken;
  end;
  PSOMTUserDefinedTypeEntryCClassDataStructure = ^SOMTUserDefinedTypeEntryCClassDataStructure;

var
  _SOMTUserDefinedTypeEntryCClassData: PSOMTUserDefinedTypeEntryCClassDataStructure = nil;

function SOMTUserDefinedTypeEntryCClassData: PSOMTUserDefinedTypeEntryCClassDataStructure;
begin
  if Assigned(_SOMTUserDefinedTypeEntryCClassData) then
    Result := _SOMTUserDefinedTypeEntryCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTUserDefinedTypeEntryCClassData, 'SOMTUserDefinedTypeEntryCClassData');
    Result := _SOMTUserDefinedTypeEntryCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMTUserDefinedTypeEntryCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMTUserDefinedTypeEntryCCClassDataStructure = ^SOMTUserDefinedTypeEntryCCClassDataStructure;

var
  _SOMTUserDefinedTypeEntryCCClassData: PSOMTUserDefinedTypeEntryCCClassDataStructure = nil;

function SOMTUserDefinedTypeEntryCCClassData: PSOMTUserDefinedTypeEntryCCClassDataStructure;
begin
  if Assigned(_SOMTUserDefinedTypeEntryCCClassData) then
    Result := _SOMTUserDefinedTypeEntryCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMTUserDefinedTypeEntryCCClassData, 'SOMTUserDefinedTypeEntryCCClassData');
    Result := _SOMTUserDefinedTypeEntryCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMTUserDefinedTypeEntryC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMTUserDefinedTypeEntryCClassData.classObject;
end;


function SOMTUserDefinedTypeEntryC._get_somtOriginalTypedef: SOMTTypedefEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtBaseTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtTypeObj: SOMTEntryC; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtPtrs: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtArrayDimsString: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtSourceText: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtType: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtVisibility: somtVisibilityT; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtEntryName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC._set_somtEntryName(somtEntryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtElementType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC._set_somtElementType(somtElementType: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtElementTypeName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtEntryComment: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtSourceLineNumber: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtTypeCode: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtIsReference: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtIDLScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC._get_somtCScopedName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetFirstArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetNextArrayDimension: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtIsArray(out size: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtIsPointer: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetModifierValue(modifierName: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetFirstModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetNextModifier(var modifierName: CORBAString; var modifierValue: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtFormatModifier(buffer: CORBAString; name: CORBAString; value: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtGetModifierList(buffer: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somtSetSymbolsOnEntry(emitter: SOMTEmitC; prefix: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somtSetEntryStruct(var es: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMTUserDefinedTypeEntryC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMTUserDefinedTypeEntryC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMDServerMgr_MajorVersion = 2;
  SOMDServerMgr_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMDServerMgrNewClass(
  somtmajorVersion: integer4 = SOMDServerMgr_MajorVersion;
  somtminorVersion: integer4 = SOMDServerMgr_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'SOMDServerMgrNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMDServerMgrClassDataStructure = record
    classObject: SOMClass;
    somdShutdownServer,somdStartServer,somdRestartServer,somdListServer,somdDisableServer,somdEnableServer,somdIsServerEnabled: somMToken;
  end;
  PSOMDServerMgrClassDataStructure = ^SOMDServerMgrClassDataStructure;

var
  SOMD_DLL_SOMDServerMgrClassData: PSOMDServerMgrClassDataStructure = nil;

function SOMDServerMgrClassData: PSOMDServerMgrClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDServerMgrClassData) then
    Result := SOMD_DLL_SOMDServerMgrClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDServerMgrClassData, 'SOMDServerMgrClassData');
    Result := SOMD_DLL_SOMDServerMgrClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMDServerMgrCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMDServerMgrCClassDataStructure = ^SOMDServerMgrCClassDataStructure;

var
  SOMD_DLL_SOMDServerMgrCClassData: PSOMDServerMgrCClassDataStructure = nil;

function SOMDServerMgrCClassData: PSOMDServerMgrCClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDServerMgrCClassData) then
    Result := SOMD_DLL_SOMDServerMgrCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDServerMgrCClassData, 'SOMDServerMgrCClassData');
    Result := SOMD_DLL_SOMDServerMgrCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMDServerMgr: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMDServerMgrClassData.classObject;
end;


function SOMDServerMgr.somdShutdownServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somdStartServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somdRestartServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somdListServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somdDisableServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somdEnableServer(server_alias: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somdIsServerEnabled(impldef: ImplementationDef): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServerMgr.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServerMgr.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMESinkEvent_MajorVersion = 2;
  SOMESinkEvent_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMESinkEventNewClass(
  somtmajorVersion: integer4 = SOMESinkEvent_MajorVersion;
  somtminorVersion: integer4 = SOMESinkEvent_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMESinkEventNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMESinkEventClassDataStructure = record
    classObject: SOMClass;
    somevGetEventSink,somevSetEventSink: somMToken;
  end;
  PSOMESinkEventClassDataStructure = ^SOMESinkEventClassDataStructure;

var
  _SOMESinkEventClassData: PSOMESinkEventClassDataStructure = nil;

function SOMESinkEventClassData: PSOMESinkEventClassDataStructure;
begin
  if Assigned(_SOMESinkEventClassData) then
    Result := _SOMESinkEventClassData
  else
  begin
    SOMIR_Load_Variable(_SOMESinkEventClassData, 'SOMESinkEventClassData');
    Result := _SOMESinkEventClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMESinkEventCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMESinkEventCClassDataStructure = ^SOMESinkEventCClassDataStructure;

var
  _SOMESinkEventCClassData: PSOMESinkEventCClassDataStructure = nil;

function SOMESinkEventCClassData: PSOMESinkEventCClassDataStructure;
begin
  if Assigned(_SOMESinkEventCClassData) then
    Result := _SOMESinkEventCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMESinkEventCClassData, 'SOMESinkEventCClassData');
    Result := _SOMESinkEventCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMESinkEvent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMESinkEventClassData.classObject;
end;


function SOMESinkEvent.somevGetEventSink: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somevSetEventSink(sink: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMESinkEvent.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMESinkEvent.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMClass_MajorVersion = 1;
  SOMClass_MinorVersion = 4;

(*
 * Declare the class creation procedure
 *)
function SOMClassNewClass(
  somtmajorVersion: integer4 = SOMClass_MajorVersion;
  somtminorVersion: integer4 = SOMClass_MinorVersion):
  SOMClass; stdcall; external SOM_DLL_Name name 'SOMClassNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMClassClassDataStructure = record
    classObject: SOMClass;
    somNew,somRenew,somInitClass,somClassReady,somGetName,somGetParent,somDescendedFrom,somCheckVersion,somFindMethod,somFindMethodOk,somSupportsMethod,somGetNumMethods,somGetInstanceSize,somGetInstanceOffset,somGetInstancePartSize,somGetMethodIndex,somGetNumStaticMethods,somGetPClsMtab,somGetClassMtab,somAddStaticMethod,somOverrideSMethod,somAddDynamicMethod,somcPrivate0,somGetApplyStub,somFindSMethod,somFindSMethodOk,somGetMethodDescriptor,somGetNthMethodInfo,somSetClassData,somGetClassData,somNewNoInit,somRenewNoInit,somGetInstanceToken,somGetMemberToken,somSetMethodDescriptor,somGetMethodData,somOverrideMtab,somGetMethodToken,somGetParents,somGetPClsMtabs,somInitMIClass,somGetVersionNumbers,somLookupMethod,_get_somInstanceDataOffsets,somRenewNoZero,somRenewNoInitNoZero,somAllocate,somDeallocate,somGetRdStub,somGetNthMethodData,somcPrivate1,somcPrivate2,_get_somDirectInitClasses,_set_somDirectInitClasses,somGetInstanceInitMask,somGetInstanceDestructionMask,somcPrivate3,somcPrivate4,somcPrivate5,somcPrivate6,somcPrivate7,somDefinedMethod,somcPrivate8,somcPrivate9,somcPrivate10,somcPrivate11,somcPrivate12,somcPrivate13,somcPrivate14,somcPrivate15,_get_somDataAlignment,somGetInstanceAssignmentMask,somcPrivate16,somcPrivate17,_get_somClassAllocate,_get_somClassDeallocate: somMToken;
  end;
  PSOMClassClassDataStructure = ^SOMClassClassDataStructure;

var
  SOM_DLL_SOMClassClassData: PSOMClassClassDataStructure = nil;

function SOMClassClassData: PSOMClassClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMClassClassData) then
    Result := SOM_DLL_SOMClassClassData
  else
  begin
    SOMIR_Load_Variable(SOM_DLL_SOMClassClassData, 'SOMClassClassData');
    Result := SOM_DLL_SOMClassClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMClassCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMClassCClassDataStructure = ^SOMClassCClassDataStructure;

var
  SOM_DLL_SOMClassCClassData: PSOMClassCClassDataStructure = nil;

function SOMClassCClassData: PSOMClassCClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMClassCClassData) then
    Result := SOM_DLL_SOMClassCClassData
  else
  begin
    SOMIR_Load_Variable(SOM_DLL_SOMClassCClassData, 'SOMClassCClassData');
    Result := SOM_DLL_SOMClassCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMClassClassData.classObject;
end;


function SOMClass._get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass._get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass._set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass._get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass._get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClass.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClass.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMMSingleInstance_MajorVersion = 2;
  SOMMSingleInstance_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMMSingleInstanceNewClass(
  somtmajorVersion: integer4 = SOMMSingleInstance_MajorVersion;
  somtminorVersion: integer4 = SOMMSingleInstance_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMMSingleInstanceNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMMSingleInstanceClassDataStructure = record
    classObject: SOMClass;
    sommGetSingleInstance,sommFreeSingleInstance: somMToken;
  end;
  PSOMMSingleInstanceClassDataStructure = ^SOMMSingleInstanceClassDataStructure;

var
  _SOMMSingleInstanceClassData: PSOMMSingleInstanceClassDataStructure = nil;

function SOMMSingleInstanceClassData: PSOMMSingleInstanceClassDataStructure;
begin
  if Assigned(_SOMMSingleInstanceClassData) then
    Result := _SOMMSingleInstanceClassData
  else
  begin
    SOMIR_Load_Variable(_SOMMSingleInstanceClassData, 'SOMMSingleInstanceClassData');
    Result := _SOMMSingleInstanceClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMMSingleInstanceCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMMSingleInstanceCClassDataStructure = ^SOMMSingleInstanceCClassDataStructure;

var
  _SOMMSingleInstanceCClassData: PSOMMSingleInstanceCClassDataStructure = nil;

function SOMMSingleInstanceCClassData: PSOMMSingleInstanceCClassDataStructure;
begin
  if Assigned(_SOMMSingleInstanceCClassData) then
    Result := _SOMMSingleInstanceCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMMSingleInstanceCClassData, 'SOMMSingleInstanceCClassData');
    Result := _SOMMSingleInstanceCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMMSingleInstance: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMMSingleInstanceClassData.classObject;
end;


function SOMMSingleInstance._get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance._get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance._set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance._get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance._get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.sommGetSingleInstance: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.sommFreeSingleInstance; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMSingleInstance.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMSingleInstance.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMMBeforeAfter_MajorVersion = 2;
  SOMMBeforeAfter_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMMBeforeAfterNewClass(
  somtmajorVersion: integer4 = SOMMBeforeAfter_MajorVersion;
  somtminorVersion: integer4 = SOMMBeforeAfter_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMMBeforeAfterNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMMBeforeAfterClassDataStructure = record
    classObject: SOMClass;
    sommBeforeMethod,sommAfterMethod: somMToken;
  end;
  PSOMMBeforeAfterClassDataStructure = ^SOMMBeforeAfterClassDataStructure;

var
  _SOMMBeforeAfterClassData: PSOMMBeforeAfterClassDataStructure = nil;

function SOMMBeforeAfterClassData: PSOMMBeforeAfterClassDataStructure;
begin
  if Assigned(_SOMMBeforeAfterClassData) then
    Result := _SOMMBeforeAfterClassData
  else
  begin
    SOMIR_Load_Variable(_SOMMBeforeAfterClassData, 'SOMMBeforeAfterClassData');
    Result := _SOMMBeforeAfterClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMMBeforeAfterCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMMBeforeAfterCClassDataStructure = ^SOMMBeforeAfterCClassDataStructure;

var
  _SOMMBeforeAfterCClassData: PSOMMBeforeAfterCClassDataStructure = nil;

function SOMMBeforeAfterCClassData: PSOMMBeforeAfterCClassDataStructure;
begin
  if Assigned(_SOMMBeforeAfterCClassData) then
    Result := _SOMMBeforeAfterCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMMBeforeAfterCClassData, 'SOMMBeforeAfterCClassData');
    Result := _SOMMBeforeAfterCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMMBeforeAfter: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMMBeforeAfterClassData.classObject;
end;


function SOMMBeforeAfter._get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter._get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter._set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter._get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter._get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.sommBeforeMethod(SOM_object: SOMObject; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.sommAfterMethod(SOM_object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMBeforeAfter.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMBeforeAfter.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMClassMgr_MajorVersion = 1;
  SOMClassMgr_MinorVersion = 4;

(*
 * Declare the class creation procedure
 *)
function SOMClassMgrNewClass(
  somtmajorVersion: integer4 = SOMClassMgr_MajorVersion;
  somtminorVersion: integer4 = SOMClassMgr_MinorVersion):
  SOMClass; stdcall; external SOM_DLL_Name name 'SOMClassMgrNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMClassMgrClassDataStructure = record
    classObject: SOMClass;
    somFindClsInFile,somFindClass,somClassFromId,somRegisterClass,somUnregisterClass,somLocateClassFile,somLoadClassFile,somUnloadClassFile,somGetInitFunction,somMergeInto,somGetRelatedClasses,somSubstituteClass,_get_somInterfaceRepository,_set_somInterfaceRepository,_get_somRegisteredClasses,somBeginPersistentClasses,somEndPersistentClasses,somcmPrivate1,somcmPrivate2,somRegisterClassLibrary,somJoinAffinityGroup,somUnregisterClassLibrary: somMToken;
  end;
  PSOMClassMgrClassDataStructure = ^SOMClassMgrClassDataStructure;

var
  SOM_DLL_SOMClassMgrClassData: PSOMClassMgrClassDataStructure = nil;

function SOMClassMgrClassData: PSOMClassMgrClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMClassMgrClassData) then
    Result := SOM_DLL_SOMClassMgrClassData
  else
  begin
    SOMIR_Load_Variable(SOM_DLL_SOMClassMgrClassData, 'SOMClassMgrClassData');
    Result := SOM_DLL_SOMClassMgrClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMClassMgrCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMClassMgrCClassDataStructure = ^SOMClassMgrCClassDataStructure;

var
  SOM_DLL_SOMClassMgrCClassData: PSOMClassMgrCClassDataStructure = nil;

function SOMClassMgrCClassData: PSOMClassMgrCClassDataStructure;
begin
  if Assigned(SOM_DLL_SOMClassMgrCClassData) then
    Result := SOM_DLL_SOMClassMgrCClassData
  else
  begin
    SOMIR_Load_Variable(SOM_DLL_SOMClassMgrCClassData, 'SOMClassMgrCClassData');
    Result := SOM_DLL_SOMClassMgrCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMClassMgr: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMClassMgrClassData.classObject;
end;


function SOMClassMgr._get_somInterfaceRepository: Repository; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr._set_somInterfaceRepository(somInterfaceRepository: Repository); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr._get_somRegisteredClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somLoadClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; SOM_file: CORBAString): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somLocateClassFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somRegisterClass(classObj: SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somRegisterClassLibrary(libraryName: CORBAString; libraryInitRtn: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somUnregisterClassLibrary(libraryName: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somUnloadClassFile(classObj: SOMClass): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somUnregisterClass(classObj: SOMClass): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somBeginPersistentClasses; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somEndPersistentClasses; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somJoinAffinityGroup(newClass: SOMClass; affClass: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somGetInitFunction: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somGetRelatedClasses(classObj: SOMClass): PSOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somClassFromId(classId: somId): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somFindClass(classId: somId; majorVersion: LongInt; minorVersion: LongInt): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somFindClsInFile(classId: somId; majorVersion: LongInt; minorVersion: LongInt; SOM_file: CORBAString): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somMergeInto(targetObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somSubstituteClass(origClassName: CORBAString; newClassName: CORBAString): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMClassMgr.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMClassMgr.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMDObject_MajorVersion = 2;
  SOMDObject_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMDObjectNewClass(
  somtmajorVersion: integer4 = SOMDObject_MajorVersion;
  somtminorVersion: integer4 = SOMDObject_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'SOMDObjectNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMDObjectClassDataStructure = record
    classObject: SOMClass;
    get_implementation,get_interface,set_to_nil,is_nil,is_SOM_ref,is_constant,is_proxy,duplicate,release,create_request,create_request_args,_get_somd_tag,_get_somd_flags,_set_somd_flags,_get_somd_impl,_set_somd_impl,_get_somd_rid,_set_somd_rid,_get_somd_id,_set_somd_id: somMToken;
  end;
  PSOMDObjectClassDataStructure = ^SOMDObjectClassDataStructure;

var
  SOMD_DLL_SOMDObjectClassData: PSOMDObjectClassDataStructure = nil;

function SOMDObjectClassData: PSOMDObjectClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDObjectClassData) then
    Result := SOMD_DLL_SOMDObjectClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDObjectClassData, 'SOMDObjectClassData');
    Result := SOMD_DLL_SOMDObjectClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMDObjectCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMDObjectCClassDataStructure = ^SOMDObjectCClassDataStructure;

var
  SOMD_DLL_SOMDObjectCClassData: PSOMDObjectCClassDataStructure = nil;

function SOMDObjectCClassData: PSOMDObjectCClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDObjectCClassData) then
    Result := SOMD_DLL_SOMDObjectCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDObjectCClassData, 'SOMDObjectCClassData');
    Result := SOMD_DLL_SOMDObjectCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMDObject: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMDObjectClassData.classObject;
end;


function SOMDObject.get_implementation: ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.get_interface: InterfaceDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.is_nil: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.is_SOM_ref: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.is_constant: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.is_proxy: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.duplicate: SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.release; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var SOM_result: NamedValue; out request: Request; req_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.create_request_args(operation: CORBAString; out arg_list: NVList; out SOM_result: NamedValue): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObject.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObject.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMDClientProxy_MajorVersion = 2;
  SOMDClientProxy_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMDClientProxyNewClass(
  somtmajorVersion: integer4 = SOMDClientProxy_MajorVersion;
  somtminorVersion: integer4 = SOMDClientProxy_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'SOMDClientProxyNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMDClientProxyClassDataStructure = record
    classObject: SOMClass;
    somdTargetFree,somdTargetGetClass,somdTargetGetClassName,somdProxyFree,somdProxyGetClass,somdProxyGetClassName,set_binding,get_binding,reset_binding,_get_ctx_seq,_set_ctx_seq,somdReleaseResources,_get_memoryMgr: somMToken;
  end;
  PSOMDClientProxyClassDataStructure = ^SOMDClientProxyClassDataStructure;

var
  SOMD_DLL_SOMDClientProxyClassData: PSOMDClientProxyClassDataStructure = nil;

function SOMDClientProxyClassData: PSOMDClientProxyClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDClientProxyClassData) then
    Result := SOMD_DLL_SOMDClientProxyClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDClientProxyClassData, 'SOMDClientProxyClassData');
    Result := SOMD_DLL_SOMDClientProxyClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMDClientProxyCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMDClientProxyCClassDataStructure = ^SOMDClientProxyCClassDataStructure;

var
  SOMD_DLL_SOMDClientProxyCClassData: PSOMDClientProxyCClassDataStructure = nil;

function SOMDClientProxyCClassData: PSOMDClientProxyCClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDClientProxyCClassData) then
    Result := SOMD_DLL_SOMDClientProxyCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDClientProxyCClassData, 'SOMDClientProxyCClassData');
    Result := SOMD_DLL_SOMDClientProxyCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMDClientProxy: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMDClientProxyClassData.classObject;
end;


procedure SOMDClientProxy.somdTargetFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somdTargetGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somdTargetGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somdProxyFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somdProxyGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somdProxyGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somdReleaseResources; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.get_implementation: ImplementationDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.get_interface: InterfaceDef; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.is_nil: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.is_SOM_ref: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.is_constant: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.is_proxy: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.duplicate: SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.release; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.create_request(ctx: Context; operation: CORBAString; arg_list: NVList; var SOM_result: NamedValue; out request: Request; req_flags: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.create_request_args(operation: CORBAString; out arg_list: NVList; out SOM_result: NamedValue): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDClientProxy.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDClientProxy.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMDMetaproxy_MajorVersion = 0;
  SOMDMetaproxy_MinorVersion = 0;

(*
 * Declare the class creation procedure
 *)
function SOMDMetaproxyNewClass(
  somtmajorVersion: integer4 = SOMDMetaproxy_MajorVersion;
  somtminorVersion: integer4 = SOMDMetaproxy_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMDMetaproxyNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMDMetaproxyClassDataStructure = record
    classObject: SOMClass;
    : somMToken;
  end;
  PSOMDMetaproxyClassDataStructure = ^SOMDMetaproxyClassDataStructure;

var
  _SOMDMetaproxyClassData: PSOMDMetaproxyClassDataStructure = nil;

function SOMDMetaproxyClassData: PSOMDMetaproxyClassDataStructure;
begin
  if Assigned(_SOMDMetaproxyClassData) then
    Result := _SOMDMetaproxyClassData
  else
  begin
    SOMIR_Load_Variable(_SOMDMetaproxyClassData, 'SOMDMetaproxyClassData');
    Result := _SOMDMetaproxyClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMDMetaproxyCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMDMetaproxyCClassDataStructure = ^SOMDMetaproxyCClassDataStructure;

var
  _SOMDMetaproxyCClassData: PSOMDMetaproxyCClassDataStructure = nil;

function SOMDMetaproxyCClassData: PSOMDMetaproxyCClassDataStructure;
begin
  if Assigned(_SOMDMetaproxyCClassData) then
    Result := _SOMDMetaproxyCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMDMetaproxyCClassData, 'SOMDMetaproxyCClassData');
    Result := _SOMDMetaproxyCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMDMetaproxy: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMDMetaproxyClassData.classObject;
end;


function SOMDMetaproxy._get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy._get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy._set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy._get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy._get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDMetaproxy.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDMetaproxy.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMDObjectMgr_MajorVersion = 2;
  SOMDObjectMgr_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMDObjectMgrNewClass(
  somtmajorVersion: integer4 = SOMDObjectMgr_MajorVersion;
  somtminorVersion: integer4 = SOMDObjectMgr_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'SOMDObjectMgrNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMDObjectMgrClassDataStructure = record
    classObject: SOMClass;
    somdFindServer,somdFindServerByName,somdFindServersByClass,somdFindAnyServerByClass,_get_somd21somFree,_set_somd21somFree: somMToken;
  end;
  PSOMDObjectMgrClassDataStructure = ^SOMDObjectMgrClassDataStructure;

var
  SOMD_DLL_SOMDObjectMgrClassData: PSOMDObjectMgrClassDataStructure = nil;

function SOMDObjectMgrClassData: PSOMDObjectMgrClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDObjectMgrClassData) then
    Result := SOMD_DLL_SOMDObjectMgrClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDObjectMgrClassData, 'SOMDObjectMgrClassData');
    Result := SOMD_DLL_SOMDObjectMgrClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMDObjectMgrCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMDObjectMgrCClassDataStructure = ^SOMDObjectMgrCClassDataStructure;

var
  SOMD_DLL_SOMDObjectMgrCClassData: PSOMDObjectMgrCClassDataStructure = nil;

function SOMDObjectMgrCClassData: PSOMDObjectMgrCClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDObjectMgrCClassData) then
    Result := SOMD_DLL_SOMDObjectMgrCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDObjectMgrCClassData, 'SOMDObjectMgrCClassData');
    Result := SOMD_DLL_SOMDObjectMgrCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMDObjectMgr: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMDObjectMgrClassData.classObject;
end;


function SOMDObjectMgr._get_somd21somFree: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr._set_somd21somFree(somd21somFree: CORBABoolean); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somdFindServer(serverid: CORBAString): SOMDServer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somdFindServerByName(servername: CORBAString): SOMDServer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somdFindServersByClass(objclass: CORBAString): _IDL_Sequence_SOMDServer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somdFindAnyServerByClass(objclass: CORBAString): SOMDServer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somdNewObject(objclass: CORBAString; hints: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somdGetIdFromObject(obj: SOMObject): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somdGetObjectFromId(id: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somdReleaseObject(obj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somdDestroyObject(obj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDObjectMgr.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDObjectMgr.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMDServer_MajorVersion = 2;
  SOMDServer_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMDServerNewClass(
  somtmajorVersion: integer4 = SOMDServer_MajorVersion;
  somtminorVersion: integer4 = SOMDServer_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'SOMDServerNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMDServerClassDataStructure = record
    classObject: SOMClass;
    somdSOMObjFromRef,somdRefFromSOMObj,somdCreateObj,somdDeleteObj,somdGetClassObj,somdDispatchMethod,somdObjReferencesCached: somMToken;
  end;
  PSOMDServerClassDataStructure = ^SOMDServerClassDataStructure;

var
  SOMD_DLL_SOMDServerClassData: PSOMDServerClassDataStructure = nil;

function SOMDServerClassData: PSOMDServerClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDServerClassData) then
    Result := SOMD_DLL_SOMDServerClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDServerClassData, 'SOMDServerClassData');
    Result := SOMD_DLL_SOMDServerClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMDServerCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMDServerCClassDataStructure = ^SOMDServerCClassDataStructure;

var
  SOMD_DLL_SOMDServerCClassData: PSOMDServerCClassDataStructure = nil;

function SOMDServerCClassData: PSOMDServerCClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMDServerCClassData) then
    Result := SOMD_DLL_SOMDServerCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMDServerCClassData, 'SOMDServerCClassData');
    Result := SOMD_DLL_SOMDServerCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMDServer: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMDServerClassData.classObject;
end;


function SOMDServer.somdRefFromSOMObj(somobj: SOMObject): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somdSOMObjFromRef(objref: SOMDObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somdDispatchMethod(somobj: SOMObject; out retValue: Pointer; methodId: somId; ap: va_list); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somdCreateObj(objclass: CORBAString; hints: CORBAString): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somdDeleteObj(somobj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somdGetClassObj(objclass: CORBAString): SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somdObjReferencesCached: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMDServer.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMDServer.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMUTId_MajorVersion = 2;
  SOMUTId_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMUTIdNewClass(
  somtmajorVersion: integer4 = SOMUTId_MajorVersion;
  somtminorVersion: integer4 = SOMUTId_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMUTIdNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMUTIdClassDataStructure = record
    classObject: SOMClass;
    somutSetIdId,somutEqualsId,somutCompareId,somutHashId: somMToken;
  end;
  PSOMUTIdClassDataStructure = ^SOMUTIdClassDataStructure;

var
  _SOMUTIdClassData: PSOMUTIdClassDataStructure = nil;

function SOMUTIdClassData: PSOMUTIdClassDataStructure;
begin
  if Assigned(_SOMUTIdClassData) then
    Result := _SOMUTIdClassData
  else
  begin
    SOMIR_Load_Variable(_SOMUTIdClassData, 'SOMUTIdClassData');
    Result := _SOMUTIdClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMUTIdCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMUTIdCClassDataStructure = ^SOMUTIdCClassDataStructure;

var
  _SOMUTIdCClassData: PSOMUTIdCClassDataStructure = nil;

function SOMUTIdCClassData: PSOMUTIdCClassDataStructure;
begin
  if Assigned(_SOMUTIdCClassData) then
    Result := _SOMUTIdCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMUTIdCClassData, 'SOMUTIdCClassData');
    Result := _SOMUTIdCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMUTId: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMUTIdClassData.classObject;
end;


procedure SOMUTId.somutSetIdId(otherId: SOMUTId); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somutEqualsId(otherId: SOMUTId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somutCompareId(otherId: SOMUTId): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somutHashId: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMUTId.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMUTId.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMOA_MajorVersion = 2;
  SOMOA_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMOANewClass(
  somtmajorVersion: integer4 = SOMOA_MajorVersion;
  somtminorVersion: integer4 = SOMOA_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'SOMOANewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMOAClassDataStructure = record
    classObject: SOMClass;
    execute_next_request,execute_request_loop,create_constant,change_id,create_SOM_ref,get_SOM_object,activate_impl_failed,interrupt_server: somMToken;
  end;
  PSOMOAClassDataStructure = ^SOMOAClassDataStructure;

var
  SOMD_DLL_SOMOAClassData: PSOMOAClassDataStructure = nil;

function SOMOAClassData: PSOMOAClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMOAClassData) then
    Result := SOMD_DLL_SOMOAClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMOAClassData, 'SOMOAClassData');
    Result := SOMD_DLL_SOMOAClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMOACClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMOACClassDataStructure = ^SOMOACClassDataStructure;

var
  SOMD_DLL_SOMOACClassData: PSOMOACClassDataStructure = nil;

function SOMOACClassData: PSOMOACClassDataStructure;
begin
  if Assigned(SOMD_DLL_SOMOACClassData) then
    Result := SOMD_DLL_SOMOACClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_SOMOACClassData, 'SOMOACClassData');
    Result := SOMD_DLL_SOMOACClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMOA: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMOAClassData.classObject;
end;


function SOMOA.execute_next_request(waitFlag: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.execute_request_loop(waitFlag: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.change_id(objref: SOMDObject; const id: _IDL_Sequence_Byte); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.create_constant(const id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.create_SOM_ref(somobj: SOMObject; impl: ImplementationDef): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.get_SOM_object(somref: SOMDObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.activate_impl_failed(impl: ImplementationDef; rc: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.interrupt_server; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.create(const id: _IDL_Sequence_Byte; intf: InterfaceDef; impl: ImplementationDef): SOMDObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.dispose(obj: SOMDObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.get_id(obj: SOMDObject): _IDL_Sequence_Byte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.get_principal(obj: SOMDObject; const req_ev: Environment): Principal; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.set_exception(major: exception_type; userid: CORBAString; param: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.impl_is_ready(impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.deactivate_impl(impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.change_implementation(obj: SOMDObject; impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.obj_is_ready(obj: SOMDObject; impl: ImplementationDef); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.deactivate_obj(obj: SOMDObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMOA.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMOA.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  Sockets_MajorVersion = 2;
  Sockets_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SocketsNewClass(
  somtmajorVersion: integer4 = Sockets_MajorVersion;
  somtminorVersion: integer4 = Sockets_MinorVersion):
  SOMClass; stdcall; external _Name name 'SocketsNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SocketsClassDataStructure = record
    classObject: SOMClass;
    somsAccept,somsBind,somsConnect,somsGethostbyaddr,somsGethostbyname,somsGethostent,somsGethostid,somsGethostname,somsGetpeername,somsGetsockname,somsGetsockopt,somsHtonl,somsHtons,somsIoctl,somsInet_addr,somsInet_lnaof,somsInet_makeaddr,somsInet_netof,somsInet_network,somsInet_ntoa,somsListen,somsNtohl,somsNtohs,somsReadv,somsRecv,somsRecvfrom,somsRecvmsg,somsSelect,somsSend,somsSendmsg,somsSendto,somsSetsockopt,somsShutdown,somsSocket,somsSoclose,somsWritev,_set_serrno,_get_serrno,somsGetservbyname: somMToken;
  end;
  PSocketsClassDataStructure = ^SocketsClassDataStructure;

var
  _SocketsClassData: PSocketsClassDataStructure = nil;

function SocketsClassData: PSocketsClassDataStructure;
begin
  if Assigned(_SocketsClassData) then
    Result := _SocketsClassData
  else
  begin
    SOMIR_Load_Variable(_SocketsClassData, 'SocketsClassData');
    Result := _SocketsClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SocketsCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSocketsCClassDataStructure = ^SocketsCClassDataStructure;

var
  _SocketsCClassData: PSocketsCClassDataStructure = nil;

function SocketsCClassData: PSocketsCClassDataStructure;
begin
  if Assigned(_SocketsCClassData) then
    Result := _SocketsCClassData
  else
  begin
    SOMIR_Load_Variable(_SocketsCClassData, 'SocketsCClassData');
    Result := _SocketsCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Sockets: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SocketsClassData.classObject;
end;


function Sockets._get_serrno: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets._set_serrno(serrno: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsAccept(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsBind(s: LongInt; var name{: opaque Sockets_sockaddr}; namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsConnect(s: LongInt; var name{: opaque Sockets_sockaddr}; namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGethostbyaddr(addr: PShortInt; addrlen: LongInt; domain: LongInt): PSockets_hostent; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGethostbyname(name: CORBAString): PSockets_hostent; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGethostent: PSockets_hostent; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGethostid: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGethostname(name: CORBAString; namelength: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGetpeername(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGetservbyname(name: CORBAString; protocol: CORBAString): PSockets_servent; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGetsockname(s: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsGetsockopt(s: LongInt; level: LongInt; optname: LongInt; optval: PShortInt; out option: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsHtonl(a: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsHtons(a: Word): Word; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsIoctl(s: LongInt; cmd: LongInt; data: PShortInt; length: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsInet_addr(cp: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsInet_lnaof(addr: Sockets_in_addr): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsInet_makeaddr(net: LongWord; lna: LongWord): Sockets_in_addr; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsInet_netof(addr: Sockets_in_addr): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsInet_network(cp: CORBAString): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsInet_ntoa(addr: Sockets_in_addr): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsListen(s: LongInt; backlog: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsNtohl(a: LongWord): LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsNtohs(a: Word): Word; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsReadv(s: LongInt; var iov{: opaque Sockets_iovec}; iovcnt: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsRecv(s: LongInt; buf: PShortInt; len: LongInt; flags: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsRecvfrom(s: LongInt; buf: PShortInt; len: LongInt; flags: LongInt; out name{: opaque Sockets_sockaddr}; out namelen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsRecvmsg(s: LongInt; var msg{: opaque Sockets_msghdr}; flags: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsSelect(nfds: LongInt; var readfds{: opaque Sockets_fd_set}; var writefds{: opaque Sockets_fd_set}; var exceptfds{: opaque Sockets_fd_set}; var timeout{: opaque Sockets_timeval}): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsSend(s: LongInt; msg: PShortInt; len: LongInt; flags: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsSendmsg(s: LongInt; var msg{: opaque Sockets_msghdr}; flags: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsSendto(s: LongInt; var msg: ShortInt; len: LongInt; flags: LongInt; var SOM_to{: opaque Sockets_sockaddr}; tolen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsSetsockopt(s: LongInt; level: LongInt; optname: LongInt; optval: PShortInt; optlen: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsShutdown(s: LongInt; how: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsSocket(domain: LongInt; SOM_type: LongInt; protocol: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsSoclose(s: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somsWritev(s: LongInt; var iov{: opaque Sockets_iovec}; iovcnt: LongInt): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function Sockets.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure Sockets.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMStringTableC_MajorVersion = 2;
  SOMStringTableC_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMStringTableCNewClass(
  somtmajorVersion: integer4 = SOMStringTableC_MajorVersion;
  somtminorVersion: integer4 = SOMStringTableC_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMStringTableCNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMStringTableCClassDataStructure = record
    classObject: SOMClass;
    _get_somstTargetCapacity,_set_somstTargetCapacity,_get_somstAssociationsCount,somstAssociate,somstAssociateCopyKey,somstAssociateCopyValue,somstAssociateCopyBoth,somstGetAssociation,somstClearAssociation,somstGetIthKey,somstGetIthValue: somMToken;
  end;
  PSOMStringTableCClassDataStructure = ^SOMStringTableCClassDataStructure;

var
  _SOMStringTableCClassData: PSOMStringTableCClassDataStructure = nil;

function SOMStringTableCClassData: PSOMStringTableCClassDataStructure;
begin
  if Assigned(_SOMStringTableCClassData) then
    Result := _SOMStringTableCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMStringTableCClassData, 'SOMStringTableCClassData');
    Result := _SOMStringTableCClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMStringTableCCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMStringTableCCClassDataStructure = ^SOMStringTableCCClassDataStructure;

var
  _SOMStringTableCCClassData: PSOMStringTableCCClassDataStructure = nil;

function SOMStringTableCCClassData: PSOMStringTableCCClassDataStructure;
begin
  if Assigned(_SOMStringTableCCClassData) then
    Result := _SOMStringTableCCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMStringTableCCClassData, 'SOMStringTableCCClassData');
    Result := _SOMStringTableCCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMStringTableC: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMStringTableCClassData.classObject;
end;


function SOMStringTableC._get_somstTargetCapacity: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC._set_somstTargetCapacity(somstTargetCapacity: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC._get_somstAssociationsCount: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somstAssociate(key: CORBAString; value: CORBAString): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somstAssociateCopyKey(key: CORBAString; value: CORBAString): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somstAssociateCopyValue(key: CORBAString; value: CORBAString): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somstAssociateCopyBoth(key: CORBAString; value: CORBAString): SmallInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somstGetAssociation(key: CORBAString): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somstClearAssociation(key: CORBAString): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somstGetIthKey(i: LongWord): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somstGetIthValue(i: LongWord): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMStringTableC.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMStringTableC.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMMTraced_MajorVersion = 2;
  SOMMTraced_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMMTracedNewClass(
  somtmajorVersion: integer4 = SOMMTraced_MajorVersion;
  somtminorVersion: integer4 = SOMMTraced_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMMTracedNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMMTracedClassDataStructure = record
    classObject: SOMClass;
    _set_sommTraceIsOn,_get_sommTraceIsOn: somMToken;
  end;
  PSOMMTracedClassDataStructure = ^SOMMTracedClassDataStructure;

var
  _SOMMTracedClassData: PSOMMTracedClassDataStructure = nil;

function SOMMTracedClassData: PSOMMTracedClassDataStructure;
begin
  if Assigned(_SOMMTracedClassData) then
    Result := _SOMMTracedClassData
  else
  begin
    SOMIR_Load_Variable(_SOMMTracedClassData, 'SOMMTracedClassData');
    Result := _SOMMTracedClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMMTracedCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMMTracedCClassDataStructure = ^SOMMTracedCClassDataStructure;

var
  _SOMMTracedCClassData: PSOMMTracedCClassDataStructure = nil;

function SOMMTracedCClassData: PSOMMTracedCClassDataStructure;
begin
  if Assigned(_SOMMTracedCClassData) then
    Result := _SOMMTracedCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMMTracedCClassData, 'SOMMTracedCClassData');
    Result := _SOMMTracedCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMMTraced: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMMTracedClassData.classObject;
end;


function SOMMTraced._get_sommTraceIsOn: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced._set_sommTraceIsOn(sommTraceIsOn: CORBABoolean); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced._get_somDataAlignment: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced._get_somInstanceDataOffsets: _IDL_Sequence_SOMClass_somOffsetInfo; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced._get_somDirectInitClasses: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced._set_somDirectInitClasses(const somDirectInitClasses: _IDL_Sequence_SOMClass); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced._get_somClassAllocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced._get_somClassDeallocate: PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.sommBeforeMethod(SOM_object: SOMObject; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.sommAfterMethod(SOM_object: SOMObject; methodId: somId; returnedvalue: Pointer; ap: va_list); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somNew: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somNewNoInit: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somRenew(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somRenewNoInit(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somRenewNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somRenewNoInitNoZero(obj: Pointer): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somAllocate(size: LongInt): CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDeallocate(memptr: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetInstanceInitMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetInstanceDestructionMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetInstanceAssignmentMask(out ctrl: Pointer): PByte; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somInitClass(className: CORBAString; parentClass: SOMClass; dataSize: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somInitMIClass(inherit_vars: LongInt; className: CORBAString; const parentClasses: _IDL_Sequence_SOMClass; dataSize: LongInt; dataAlignment: LongInt; maxStaticMethods: LongInt; majorVersion: LongInt; minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somAddStaticMethod(methodId: somId; methodDescriptor: somId; method: Pointer; redispatchStub: Pointer; applyStub: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somAddDynamicMethod(methodId: somId; methodDescriptor: somId; method: Pointer; applyStub: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somOverrideSMethod(methodId: somId; method: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somClassReady; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetClassData: PsomClassDataStructure; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somSetClassData(const cds: somClassDataStructure); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetClassMtab: PsomMethodTab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetInstanceOffset: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetInstancePartSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetInstanceSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetInstanceToken: Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetMemberToken(memberOffset: LongInt; instanceToken: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetMethodData(methodId: somId; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetRdStub(methodId: somId): PPointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetMethodDescriptor(methodId: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetMethodIndex(id: somId): LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetMethodToken(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetNthMethodData(n: LongInt; out md: somMethodDataStruct): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetNthMethodInfo(n: LongInt; out descriptor: somId): somId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetNumMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetNumStaticMethods: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetParent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetParents: _IDL_Sequence_SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetPClsMtab: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetPClsMtabs: PsomMethodTabList; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somGetVersionNumbers(out majorVersion: LongInt; out minorVersion: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somSetMethodDescriptor(methodId: somId; descriptor: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somFindMethod(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somFindMethodOk(methodId: somId; out m: Pointer): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somFindSMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somFindSMethodOk(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somLookupMethod(methodId: somId): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somCheckVersion(majorVersion: LongInt; minorVersion: LongInt): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somDescendedFrom(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somSupportsMethod(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somDefinedMethod(method: Pointer): Pointer; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somOverrideMtab; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMMTraced.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMMTraced.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMETimerEvent_MajorVersion = 2;
  SOMETimerEvent_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMETimerEventNewClass(
  somtmajorVersion: integer4 = SOMETimerEvent_MajorVersion;
  somtminorVersion: integer4 = SOMETimerEvent_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMETimerEventNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMETimerEventClassDataStructure = record
    classObject: SOMClass;
    somevGetEventInterval,somevSetEventInterval: somMToken;
  end;
  PSOMETimerEventClassDataStructure = ^SOMETimerEventClassDataStructure;

var
  _SOMETimerEventClassData: PSOMETimerEventClassDataStructure = nil;

function SOMETimerEventClassData: PSOMETimerEventClassDataStructure;
begin
  if Assigned(_SOMETimerEventClassData) then
    Result := _SOMETimerEventClassData
  else
  begin
    SOMIR_Load_Variable(_SOMETimerEventClassData, 'SOMETimerEventClassData');
    Result := _SOMETimerEventClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMETimerEventCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMETimerEventCClassDataStructure = ^SOMETimerEventCClassDataStructure;

var
  _SOMETimerEventCClassData: PSOMETimerEventCClassDataStructure = nil;

function SOMETimerEventCClassData: PSOMETimerEventCClassDataStructure;
begin
  if Assigned(_SOMETimerEventCClassData) then
    Result := _SOMETimerEventCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMETimerEventCClassData, 'SOMETimerEventCClassData');
    Result := _SOMETimerEventCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMETimerEvent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMETimerEventClassData.classObject;
end;


function SOMETimerEvent.somevGetEventInterval: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somevSetEventInterval(interval: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMETimerEvent.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMETimerEvent.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  TSIdentification_MajorVersion = 2;
  TSIdentification_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function TSIdentificationNewClass(
  somtmajorVersion: integer4 = TSIdentification_MajorVersion;
  somtminorVersion: integer4 = TSIdentification_MinorVersion):
  SOMClass; stdcall; external SOMD_DLL_Name name 'TSIdentificationNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  TSIdentificationClassDataStructure = record
    classObject: SOMClass;
    identify_sender,identify_receiver,_get_sender,_get_receiver: somMToken;
  end;
  PTSIdentificationClassDataStructure = ^TSIdentificationClassDataStructure;

var
  SOMD_DLL_TSIdentificationClassData: PTSIdentificationClassDataStructure = nil;

function TSIdentificationClassData: PTSIdentificationClassDataStructure;
begin
  if Assigned(SOMD_DLL_TSIdentificationClassData) then
    Result := SOMD_DLL_TSIdentificationClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_TSIdentificationClassData, 'TSIdentificationClassData');
    Result := SOMD_DLL_TSIdentificationClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  TSIdentificationCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PTSIdentificationCClassDataStructure = ^TSIdentificationCClassDataStructure;

var
  SOMD_DLL_TSIdentificationCClassData: PTSIdentificationCClassDataStructure = nil;

function TSIdentificationCClassData: PTSIdentificationCClassDataStructure;
begin
  if Assigned(SOMD_DLL_TSIdentificationCClassData) then
    Result := SOMD_DLL_TSIdentificationCClassData
  else
  begin
    SOMIR_Load_Variable(SOMD_DLL_TSIdentificationCClassData, 'TSIdentificationCClassData');
    Result := SOMD_DLL_TSIdentificationCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_TSIdentification: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := TSIdentificationClassData.classObject;
end;


function TSIdentification._get_sender: TSPortability_Sender; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification._get_receiver: TSPortability_Receiver; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.identify_sender(sender: TSPortability_Sender); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.identify_receiver(receiver: TSPortability_Receiver); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TSIdentification.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TSIdentification.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  TypeDef_MajorVersion = 2;
  TypeDef_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function TypeDefNewClass(
  somtmajorVersion: integer4 = TypeDef_MajorVersion;
  somtminorVersion: integer4 = TypeDef_MinorVersion):
  SOMClass; stdcall; external SOMIR_DLL_Name name 'TypeDefNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  TypeDefClassDataStructure = record
    classObject: SOMClass;
    _get_type,_set_type: somMToken;
  end;
  PTypeDefClassDataStructure = ^TypeDefClassDataStructure;

var
  SOMIR_DLL_TypeDefClassData: PTypeDefClassDataStructure = nil;

function TypeDefClassData: PTypeDefClassDataStructure;
begin
  if Assigned(SOMIR_DLL_TypeDefClassData) then
    Result := SOMIR_DLL_TypeDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_TypeDefClassData, 'TypeDefClassData');
    Result := SOMIR_DLL_TypeDefClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  TypeDefCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PTypeDefCClassDataStructure = ^TypeDefCClassDataStructure;

var
  SOMIR_DLL_TypeDefCClassData: PTypeDefCClassDataStructure = nil;

function TypeDefCClassData: PTypeDefCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_TypeDefCClassData) then
    Result := SOMIR_DLL_TypeDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_TypeDefCClassData, 'TypeDefCClassData');
    Result := SOMIR_DLL_TypeDefCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_TypeDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := TypeDefClassData.classObject;
end;


function TypeDef._get_type: TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef._set_type(SOM_type: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef._get_name: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef._set_name(name: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef._get_id: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef._set_id(id: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef._get_defined_in: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef._set_defined_in(defined_in: CORBAString); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef._get_somModifiers: _IDL_Sequence_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef._set_somModifiers(const somModifiers: _IDL_Sequence_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.within: _IDL_Sequence_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.describe: Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function TypeDef.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure TypeDef.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

const
  SOMEWorkProcEvent_MajorVersion = 2;
  SOMEWorkProcEvent_MinorVersion = 1;

(*
 * Declare the class creation procedure
 *)
function SOMEWorkProcEventNewClass(
  somtmajorVersion: integer4 = SOMEWorkProcEvent_MajorVersion;
  somtminorVersion: integer4 = SOMEWorkProcEvent_MinorVersion):
  SOMClass; stdcall; external _Name name 'SOMEWorkProcEventNewClass';

(*
 * Declare the ABI 2 ClassData structure
 *)
type
  SOMEWorkProcEventClassDataStructure = record
    classObject: SOMClass;
    : somMToken;
  end;
  PSOMEWorkProcEventClassDataStructure = ^SOMEWorkProcEventClassDataStructure;

var
  _SOMEWorkProcEventClassData: PSOMEWorkProcEventClassDataStructure = nil;

function SOMEWorkProcEventClassData: PSOMEWorkProcEventClassDataStructure;
begin
  if Assigned(_SOMEWorkProcEventClassData) then
    Result := _SOMEWorkProcEventClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEWorkProcEventClassData, 'SOMEWorkProcEventClassData');
    Result := _SOMEWorkProcEventClassData;
  end;
end;

(*
 * Declare the ABI 2 CClassData structure
 *)
type
  SOMEWorkProcEventCClassDataStructure = record
    parentMtab: somMethodTabs;
    instanceDataToken: somDToken;
  end;
  PSOMEWorkProcEventCClassDataStructure = ^SOMEWorkProcEventCClassDataStructure;

var
  _SOMEWorkProcEventCClassData: PSOMEWorkProcEventCClassDataStructure = nil;

function SOMEWorkProcEventCClassData: PSOMEWorkProcEventCClassDataStructure;
begin
  if Assigned(_SOMEWorkProcEventCClassData) then
    Result := _SOMEWorkProcEventCClassData
  else
  begin
    SOMIR_Load_Variable(_SOMEWorkProcEventCClassData, 'SOMEWorkProcEventCClassData');
    Result := _SOMEWorkProcEventCClassData;
  end;
end;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_SOMEWorkProcEvent: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := SOMEWorkProcEventClassData.classObject;
end;


function SOMEWorkProcEvent.somevGetEventTime: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somevGetEventType: LongWord; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somevSetEventTime(time: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somevSetEventType(SOM_type: LongWord); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultInit(var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDestruct(doFree: Byte; var ctrl: Pointer); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somDefaultAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultConstCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDefaultConstVCopyInit(var ctrl: Pointer; fromObj: SOMObject); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somDefaultConstAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somDefaultVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somDefaultConstVAssign(var ctrl: Pointer; fromObj: SOMObject): SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somInit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somFree; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somUninit; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somGetClass: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somGetClassName: CORBAString; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somGetSize: LongInt; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somIsA(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somIsInstanceOf(aClassObj: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somRespondsTo(mId: somId): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somDispatch(out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somClassDispatch(clsObj: SOMClass; out retValue: Pointer; methodId: somId; ap: va_list): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somCastObj(cls: SOMClass): CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somResetObj: CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

function SOMEWorkProcEvent.somPrintSelf: SOMObject; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDumpSelf(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

procedure SOMEWorkProcEvent.somDumpSelfInt(level: LongInt); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  { ... }
end;

initialization
  Windows.InitializeCriticalSection(DLLLoad_CriticalSection);
finalization
  Windows.DeleteCriticalSection(DLLLoad_CriticalSection);
end.
