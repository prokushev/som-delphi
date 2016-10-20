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

  SOMObject = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  Contained = class
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
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
    function _get_type( { ... } ): { ... };
    procedure _set_type( { ... } );
    function _get_mode( { ... } ): { ... };
    procedure _set_mode( { ... } );
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property type: { ... } read _get_type write _set_type;
    property mode: { ... } read _get_mode write _set_mode;
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
  end;

  BOA = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function create( { ... } ): { ... };
    procedure dispose( { ... } );
    function get_id( { ... } ): { ... };
    function get_principal( { ... } ): { ... };
    procedure set_exception( { ... } );
    procedure impl_is_ready( { ... } );
    procedure deactivate_impl( { ... } );
    procedure change_implementation( { ... } );
    procedure obj_is_ready( { ... } );
    procedure deactivate_obj( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  SOMTEmitC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate( { ... } ): { ... };
    procedure _set_somtTemplate( { ... } );
    function _get_somtTargetFile( { ... } ): { ... };
    procedure _set_somtTargetFile( { ... } );
    function _get_somtTargetClass( { ... } ): { ... };
    procedure _set_somtTargetClass( { ... } );
    function _get_somtTargetModule( { ... } ): { ... };
    procedure _set_somtTargetModule( { ... } );
    function _get_somtTargetType( { ... } ): { ... };
    procedure _set_somtTargetType( { ... } );
    function _get_somtEmitterName( { ... } ): { ... };
    procedure _set_somtEmitterName( { ... } );
  public
    function somtGenerateSections( { ... } ): { ... };
    function somtOpenSymbolsFile( { ... } ): { ... };
    procedure somtSetPredefinedSymbols( { ... } );
    procedure somtFileSymbols( { ... } );
    procedure somtEmitProlog( { ... } );
    procedure somtEmitBaseIncludesProlog( { ... } );
    procedure somtEmitBaseIncludes( { ... } );
    procedure somtEmitBaseIncludesEpilog( { ... } );
    procedure somtEmitMetaInclude( { ... } );
    procedure somtEmitClass( { ... } );
    procedure somtEmitMeta( { ... } );
    procedure somtEmitBaseProlog( { ... } );
    procedure somtEmitBase( { ... } );
    procedure somtEmitBaseEpilog( { ... } );
    procedure somtEmitPassthruProlog( { ... } );
    procedure somtEmitPassthru( { ... } );
    procedure somtEmitPassthruEpilog( { ... } );
    procedure somtEmitRelease( { ... } );
    procedure somtEmitDataProlog( { ... } );
    procedure somtEmitData( { ... } );
    procedure somtEmitDataEpilog( { ... } );
    procedure somtEmitAttributeProlog( { ... } );
    procedure somtEmitAttribute( { ... } );
    procedure somtEmitAttributeEpilog( { ... } );
    procedure somtEmitConstantProlog( { ... } );
    procedure somtEmitConstant( { ... } );
    procedure somtEmitConstantEpilog( { ... } );
    procedure somtEmitTypedefProlog( { ... } );
    procedure somtEmitTypedef( { ... } );
    procedure somtEmitTypedefEpilog( { ... } );
    procedure somtEmitStructProlog( { ... } );
    procedure somtEmitStruct( { ... } );
    procedure somtEmitStructEpilog( { ... } );
    procedure somtEmitUnionProlog( { ... } );
    procedure somtEmitUnion( { ... } );
    procedure somtEmitUnionEpilog( { ... } );
    procedure somtEmitEnumProlog( { ... } );
    procedure somtEmitEnum( { ... } );
    procedure somtEmitEnumEpilog( { ... } );
    procedure somtEmitInterfaceProlog( { ... } );
    procedure somtEmitInterface( { ... } );
    procedure somtEmitInterfaceEpilog( { ... } );
    procedure somtEmitModuleProlog( { ... } );
    procedure somtEmitModule( { ... } );
    procedure somtEmitModuleEpilog( { ... } );
    procedure somtEmitMethodsProlog( { ... } );
    procedure somtEmitMethods( { ... } );
    procedure somtEmitMethodsEpilog( { ... } );
    procedure somtEmitMethod( { ... } );
    procedure somtEmitEpilog( { ... } );
    function somtScanBases( { ... } ): { ... };
    function somtCheckVisibility( { ... } ): { ... };
    function somtNew( { ... } ): { ... };
    function somtImplemented( { ... } ): { ... };
    function somtOverridden( { ... } ): { ... };
    function somtInherited( { ... } ): { ... };
    function somtAllVisible( { ... } ): { ... };
    function somtAll( { ... } ): { ... };
    function somtNewNoProc( { ... } ): { ... };
    function somtPrivOrPub( { ... } ): { ... };
    function somtNewProc( { ... } ): { ... };
    function somtLink( { ... } ): { ... };
    function somtVA( { ... } ): { ... };
    function somtScanMethods( { ... } ): { ... };
    function somtScanConstants( { ... } ): { ... };
    function somtScanTypedefs( { ... } ): { ... };
    function somtScanStructs( { ... } ): { ... };
    function somtScanUnions( { ... } ): { ... };
    function somtScanEnums( { ... } ): { ... };
    function somtScanData( { ... } ): { ... };
    function somtScanAttributes( { ... } ): { ... };
    function somtScanInterfaces( { ... } ): { ... };
    function somtScanModules( { ... } ): { ... };
    function somtScanPassthru( { ... } ): { ... };
    procedure somtEmitFullPassthru( { ... } );
    function somtScanDataF( { ... } ): { ... };
    function somtScanBasesF( { ... } ): { ... };
    function somtGetGlobalModifierValue( { ... } ): { ... };
    function somtGetFirstGlobalDefinition( { ... } ): { ... };
    function somtGetNextGlobalDefinition( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtTemplate: { ... } read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: { ... } read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: { ... } read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: { ... } read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: { ... } read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: { ... } read _get_somtEmitterName write _set_somtEmitterName;
  end;

  brsclassc = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate( { ... } ): { ... };
    procedure _set_somtTemplate( { ... } );
    function _get_somtTargetFile( { ... } ): { ... };
    procedure _set_somtTargetFile( { ... } );
    function _get_somtTargetClass( { ... } ): { ... };
    procedure _set_somtTargetClass( { ... } );
    function _get_somtTargetModule( { ... } ): { ... };
    procedure _set_somtTargetModule( { ... } );
    function _get_somtTargetType( { ... } ): { ... };
    procedure _set_somtTargetType( { ... } );
    function _get_somtEmitterName( { ... } ): { ... };
    procedure _set_somtEmitterName( { ... } );
  public
    function somtGenerateSections( { ... } ): { ... };
    function somtOpenSymbolsFile( { ... } ): { ... };
    procedure somtSetPredefinedSymbols( { ... } );
    procedure somtFileSymbols( { ... } );
    procedure somtEmitProlog( { ... } );
    procedure somtEmitBaseIncludesProlog( { ... } );
    procedure somtEmitBaseIncludes( { ... } );
    procedure somtEmitBaseIncludesEpilog( { ... } );
    procedure somtEmitMetaInclude( { ... } );
    procedure somtEmitClass( { ... } );
    procedure somtEmitMeta( { ... } );
    procedure somtEmitBaseProlog( { ... } );
    procedure somtEmitBase( { ... } );
    procedure somtEmitBaseEpilog( { ... } );
    procedure somtEmitPassthruProlog( { ... } );
    procedure somtEmitPassthru( { ... } );
    procedure somtEmitPassthruEpilog( { ... } );
    procedure somtEmitRelease( { ... } );
    procedure somtEmitDataProlog( { ... } );
    procedure somtEmitData( { ... } );
    procedure somtEmitDataEpilog( { ... } );
    procedure somtEmitAttributeProlog( { ... } );
    procedure somtEmitAttribute( { ... } );
    procedure somtEmitAttributeEpilog( { ... } );
    procedure somtEmitConstantProlog( { ... } );
    procedure somtEmitConstant( { ... } );
    procedure somtEmitConstantEpilog( { ... } );
    procedure somtEmitTypedefProlog( { ... } );
    procedure somtEmitTypedef( { ... } );
    procedure somtEmitTypedefEpilog( { ... } );
    procedure somtEmitStructProlog( { ... } );
    procedure somtEmitStruct( { ... } );
    procedure somtEmitStructEpilog( { ... } );
    procedure somtEmitUnionProlog( { ... } );
    procedure somtEmitUnion( { ... } );
    procedure somtEmitUnionEpilog( { ... } );
    procedure somtEmitEnumProlog( { ... } );
    procedure somtEmitEnum( { ... } );
    procedure somtEmitEnumEpilog( { ... } );
    procedure somtEmitInterfaceProlog( { ... } );
    procedure somtEmitInterface( { ... } );
    procedure somtEmitInterfaceEpilog( { ... } );
    procedure somtEmitModuleProlog( { ... } );
    procedure somtEmitModule( { ... } );
    procedure somtEmitModuleEpilog( { ... } );
    procedure somtEmitMethodsProlog( { ... } );
    procedure somtEmitMethods( { ... } );
    procedure somtEmitMethodsEpilog( { ... } );
    procedure somtEmitMethod( { ... } );
    procedure somtEmitEpilog( { ... } );
    function somtScanBases( { ... } ): { ... };
    function somtCheckVisibility( { ... } ): { ... };
    function somtNew( { ... } ): { ... };
    function somtImplemented( { ... } ): { ... };
    function somtOverridden( { ... } ): { ... };
    function somtInherited( { ... } ): { ... };
    function somtAllVisible( { ... } ): { ... };
    function somtAll( { ... } ): { ... };
    function somtNewNoProc( { ... } ): { ... };
    function somtPrivOrPub( { ... } ): { ... };
    function somtNewProc( { ... } ): { ... };
    function somtLink( { ... } ): { ... };
    function somtVA( { ... } ): { ... };
    function somtScanMethods( { ... } ): { ... };
    function somtScanConstants( { ... } ): { ... };
    function somtScanTypedefs( { ... } ): { ... };
    function somtScanStructs( { ... } ): { ... };
    function somtScanUnions( { ... } ): { ... };
    function somtScanEnums( { ... } ): { ... };
    function somtScanData( { ... } ): { ... };
    function somtScanAttributes( { ... } ): { ... };
    function somtScanInterfaces( { ... } ): { ... };
    function somtScanModules( { ... } ): { ... };
    function somtScanPassthru( { ... } ): { ... };
    procedure somtEmitFullPassthru( { ... } );
    function somtScanDataF( { ... } ): { ... };
    function somtScanBasesF( { ... } ): { ... };
    function somtGetGlobalModifierValue( { ... } ): { ... };
    function somtGetFirstGlobalDefinition( { ... } ): { ... };
    function somtGetNextGlobalDefinition( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtTemplate: { ... } read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: { ... } read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: { ... } read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: { ... } read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: { ... } read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: { ... } read _get_somtEmitterName write _set_somtEmitterName;
  end;

  Context = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function set_one_value( { ... } ): { ... };
    function set_values( { ... } ): { ... };
    function get_values( { ... } ): { ... };
    function delete_values( { ... } ): { ... };
    function create_child( { ... } ): { ... };
    function destroy( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  ConstantDef = class
    { Found item: ConstantDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type( { ... } ): { ... };
    procedure _set_type( { ... } );
    function _get_value( { ... } ): { ... };
    procedure _set_value( { ... } );
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property type: { ... } read _get_type write _set_type;
    property value: { ... } read _get_value write _set_value;
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
  end;

  Container = class
    { Found item: InterfaceName }
    { Found item: ContainerDescription }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function contents( { ... } ): { ... };
    function lookup_name( { ... } ): { ... };
    function describe_contents( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  DirectToSomCpp = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate( { ... } ): { ... };
    procedure _set_somtTemplate( { ... } );
    function _get_somtTargetFile( { ... } ): { ... };
    procedure _set_somtTargetFile( { ... } );
    function _get_somtTargetClass( { ... } ): { ... };
    procedure _set_somtTargetClass( { ... } );
    function _get_somtTargetModule( { ... } ): { ... };
    procedure _set_somtTargetModule( { ... } );
    function _get_somtTargetType( { ... } ): { ... };
    procedure _set_somtTargetType( { ... } );
    function _get_somtEmitterName( { ... } ): { ... };
    procedure _set_somtEmitterName( { ... } );
  public
    procedure emitSectionForNamedEntry( { ... } );
    procedure somtEmitDefinitionOfType( { ... } );
    procedure emitSectionForEntry( { ... } );
    procedure emitTDIncludeForEntry( { ... } );
    procedure emitSequenceTypedef( { ... } );
    procedure chkUDA( { ... } );
    procedure chkOptDefaultCtor( { ... } );
    function somtGenerateSections( { ... } ): { ... };
    function somtOpenSymbolsFile( { ... } ): { ... };
    procedure somtSetPredefinedSymbols( { ... } );
    procedure somtFileSymbols( { ... } );
    procedure somtEmitProlog( { ... } );
    procedure somtEmitBaseIncludesProlog( { ... } );
    procedure somtEmitBaseIncludes( { ... } );
    procedure somtEmitBaseIncludesEpilog( { ... } );
    procedure somtEmitMetaInclude( { ... } );
    procedure somtEmitClass( { ... } );
    procedure somtEmitMeta( { ... } );
    procedure somtEmitBaseProlog( { ... } );
    procedure somtEmitBase( { ... } );
    procedure somtEmitBaseEpilog( { ... } );
    procedure somtEmitPassthruProlog( { ... } );
    procedure somtEmitPassthru( { ... } );
    procedure somtEmitPassthruEpilog( { ... } );
    procedure somtEmitRelease( { ... } );
    procedure somtEmitDataProlog( { ... } );
    procedure somtEmitData( { ... } );
    procedure somtEmitDataEpilog( { ... } );
    procedure somtEmitAttributeProlog( { ... } );
    procedure somtEmitAttribute( { ... } );
    procedure somtEmitAttributeEpilog( { ... } );
    procedure somtEmitConstantProlog( { ... } );
    procedure somtEmitConstant( { ... } );
    procedure somtEmitConstantEpilog( { ... } );
    procedure somtEmitTypedefProlog( { ... } );
    procedure somtEmitTypedef( { ... } );
    procedure somtEmitTypedefEpilog( { ... } );
    procedure somtEmitStructProlog( { ... } );
    procedure somtEmitStruct( { ... } );
    procedure somtEmitStructEpilog( { ... } );
    procedure somtEmitUnionProlog( { ... } );
    procedure somtEmitUnion( { ... } );
    procedure somtEmitUnionEpilog( { ... } );
    procedure somtEmitEnumProlog( { ... } );
    procedure somtEmitEnum( { ... } );
    procedure somtEmitEnumEpilog( { ... } );
    procedure somtEmitInterfaceProlog( { ... } );
    procedure somtEmitInterface( { ... } );
    procedure somtEmitInterfaceEpilog( { ... } );
    procedure somtEmitModuleProlog( { ... } );
    procedure somtEmitModule( { ... } );
    procedure somtEmitModuleEpilog( { ... } );
    procedure somtEmitMethodsProlog( { ... } );
    procedure somtEmitMethods( { ... } );
    procedure somtEmitMethodsEpilog( { ... } );
    procedure somtEmitMethod( { ... } );
    procedure somtEmitEpilog( { ... } );
    function somtScanBases( { ... } ): { ... };
    function somtCheckVisibility( { ... } ): { ... };
    function somtNew( { ... } ): { ... };
    function somtImplemented( { ... } ): { ... };
    function somtOverridden( { ... } ): { ... };
    function somtInherited( { ... } ): { ... };
    function somtAllVisible( { ... } ): { ... };
    function somtAll( { ... } ): { ... };
    function somtNewNoProc( { ... } ): { ... };
    function somtPrivOrPub( { ... } ): { ... };
    function somtNewProc( { ... } ): { ... };
    function somtLink( { ... } ): { ... };
    function somtVA( { ... } ): { ... };
    function somtScanMethods( { ... } ): { ... };
    function somtScanConstants( { ... } ): { ... };
    function somtScanTypedefs( { ... } ): { ... };
    function somtScanStructs( { ... } ): { ... };
    function somtScanUnions( { ... } ): { ... };
    function somtScanEnums( { ... } ): { ... };
    function somtScanData( { ... } ): { ... };
    function somtScanAttributes( { ... } ): { ... };
    function somtScanInterfaces( { ... } ): { ... };
    function somtScanModules( { ... } ): { ... };
    function somtScanPassthru( { ... } ): { ... };
    procedure somtEmitFullPassthru( { ... } );
    function somtScanDataF( { ... } ): { ... };
    function somtScanBasesF( { ... } ): { ... };
    function somtGetGlobalModifierValue( { ... } ): { ... };
    function somtGetFirstGlobalDefinition( { ... } ): { ... };
    function somtGetNextGlobalDefinition( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtTemplate: { ... } read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: { ... } read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: { ... } read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: { ... } read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: { ... } read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: { ... } read _get_somtEmitterName write _set_somtEmitterName;
  end;

  CTMEmitC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate( { ... } ): { ... };
    procedure _set_somtTemplate( { ... } );
    function _get_somtTargetFile( { ... } ): { ... };
    procedure _set_somtTargetFile( { ... } );
    function _get_somtTargetClass( { ... } ): { ... };
    procedure _set_somtTargetClass( { ... } );
    function _get_somtTargetModule( { ... } ): { ... };
    procedure _set_somtTargetModule( { ... } );
    function _get_somtTargetType( { ... } ): { ... };
    procedure _set_somtTargetType( { ... } );
    function _get_somtEmitterName( { ... } ): { ... };
    procedure _set_somtEmitterName( { ... } );
  public
    procedure emitModule( { ... } );
    procedure emitParentMethodCalls( { ... } );
    procedure emitInitializerTemplate( { ... } );
    procedure emitAssignmentOpTemplate( { ... } );
    procedure emitDestructorTemplate( { ... } );
    function somtGenerateSections( { ... } ): { ... };
    function somtOpenSymbolsFile( { ... } ): { ... };
    procedure somtSetPredefinedSymbols( { ... } );
    procedure somtFileSymbols( { ... } );
    procedure somtEmitProlog( { ... } );
    procedure somtEmitBaseIncludesProlog( { ... } );
    procedure somtEmitBaseIncludes( { ... } );
    procedure somtEmitBaseIncludesEpilog( { ... } );
    procedure somtEmitMetaInclude( { ... } );
    procedure somtEmitClass( { ... } );
    procedure somtEmitMeta( { ... } );
    procedure somtEmitBaseProlog( { ... } );
    procedure somtEmitBase( { ... } );
    procedure somtEmitBaseEpilog( { ... } );
    procedure somtEmitPassthruProlog( { ... } );
    procedure somtEmitPassthru( { ... } );
    procedure somtEmitPassthruEpilog( { ... } );
    procedure somtEmitRelease( { ... } );
    procedure somtEmitDataProlog( { ... } );
    procedure somtEmitData( { ... } );
    procedure somtEmitDataEpilog( { ... } );
    procedure somtEmitAttributeProlog( { ... } );
    procedure somtEmitAttribute( { ... } );
    procedure somtEmitAttributeEpilog( { ... } );
    procedure somtEmitConstantProlog( { ... } );
    procedure somtEmitConstant( { ... } );
    procedure somtEmitConstantEpilog( { ... } );
    procedure somtEmitTypedefProlog( { ... } );
    procedure somtEmitTypedef( { ... } );
    procedure somtEmitTypedefEpilog( { ... } );
    procedure somtEmitStructProlog( { ... } );
    procedure somtEmitStruct( { ... } );
    procedure somtEmitStructEpilog( { ... } );
    procedure somtEmitUnionProlog( { ... } );
    procedure somtEmitUnion( { ... } );
    procedure somtEmitUnionEpilog( { ... } );
    procedure somtEmitEnumProlog( { ... } );
    procedure somtEmitEnum( { ... } );
    procedure somtEmitEnumEpilog( { ... } );
    procedure somtEmitInterfaceProlog( { ... } );
    procedure somtEmitInterface( { ... } );
    procedure somtEmitInterfaceEpilog( { ... } );
    procedure somtEmitModuleProlog( { ... } );
    procedure somtEmitModule( { ... } );
    procedure somtEmitModuleEpilog( { ... } );
    procedure somtEmitMethodsProlog( { ... } );
    procedure somtEmitMethods( { ... } );
    procedure somtEmitMethodsEpilog( { ... } );
    procedure somtEmitMethod( { ... } );
    procedure somtEmitEpilog( { ... } );
    function somtScanBases( { ... } ): { ... };
    function somtCheckVisibility( { ... } ): { ... };
    function somtNew( { ... } ): { ... };
    function somtImplemented( { ... } ): { ... };
    function somtOverridden( { ... } ): { ... };
    function somtInherited( { ... } ): { ... };
    function somtAllVisible( { ... } ): { ... };
    function somtAll( { ... } ): { ... };
    function somtNewNoProc( { ... } ): { ... };
    function somtPrivOrPub( { ... } ): { ... };
    function somtNewProc( { ... } ): { ... };
    function somtLink( { ... } ): { ... };
    function somtVA( { ... } ): { ... };
    function somtScanMethods( { ... } ): { ... };
    function somtScanConstants( { ... } ): { ... };
    function somtScanTypedefs( { ... } ): { ... };
    function somtScanStructs( { ... } ): { ... };
    function somtScanUnions( { ... } ): { ... };
    function somtScanEnums( { ... } ): { ... };
    function somtScanData( { ... } ): { ... };
    function somtScanAttributes( { ... } ): { ... };
    function somtScanInterfaces( { ... } ): { ... };
    function somtScanModules( { ... } ): { ... };
    function somtScanPassthru( { ... } ): { ... };
    procedure somtEmitFullPassthru( { ... } );
    function somtScanDataF( { ... } ): { ... };
    function somtScanBasesF( { ... } ): { ... };
    function somtGetGlobalModifierValue( { ... } ): { ... };
    function somtGetFirstGlobalDefinition( { ... } ): { ... };
    function somtGetNextGlobalDefinition( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtTemplate: { ... } read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: { ... } read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: { ... } read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: { ... } read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: { ... } read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: { ... } read _get_somtEmitterName write _set_somtEmitterName;
  end;

  DTSImplTmpl = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTemplate( { ... } ): { ... };
    procedure _set_somtTemplate( { ... } );
    function _get_somtTargetFile( { ... } ): { ... };
    procedure _set_somtTargetFile( { ... } );
    function _get_somtTargetClass( { ... } ): { ... };
    procedure _set_somtTargetClass( { ... } );
    function _get_somtTargetModule( { ... } ): { ... };
    procedure _set_somtTargetModule( { ... } );
    function _get_somtTargetType( { ... } ): { ... };
    procedure _set_somtTargetType( { ... } );
    function _get_somtEmitterName( { ... } ): { ... };
    procedure _set_somtEmitterName( { ... } );
  public
    procedure emitSectionForNamedEntry( { ... } );
    function somtGenerateSections( { ... } ): { ... };
    function somtOpenSymbolsFile( { ... } ): { ... };
    procedure somtSetPredefinedSymbols( { ... } );
    procedure somtFileSymbols( { ... } );
    procedure somtEmitProlog( { ... } );
    procedure somtEmitBaseIncludesProlog( { ... } );
    procedure somtEmitBaseIncludes( { ... } );
    procedure somtEmitBaseIncludesEpilog( { ... } );
    procedure somtEmitMetaInclude( { ... } );
    procedure somtEmitClass( { ... } );
    procedure somtEmitMeta( { ... } );
    procedure somtEmitBaseProlog( { ... } );
    procedure somtEmitBase( { ... } );
    procedure somtEmitBaseEpilog( { ... } );
    procedure somtEmitPassthruProlog( { ... } );
    procedure somtEmitPassthru( { ... } );
    procedure somtEmitPassthruEpilog( { ... } );
    procedure somtEmitRelease( { ... } );
    procedure somtEmitDataProlog( { ... } );
    procedure somtEmitData( { ... } );
    procedure somtEmitDataEpilog( { ... } );
    procedure somtEmitAttributeProlog( { ... } );
    procedure somtEmitAttribute( { ... } );
    procedure somtEmitAttributeEpilog( { ... } );
    procedure somtEmitConstantProlog( { ... } );
    procedure somtEmitConstant( { ... } );
    procedure somtEmitConstantEpilog( { ... } );
    procedure somtEmitTypedefProlog( { ... } );
    procedure somtEmitTypedef( { ... } );
    procedure somtEmitTypedefEpilog( { ... } );
    procedure somtEmitStructProlog( { ... } );
    procedure somtEmitStruct( { ... } );
    procedure somtEmitStructEpilog( { ... } );
    procedure somtEmitUnionProlog( { ... } );
    procedure somtEmitUnion( { ... } );
    procedure somtEmitUnionEpilog( { ... } );
    procedure somtEmitEnumProlog( { ... } );
    procedure somtEmitEnum( { ... } );
    procedure somtEmitEnumEpilog( { ... } );
    procedure somtEmitInterfaceProlog( { ... } );
    procedure somtEmitInterface( { ... } );
    procedure somtEmitInterfaceEpilog( { ... } );
    procedure somtEmitModuleProlog( { ... } );
    procedure somtEmitModule( { ... } );
    procedure somtEmitModuleEpilog( { ... } );
    procedure somtEmitMethodsProlog( { ... } );
    procedure somtEmitMethods( { ... } );
    procedure somtEmitMethodsEpilog( { ... } );
    procedure somtEmitMethod( { ... } );
    procedure somtEmitEpilog( { ... } );
    function somtScanBases( { ... } ): { ... };
    function somtCheckVisibility( { ... } ): { ... };
    function somtNew( { ... } ): { ... };
    function somtImplemented( { ... } ): { ... };
    function somtOverridden( { ... } ): { ... };
    function somtInherited( { ... } ): { ... };
    function somtAllVisible( { ... } ): { ... };
    function somtAll( { ... } ): { ... };
    function somtNewNoProc( { ... } ): { ... };
    function somtPrivOrPub( { ... } ): { ... };
    function somtNewProc( { ... } ): { ... };
    function somtLink( { ... } ): { ... };
    function somtVA( { ... } ): { ... };
    function somtScanMethods( { ... } ): { ... };
    function somtScanConstants( { ... } ): { ... };
    function somtScanTypedefs( { ... } ): { ... };
    function somtScanStructs( { ... } ): { ... };
    function somtScanUnions( { ... } ): { ... };
    function somtScanEnums( { ... } ): { ... };
    function somtScanData( { ... } ): { ... };
    function somtScanAttributes( { ... } ): { ... };
    function somtScanInterfaces( { ... } ): { ... };
    function somtScanModules( { ... } ): { ... };
    function somtScanPassthru( { ... } ): { ... };
    procedure somtEmitFullPassthru( { ... } );
    function somtScanDataF( { ... } ): { ... };
    function somtScanBasesF( { ... } ): { ... };
    function somtGetGlobalModifierValue( { ... } ): { ... };
    function somtGetFirstGlobalDefinition( { ... } ): { ... };
    function somtGetNextGlobalDefinition( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtTemplate: { ... } read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: { ... } read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: { ... } read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: { ... } read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: { ... } read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: { ... } read _get_somtEmitterName write _set_somtEmitterName;
  end;

  ExceptionDef = class
    { Found item: ExceptionDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type( { ... } ): { ... };
    procedure _set_type( { ... } );
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property type: { ... } read _get_type write _set_type;
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
  end;

  SOMDServer = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function somdRefFromSOMObj( { ... } ): { ... };
    function somdSOMObjFromRef( { ... } ): { ... };
    procedure somdDispatchMethod( { ... } );
    function somdCreateObj( { ... } ): { ... };
    procedure somdDeleteObj( { ... } );
    function somdGetClassObj( { ... } ): { ... };
    function somdObjReferencesCached( { ... } ): { ... };
    function somdCreateFactory( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  SOMDForeignMarshaler = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure marshal( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  somInitModEmitter = class
    { Found item: INIT_SUFFIX }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_targetDllName( { ... } ): { ... };
    procedure _set_targetDllName( { ... } );
    function _get_targetFileName( { ... } ): { ... };
    procedure _set_targetFileName( { ... } );
    function _get_symbolsFileName( { ... } ): { ... };
    procedure _set_symbolsFileName( { ... } );
    function _get_somtTemplate( { ... } ): { ... };
    procedure _set_somtTemplate( { ... } );
    function _get_somtTargetFile( { ... } ): { ... };
    procedure _set_somtTargetFile( { ... } );
    function _get_somtTargetClass( { ... } ): { ... };
    procedure _set_somtTargetClass( { ... } );
    function _get_somtTargetModule( { ... } ): { ... };
    procedure _set_somtTargetModule( { ... } );
    function _get_somtTargetType( { ... } ): { ... };
    procedure _set_somtTargetType( { ... } );
    function _get_somtEmitterName( { ... } ): { ... };
    procedure _set_somtEmitterName( { ... } );
  public
    procedure somtAddClassEntry( { ... } );
    function emitInitTermFunctions( { ... } ): { ... };
    function buildInitModFileName( { ... } ): { ... };
    function somtGenerateSections( { ... } ): { ... };
    function somtOpenSymbolsFile( { ... } ): { ... };
    procedure somtSetPredefinedSymbols( { ... } );
    procedure somtFileSymbols( { ... } );
    procedure somtEmitProlog( { ... } );
    procedure somtEmitBaseIncludesProlog( { ... } );
    procedure somtEmitBaseIncludes( { ... } );
    procedure somtEmitBaseIncludesEpilog( { ... } );
    procedure somtEmitMetaInclude( { ... } );
    procedure somtEmitClass( { ... } );
    procedure somtEmitMeta( { ... } );
    procedure somtEmitBaseProlog( { ... } );
    procedure somtEmitBase( { ... } );
    procedure somtEmitBaseEpilog( { ... } );
    procedure somtEmitPassthruProlog( { ... } );
    procedure somtEmitPassthru( { ... } );
    procedure somtEmitPassthruEpilog( { ... } );
    procedure somtEmitRelease( { ... } );
    procedure somtEmitDataProlog( { ... } );
    procedure somtEmitData( { ... } );
    procedure somtEmitDataEpilog( { ... } );
    procedure somtEmitAttributeProlog( { ... } );
    procedure somtEmitAttribute( { ... } );
    procedure somtEmitAttributeEpilog( { ... } );
    procedure somtEmitConstantProlog( { ... } );
    procedure somtEmitConstant( { ... } );
    procedure somtEmitConstantEpilog( { ... } );
    procedure somtEmitTypedefProlog( { ... } );
    procedure somtEmitTypedef( { ... } );
    procedure somtEmitTypedefEpilog( { ... } );
    procedure somtEmitStructProlog( { ... } );
    procedure somtEmitStruct( { ... } );
    procedure somtEmitStructEpilog( { ... } );
    procedure somtEmitUnionProlog( { ... } );
    procedure somtEmitUnion( { ... } );
    procedure somtEmitUnionEpilog( { ... } );
    procedure somtEmitEnumProlog( { ... } );
    procedure somtEmitEnum( { ... } );
    procedure somtEmitEnumEpilog( { ... } );
    procedure somtEmitInterfaceProlog( { ... } );
    procedure somtEmitInterface( { ... } );
    procedure somtEmitInterfaceEpilog( { ... } );
    procedure somtEmitModuleProlog( { ... } );
    procedure somtEmitModule( { ... } );
    procedure somtEmitModuleEpilog( { ... } );
    procedure somtEmitMethodsProlog( { ... } );
    procedure somtEmitMethods( { ... } );
    procedure somtEmitMethodsEpilog( { ... } );
    procedure somtEmitMethod( { ... } );
    procedure somtEmitEpilog( { ... } );
    function somtScanBases( { ... } ): { ... };
    function somtCheckVisibility( { ... } ): { ... };
    function somtNew( { ... } ): { ... };
    function somtImplemented( { ... } ): { ... };
    function somtOverridden( { ... } ): { ... };
    function somtInherited( { ... } ): { ... };
    function somtAllVisible( { ... } ): { ... };
    function somtAll( { ... } ): { ... };
    function somtNewNoProc( { ... } ): { ... };
    function somtPrivOrPub( { ... } ): { ... };
    function somtNewProc( { ... } ): { ... };
    function somtLink( { ... } ): { ... };
    function somtVA( { ... } ): { ... };
    function somtScanMethods( { ... } ): { ... };
    function somtScanConstants( { ... } ): { ... };
    function somtScanTypedefs( { ... } ): { ... };
    function somtScanStructs( { ... } ): { ... };
    function somtScanUnions( { ... } ): { ... };
    function somtScanEnums( { ... } ): { ... };
    function somtScanData( { ... } ): { ... };
    function somtScanAttributes( { ... } ): { ... };
    function somtScanInterfaces( { ... } ): { ... };
    function somtScanModules( { ... } ): { ... };
    function somtScanPassthru( { ... } ): { ... };
    procedure somtEmitFullPassthru( { ... } );
    function somtScanDataF( { ... } ): { ... };
    function somtScanBasesF( { ... } ): { ... };
    function somtGetGlobalModifierValue( { ... } ): { ... };
    function somtGetFirstGlobalDefinition( { ... } ): { ... };
    function somtGetNextGlobalDefinition( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property targetDllName: { ... } read _get_targetDllName write _set_targetDllName;
    property targetFileName: { ... } read _get_targetFileName write _set_targetFileName;
    property symbolsFileName: { ... } read _get_symbolsFileName write _set_symbolsFileName;
    property somtTemplate: { ... } read _get_somtTemplate write _set_somtTemplate;
    property somtTargetFile: { ... } read _get_somtTargetFile write _set_somtTargetFile;
    property somtTargetClass: { ... } read _get_somtTargetClass write _set_somtTargetClass;
    property somtTargetModule: { ... } read _get_somtTargetModule write _set_somtTargetModule;
    property somtTargetType: { ... } read _get_somtTargetType write _set_somtTargetType;
    property somtEmitterName: { ... } read _get_somtEmitterName write _set_somtEmitterName;
  end;

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
    function _get_impl_id( { ... } ): { ... };
    procedure _set_impl_id( { ... } );
    function _get_impl_alias( { ... } ): { ... };
    procedure _set_impl_alias( { ... } );
    function _get_impl_program( { ... } ): { ... };
    procedure _set_impl_program( { ... } );
    function _get_impl_flags( { ... } ): { ... };
    procedure _set_impl_flags( { ... } );
    function _get_impl_server_class( { ... } ): { ... };
    procedure _set_impl_server_class( { ... } );
    function _get_impl_refdata_file( { ... } ): { ... };
    procedure _set_impl_refdata_file( { ... } );
    function _get_impl_refdata_bkup( { ... } ): { ... };
    procedure _set_impl_refdata_bkup( { ... } );
    function _get_impl_hostname( { ... } ): { ... };
    procedure _set_impl_hostname( { ... } );
    function _get_config_file( { ... } ): { ... };
    procedure _set_config_file( { ... } );
    function _get_impldef_class( { ... } ): { ... };
    procedure _set_impldef_class( { ... } );
    function _get_svr_objref( { ... } ): { ... };
    procedure _set_svr_objref( { ... } );
    function _get_protocols( { ... } ): { ... };
    procedure _set_protocols( { ... } );
    function _get_registrar_resp( { ... } ): { ... };
    procedure _set_registrar_resp( { ... } );
    function _get_constant_random_id( { ... } ): { ... };
  public
    procedure externalize_to_stream( { ... } );
    procedure internalize_from_stream( { ... } );
    function is_identical( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property impl_id: { ... } read _get_impl_id write _set_impl_id;
    property impl_alias: { ... } read _get_impl_alias write _set_impl_alias;
    property impl_program: { ... } read _get_impl_program write _set_impl_program;
    property impl_flags: { ... } read _get_impl_flags write _set_impl_flags;
    property impl_server_class: { ... } read _get_impl_server_class write _set_impl_server_class;
    property impl_refdata_file: { ... } read _get_impl_refdata_file write _set_impl_refdata_file;
    property impl_refdata_bkup: { ... } read _get_impl_refdata_bkup write _set_impl_refdata_bkup;
    property impl_hostname: { ... } read _get_impl_hostname write _set_impl_hostname;
    property config_file: { ... } read _get_config_file write _set_config_file;
    property impldef_class: { ... } read _get_impldef_class write _set_impldef_class;
    property svr_objref: { ... } read _get_svr_objref write _set_svr_objref;
    property protocols: { ... } read _get_protocols write _set_protocols;
    property registrar_resp: { ... } read _get_registrar_resp write _set_registrar_resp;
    property constant_random_id: { ... } read _get_constant_random_id write _set_constant_random_id;
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
    function find_impldef( { ... } ): { ... };
    function find_impldef_by_alias( { ... } ): { ... };
    function find_all_aliases( { ... } ): { ... };
    function find_all_impldefs( { ... } ): { ... };
    function add_impldef( { ... } ): { ... };
    function update_impldef( { ... } ): { ... };
    function delete_impldef( { ... } ): { ... };
    function find_impldef_by_class( { ... } ): { ... };
    procedure add_class_to_impldef( { ... } );
    procedure remove_class_from_impldef( { ... } );
    procedure remove_class_from_all( { ... } );
    function find_classes_by_impldef( { ... } ): { ... };
    function add_class_to_all( { ... } ): { ... };
    function add_class_with_properties( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
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
    function _get_base_interfaces( { ... } ): { ... };
    procedure _set_base_interfaces( { ... } );
    function _get_instanceData( { ... } ): { ... };
    procedure _set_instanceData( { ... } );
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function describe_interface( { ... } ): { ... };
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    function contents( { ... } ): { ... };
    function lookup_name( { ... } ): { ... };
    function describe_contents( { ... } ): { ... };
    property base_interfaces: { ... } read _get_base_interfaces write _set_base_interfaces;
    property instanceData: { ... } read _get_instanceData write _set_instanceData;
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
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
    function insert_component( { ... } ): { ... };
    function get_component( { ... } ): { ... };
    function delete_component( { ... } ): { ... };
    function num_components( { ... } ): { ... };
    function equal( { ... } ): { ... };
    function less_than( { ... } ): { ... };
    function to_idl_form( { ... } ): { ... };
    procedure from_idl_form( { ... } );
    procedure destroy( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  LNameComponent = class
    { Found item: NotSet }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function get_id( { ... } ): { ... };
    procedure set_id( { ... } );
    function get_kind( { ... } ): { ... };
    procedure set_kind( { ... } );
    procedure destroy( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
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
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    function contents( { ... } ): { ... };
    function lookup_name( { ... } ): { ... };
    function describe_contents( { ... } ): { ... };
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
  end;

  NVList = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function add_item( { ... } ): { ... };
    function free( { ... } ): { ... };
    function free_memory( { ... } ): { ... };
    function get_count( { ... } ): { ... };
    function set_item( { ... } ): { ... };
    function get_item( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  ObjectMgr = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function somdNewObject( { ... } ): { ... };
    function somdGetIdFromObject( { ... } ): { ... };
    function somdGetObjectFromId( { ... } ): { ... };
    procedure somdReleaseObject( { ... } );
    procedure somdDestroyObject( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
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
    function _get_result( { ... } ): { ... };
    procedure _set_result( { ... } );
    function _get_mode( { ... } ): { ... };
    procedure _set_mode( { ... } );
    function _get_contexts( { ... } ): { ... };
    procedure _set_contexts( { ... } );
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    function contents( { ... } ): { ... };
    function lookup_name( { ... } ): { ... };
    function describe_contents( { ... } ): { ... };
    property result: { ... } read _get_result write _set_result;
    property mode: { ... } read _get_mode write _set_mode;
    property contexts: { ... } read _get_contexts write _set_contexts;
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
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
    function _get_stringToObject30( { ... } ): { ... };
    procedure _set_stringToObject30( { ... } );
  public
    function object_to_string( { ... } ): { ... };
    function string_to_object( { ... } ): { ... };
    function create_list( { ... } ): { ... };
    function create_operation_list( { ... } ): { ... };
    function get_default_context( { ... } ): { ... };
    function list_initial_services( { ... } ): { ... };
    function resolve_initial_references( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property stringToObject30: { ... } read _get_stringToObject30 write _set_stringToObject30;
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
    function _get_type( { ... } ): { ... };
    procedure _set_type( { ... } );
    function _get_mode( { ... } ): { ... };
    procedure _set_mode( { ... } );
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property type: { ... } read _get_type write _set_type;
    property mode: { ... } read _get_mode write _set_mode;
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
  end;

  Principal = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_userName( { ... } ): { ... };
    procedure _set_userName( { ... } );
    function _get_hostName( { ... } ): { ... };
    procedure _set_hostName( { ... } );
  public
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property userName: { ... } read _get_userName write _set_userName;
    property hostName: { ... } read _get_hostName write _set_hostName;
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
    function lookup_id( { ... } ): { ... };
    function lookup_modifier( { ... } ): { ... };
    procedure release_cache( { ... } );
    function queryException( { ... } ): { ... };
    function contents( { ... } ): { ... };
    function lookup_name( { ... } ): { ... };
    function describe_contents( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  Request = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function add_arg( { ... } ): { ... };
    function invoke( { ... } ): { ... };
    function send( { ... } ): { ... };
    function get_response( { ... } ): { ... };
    function destroy( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  SOMTEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTAttributeEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtIsReadonly( { ... } ): { ... };
    function _get_somtAttribType( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstAttributeDeclarator( { ... } ): { ... };
    function somtGetNextAttributeDeclarator( { ... } ): { ... };
    function somtGetFirstGetMethod( { ... } ): { ... };
    function somtGetNextGetMethod( { ... } ): { ... };
    function somtGetFirstSetMethod( { ... } ): { ... };
    function somtGetNextSetMethod( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtIsReadonly: { ... } read _get_somtIsReadonly write _set_somtIsReadonly;
    property somtAttribType: { ... } read _get_somtAttribType write _set_somtAttribType;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTBaseClassEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtBaseClassDef( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtBaseClassDef: { ... } read _get_somtBaseClassDef write _set_somtBaseClassDef;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTClassEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtSourceFileName( { ... } ): { ... };
    function _get_somtMetaClassEntry( { ... } ): { ... };
    function _get_somtClassModule( { ... } ): { ... };
    function _get_somtNewMethodCount( { ... } ): { ... };
    function _get_somtLocalInclude( { ... } ): { ... };
    function _get_somtPrivateMethodCount( { ... } ): { ... };
    function _get_somtStaticMethodCount( { ... } ): { ... };
    function _get_somtOverrideMethodCount( { ... } ): { ... };
    function _get_somtProcMethodCount( { ... } ): { ... };
    function _get_somtVAMethodCount( { ... } ): { ... };
    function _get_somtBaseCount( { ... } ): { ... };
    function _get_somtExternalDataCount( { ... } ): { ... };
    function _get_somtPublicDataCount( { ... } ): { ... };
    function _get_somtPrivateDataCount( { ... } ): { ... };
    function _get_somtMetaclassFor( { ... } ): { ... };
    function _get_somtForwardRef( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstBaseClass( { ... } ): { ... };
    function somtGetNextBaseClass( { ... } ): { ... };
    function somtGetFirstReleaseName( { ... } ): { ... };
    function somtGetNextReleaseName( { ... } ): { ... };
    function somtGetReleaseNameList( { ... } ): { ... };
    function somtGetFirstPassthru( { ... } ): { ... };
    function somtGetNextPassthru( { ... } ): { ... };
    function somtGetFirstData( { ... } ): { ... };
    function somtGetNextData( { ... } ): { ... };
    function somtGetFirstStaticData( { ... } ): { ... };
    function somtGetNextStaticData( { ... } ): { ... };
    function somtGetFirstMethod( { ... } ): { ... };
    function somtGetNextMethod( { ... } ): { ... };
    function somtGetFirstInheritedMethod( { ... } ): { ... };
    function somtGetNextInheritedMethod( { ... } ): { ... };
    function somtGetFirstAttribute( { ... } ): { ... };
    function somtGetNextAttribute( { ... } ): { ... };
    function somtGetFirstStruct( { ... } ): { ... };
    function somtGetNextStruct( { ... } ): { ... };
    function somtGetFirstTypedef( { ... } ): { ... };
    function somtGetNextTypedef( { ... } ): { ... };
    function somtGetFirstUnion( { ... } ): { ... };
    function somtGetNextUnion( { ... } ): { ... };
    function somtGetFirstEnum( { ... } ): { ... };
    function somtGetNextEnum( { ... } ): { ... };
    function somtGetFirstConstant( { ... } ): { ... };
    function somtGetNextConstant( { ... } ): { ... };
    function somtGetFirstSequence( { ... } ): { ... };
    function somtGetNextSequence( { ... } ): { ... };
    function somtGetFirstPubdef( { ... } ): { ... };
    function somtGetNextPubdef( { ... } ): { ... };
    function somtFilterNew( { ... } ): { ... };
    function somtFilterOverridden( { ... } ): { ... };
    function somtFilterPrivOrPub( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtSourceFileName: { ... } read _get_somtSourceFileName write _set_somtSourceFileName;
    property somtMetaClassEntry: { ... } read _get_somtMetaClassEntry write _set_somtMetaClassEntry;
    property somtClassModule: { ... } read _get_somtClassModule write _set_somtClassModule;
    property somtNewMethodCount: { ... } read _get_somtNewMethodCount write _set_somtNewMethodCount;
    property somtLocalInclude: { ... } read _get_somtLocalInclude write _set_somtLocalInclude;
    property somtPrivateMethodCount: { ... } read _get_somtPrivateMethodCount write _set_somtPrivateMethodCount;
    property somtStaticMethodCount: { ... } read _get_somtStaticMethodCount write _set_somtStaticMethodCount;
    property somtOverrideMethodCount: { ... } read _get_somtOverrideMethodCount write _set_somtOverrideMethodCount;
    property somtProcMethodCount: { ... } read _get_somtProcMethodCount write _set_somtProcMethodCount;
    property somtVAMethodCount: { ... } read _get_somtVAMethodCount write _set_somtVAMethodCount;
    property somtBaseCount: { ... } read _get_somtBaseCount write _set_somtBaseCount;
    property somtExternalDataCount: { ... } read _get_somtExternalDataCount write _set_somtExternalDataCount;
    property somtPublicDataCount: { ... } read _get_somtPublicDataCount write _set_somtPublicDataCount;
    property somtPrivateDataCount: { ... } read _get_somtPrivateDataCount write _set_somtPrivateDataCount;
    property somtMetaclassFor: { ... } read _get_somtMetaclassFor write _set_somtMetaclassFor;
    property somtForwardRef: { ... } read _get_somtForwardRef write _set_somtForwardRef;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTCommonEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTypeObj( { ... } ): { ... };
    function _get_somtPtrs( { ... } ): { ... };
    function _get_somtArrayDimsString( { ... } ): { ... };
    function _get_somtSourceText( { ... } ): { ... };
    function _get_somtType( { ... } ): { ... };
    function _get_somtVisibility( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstArrayDimension( { ... } ): { ... };
    function somtGetNextArrayDimension( { ... } ): { ... };
    function somtIsArray( { ... } ): { ... };
    function somtIsPointer( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtTypeObj: { ... } read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: { ... } read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: { ... } read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: { ... } read _get_somtSourceText write _set_somtSourceText;
    property somtType: { ... } read _get_somtType write _set_somtType;
    property somtVisibility: { ... } read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTConstEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtConstTypeObj( { ... } ): { ... };
    function _get_somtConstType( { ... } ): { ... };
    function _get_somtConstStringVal( { ... } ): { ... };
    function _get_somtConstNumVal( { ... } ): { ... };
    function _get_somtConstNumNegVal( { ... } ): { ... };
    function _get_somtConstIsNegative( { ... } ): { ... };
    function _get_somtConstVal( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtConstTypeObj: { ... } read _get_somtConstTypeObj write _set_somtConstTypeObj;
    property somtConstType: { ... } read _get_somtConstType write _set_somtConstType;
    property somtConstStringVal: { ... } read _get_somtConstStringVal write _set_somtConstStringVal;
    property somtConstNumVal: { ... } read _get_somtConstNumVal write _set_somtConstNumVal;
    property somtConstNumNegVal: { ... } read _get_somtConstNumNegVal write _set_somtConstNumNegVal;
    property somtConstIsNegative: { ... } read _get_somtConstIsNegative write _set_somtConstIsNegative;
    property somtConstVal: { ... } read _get_somtConstVal write _set_somtConstVal;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTDataEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtIsSelfRef( { ... } ): { ... };
    function _get_somtTypeObj( { ... } ): { ... };
    function _get_somtPtrs( { ... } ): { ... };
    function _get_somtArrayDimsString( { ... } ): { ... };
    function _get_somtSourceText( { ... } ): { ... };
    function _get_somtType( { ... } ): { ... };
    function _get_somtVisibility( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstArrayDimension( { ... } ): { ... };
    function somtGetNextArrayDimension( { ... } ): { ... };
    function somtIsArray( { ... } ): { ... };
    function somtIsPointer( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtIsSelfRef: { ... } read _get_somtIsSelfRef write _set_somtIsSelfRef;
    property somtTypeObj: { ... } read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: { ... } read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: { ... } read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: { ... } read _get_somtSourceText write _set_somtSourceText;
    property somtType: { ... } read _get_somtType write _set_somtType;
    property somtVisibility: { ... } read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTEnumEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstEnumName( { ... } ): { ... };
    function somtGetNextEnumName( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTEnumNameEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtEnumPtr( { ... } ): { ... };
    function _get_somtEnumVal( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtEnumPtr: { ... } read _get_somtEnumPtr write _set_somtEnumPtr;
    property somtEnumVal: { ... } read _get_somtEnumVal write _set_somtEnumVal;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTMetaClassEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtMetaFile( { ... } ): { ... };
    function _get_somtMetaClassDef( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtMetaFile: { ... } read _get_somtMetaFile write _set_somtMetaFile;
    property somtMetaClassDef: { ... } read _get_somtMetaClassDef write _set_somtMetaClassDef;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTMethodEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtIsVarargs( { ... } ): { ... };
    function _get_somtOriginalMethod( { ... } ): { ... };
    function _get_somtOriginalClass( { ... } ): { ... };
    function _get_somtMethodGroup( { ... } ): { ... };
    function _get_somtIsPrivateMethod( { ... } ): { ... };
    function _get_somtIsOneway( { ... } ): { ... };
    function _get_somtArgCount( { ... } ): { ... };
    function _get_somtContextArray( { ... } ): { ... };
    function _get_somtCReturnType( { ... } ): { ... };
    function _get_somtTypeObj( { ... } ): { ... };
    function _get_somtPtrs( { ... } ): { ... };
    function _get_somtArrayDimsString( { ... } ): { ... };
    function _get_somtSourceText( { ... } ): { ... };
    function _get_somtType( { ... } ): { ... };
    function _get_somtVisibility( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstParameter( { ... } ): { ... };
    function somtGetNextParameter( { ... } ): { ... };
    function somtGetIDLParamList( { ... } ): { ... };
    function somtGetShortCParamList( { ... } ): { ... };
    function somtGetFullCParamList( { ... } ): { ... };
    function somtGetShortParamNameList( { ... } ): { ... };
    function somtGetFullParamNameList( { ... } ): { ... };
    function somtGetNthParameter( { ... } ): { ... };
    function somtGetFirstException( { ... } ): { ... };
    function somtGetNextException( { ... } ): { ... };
    function somtGetFirstArrayDimension( { ... } ): { ... };
    function somtGetNextArrayDimension( { ... } ): { ... };
    function somtIsArray( { ... } ): { ... };
    function somtIsPointer( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtIsVarargs: { ... } read _get_somtIsVarargs write _set_somtIsVarargs;
    property somtOriginalMethod: { ... } read _get_somtOriginalMethod write _set_somtOriginalMethod;
    property somtOriginalClass: { ... } read _get_somtOriginalClass write _set_somtOriginalClass;
    property somtMethodGroup: { ... } read _get_somtMethodGroup write _set_somtMethodGroup;
    property somtIsPrivateMethod: { ... } read _get_somtIsPrivateMethod write _set_somtIsPrivateMethod;
    property somtIsOneway: { ... } read _get_somtIsOneway write _set_somtIsOneway;
    property somtArgCount: { ... } read _get_somtArgCount write _set_somtArgCount;
    property somtContextArray: { ... } read _get_somtContextArray write _set_somtContextArray;
    property somtCReturnType: { ... } read _get_somtCReturnType write _set_somtCReturnType;
    property somtTypeObj: { ... } read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: { ... } read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: { ... } read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: { ... } read _get_somtSourceText write _set_somtSourceText;
    property somtType: { ... } read _get_somtType write _set_somtType;
    property somtVisibility: { ... } read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTModuleEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtOuterModule( { ... } ): { ... };
    function _get_somtModuleFile( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstModuleStruct( { ... } ): { ... };
    function somtGetNextModuleStruct( { ... } ): { ... };
    function somtGetFirstModuleTypedef( { ... } ): { ... };
    function somtGetNextModuleTypedef( { ... } ): { ... };
    function somtGetFirstModuleUnion( { ... } ): { ... };
    function somtGetNextModuleUnion( { ... } ): { ... };
    function somtGetFirstModuleEnum( { ... } ): { ... };
    function somtGetNextModuleEnum( { ... } ): { ... };
    function somtGetFirstModuleConstant( { ... } ): { ... };
    function somtGetNextModuleConstant( { ... } ): { ... };
    function somtGetFirstModuleSequence( { ... } ): { ... };
    function somtGetNextModuleSequence( { ... } ): { ... };
    function somtGetFirstInterface( { ... } ): { ... };
    function somtGetNextInterface( { ... } ): { ... };
    function somtGetFirstModule( { ... } ): { ... };
    function somtGetNextModule( { ... } ): { ... };
    function somtGetFirstModuleDef( { ... } ): { ... };
    function somtGetNextModuleDef( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtOuterModule: { ... } read _get_somtOuterModule write _set_somtOuterModule;
    property somtModuleFile: { ... } read _get_somtModuleFile write _set_somtModuleFile;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTParameterEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtParameterDirection( { ... } ): { ... };
    function _get_somtIDLParameterDeclaration( { ... } ): { ... };
    function _get_somtCParameterDeclaration( { ... } ): { ... };
    function _get_somtTypeObj( { ... } ): { ... };
    function _get_somtPtrs( { ... } ): { ... };
    function _get_somtArrayDimsString( { ... } ): { ... };
    function _get_somtSourceText( { ... } ): { ... };
    function _get_somtType( { ... } ): { ... };
    function _get_somtVisibility( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstArrayDimension( { ... } ): { ... };
    function somtGetNextArrayDimension( { ... } ): { ... };
    function somtIsArray( { ... } ): { ... };
    function somtIsPointer( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtParameterDirection: { ... } read _get_somtParameterDirection write _set_somtParameterDirection;
    property somtIDLParameterDeclaration: { ... } read _get_somtIDLParameterDeclaration write _set_somtIDLParameterDeclaration;
    property somtCParameterDeclaration: { ... } read _get_somtCParameterDeclaration write _set_somtCParameterDeclaration;
    property somtTypeObj: { ... } read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: { ... } read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: { ... } read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: { ... } read _get_somtSourceText write _set_somtSourceText;
    property somtType: { ... } read _get_somtType write _set_somtType;
    property somtVisibility: { ... } read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTPassthruEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtPassthruBody( { ... } ): { ... };
    function _get_somtPassthruLanguage( { ... } ): { ... };
    function _get_somtPassthruTarget( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtIsBeforePassthru( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtPassthruBody: { ... } read _get_somtPassthruBody write _set_somtPassthruBody;
    property somtPassthruLanguage: { ... } read _get_somtPassthruLanguage write _set_somtPassthruLanguage;
    property somtPassthruTarget: { ... } read _get_somtPassthruTarget write _set_somtPassthruTarget;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTSequenceEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtSeqLength( { ... } ): { ... };
    function _get_somtSeqType( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtSeqLength: { ... } read _get_somtSeqLength write _set_somtSeqLength;
    property somtSeqType: { ... } read _get_somtSeqType write _set_somtSeqType;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTStringEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtStringLength( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtStringLength: { ... } read _get_somtStringLength write _set_somtStringLength;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTStructEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtStructClass( { ... } ): { ... };
    function _get_somtIsException( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstMember( { ... } ): { ... };
    function somtGetNextMember( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtStructClass: { ... } read _get_somtStructClass write _set_somtStructClass;
    property somtIsException: { ... } read _get_somtIsException write _set_somtIsException;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTTypedefEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtTypedefType( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstDeclarator( { ... } ): { ... };
    function somtGetNextDeclarator( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtTypedefType: { ... } read _get_somtTypedefType write _set_somtTypedefType;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTTemplateOutputC = class
    { Found item: MAX_INPUT_LINE_LENGTH }
    { Found item: MAX_OUTPUT_LINE_LENGTH }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtCommentStyle( { ... } ): { ... };
    procedure _set_somtCommentStyle( { ... } );
    function _get_somtLineLength( { ... } ): { ... };
    procedure _set_somtLineLength( { ... } );
    function _get_somtCommentNewline( { ... } ): { ... };
    procedure _set_somtCommentNewline( { ... } );
  public
    function somtGetSymbol( { ... } ): { ... };
    procedure somtSetSymbol( { ... } );
    procedure somtSetSymbolCopyName( { ... } );
    procedure somtSetSymbolCopyValue( { ... } );
    procedure somtSetSymbolCopyBoth( { ... } );
    function somtCheckSymbol( { ... } ): { ... };
    procedure somtSetOutputFile( { ... } );
    procedure somto( { ... } );
    procedure somtOutputComment( { ... } );
    procedure somtOutputSection( { ... } );
    procedure somtAddSectionDefinitions( { ... } );
    procedure somtReadSectionDefinitions( { ... } );
    function somtExpandSymbol( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtCommentStyle: { ... } read _get_somtCommentStyle write _set_somtCommentStyle;
    property somtLineLength: { ... } read _get_somtLineLength write _set_somtLineLength;
    property somtCommentNewline: { ... } read _get_somtCommentNewline write _set_somtCommentNewline;
  end;

  SOMTUnionEntryC = class
    { Found item: somtLabelList }
    { Found item: somtCaseEntry }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtSwitchType( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstCaseEntry( { ... } ): { ... };
    function somtGetNextCaseEntry( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtSwitchType: { ... } read _get_somtSwitchType write _set_somtSwitchType;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMTUserDefinedTypeEntryC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somtOriginalTypedef( { ... } ): { ... };
    function _get_somtBaseTypeObj( { ... } ): { ... };
    function _get_somtTypeObj( { ... } ): { ... };
    function _get_somtPtrs( { ... } ): { ... };
    function _get_somtArrayDimsString( { ... } ): { ... };
    function _get_somtSourceText( { ... } ): { ... };
    function _get_somtType( { ... } ): { ... };
    function _get_somtVisibility( { ... } ): { ... };
    function _get_somtEntryName( { ... } ): { ... };
    procedure _set_somtEntryName( { ... } );
    function _get_somtElementType( { ... } ): { ... };
    procedure _set_somtElementType( { ... } );
    function _get_somtElementTypeName( { ... } ): { ... };
    function _get_somtEntryComment( { ... } ): { ... };
    function _get_somtSourceLineNumber( { ... } ): { ... };
    function _get_somtTypeCode( { ... } ): { ... };
    function _get_somtIsReference( { ... } ): { ... };
    function _get_somtIDLScopedName( { ... } ): { ... };
    function _get_somtCScopedName( { ... } ): { ... };
  public
    function somtGetFirstArrayDimension( { ... } ): { ... };
    function somtGetNextArrayDimension( { ... } ): { ... };
    function somtIsArray( { ... } ): { ... };
    function somtIsPointer( { ... } ): { ... };
    function somtGetModifierValue( { ... } ): { ... };
    function somtGetFirstModifier( { ... } ): { ... };
    function somtGetNextModifier( { ... } ): { ... };
    function somtFormatModifier( { ... } ): { ... };
    function somtGetModifierList( { ... } ): { ... };
    function somtSetSymbolsOnEntry( { ... } ): { ... };
    procedure somtSetEntryStruct( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somtOriginalTypedef: { ... } read _get_somtOriginalTypedef write _set_somtOriginalTypedef;
    property somtBaseTypeObj: { ... } read _get_somtBaseTypeObj write _set_somtBaseTypeObj;
    property somtTypeObj: { ... } read _get_somtTypeObj write _set_somtTypeObj;
    property somtPtrs: { ... } read _get_somtPtrs write _set_somtPtrs;
    property somtArrayDimsString: { ... } read _get_somtArrayDimsString write _set_somtArrayDimsString;
    property somtSourceText: { ... } read _get_somtSourceText write _set_somtSourceText;
    property somtType: { ... } read _get_somtType write _set_somtType;
    property somtVisibility: { ... } read _get_somtVisibility write _set_somtVisibility;
    property somtEntryName: { ... } read _get_somtEntryName write _set_somtEntryName;
    property somtElementType: { ... } read _get_somtElementType write _set_somtElementType;
    property somtElementTypeName: { ... } read _get_somtElementTypeName write _set_somtElementTypeName;
    property somtEntryComment: { ... } read _get_somtEntryComment write _set_somtEntryComment;
    property somtSourceLineNumber: { ... } read _get_somtSourceLineNumber write _set_somtSourceLineNumber;
    property somtTypeCode: { ... } read _get_somtTypeCode write _set_somtTypeCode;
    property somtIsReference: { ... } read _get_somtIsReference write _set_somtIsReference;
    property somtIDLScopedName: { ... } read _get_somtIDLScopedName write _set_somtIDLScopedName;
    property somtCScopedName: { ... } read _get_somtCScopedName write _set_somtCScopedName;
  end;

  SOMDServerMgr = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function somdShutdownServer( { ... } ): { ... };
    function somdShutdownImpl( { ... } ): { ... };
    function somdStartServer( { ... } ): { ... };
    function somdRestartServer( { ... } ): { ... };
    function somdListServer( { ... } ): { ... };
    function somdDisableServer( { ... } ): { ... };
    function somdEnableServer( { ... } ): { ... };
    function somdIsServerEnabled( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

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
    function _get_somDataAlignment( { ... } ): { ... };
    function _get_somInstanceDataOffsets( { ... } ): { ... };
    function _get_somDirectInitClasses( { ... } ): { ... };
  public
    function somNew( { ... } ): { ... };
    function somNewNoInit( { ... } ): { ... };
    function somRenew( { ... } ): { ... };
    function somRenewNoInit( { ... } ): { ... };
    function somRenewNoZero( { ... } ): { ... };
    function somRenewNoInitNoZero( { ... } ): { ... };
    function somAllocate( { ... } ): { ... };
    procedure somDeallocate( { ... } );
    function somJoin( { ... } ): { ... };
    function somEndow( { ... } ): { ... };
    function somClassOfNewClassWithParents( { ... } ): { ... };
    procedure somInitMIClass( { ... } );
    function somAddStaticMethod( { ... } ): { ... };
    procedure somOverrideSMethod( { ... } );
    procedure somClassReady( { ... } );
    procedure somAddDynamicMethod( { ... } );
    function somGetName( { ... } ): { ... };
    procedure somGetVersionNumbers( { ... } );
    function somGetNumMethods( { ... } ): { ... };
    function somGetNumStaticMethods( { ... } ): { ... };
    function somGetParents( { ... } ): { ... };
    function somGetInstanceSize( { ... } ): { ... };
    function somGetInstancePartSize( { ... } ): { ... };
    function somGetInstanceToken( { ... } ): { ... };
    function somGetMemberToken( { ... } ): { ... };
    function somGetClassMtab( { ... } ): { ... };
    function somGetClassData( { ... } ): { ... };
    procedure somSetClassData( { ... } );
    function somGetMethodDescriptor( { ... } ): { ... };
    function somGetMethodIndex( { ... } ): { ... };
    function somGetMethodToken( { ... } ): { ... };
    function somGetNthMethodInfo( { ... } ): { ... };
    function somGetMarshalPlan( { ... } ): { ... };
    function somGetMethodData( { ... } ): { ... };
    function somGetNthMethodData( { ... } ): { ... };
    function somFindMethod( { ... } ): { ... };
    function somFindMethodOk( { ... } ): { ... };
    function somFindSMethod( { ... } ): { ... };
    function somFindSMethodOk( { ... } ): { ... };
    function somLookupMethod( { ... } ): { ... };
    function somGetApplyStub( { ... } ): { ... };
    function somGetPClsMtab( { ... } ): { ... };
    function somCheckVersion( { ... } ): { ... };
    function somDescendedFrom( { ... } ): { ... };
    function somSupportsMethod( { ... } ): { ... };
    function somDefinedMethod( { ... } ): { ... };
    function somMethodImplOwner( { ... } ): { ... };
    function somGetRdStub( { ... } ): { ... };
    procedure somOverrideMtab( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somDataAlignment: { ... } read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: { ... } read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: { ... } read _get_somDirectInitClasses write _set_somDirectInitClasses;
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
    function _get_somDataAlignment( { ... } ): { ... };
    function _get_somInstanceDataOffsets( { ... } ): { ... };
    function _get_somDirectInitClasses( { ... } ): { ... };
  public
    function sommGetSingleInstance( { ... } ): { ... };
    procedure sommFreeSingleInstance( { ... } );
    function somNew( { ... } ): { ... };
    function somNewNoInit( { ... } ): { ... };
    function somRenew( { ... } ): { ... };
    function somRenewNoInit( { ... } ): { ... };
    function somRenewNoZero( { ... } ): { ... };
    function somRenewNoInitNoZero( { ... } ): { ... };
    function somAllocate( { ... } ): { ... };
    procedure somDeallocate( { ... } );
    function somJoin( { ... } ): { ... };
    function somEndow( { ... } ): { ... };
    function somClassOfNewClassWithParents( { ... } ): { ... };
    procedure somInitMIClass( { ... } );
    function somAddStaticMethod( { ... } ): { ... };
    procedure somOverrideSMethod( { ... } );
    procedure somClassReady( { ... } );
    procedure somAddDynamicMethod( { ... } );
    function somGetName( { ... } ): { ... };
    procedure somGetVersionNumbers( { ... } );
    function somGetNumMethods( { ... } ): { ... };
    function somGetNumStaticMethods( { ... } ): { ... };
    function somGetParents( { ... } ): { ... };
    function somGetInstanceSize( { ... } ): { ... };
    function somGetInstancePartSize( { ... } ): { ... };
    function somGetInstanceToken( { ... } ): { ... };
    function somGetMemberToken( { ... } ): { ... };
    function somGetClassMtab( { ... } ): { ... };
    function somGetClassData( { ... } ): { ... };
    procedure somSetClassData( { ... } );
    function somGetMethodDescriptor( { ... } ): { ... };
    function somGetMethodIndex( { ... } ): { ... };
    function somGetMethodToken( { ... } ): { ... };
    function somGetNthMethodInfo( { ... } ): { ... };
    function somGetMarshalPlan( { ... } ): { ... };
    function somGetMethodData( { ... } ): { ... };
    function somGetNthMethodData( { ... } ): { ... };
    function somFindMethod( { ... } ): { ... };
    function somFindMethodOk( { ... } ): { ... };
    function somFindSMethod( { ... } ): { ... };
    function somFindSMethodOk( { ... } ): { ... };
    function somLookupMethod( { ... } ): { ... };
    function somGetApplyStub( { ... } ): { ... };
    function somGetPClsMtab( { ... } ): { ... };
    function somCheckVersion( { ... } ): { ... };
    function somDescendedFrom( { ... } ): { ... };
    function somSupportsMethod( { ... } ): { ... };
    function somDefinedMethod( { ... } ): { ... };
    function somMethodImplOwner( { ... } ): { ... };
    function somGetRdStub( { ... } ): { ... };
    procedure somOverrideMtab( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somDataAlignment: { ... } read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: { ... } read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: { ... } read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  TypecodeDataManipulator = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
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
    function _get_somDataAlignment( { ... } ): { ... };
    function _get_somInstanceDataOffsets( { ... } ): { ... };
    function _get_somDirectInitClasses( { ... } ): { ... };
  public
    function sommBeforeMethod( { ... } ): { ... };
    procedure sommAfterMethod( { ... } );
    function somNew( { ... } ): { ... };
    function somNewNoInit( { ... } ): { ... };
    function somRenew( { ... } ): { ... };
    function somRenewNoInit( { ... } ): { ... };
    function somRenewNoZero( { ... } ): { ... };
    function somRenewNoInitNoZero( { ... } ): { ... };
    function somAllocate( { ... } ): { ... };
    procedure somDeallocate( { ... } );
    function somJoin( { ... } ): { ... };
    function somEndow( { ... } ): { ... };
    function somClassOfNewClassWithParents( { ... } ): { ... };
    procedure somInitMIClass( { ... } );
    function somAddStaticMethod( { ... } ): { ... };
    procedure somOverrideSMethod( { ... } );
    procedure somClassReady( { ... } );
    procedure somAddDynamicMethod( { ... } );
    function somGetName( { ... } ): { ... };
    procedure somGetVersionNumbers( { ... } );
    function somGetNumMethods( { ... } ): { ... };
    function somGetNumStaticMethods( { ... } ): { ... };
    function somGetParents( { ... } ): { ... };
    function somGetInstanceSize( { ... } ): { ... };
    function somGetInstancePartSize( { ... } ): { ... };
    function somGetInstanceToken( { ... } ): { ... };
    function somGetMemberToken( { ... } ): { ... };
    function somGetClassMtab( { ... } ): { ... };
    function somGetClassData( { ... } ): { ... };
    procedure somSetClassData( { ... } );
    function somGetMethodDescriptor( { ... } ): { ... };
    function somGetMethodIndex( { ... } ): { ... };
    function somGetMethodToken( { ... } ): { ... };
    function somGetNthMethodInfo( { ... } ): { ... };
    function somGetMarshalPlan( { ... } ): { ... };
    function somGetMethodData( { ... } ): { ... };
    function somGetNthMethodData( { ... } ): { ... };
    function somFindMethod( { ... } ): { ... };
    function somFindMethodOk( { ... } ): { ... };
    function somFindSMethod( { ... } ): { ... };
    function somFindSMethodOk( { ... } ): { ... };
    function somLookupMethod( { ... } ): { ... };
    function somGetApplyStub( { ... } ): { ... };
    function somGetPClsMtab( { ... } ): { ... };
    function somCheckVersion( { ... } ): { ... };
    function somDescendedFrom( { ... } ): { ... };
    function somSupportsMethod( { ... } ): { ... };
    function somDefinedMethod( { ... } ): { ... };
    function somMethodImplOwner( { ... } ): { ... };
    function somGetRdStub( { ... } ): { ... };
    procedure somOverrideMtab( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somDataAlignment: { ... } read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: { ... } read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: { ... } read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  SOMClassMgr = class
    { Found item: SOMClassArray }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somInterfaceRepository( { ... } ): { ... };
    procedure _set_somInterfaceRepository( { ... } );
    function _get_somRegisteredClasses( { ... } ): { ... };
  public
    function somLoadClassFile( { ... } ): { ... };
    function somLocateClassFile( { ... } ): { ... };
    procedure somRegisterClass( { ... } );
    procedure somRegisterClassLibrary( { ... } );
    procedure somUnregisterClassLibrary( { ... } );
    function somUnloadClassFile( { ... } ): { ... };
    function somUnregisterClass( { ... } ): { ... };
    procedure somBeginPersistentClasses( { ... } );
    procedure somEndPersistentClasses( { ... } );
    function somJoinAffinityGroup( { ... } ): { ... };
    function somGetInitFunction( { ... } ): { ... };
    function somGetRelatedClasses( { ... } ): { ... };
    function somClassFromId( { ... } ): { ... };
    function somFindClass( { ... } ): { ... };
    function somFindClsInFile( { ... } ): { ... };
    procedure somMergeInto( { ... } );
    function somSubstituteClass( { ... } ): { ... };
    function somImportObject( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somInterfaceRepository: { ... } read _get_somInterfaceRepository write _set_somInterfaceRepository;
    property somRegisteredClasses: { ... } read _get_somRegisteredClasses write _set_somRegisteredClasses;
  end;

  SOMMProxyForObject = class
    { Found item: sommProxyDispatchInfo }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_sommProxyTarget( { ... } ): { ... };
    procedure _set_sommProxyTarget( { ... } );
  public
    function sommProxyDispatch( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property sommProxyTarget: { ... } read _get_sommProxyTarget write _set_sommProxyTarget;
  end;

  SOMDObject = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type_id( { ... } ): { ... };
    procedure _set_type_id( { ... } );
  public
    function is_nil( { ... } ): { ... };
    function is_SOM_ref( { ... } ): { ... };
    function is_constant( { ... } ): { ... };
    function get_implementation( { ... } ): { ... };
    function get_interface( { ... } ): { ... };
    function is_proxy( { ... } ): { ... };
    function duplicate( { ... } ): { ... };
    procedure release( { ... } );
    function create_request( { ... } ): { ... };
    function create_request_args( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property type_id: { ... } read _get_type_id write _set_type_id;
  end;

  SOMDClientProxy = class
    { Found item: sommProxyDispatchInfo }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_sommProxyTarget( { ... } ): { ... };
    procedure _set_sommProxyTarget( { ... } );
    function _get_type_id( { ... } ): { ... };
    procedure _set_type_id( { ... } );
  public
    procedure somdTargetFree( { ... } );
    function somdTargetGetClass( { ... } ): { ... };
    function somdTargetGetClassName( { ... } ): { ... };
    procedure somdProxyFree( { ... } );
    function somdProxyGetClass( { ... } ): { ... };
    function somdProxyGetClassName( { ... } ): { ... };
    procedure somdReleaseResources( { ... } );
    function sommProxyDispatch( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    function is_nil( { ... } ): { ... };
    function is_SOM_ref( { ... } ): { ... };
    function is_constant( { ... } ): { ... };
    function get_implementation( { ... } ): { ... };
    function get_interface( { ... } ): { ... };
    function is_proxy( { ... } ): { ... };
    function duplicate( { ... } ): { ... };
    procedure release( { ... } );
    function create_request( { ... } ): { ... };
    function create_request_args( { ... } ): { ... };
    property sommProxyTarget: { ... } read _get_sommProxyTarget write _set_sommProxyTarget;
    property type_id: { ... } read _get_type_id write _set_type_id;
  end;

  SOMDObjectMgr = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somd21somFree( { ... } ): { ... };
    procedure _set_somd21somFree( { ... } );
  public
    function somdFindServer( { ... } ): { ... };
    function somdFindServerByName( { ... } ): { ... };
    function somdFindServersByClass( { ... } ): { ... };
    function somdFindAnyServerByClass( { ... } ): { ... };
    function somdNewObject( { ... } ): { ... };
    function somdGetIdFromObject( { ... } ): { ... };
    function somdGetObjectFromId( { ... } ): { ... };
    procedure somdReleaseObject( { ... } );
    procedure somdDestroyObject( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somd21somFree: { ... } read _get_somd21somFree write _set_somd21somFree;
  end;

  SOMUTId = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    procedure somutSetIdId( { ... } );
    function somutEqualsId( { ... } ): { ... };
    function somutCompareId( { ... } ): { ... };
    function somutHashId( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  SOMOA = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function execute_next_request( { ... } ): { ... };
    function execute_request_loop( { ... } ): { ... };
    procedure change_id( { ... } );
    function create_constant( { ... } ): { ... };
    function create_SOM_ref( { ... } ): { ... };
    function get_SOM_object( { ... } ): { ... };
    procedure activate_impl_failed( { ... } );
    procedure interrupt_server( { ... } );
    function get_service_contexts( { ... } ): { ... };
    function create( { ... } ): { ... };
    procedure dispose( { ... } );
    function get_id( { ... } ): { ... };
    function get_principal( { ... } ): { ... };
    procedure set_exception( { ... } );
    procedure impl_is_ready( { ... } );
    procedure deactivate_impl( { ... } );
    procedure change_implementation( { ... } );
    procedure obj_is_ready( { ... } );
    procedure deactivate_obj( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
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
    function _get_somDataAlignment( { ... } ): { ... };
    function _get_somInstanceDataOffsets( { ... } ): { ... };
    function _get_somDirectInitClasses( { ... } ): { ... };
  public
    procedure somwpclsInitData( { ... } );
    procedure somwpclsUninitData( { ... } );
    function somNew( { ... } ): { ... };
    function somNewNoInit( { ... } ): { ... };
    function somRenew( { ... } ): { ... };
    function somRenewNoInit( { ... } ): { ... };
    function somRenewNoZero( { ... } ): { ... };
    function somRenewNoInitNoZero( { ... } ): { ... };
    function somAllocate( { ... } ): { ... };
    procedure somDeallocate( { ... } );
    function somJoin( { ... } ): { ... };
    function somEndow( { ... } ): { ... };
    function somClassOfNewClassWithParents( { ... } ): { ... };
    procedure somInitMIClass( { ... } );
    function somAddStaticMethod( { ... } ): { ... };
    procedure somOverrideSMethod( { ... } );
    procedure somClassReady( { ... } );
    procedure somAddDynamicMethod( { ... } );
    function somGetName( { ... } ): { ... };
    procedure somGetVersionNumbers( { ... } );
    function somGetNumMethods( { ... } ): { ... };
    function somGetNumStaticMethods( { ... } ): { ... };
    function somGetParents( { ... } ): { ... };
    function somGetInstanceSize( { ... } ): { ... };
    function somGetInstancePartSize( { ... } ): { ... };
    function somGetInstanceToken( { ... } ): { ... };
    function somGetMemberToken( { ... } ): { ... };
    function somGetClassMtab( { ... } ): { ... };
    function somGetClassData( { ... } ): { ... };
    procedure somSetClassData( { ... } );
    function somGetMethodDescriptor( { ... } ): { ... };
    function somGetMethodIndex( { ... } ): { ... };
    function somGetMethodToken( { ... } ): { ... };
    function somGetNthMethodInfo( { ... } ): { ... };
    function somGetMarshalPlan( { ... } ): { ... };
    function somGetMethodData( { ... } ): { ... };
    function somGetNthMethodData( { ... } ): { ... };
    function somFindMethod( { ... } ): { ... };
    function somFindMethodOk( { ... } ): { ... };
    function somFindSMethod( { ... } ): { ... };
    function somFindSMethodOk( { ... } ): { ... };
    function somLookupMethod( { ... } ): { ... };
    function somGetApplyStub( { ... } ): { ... };
    function somGetPClsMtab( { ... } ): { ... };
    function somCheckVersion( { ... } ): { ... };
    function somDescendedFrom( { ... } ): { ... };
    function somSupportsMethod( { ... } ): { ... };
    function somDefinedMethod( { ... } ): { ... };
    function somMethodImplOwner( { ... } ): { ... };
    function somGetRdStub( { ... } ): { ... };
    procedure somOverrideMtab( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somDataAlignment: { ... } read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: { ... } read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: { ... } read _get_somDirectInitClasses write _set_somDirectInitClasses;
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
    function _get_somNonDerivedFrontier( { ... } ): { ... };
    function _get_somDataAlignment( { ... } ): { ... };
    function _get_somInstanceDataOffsets( { ... } ): { ... };
    function _get_somDirectInitClasses( { ... } ): { ... };
  public
    function somNew( { ... } ): { ... };
    function somNewNoInit( { ... } ): { ... };
    function somRenew( { ... } ): { ... };
    function somRenewNoInit( { ... } ): { ... };
    function somRenewNoZero( { ... } ): { ... };
    function somRenewNoInitNoZero( { ... } ): { ... };
    function somAllocate( { ... } ): { ... };
    procedure somDeallocate( { ... } );
    function somJoin( { ... } ): { ... };
    function somEndow( { ... } ): { ... };
    function somClassOfNewClassWithParents( { ... } ): { ... };
    procedure somInitMIClass( { ... } );
    function somAddStaticMethod( { ... } ): { ... };
    procedure somOverrideSMethod( { ... } );
    procedure somClassReady( { ... } );
    procedure somAddDynamicMethod( { ... } );
    function somGetName( { ... } ): { ... };
    procedure somGetVersionNumbers( { ... } );
    function somGetNumMethods( { ... } ): { ... };
    function somGetNumStaticMethods( { ... } ): { ... };
    function somGetParents( { ... } ): { ... };
    function somGetInstanceSize( { ... } ): { ... };
    function somGetInstancePartSize( { ... } ): { ... };
    function somGetInstanceToken( { ... } ): { ... };
    function somGetMemberToken( { ... } ): { ... };
    function somGetClassMtab( { ... } ): { ... };
    function somGetClassData( { ... } ): { ... };
    procedure somSetClassData( { ... } );
    function somGetMethodDescriptor( { ... } ): { ... };
    function somGetMethodIndex( { ... } ): { ... };
    function somGetMethodToken( { ... } ): { ... };
    function somGetNthMethodInfo( { ... } ): { ... };
    function somGetMarshalPlan( { ... } ): { ... };
    function somGetMethodData( { ... } ): { ... };
    function somGetNthMethodData( { ... } ): { ... };
    function somFindMethod( { ... } ): { ... };
    function somFindMethodOk( { ... } ): { ... };
    function somFindSMethod( { ... } ): { ... };
    function somFindSMethodOk( { ... } ): { ... };
    function somLookupMethod( { ... } ): { ... };
    function somGetApplyStub( { ... } ): { ... };
    function somGetPClsMtab( { ... } ): { ... };
    function somCheckVersion( { ... } ): { ... };
    function somDescendedFrom( { ... } ): { ... };
    function somSupportsMethod( { ... } ): { ... };
    function somDefinedMethod( { ... } ): { ... };
    function somMethodImplOwner( { ... } ): { ... };
    function somGetRdStub( { ... } ): { ... };
    procedure somOverrideMtab( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somNonDerivedFrontier: { ... } read _get_somNonDerivedFrontier write _set_somNonDerivedFrontier;
    property somDataAlignment: { ... } read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: { ... } read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: { ... } read _get_somDirectInitClasses write _set_somDirectInitClasses;
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
    function _get_somDataAlignment( { ... } ): { ... };
    function _get_somInstanceDataOffsets( { ... } ): { ... };
    function _get_somDirectInitClasses( { ... } ): { ... };
  public
    function sommMakeProxyClass( { ... } ): { ... };
    function somNew( { ... } ): { ... };
    function somNewNoInit( { ... } ): { ... };
    function somRenew( { ... } ): { ... };
    function somRenewNoInit( { ... } ): { ... };
    function somRenewNoZero( { ... } ): { ... };
    function somRenewNoInitNoZero( { ... } ): { ... };
    function somAllocate( { ... } ): { ... };
    procedure somDeallocate( { ... } );
    function somJoin( { ... } ): { ... };
    function somEndow( { ... } ): { ... };
    function somClassOfNewClassWithParents( { ... } ): { ... };
    procedure somInitMIClass( { ... } );
    function somAddStaticMethod( { ... } ): { ... };
    procedure somOverrideSMethod( { ... } );
    procedure somClassReady( { ... } );
    procedure somAddDynamicMethod( { ... } );
    function somGetName( { ... } ): { ... };
    procedure somGetVersionNumbers( { ... } );
    function somGetNumMethods( { ... } ): { ... };
    function somGetNumStaticMethods( { ... } ): { ... };
    function somGetParents( { ... } ): { ... };
    function somGetInstanceSize( { ... } ): { ... };
    function somGetInstancePartSize( { ... } ): { ... };
    function somGetInstanceToken( { ... } ): { ... };
    function somGetMemberToken( { ... } ): { ... };
    function somGetClassMtab( { ... } ): { ... };
    function somGetClassData( { ... } ): { ... };
    procedure somSetClassData( { ... } );
    function somGetMethodDescriptor( { ... } ): { ... };
    function somGetMethodIndex( { ... } ): { ... };
    function somGetMethodToken( { ... } ): { ... };
    function somGetNthMethodInfo( { ... } ): { ... };
    function somGetMarshalPlan( { ... } ): { ... };
    function somGetMethodData( { ... } ): { ... };
    function somGetNthMethodData( { ... } ): { ... };
    function somFindMethod( { ... } ): { ... };
    function somFindMethodOk( { ... } ): { ... };
    function somFindSMethod( { ... } ): { ... };
    function somFindSMethodOk( { ... } ): { ... };
    function somLookupMethod( { ... } ): { ... };
    function somGetApplyStub( { ... } ): { ... };
    function somGetPClsMtab( { ... } ): { ... };
    function somCheckVersion( { ... } ): { ... };
    function somDescendedFrom( { ... } ): { ... };
    function somSupportsMethod( { ... } ): { ... };
    function somDefinedMethod( { ... } ): { ... };
    function somMethodImplOwner( { ... } ): { ... };
    function somGetRdStub( { ... } ): { ... };
    procedure somOverrideMtab( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somDataAlignment: { ... } read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: { ... } read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: { ... } read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  SOMUTStringId = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  public
    function somutSetIdString( { ... } ): { ... };
    function somutGetIdString( { ... } ): { ... };
    function somutGetIdStringLen( { ... } ): { ... };
    function somutEqualsString( { ... } ): { ... };
    function somutCompareString( { ... } ): { ... };
    procedure somutSetIdId( { ... } );
    function somutEqualsId( { ... } ): { ... };
    function somutCompareId( { ... } ): { ... };
    function somutHashId( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

  SOMStringTableC = class
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_somstTargetCapacity( { ... } ): { ... };
    procedure _set_somstTargetCapacity( { ... } );
    function _get_somstAssociationsCount( { ... } ): { ... };
  public
    function somstAssociate( { ... } ): { ... };
    function somstAssociateCopyKey( { ... } ): { ... };
    function somstAssociateCopyValue( { ... } ): { ... };
    function somstAssociateCopyBoth( { ... } ): { ... };
    function somstGetAssociation( { ... } ): { ... };
    function somstClearAssociation( { ... } ): { ... };
    function somstGetIthKey( { ... } ): { ... };
    function somstGetIthValue( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property somstTargetCapacity: { ... } read _get_somstTargetCapacity write _set_somstTargetCapacity;
    property somstAssociationsCount: { ... } read _get_somstAssociationsCount write _set_somstAssociationsCount;
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
    function _get_sommTraceIsOn( { ... } ): { ... };
    procedure _set_sommTraceIsOn( { ... } );
    function _get_somDataAlignment( { ... } ): { ... };
    function _get_somInstanceDataOffsets( { ... } ): { ... };
    function _get_somDirectInitClasses( { ... } ): { ... };
  public
    function sommBeforeMethod( { ... } ): { ... };
    procedure sommAfterMethod( { ... } );
    function somNew( { ... } ): { ... };
    function somNewNoInit( { ... } ): { ... };
    function somRenew( { ... } ): { ... };
    function somRenewNoInit( { ... } ): { ... };
    function somRenewNoZero( { ... } ): { ... };
    function somRenewNoInitNoZero( { ... } ): { ... };
    function somAllocate( { ... } ): { ... };
    procedure somDeallocate( { ... } );
    function somJoin( { ... } ): { ... };
    function somEndow( { ... } ): { ... };
    function somClassOfNewClassWithParents( { ... } ): { ... };
    procedure somInitMIClass( { ... } );
    function somAddStaticMethod( { ... } ): { ... };
    procedure somOverrideSMethod( { ... } );
    procedure somClassReady( { ... } );
    procedure somAddDynamicMethod( { ... } );
    function somGetName( { ... } ): { ... };
    procedure somGetVersionNumbers( { ... } );
    function somGetNumMethods( { ... } ): { ... };
    function somGetNumStaticMethods( { ... } ): { ... };
    function somGetParents( { ... } ): { ... };
    function somGetInstanceSize( { ... } ): { ... };
    function somGetInstancePartSize( { ... } ): { ... };
    function somGetInstanceToken( { ... } ): { ... };
    function somGetMemberToken( { ... } ): { ... };
    function somGetClassMtab( { ... } ): { ... };
    function somGetClassData( { ... } ): { ... };
    procedure somSetClassData( { ... } );
    function somGetMethodDescriptor( { ... } ): { ... };
    function somGetMethodIndex( { ... } ): { ... };
    function somGetMethodToken( { ... } ): { ... };
    function somGetNthMethodInfo( { ... } ): { ... };
    function somGetMarshalPlan( { ... } ): { ... };
    function somGetMethodData( { ... } ): { ... };
    function somGetNthMethodData( { ... } ): { ... };
    function somFindMethod( { ... } ): { ... };
    function somFindMethodOk( { ... } ): { ... };
    function somFindSMethod( { ... } ): { ... };
    function somFindSMethodOk( { ... } ): { ... };
    function somLookupMethod( { ... } ): { ... };
    function somGetApplyStub( { ... } ): { ... };
    function somGetPClsMtab( { ... } ): { ... };
    function somCheckVersion( { ... } ): { ... };
    function somDescendedFrom( { ... } ): { ... };
    function somSupportsMethod( { ... } ): { ... };
    function somDefinedMethod( { ... } ): { ... };
    function somMethodImplOwner( { ... } ): { ... };
    function somGetRdStub( { ... } ): { ... };
    procedure somOverrideMtab( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property sommTraceIsOn: { ... } read _get_sommTraceIsOn write _set_sommTraceIsOn;
    property somDataAlignment: { ... } read _get_somDataAlignment write _set_somDataAlignment;
    property somInstanceDataOffsets: { ... } read _get_somInstanceDataOffsets write _set_somInstanceDataOffsets;
    property somDirectInitClasses: { ... } read _get_somDirectInitClasses write _set_somDirectInitClasses;
  end;

  TSIdentification = class
    { Found item: NotAvailable }
    { Found item: AlreadyIdentified }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_sender( { ... } ): { ... };
    function _get_receiver( { ... } ): { ... };
  public
    procedure identify_sender( { ... } );
    procedure identify_receiver( { ... } );
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property sender: { ... } read _get_sender write _set_sender;
    property receiver: { ... } read _get_receiver write _set_receiver;
  end;

  TypeDef = class
    { Found item: TypeDescription }
    { Found item: Description }
    { Found item: SOMObjectSequence }
    { Found item: BooleanSequence }
    { Found item: somObjectOffset }
    { Found item: somObjectOffsets }
  private
    function _get_type( { ... } ): { ... };
    procedure _set_type( { ... } );
    function _get_name( { ... } ): { ... };
    procedure _set_name( { ... } );
    function _get_id( { ... } ): { ... };
    procedure _set_id( { ... } );
    function _get_defined_in( { ... } ): { ... };
    procedure _set_defined_in( { ... } );
    function _get_somModifiers( { ... } ): { ... };
    procedure _set_somModifiers( { ... } );
  public
    function within( { ... } ): { ... };
    function describe( { ... } ): { ... };
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
    property type: { ... } read _get_type write _set_type;
    property name: { ... } read _get_name write _set_name;
    property id: { ... } read _get_id write _set_id;
    property defined_in: { ... } read _get_defined_in write _set_defined_in;
    property somModifiers: { ... } read _get_somModifiers write _set_somModifiers;
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
    procedure somDefaultInit( { ... } );
    procedure somDestruct( { ... } );
    procedure somDefaultCopyInit( { ... } );
    function somDefaultAssign( { ... } ): { ... };
    procedure somDefaultConstCopyInit( { ... } );
    procedure somDefaultVCopyInit( { ... } );
    procedure somDefaultConstVCopyInit( { ... } );
    function somDefaultConstAssign( { ... } ): { ... };
    function somDefaultVAssign( { ... } ): { ... };
    function somDefaultConstVAssign( { ... } ): { ... };
    procedure somInit( { ... } );
    procedure somUninit( { ... } );
    procedure somFree( { ... } );
    function somGetClass( { ... } ): { ... };
    function somGetClassName( { ... } ): { ... };
    function somGetSize( { ... } ): { ... };
    function somIsA( { ... } ): { ... };
    function somIsInstanceOf( { ... } ): { ... };
    function somRespondsTo( { ... } ): { ... };
    function somDispatch( { ... } ): { ... };
    function somClassDispatch( { ... } ): { ... };
    function somCastObj( { ... } ): { ... };
    function somResetObj( { ... } ): { ... };
    function somPrintSelf( { ... } ): { ... };
    procedure somDumpSelf( { ... } );
    procedure somDumpSelfInt( { ... } );
  end;

{ Found item: bhany }

{ Found item: int }

{ Found item: uchar_t }

{ Found item: size_t }

{ Found item: signed_char }

{ Found item: SOMFOREIGN }

{ Found item: FILE }

{ Found item: va_list }

{ Found item: SOMHANDLE }

{ Found item: somToken }

{ Found item: somId }

{ Found item: TCKind }

{ Found item: integer1 }

{ Found item: integer2 }

{ Found item: uinteger2 }

{ Found item: integer4 }

{ Found item: uinteger4 }

{ Found item: float4 }

{ Found item: float8 }

{ Found item: zString }

{ Found item: fString }

{ Found item: somMethodProc }

{ Found item: somMethodPtr }

{ Found item: somMethodTab }

{ Found item: SOMAny }

{ Found item: somMToken }

{ Found item: somDToken }

{ Found item: somGenericCtrl }

{ Found item: som3InitCtrl }

{ Found item: som3DestructCtrl }

{ Found item: som3AssignCtrl }

{ Found item: somInitCtrl }

{ Found item: somDestructCtrl }

{ Found item: somAssignCtrl }

{ Found item: somMethodDataStruct }

{ Found item: somMethodData }

{ Found item: somClassList }

{ Found item: somClasses }

{ Found item: somObjects }

{ Found item: somMethodTabList }

{ Found item: somMethodTabs }

{ Found item: somParentMtabStructPtr }

{ Found item: somBooleanVector }

{ Found item: exception_type }

{ Found item: Environment }

{ Found item: somCClassDataStructurePtr }

{ Found item: somClassDataStructurePtr }

{ Found item: somMethodTabPtr }

{ Found item: somEmbeddedObjStructPtr }

{ Found item: somMethodDefnPtr }

{ Found item: somClassMemPtr }

{ Found item: somClassVars3Ptr }

{ Found item: SOM_CIBPtr }

{ Found item: somModifier }

{ Found item: Identifier }

{ Found item: RepositoryId }

{ Found item: SOMObject }

{ Found item: Contained }

{ Found item: AttributeDef }

{ Found item: CosNaming }

{ Found item: Biter }

{ Found item: completion_status }

{ Found item: ORBStatus }

{ Found item: ReferenceData }

{ Found item: Flags }

{ Found item: ORBid }

{ Found item: NamedValue }

{ Found item: ImplId }

{ Found item: SOMD }

{ Found item: BOA }

{ Found item: somtCommentStyleT }

{ Found item: Entry }

{ Found item: SOMTTargetTypeT }

{ Found item: SOMTTypes }

{ Found item: SOMTEmitC }

{ Found item: brsclassc }

{ Found item: Context }

{ Found item: ConstantDef }

{ Found item: Container }

{ Found item: DirectToSomCpp }

{ Found item: CTMEmitC }

{ Found item: DTSImplTmpl }

{ Found item: ExceptionDef }

{ Found item: ExtendedNaming }

{ Found item: IIOP }

{ Found item: IOR }

{ Found item: CosObjectIdentity }

{ Found item: somOS }

{ Found item: SOMDServer }

{ Found item: CosLifeCycle }

{ Found item: CosStream }

{ Found item: somStream }

{ Found item: SOMDForeignMarshaler }

{ Found item: Mlist }

{ Found item: AttList }

{ Found item: NumberList }

{ Found item: SwitchBody }

{ Found item: somInitModEmitter }

{ Found item: ImplementationDef }

{ Found item: ImplRepository }

{ Found item: ContextIdentifier }

{ Found item: InterfaceDef }

{ Found item: LName }

{ Found item: LNameComponent }

{ Found item: ModuleDef }

{ Found item: NVList }

{ Found item: ObjectMgr }

{ Found item: OperationDef }

{ Found item: ORB }

{ Found item: ParameterDef }

{ Found item: Principal }

{ Found item: Repository }

{ Found item: Request }

{ Found item: SOMTEntryC }

{ Found item: SOMTAttributeEntryC }

{ Found item: SOMTBaseClassEntryC }

{ Found item: SOMTClassEntryC }

{ Found item: somtVisibilityT }

{ Found item: SOMTCommonEntryC }

{ Found item: SOMTConstEntryC }

{ Found item: SOMTDataEntryC }

{ Found item: SOMTEnumEntryC }

{ Found item: SOMTEnumNameEntryC }

{ Found item: SOMTMetaClassEntryC }

{ Found item: SOMTMethodEntryC }

{ Found item: SOMTModuleEntryC }

{ Found item: somtParameterDirectionT }

{ Found item: SOMTParameterEntryC }

{ Found item: SOMTPassthruEntryC }

{ Found item: SOMTSequenceEntryC }

{ Found item: SOMTStringEntryC }

{ Found item: SOMTStructEntryC }

{ Found item: SOMTTypedefEntryC }

{ Found item: SOMTTemplateOutputC }

{ Found item: SOMTUnionEntryC }

{ Found item: SOMTUserDefinedTypeEntryC }

{ Found item: SOMDServerMgr }

{ Found item: SOMClass }

{ Found item: SOMMSingleInstance }

{ Found item: somAttributePersistence }

{ Found item: TypecodeDataManipulator }

{ Found item: SOMMBeforeAfter }

{ Found item: SOMClassMgr }

{ Found item: SOMMProxyForObject }

{ Found item: SOMDObject }

{ Found item: SOMDClientProxy }

{ Found item: SOMDObjectMgr }

{ Found item: SOMUTId }

{ Found item: SOMOA }

{ Found item: SOMParentDerived }

{ Found item: SOMParentDerivedMetaclass }

{ Found item: SOMMProxyFor }

{ Found item: SOMUTStringId }

{ Found item: entryT }

{ Found item: tablePT }

{ Found item: SOMStringTableC }

{ Found item: SOMMTraced }

{ Found item: StExcep }

{ Found item: TSPortability }

{ Found item: TSIdentification }

{ Found item: TypeDef }

{ Found item: SysAdminException }

{ Found item: FileXNaming }

implementation

end.
