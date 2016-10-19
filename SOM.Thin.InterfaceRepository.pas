{$R-}
{$WARN UNSAFE_TYPE OFF}

unit SOM.Thin.InterfaceRepository;

// Define everything that becomes available in C when doing "#include <repository.h>"

interface

uses
  SOM.DelphiFeatures, SOM.Thin;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

// #include <somir.h>

(*
 *    SOMIR.H
 *    Typedefs, structs, & enums in support of the CORBA Interface Repository
 *    for use with SOM
 *
 *    #22160  05/16/96   partha     _WIN32: replace _System with _stdcall
 *)

(*
 * The following structure is for a SOM-unique extension
 * to the CORBA Interface Repository
 *)

type
  somModifier = record
    name: CORBAString;
    value: CORBAString;
  end;
  PsomModifier = ^somModifier;

(*
 * Miscellaneous "ir" helper functions
 *)

function irGetFileNames: PAnsiChar; stdcall;
function irGetLastFileName: PAnsiChar; stdcall;

// #include <containd.h>

type
  Contained = SOMObject;
  PContained = ^Contained;

(*
 *  CORBA 1.1, 7.5.1, p.130
 * 
 *  The Contained interface is the most generic form of interface
 *  for the objects in the SOM CORBA-compliant Interface Repository (IR).
 *  All objects contained in the IR inherit this interface.
 *)

(*
 * Start of bindings for IDL types
 *)

type
  Container = SOMObject;
  PContainer = ^Container;

  Contained_Description = record
    name: Identifier;
    value: any;
  end;
  PContained_Description = ^Contained_Description;

  _IDL_SEQUENCE_somModifier = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PsomModifier;
  end;
  P_IDL_SEQUENCE_somModifier = ^_IDL_SEQUENCE_somModifier;

  _IDL_SEQUENCE_Container = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PContainer;
  end;

(*
 * End of bindings for IDL types.
 *)

const
  Contained_MajorVersion = 2;
  Contained_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function ContainedNewClass(
  somtmajorVersion: integer4 = Contained_MajorVersion;
  somtminorVersion: integer4 = Contained_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type ContainedClassDataStructure = record
  classObject: SOMClass;
  within: somMToken;
  describe: somMToken;
  _get_name: somMToken;
  _set_name: somMToken;
  _get_id: somMToken;
  _set_id: somMToken;
  _get_defined_in: somMToken;
  _set_defined_in: somMToken;
  _get_somModifiers: somMToken;
  _set_somModifiers: somMToken;
end;
PContainedClassDataStructure = ^ContainedClassDataStructure;
function ContainedClassData: PContainedClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type ContainedCClassDataStructure = record
  somMethodTabs parentMtab;
  somDToken instanceDataToken;
end;
PContainedCClassDataStructure = ^ContainedCClassDataStructure;
function ContainedCClassData: PContainedCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Contained: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for Contained
 *)
function ContainedNew: Contained;
function ContainedRenew(buf: Pointer): Contained;

(*
 * New Method: _get_name
 *)
type
  somTP_Contained__get_name = function(somSelf: Contained; ev: PEnvironment): Identifier; stdcall;
  somTD_Contained__get_name = somTP_Contained__get_name;
(*
 *  The value of the "name" field of the receiving object
 * 
 *  This is a simple name that indentifies the receiving object
 *  within its containment hierarchy.  Outside of the containment
 *  hierarchy this name is not necessarily unique, and may require
 *  qualification by ModuleDef name, InterfaceDef name, etc.
 *)
const somMD_Contained__get_name = '::Contained::_get_name';
function Contained__get_name(somSelf: Contained; ev: PEnvironment):
  Identifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_name
 *)
type
  somTP_Contained__set_name = procedure(somSelf: Contained; ev: PEnvironment;
    name: Identifier); stdcall;
  somTD_Contained__set_name = somTP_Contained__set_name;
(*
 *  The value of the "name" field of the receiving object
 * 
 *  This is a simple name that indentifies the receiving object
 *  within its containment hierarchy.  Outside of the containment
 *  hierarchy this name is not necessarily unique, and may require
 *  qualification by ModuleDef name, InterfaceDef name, etc.
 *)
const somMD_Contained__set_name = '::Contained::_set_name';
procedure Contained__set_name(somSelf: Contained; ev: PEnvironment;
  name: Identifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_id
 *)
type
  somTP_Contained__get_id = function(somSelf: Contained; ev: PEnvironment): RepositoryId; stdcall;
  somTD_Contained__get_id = somTP_Contained__get_id;
(*
 *  The value of the "id" field of the receiving object
 * 
 *  The "id" is a string that uniquely identifies any object in
 *  the interface repository.  No qualification is needed for
 *  an "id".  Notice that "RepositoryId"s have no relationship
 *  to the SOM type "somId".
 *)
const somMD_Contained__get_id = '::Contained::_get_id';
function Contained__get_id(somSelf: Contained; ev: PEnvironment):
  RepositoryId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_id
 *)
type
  somTP_Contained__set_id = procedure(somSelf: Contained; ev: PEnvironment;
    id: RepositoryId); stdcall;
  somTD_Contained__set_id = somTP_Contained__set_id;
(*
 *  The value of the "id" field of the receiving object
 * 
 *  The "id" is a string that uniquely identifies any object in
 *  the interface repository.  No qualification is needed for
 *  an "id".  Notice that "RepositoryId"s have no relationship
 *  to the SOM type "somId".
 *)
const somMD_Contained__set_id = '::Contained::_set_id';
procedure Contained__set_id(somSelf: Contained; ev: PEnvironment;
  id: RepositoryId); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_defined_in
 *)
type
  somTP_Contained__get_defined_in = function(somSelf: Contained; ev: PEnvironment): RepositoryId; stdcall;
  somTD_Contained__get_defined_in = somTP_Contained__get_defined_in;
(*
 *  The value of the "defined_in" field of the receiving object
 * 
 *  This "id" uniquely identifies the container where the
 *  receiving object is defined.  Objects that have global scope
 *  and do not appear within any other objects are by default
 *  placed in the "Repository" object.
 *)
const somMD_Contained__get_defined_in = '::Contained::_get_defined_in';
function Contained__get_defined_in(somSelf: Contained; ev: PEnvironment):
  RepositoryId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_defined_in
 *)
type
  somTP_Contained__set_defined_in = procedure(somSelf: Contained; ev: PEnvironment;
    defined_in: RepositoryId); stdcall;
  somTD_Contained__set_defined_in = somTP_Contained__set_defined_in;
(*
 *  The value of the "defined_in" field of the receiving object
 * 
 *  This "id" uniquely identifies the container where the
 *  receiving object is defined.  Objects that have global scope
 *  and do not appear within any other objects are by default
 *  placed in the "Repository" object.
 *)
const somMD_Contained__set_defined_in = '::Contained::_set_defined_in';
procedure Contained__set_defined_in(somSelf: Contained; ev: PEnvironment;
  defined_in: RepositoryId); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_somModifiers
 *)
type
  somTP_Contained__get_somModifiers = function(somSelf: Contained; ev: PEnvironment): _IDL_SEQUENCE_somModifier; stdcall;
  somTD_Contained__get_somModifiers = somTP_Contained__get_somModifiers;
(*
 *  [SOM-unique extension]
 * 
 *  The somModifiers attribute is a sequence containing all of
 *  the "modifiers" attached to the corresponding IDL object in
 *  the SOM-unique implementation section of the IDL file where
 *  the receiving object was originally defined.
 *)
const somMD_Contained__get_somModifiers = '::Contained::_get_somModifiers';
function Contained__get_somModifiers(somSelf: Contained; ev: PEnvironment):
  _IDL_SEQUENCE_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_somModifiers
 *)
type
  somTP_Contained__set_somModifiers = procedure(somSelf: Contained; ev: PEnvironment;
    somModifiers: P_IDL_SEQUENCE_somModifier); stdcall;
  somTD_Contained__set_somModifiers = somTP_Contained__set_somModifiers;
(*
 *  [SOM-unique extension]
 * 
 *  The somModifiers attribute is a sequence containing all of
 *  the "modifiers" attached to the corresponding IDL object in
 *  the SOM-unique implementation section of the IDL file where
 *  the receiving object was originally defined.
 *)
const somMD_Contained__set_somModifiers = '::Contained::_set_somModifiers';
procedure Contained__set_somModifiers(somSelf: Contained; ev: PEnvironment;
  somModifiers: P_IDL_SEQUENCE_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: within
 *)
type
  somTP_Contained_within = function(somSelf: Contained; ev: PEnvironment): _IDL_SEQUENCE_Container; stdcall;
  somTD_Contained_within = somTP_Contained_within;
(*
 *  Returns a list of objects that contain the receiving object.
 *  If the object is an interface or module, it can only be contained
 *  by the object that defines it.  Other objects can be contained by
 *  objects that define or inherit them.
 * 
 *  When you have finished using the sequence returned by this method
 *  it is your responsibility to release the storage allocated for it.
 *  To free the sequence, use a call similar to the following:
 * 
 *     if (seqname._length)
 *         long i;
 *         for(i=0; i<seqname._length; i++)
 *     _somFree(seqname._buffer[i]);
 *         SOMFree (seqname._buffer);
 *)
const somMD_Contained_within = '::Contained::within';
function Contained_within(somSelf: Contained; ev: PEnvironment):
  _IDL_SEQUENCE_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: describe
 *)
type
  somTP_Contained_describe = function(somSelf: Contained; ev: PEnvironment): Contained_Description; stdcall;
  somTD_Contained_describe = somTP_Contained_describe;
(*
 *  Returns a structure containing all of the attributes defined in
 *  the interface of the receiving object.
 * 
 *  Warning: this method returns pointers to things withing objects
 *  (for example, name).  Don't use the somFree method to release
 *  any of these objects while this information is still needed..
 * 
 *  When you have finished using the information in the returned
 *  Description structure, it is your responsibility to release
 *  the associated storage using a call similar to the following:
 * 
 *     if (desc.value._value)
 *         SOMFree (desc.value._value);
 *)
const somMD_Contained_describe = '::Contained::describe';
function Contained_describe(somSelf: Contained; ev: PEnvironment):
  Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <containr.h>

(*
 * Define the class name as an object type
 *)

// type
//   Container = SOMObject;

(*
 *  CORBA 1.1, 7.5.1, p.131
 * 
 *  Container is a generic interface that is common to all of the
 *  SOM CORBA-compliant Interface Repository (IR) objects that can
 *  be used to hold or contain other objects.  The different types
 *  of Container objects are: ModuleDefs, InterfaceDefs, and OperationDefs,
 *)

(*
 * Start of bindings for IDL types
 *)

type
  Container_InterfaceName = CORBAString;
(*
 *  Valid values for InterfaceName are limited to the following set:
 *    {"AttributeDef", "ConstantDef", "ExceptionDef", "InterfaceDef",
 *     "ModuleDef", "ParameterDef", "OperationDef", "TypeDef", "all"}
 *)
  Container_ContainerDescription = record
    contained_object: Contained;
    name: Identifier;
    value: any;
  end;
  PContainer_ContainerDescription = ^Container_ContainerDescription;

  _IDL_SEQUENCE_Contained = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PContained;
  end;
  P_IDL_SEQUENCE_Contained = ^_IDL_SEQUENCE_Contained;

  _IDL_SEQUENCE_Container_ContainerDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PContainer_ContainerDescription;
  end;
  P_IDL_SEQUENCE_Container_ContainerDescription = ^_IDL_SEQUENCE_Container_ContainerDescription;

(*
 * End of bindings for IDL types.
 *)

const
  Container_MajorVersion = 2;
  Container_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function ContainerNewClass(
  somtmajorVersion: integer4 = Container_MajorVersion;
  somtminorVersion: integer4 = Container_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type ContainerClassDataStructure = record
  classObject: SOMClass;
  contents: somMToken;
  lookup_name: somMToken;
  describe_contents: somMToken;
end;
PContainerClassDataStructure = ^ContainerClassDataStructure;
function ContainerClassData: PContainerClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type ContainerCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PContainerCClassDataStructure = ^ContainerCClassDataStructure;
function ContainerCClassData: PContainerCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Container: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for Container
 *)
function ContainerNew: Container;
function ContainerRenew(buf: Pointer): Container;

(*
 * New Method: contents
 *)
type
  somTP_Container_contents = function(somSelf: Container; ev: PEnvironment;
    limit_type: Container_InterfaceName; exclude_inherited: CORBABoolean):
    _IDL_SEQUENCE_Contained; stdcall;
  somTD_Container_contents = somTP_Container_contents;
(*
 *  Returns a list of objects contained by the receiving object.
 *  This operation is used to navigate thru the hierarchy of objects.
 *  Starting with the Repository object, use this operation to list
 *  all of the objects in the Repository, then all of the objects
 *  within the ModuleDef objects, then all of the objects in the
 *  InterfaceDefs, etc.
 * 
 *  If restrict_type is set to "all", objects of all interface types
 *  are returned, otherwise only objects of the requested interface type
 *  will be returned.  If exclude_inherited is set to TRUE, inherited
 *  objects, if any, will not be returned.
 * 
 *  You are responsible for freeing the contents of the returned
 *  sequence when you are finished with it.  Use a code fragment
 *  similar to the following to free it:
 * 
 *     if (containedSeq._length)
 *         long i;
 *         for(i=0; i<containedSeq._length; i++)
 *     SOMObject_somFree(containedSeq._buffer[i]);
 *         SOMFree (containedSeq._buffer);
 *)
const somMD_Container_contents = '::Container::contents';
function Container_contents(somSelf: Container; ev: PEnvironment;
  limit_type: Container_InterfaceName; exclude_inherited: CORBABoolean):
  _IDL_SEQUENCE_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: lookup_name
 *)
type
  somTP_Container_lookup_name = function(somSelf: Container; ev: PEnvironment;
    search_name: Identifier; levels_to_search: LongInt;
    limit_type: Container_InterfaceName; exclude_inherited: CORBABoolean):
    _IDL_SEQUENCE_Contained; stdcall;
  somTD_Container_lookup_name = somTP_Container_lookup_name;
(*
 *  Locates an object by name within the receiving object, or within
 *  objects contained in the receiving object.  Search_name specifies
 *  the name of the object to be found.  Levels_to_search controls
 *  whether the lookup is constrained to the receiving object or
 *  whether it includes objects contained withing the receiving object.
 *  (Set levels_to_search to -1 to search the receiver and all contained
 *  objects, -- set it to 1 to search the receiver only.)  If
 *  limit_type is set to "all", objects of all interface types
 *  are returned, otherwise only objects of the requested interface type
 *  will be returned.  Only the values "AttributeDef", "ConstantDef",
 *  "ExceptionDef", "InterfaceDef", "ModuleDef", "ParameterDef",
 *  "OperationDef", "TypeDef", or "all" may be specified for limit_type.
 *  If exclude_inherited is set to TRUE, inherited objects will not be
 *  included in the returned sequence.
 * 
 *  You are responsible for freeing the contents of the returned
 *  sequence when you are finished with it.  Use a code fragment
 *  similar to the following to free it:
 * 
 *     if (containedSeq._length)
 *         long i;
 *         for(i=0; i<containedSeq._length; i++)
 *     SOMObject_somFree(containedSeq._buffer[i]);
 *         SOMFree (containedSeq._buffer);
 *)
const somMD_Container_lookup_name = '::Container::lookup_name';
function Container_lookup_name(somSelf: Container; ev: PEnvironment;
  search_name: Identifier; levels_to_search: LongInt;
  limit_type: Container_InterfaceName; exclude_inherited: CORBABoolean):
  _IDL_SEQUENCE_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: describe_contents
 *)
type
  somTP_Container_describe_contents = function(somSelf: Container;
    ev: PEnvironment; limit_type: Container_InterfaceName;
    exclude_inherited: CORBABoolean; max_returned_objs: LongInt):
    _IDL_SEQUENCE_Container_ContainerDescription; stdcall;
  somTD_Container_describe_contents = somTP_Container_describe_contents;
(*
 *  Combines the "contents" operation and the "describe" operation.  For
 *  each object returned by the contents operation, the description of
 *  the object is returned by invoking its "describe" operation.
 * 
 *  Max_returned_objs can be used to limit the number of objects that can
 *  be returned.  If max_returned_objs is set to -1, results for all
 *  contained objects will be returned.
 * 
 *  Note: You should SOMFree result._buffer when you are done with it
 *  as well as result._buffer[x].value._value !
 *)
const somMD_Container_describe_contents = '::Container::describe_contents';
function Container_describe_contents(somSelf: Container; ev: PEnvironment;
  limit_type: Container_InterfaceName; exclude_inherited: CORBABoolean;
  max_returned_objs: LongInt): _IDL_SEQUENCE_Container_ContainerDescription;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <repository.h>

(*
 * Define the class name as an object type
 *)
// type
//   Repository = SOMObject;
(*
 *  The Repository interface provides global access to the SOM
 *  CORBA-compliant Interface Repository (IR).  To obtain an object
 *  reference to an instance of Repository, use the RepositoryNew
 *  function.
 * 
 *  See CORBA 1.1, 7.5.2, p.133
 *)

(*
 * Start of bindings for IDL types
 *)

type
  Repository_RepositoryDescription = record
    name: Identifier;
    id: CORBAString;
    defined_in: CORBAString;
  end;
  PRepository_RepositoryDescription = ^Repository_RepositoryDescription;
(*
 *  The inherited describe_contents method returns an instance
 *  of this (RepositoryDescription) structure in the value
 *  member of the Description structure defined in the Container
 *  interface.
 *)
  Repository_irOpenErrorCodes = type LongWord;
const
  Repository_NOACCESS = Repository_irOpenErrorCodes(1);
  Repository_BADMAGICNUMBER = Repository_irOpenErrorCodes(2);
  Repository_MISSINGVERSIONINFO = Repository_irOpenErrorCodes(3);
  Repository_IOERROR = Repository_irOpenErrorCodes(4);
  Repository_VERSIONMISMATCH = Repository_irOpenErrorCodes(5);
  Repository_NOWRITEACCESS = Repository_irOpenErrorCodes(6);
  Repository_INDEXINCONSISTENT = Repository_irOpenErrorCodes(7);
  Repository_INDEXNOTPRESENT = Repository_irOpenErrorCodes(8);
(*
 *  @dcr13033
 *)

const ex_Repository_irOpenError = '::Repository::irOpenError';
type
  Repository_irOpenError = record
    errorCode: Repository_irOpenErrorCodes;
    fileName: CORBAString;
  end;
  PRepository_irOpenError = ^Repository_irOpenError;
(*
 *  The irOpenError and associated irOpenErrorCodes are a
 *  SOM-unique extension to the Interface Repository.  These
 *  errors may be raised by the somNew when instantiating the
 *  Repository object and can be found in the SOM global
 *  Environment if the returned Repository object is NULL (meaning
 *  no Repository object could be created). When the Repository
 *  object is not NULL, use the queryException method to place any
 *  exception info into a user-supplied Environment
 *  (see queryException below).
 *)

(*
 * End of bindings for IDL types.
 *)

const
  Repository_MajorVersion = 2;
  Repository_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function RepositoryNewClass(
  somtmajorVersion: integer4 = Repository_MajorVersion;
  somtminorVersion: integer4 = Repository_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type RepositoryClassDataStructure = record
  classObject: SOMClass;
  lookup_id: somMToken;
  lookup_modifier: somMToken;
  release_cache: somMToken;
  reserved1: somMToken;
  reserved2: somMToken;
  reserved3: somMToken;
  queryException: somMToken;
end;
PRepositoryClassDataStructure = ^RepositoryClassDataStructure;
function RepositoryClassData: PRepositoryClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type RepositoryCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PRepositoryCClassDataStructure = ^RepositoryCClassDataStructure;
function RepositoryCClassData: PRepositoryCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_Repository: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for Repository
 *)
function RepositoryNew: Repository;
function RepositoryRenew(buf: Pointer): Repository;

(*
 * New Method: lookup_id
 *)
type
  somTP_Repository_lookup_id = function(somSelf: Repository; ev: PEnvironment;
    search_id: CORBAString): Contained; stdcall;
  somTD_Repository_lookup_id = somTP_Repository_lookup_id;
(*
 *  Returns the object with a RepositoryId given by search_id.
 *)
const somMD_Repository_lookup_id = '::Repository::lookup_id';
function Repository_lookup_id(somSelf: Repository; ev: PEnvironment;
  search_id: CORBAString): Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: lookup_modifier
 *)
type
  somTP_Repository_lookup_modifier = function(somSelf: Repository; ev: PEnvironment;
    name, modifier: CORBAString): CORBAString; stdcall;
  somTD_Repository_lookup_modifier = somTP_Repository_lookup_modifier;
(*
 *  [SOM-unique extension]
 * 
 *  Returns the value string associated with the given SOM modifier
 *  for the object whose id is specified.  If the object does not
 *  exist or does not possess the modifier, NULL (or zero) is returned.
 *  If the modifier exists but does not have a value, a zero-length
 *  value string is returned.
 * 
 *  You must free the returned string when finished with it (using
 *  SOMFree).
 *)
const somMD_Repository_lookup_modifier = '::Repository::lookup_modifier';
function Repository_lookup_modifier(somSelf: Repository; ev: PEnvironment;
  name, modifier: CORBAString): CORBAString;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: release_cache
 *)
type
  somTP_Repository_release_cache = procedure(somSelf: Repository;
    ev: PEnvironment); stdcall;
  somTD_Repository_release_cache = somTP_Repository_release_cache;
(*
 *  [SOM-unique extension]
 * 
 *  This method releases all currently unreferenced Interface Repository
 *  objects from the internal object cache.  This may release some storage
 *  at the cost of slowing down (slightly) the next few lookup operations.
 *  The internal cache will replenish itself (over time) with each
 *  subsequent lookup operation.
 *)
const somMD_Repository_release_cache = '::Repository::release_cache';
procedure Repository_release_cache(somSelf: Repository; ev: PEnvironment);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: queryException
 *)
type
  somTP_Repository_queryException = function(somSelf: Repository;
    ev: PEnvironment): CORBABoolean; stdcall;
  somTD_Repository_queryException = somTP_Repository_queryException;
(*
 *  [SOM-unique extension]
 * 
 *  This method returns TRUE if an exception condition was
 *  raised during the creation of the Repository object, otherwise
 *  it returns FALSE.  When the result is TRUE, the actual
 *  exception info may be found in the Environment passed in to
 *  the queryException operation.
 *)
const somMD_Repository_queryException = '::Repository::queryException';
function Repository_queryException(somSelf: Repository; ev: PEnvironment):
  CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}











implementation

uses
  Windows, SOM.Thin.DLL;

var
  SOMIR_DLL: System.HMODULE = 0;

procedure SOMIR_Load_Variable(var V_Pointer; const Var_Name: AnsiString);
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

// #include <somir.h>

function irGetFileNames; external SOMIR_DLL_Name;
function irGetLastFileName; external SOMIR_DLL_Name;

// #include <containd.h>

function ContainedNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_ContainedClassData: PContainedClassDataStructure;

function ContainedClassData: PContainedClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ContainedClassData) then
    Result := SOMIR_DLL_ContainedClassData
  else
  begin
    SOME_Load_Variable(SOMIR_DLL_ContainedClassData, 'ContainedClassData');
    Result := SOMIR_DLL_ContainedClassData;
  end;
end;

var
  SOMIR_DLL_ContainedCClassData: PContainedCClassDataStructure;

function ContainedCClassData: PContainedCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ContainedCClassData) then
    Result := SOMIR_DLL_ContainedCClassData
  else
  begin
    SOME_Load_Variable(SOMIR_DLL_ContainedCClassData, 'ContainedCClassData');
    Result := SOMIR_DLL_ContainedCClassData;
  end;
end;

function _SOMCLASS_Contained: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ContainedClassData.classObject;
end;

function ContainedNew: Contained;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_Contained;
  if not Assigned(cls) then cls := ContainedNewClass;
  Result := SOMClass_somNew(cls);
end;

function ContainedRenew(buf: Pointer): Contained;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_Contained;
  if not Assigned(cls) then cls := ContainedNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function Contained__get_name(somSelf: Contained; ev: PEnvironment):
  Identifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  Result :=
    somTD_Contained__get_name
     (SOM_Resolve(somSelf, cd.classObject, cd._get_name))(somSelf, ev);
end;

procedure Contained__set_name(somSelf: Contained; ev: PEnvironment;
  name: Identifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  somTD_Contained__set_name
   (SOM_Resolve(somSelf, cd.classObject, cd._set_name))(somSelf, ev, name);
end;

function Contained__get_id(somSelf: Contained; ev: PEnvironment):
  RepositoryId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  Result :=
    somTD_Contained__get_id
     (SOM_Resolve(somSelf, cd.classObject, cd._get_id))(somSelf, ev);
end;

procedure Contained__set_id(somSelf: Contained; ev: PEnvironment;
  id: RepositoryId); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  somTD_Contained__set_id
   (SOM_Resolve(somSelf, cd.classObject, cd._set_id))(somSelf, ev, id);
end;

function Contained__get_defined_in(somSelf: Contained; ev: PEnvironment):
  RepositoryId; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  Result :=
    somTD_Contained__get_defined_in
     (SOM_Resolve(somSelf, cd.classObject, cd._get_defined_in))(somSelf, ev);
end;

procedure Contained__set_defined_in(somSelf: Contained; ev: PEnvironment;
  defined_in: RepositoryId); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  somTD_Contained__set_defined_in
   (SOM_Resolve(somSelf, cd.classObject, cd._set_defined_in))
     (somSelf, ev, defined_in);
end;

function Contained__get_somModifiers(somSelf: Contained; ev: PEnvironment):
  _IDL_SEQUENCE_somModifier; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  Result :=
    somTD_Contained__get_somModifiers
     (SOM_Resolve(somSelf, cd.classObject, cd._get_somModifiers))(somSelf, ev);
end;

procedure Contained__set_somModifiers(somSelf: Contained; ev: PEnvironment;
  somModifiers: P_IDL_SEQUENCE_somModifier); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  somTD_Contained__set_somModifiers
   (SOM_Resolve(somSelf, cd.classObject, cd._set_somModifiers))
     (somSelf, ev, somModifiers);
end;

function Contained_within(somSelf: Contained; ev: PEnvironment):
  _IDL_SEQUENCE_Container; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  Result :=
    somTD_Contained_within
     (SOM_Resolve(somSelf, cd.classObject, cd.within))(somSelf, ev);
end;

function Contained_describe(somSelf: Contained; ev: PEnvironment):
  Contained_Description; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainedClassDataStructure;
begin
  cd := ContainedClassData;
  Result :=
    somTD_Contained_describe
     (SOM_Resolve(somSelf, cd.classObject, cd.describe))(somSelf, ev);
end;

// #include <containr.h>

function ContainerNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_ContainerClassData: PContainerClassDataStructure;

function ContainerClassData: PContainerClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ContainerClassData) then
    Result := SOMIR_DLL_ContainerClassData
  else
  begin
    SOME_Load_Variable(SOMIR_DLL_ContainerClassData, 'ContainerClassData');
    Result := SOMIR_DLL_ContainerClassData;
  end;
end;

var
  SOMIR_DLL_ContainerCClassData: PContainerCClassDataStructure;

function ContainerCClassData: PContainerCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ContainerCClassData) then
    Result := SOMIR_DLL_ContainerCClassData
  else
  begin
    SOME_Load_Variable(SOMIR_DLL_ContainerCClassData, 'ContainerCClassData');
    Result := SOMIR_DLL_ContainerCClassData;
  end;
end;

function _SOMCLASS_Container: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ContainerClassData.classObject;
end;

function ContainerNew: Container;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_Container;
  if not Assigned(cls) then cls := ContainerNewClass;
  Result := SOMClass_somNew(cls);
end;

function ContainerRenew(buf: Pointer): Container;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_Container;
  if not Assigned(cls) then cls := ContainerNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function Container_contents(somSelf: Container; ev: PEnvironment;
  limit_type: Container_InterfaceName; exclude_inherited: CORBABoolean):
  _IDL_SEQUENCE_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainerClassDataStructure;
begin
  cd := ContainerClassData;
  Result :=
    somTD_Container_contents
     (SOM_Resolve(somSelf, cd.classObject, cd.contents))
       (somSelf, ev, limit_type, exclude_inherited);
end;

function Container_lookup_name(somSelf: Container; ev: PEnvironment;
  search_name: Identifier; levels_to_search: LongInt;
  limit_type: Container_InterfaceName; exclude_inherited: CORBABoolean):
  _IDL_SEQUENCE_Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainerClassDataStructure;
begin
  cd := ContainerClassData;
  Result :=
    somTD_Container_lookup_name
     (SOM_Resolve(somSelf, cd.classObject, cd.lookup_name))
       (somSelf, ev, search_name, levels_to_search, limit_type,
        exclude_inherited);
end;

function Container_describe_contents(somSelf: Container; ev: PEnvironment;
  limit_type: Container_InterfaceName; exclude_inherited: CORBABoolean;
  max_returned_objs: LongInt): _IDL_SEQUENCE_Container_ContainerDescription;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PContainerClassDataStructure;
begin
  cd := ContainerClassData;
  Result :=
    somTD_Container_describe_contents
     (SOM_Resolve(somSelf, cd.classObject, cd.describe_contents))
       (somSelf, ev, limit_type, exclude_inherited, max_returned_objs);
end;

// #include <repository.h>

function RepositoryNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_RepositoryClassData: PRepositoryClassDataStructure;

function RepositoryClassData: PRepositoryClassDataStructure;
begin
  if Assigned(SOMIR_DLL_RepositoryClassData) then
    Result := SOMIR_DLL_RepositoryClassData
  else
  begin
    SOME_Load_Variable(SOMIR_DLL_RepositoryClassData, 'RepositoryClassData');
    Result := SOMIR_DLL_RepositoryClassData;
  end;
end;

var
  SOMIR_DLL_RepositoryCClassData: PRepositoryCClassDataStructure;

function RepositoryCClassData: PRepositoryCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_RepositoryCClassData) then
    Result := SOMIR_DLL_RepositoryCClassData
  else
  begin
    SOME_Load_Variable(SOMIR_DLL_RepositoryCClassData, 'RepositoryCClassData');
    Result := SOMIR_DLL_RepositoryCClassData;
  end;
end;

function _SOMCLASS_Repository: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := RepositoryClassData.classObject;
end;

function RepositoryNew: Repository;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_Repository;
  if not Assigned(cls) then cls := RepositoryNewClass;
  Result := SOMClass_somNew(cls);
end;

function RepositoryRenew(buf: Pointer): Repository;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_Repository;
  if not Assigned(cls) then cls := RepositoryNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function Repository_lookup_id(somSelf: Repository; ev: PEnvironment;
  search_id: CORBAString): Contained; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PRepositoryClassDataStructure;
begin
  cd := RepositoryClassData;
  Result :=
    somTD_Repository_lookup_id
     (SOM_Resolve(somSelf, cd.classObject, cd.lookup_id))
       (somSelf, ev, search_id);
end;

function Repository_lookup_modifier(somSelf: Repository; ev: PEnvironment;
  name, modifier: CORBAString): CORBAString;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PRepositoryClassDataStructure;
begin
  cd := RepositoryClassData;
  Result :=
    somTD_Repository_lookup_modifier
     (SOM_Resolve(somSelf, cd.classObject, cd.lookup_modifier))
       (somSelf, ev, name, modifier);
end;

procedure Repository_release_cache(somSelf: Repository; ev: PEnvironment);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PRepositoryClassDataStructure;
begin
  cd := RepositoryClassData;
  somTD_Repository_release_cache
   (SOM_Resolve(somSelf, cd.classObject, cd.release_cache))(somSelf, ev);
end;

function Repository_queryException(somSelf: Repository; ev: PEnvironment):
  CORBABoolean; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PRepositoryClassDataStructure;
begin
  cd := RepositoryClassData;
  Result :=
    somTD_Repository_queryException
     (SOM_Resolve(somSelf, cd.classObject, cd.queryException))(somSelf, ev);
end;





end.
