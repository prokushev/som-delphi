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
  RepositoryId = CORBAString;
  PRepositoryId = ^RepositoryId;
  _IDL_SEQUENCE_RepositoryId = _IDL_SEQUENCE_string;
  P_IDL_SEQUENCE_RepositoryId = ^_IDL_SEQUENCE_RepositoryId;

(*
 * Define the class name as an object type
 *)
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
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
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
  PContainer_InterfaceName = ^Container_InterfaceName;
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
//   Repository = Container;
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

// #include <attribdf.h>

(*
 * Define the class name as an object type
 *)
type
  AttributeDef = Contained;
(*
 *  This interface is used to access information associated with
 *  attributes defined in an IDL interface.
 * 
 *  See CORBA 1.1, 7.5.5, p.135
 *)

(*
 * Start of bindings for IDL types
 *)

type
  AttributeDef_AttributeMode = type LongWord;
const 
  AttributeDef_NORMAL = AttributeDef_AttributeMode(1);
  AttributeDef_READONLY = AttributeDef_AttributeMode(2);
type
  AttributeDef_AttributeDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
    type_code: TypeCode;
    mode: AttributeDef_AttributeMode;
  end;
  PAttributeDef_AttributeDescription = ^AttributeDef_AttributeDescription;
(*
 *  The inherited describe method returns an instance of this
 *  (AttributeDescription) structure in the "value" member of the
 *  Description structure defined in the Contained interface.
 *)

(*
 * End of bindings for IDL types.
 *)

const
  AttributeDef_MajorVersion = 2;
  AttributeDef_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function AttributeDefNewClass(
  somtmajorVersion: integer4 = AttributeDef_MajorVersion;
  somtminorVersion: integer4 = AttributeDef_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type AttributeDefClassDataStructure = record
  classObject: SOMClass;
  _get_type: somMToken;
  _set_type: somMToken;
  _get_mode: somMToken;
  _set_mode: somMToken;
end;
PAttributeDefClassDataStructure = ^AttributeDefClassDataStructure;
function AttributeDefClassData: PAttributeDefClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type AttributeDefCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PAttributeDefCClassDataStructure = ^AttributeDefCClassDataStructure;
function AttributeDefCClassData: PAttributeDefCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_AttributeDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for AttributeDef
 *)
function AttributeDefNew: AttributeDef;
function AttributeDefRenew(buf: Pointer): AttributeDef;

(*
 * New Method: _get_type
 *)
type
  somTP_AttributeDef__get_type = function(somSelf: AttributeDef;
    ev: PEnvironment): TypeCode; stdcall;
  somTD_AttributeDef__get_type = somTP_AttributeDef__get_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_AttributeDef__get_type = '::AttributeDef::_get_type';
function AttributeDef__get_type(somSelf: AttributeDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_type
 *)
type
  somTP_AttributeDef__set_type = procedure(somSelf: AttributeDef;
    ev: PEnvironment; type_code: TypeCode); stdcall;
  somTD_AttributeDef__set_type = somTP_AttributeDef__set_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_AttributeDef__set_type = '::AttributeDef::_set_type';
procedure AttributeDef__set_type(somSelf: AttributeDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_mode
 *)
type
  somTP_AttributeDef__get_mode = function(somSelf: AttributeDef;
    ev: PEnvironment): AttributeDef_AttributeMode; stdcall;
  somTD_AttributeDef__get_mode = somTP_AttributeDef__get_mode;
(*
 *  The AttributeMode of the receiving object;
 *)
const somMD_AttributeDef__get_mode = '::AttributeDef::_get_mode';
function AttributeDef__get_mode(somSelf: AttributeDef;
  ev: PEnvironment): AttributeDef_AttributeMode;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_mode
 *)
type
  somTP_AttributeDef__set_mode = procedure(somSelf: AttributeDef;
    ev: PEnvironment; mode: AttributeDef_AttributeMode); stdcall;
  somTD_AttributeDef__set_mode = somTP_AttributeDef__set_mode;
(*
 *  The AttributeMode of the receiving object;
 *)
const somMD_AttributeDef__set_mode = '::AttributeDef::_set_mode';
procedure AttributeDef__set_mode(somSelf: AttributeDef; ev: PEnvironment;
  mode: AttributeDef_AttributeMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <constdef.h>

(*
 * Define the class name as an object type
 *)
type
  ConstantDef = Contained;
(*
 *  This interface is used to access information associated with
 *  constants defined in an IDL file.
 * 
 *  See CORBA 1.1, 7.5.9, p.137
 *)

(*
 * Start of bindings for IDL types
 *)

type
  ConstantDef_ConstantDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
    type_code: TypeCode;
    value: any;
  end;
  PConstantDef_ConstantDescription = ^ConstantDef_ConstantDescription;
(*
 *  The inherited describe method returns an instance of this
 *  (ConstantDescription) structure in the "value" member of the
 *  Description structure defined in the Contained interface.
 *)

(*
 * End of bindings for IDL types.
 *)

const
  ConstantDef_MajorVersion = 2;
  ConstantDef_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function ConstantDefNewClass(
  somtmajorVersion: integer4 = ConstantDef_MajorVersion;
  somtminorVersion: integer4 = ConstantDef_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type ConstantDefClassDataStructure = record
  classObject: SOMClass;
  _get_type: somMToken;
  _set_type: somMToken;
  _get_value: somMToken;
  _set_value: somMToken;
end;
PConstantDefClassDataStructure = ^ConstantDefClassDataStructure;
function ConstantDefClassData: PConstantDefClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type ConstantDefCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PConstantDefCClassDataStructure = ^ConstantDefCClassDataStructure;
function ConstantDefCClassData: PConstantDefCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ConstantDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for ConstantDef
 *)
function ConstantDefNew: ConstantDef;
function ConstantDefRenew(buf: Pointer): ConstantDef;

(*
 * New Method: _get_type
 *)
type
  somTP_ConstantDef__get_type = function(somSelf: ConstantDef;
    ev: PEnvironment): TypeCode; stdcall;
  somTD_ConstantDef__get_type = somTP_ConstantDef__get_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_ConstantDef__get_type = '::ConstantDef::_get_type';
function ConstantDef__get_type(somSelf: ConstantDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_type
 *)
type
  somTP_ConstantDef__set_type = procedure(somSelf: ConstantDef; ev: PEnvironment;
    type_code: TypeCode); stdcall;
  somTD_ConstantDef__set_type = somTP_ConstantDef__set_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_ConstantDef__set_type = '::ConstantDef::_set_type';
procedure ConstantDef__set_type(somSelf: ConstantDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_value
 *)
type
  somTP_ConstantDef__get_value = function(somSelf: ConstantDef;
    ev: PEnvironment): any; stdcall;
  somTD_ConstantDef__get_value = somTP_ConstantDef__get_value;
(*
 *  The value of the receiving constant object;
 *  "value" is an any carrying a string per CORBA 7.5.9 p. 123
 *)
const somMD_ConstantDef__get_value = '::ConstantDef::_get_value';
function ConstantDef__get_value(somSelf: ConstantDef; ev: PEnvironment): any;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_value
 *)
type
  somTP_ConstantDef__set_value = procedure(somSelf: ConstantDef;
    ev: PEnvironment; value: Pany); stdcall;
  somTD_ConstantDef__set_value = somTP_ConstantDef__set_value;
(*
 *  The value of the receiving constant object;
 *  "value" is an any carrying a string per CORBA 7.5.9 p. 123
 *)
const somMD_ConstantDef__set_value = '::ConstantDef::_set_value';
procedure ConstantDef__set_value(somSelf: ConstantDef; ev: PEnvironment;
  value: Pany); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <excptdef.h>

(*
 * Define the class name as an object type
 *)
type
  ExceptionDef = Contained;
(*
 *  This interface is used to access information associated with
 *  exceptions defined in an IDL file.
 * 
 *  See CORBA 1.1, 7.5.10, p.138
 *)

(*
 * Start of bindings for IDL types
 *)

type
  ExceptionDef_ExceptionDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
    type_code: TypeCode;
  end;
  PExceptionDef_ExceptionDescription = ^ExceptionDef_ExceptionDescription;
(*
 *  The inherited describe method returns an instance of this
 *  (ExceptionDescription) structure in the "value" member of the
 *  Description structure defined in the Contained interface.
 *)

(*
 * End of bindings for IDL types.
 *)

const
  ExceptionDef_MajorVersion = 2;
  ExceptionDef_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function ExceptionDefNewClass(
  somtmajorVersion: integer4 = ExceptionDef_MajorVersion;
  somtminorVersion: integer4 = ExceptionDef_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type ExceptionDefClassDataStructure = record
  classObject: SOMClass;
  _get_type: somMToken;
  _set_type: somMToken;
end;
PExceptionDefClassDataStructure = ^ExceptionDefClassDataStructure;
function ExceptionDefClassData: PExceptionDefClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type ExceptionDefCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PExceptionDefCClassDataStructure = ^ExceptionDefCClassDataStructure;
function ExceptionDefCClassData: PExceptionDefCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ExceptionDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for ExceptionDef
 *)
function ExceptionDefNew: ExceptionDef;
function ExceptionDefRenew(buf: Pointer): ExceptionDef;

(*
 * New Method: _get_type
 *)
type
  somTP_ExceptionDef__get_type = function(somSelf: ExceptionDef;
    ev: PEnvironment): TypeCode; stdcall;
  somTD_ExceptionDef__get_type = somTP_ExceptionDef__get_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_ExceptionDef__get_type = '::ExceptionDef::_get_type';
function ExceptionDef__get_type(somSelf: ExceptionDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_type
 *)
type
  somTP_ExceptionDef__set_type = procedure(somSelf: ExceptionDef; ev: PEnvironment;
    type_code: TypeCode); stdcall;
  somTD_ExceptionDef__set_type = somTP_ExceptionDef__set_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_ExceptionDef__set_type = '::ExceptionDef::_set_type';
procedure ExceptionDef__set_type(somSelf: ExceptionDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <paramdef.h>

(*
 * Define the class name as an object type
 *)
type
  ParameterDef = Contained;
(*
 *  This interface is used to access information associated with
 *  parameters used with an IDL operation.
 * 
 *  See CORBA 1.1, 7.5.7, p.136
 *)

(*
 * Start of bindings for IDL types
 *)

type
  ParameterDef_ParameterMode = type LongWord;
const
  ParameterDef_IN = ParameterDef_ParameterMode(1);
  ParameterDef_OUT = ParameterDef_ParameterMode(2);
  ParameterDef_INOUT = ParameterDef_ParameterMode(3);
type
  ParameterDef_ParameterDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
    type_code: TypeCode;
    mode: ParameterDef_ParameterMode;
  end;
  PParameterDef_ParameterDescription = ^ParameterDef_ParameterDescription;
(*
 *  The inherited describe method returns an instance of this
 *  (ParameterDescription) structure in the "value" member of the
 *  Description structure defined in the Contained interface.
 *)

(*
 * End of bindings for IDL types.
 *)

const
  ParameterDef_MajorVersion = 2;
  ParameterDef_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function ParameterDefNewClass(
  somtmajorVersion: integer4 = ParameterDef_MajorVersion;
  somtminorVersion: integer4 = ParameterDef_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type ParameterDefClassDataStructure = record
  classObject: SOMClass;
  _get_type: somMToken;
  _set_type: somMToken;
  _get_mode: somMToken;
  _set_mode: somMToken;
end;
PParameterDefClassDataStructure = ^ParameterDefClassDataStructure;
function ParameterDefClassData: PParameterDefClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type ParameterDefCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PParameterDefCClassDataStructure = ^ParameterDefCClassDataStructure;
function ParameterDefCClassData: PParameterDefCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ParameterDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for ParameterDef
 *)
function ParameterDefNew: ParameterDef;
function ParameterDefRenew(buf: Pointer): ParameterDef;

(*
 * New Method: _get_type
 *)
type
  somTP_ParameterDef__get_type = function(somSelf: ParameterDef;
    ev: PEnvironment): TypeCode; stdcall;
  somTD_ParameterDef__get_type = somTP_ParameterDef__get_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_ParameterDef__get_type = '::ParameterDef::_get_type';
function ParameterDef__get_type(somSelf: ParameterDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_type
 *)
type
  somTP_ParameterDef__set_type = procedure(somSelf: ParameterDef;
    ev: PEnvironment; type_code: TypeCode); stdcall;
  somTD_ParameterDef__set_type = somTP_ParameterDef__set_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_ParameterDef__set_type = '::ParameterDef::_set_type';
procedure ParameterDef__set_type(somSelf: ParameterDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_mode
 *)
type
  somTP_ParameterDef__get_mode = function(somSelf: ParameterDef;
    ev: PEnvironment): ParameterDef_ParameterMode; stdcall;
  somTD_ParameterDef__get_mode = somTP_ParameterDef__get_mode;
(*
 *  The ParameterMode of the receiving object;
 *)
const somMD_ParameterDef__get_mode = '::ParameterDef::_get_mode';
function ParameterDef__get_mode(somSelf: ParameterDef; ev: PEnvironment):
  ParameterDef_ParameterMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_mode
 *)
type
  somTP_ParameterDef__set_mode = procedure(somSelf: ParameterDef;
    ev: PEnvironment; mode: ParameterDef_ParameterMode); stdcall;
  somTD_ParameterDef__set_mode = somTP_ParameterDef__set_mode;
(*
 *  The ParameterMode of the receiving object;
 *)
const somMD_ParameterDef__set_mode = '::ParameterDef::_set_mode';
procedure ParameterDef__set_mode(somSelf: ParameterDef; ev: PEnvironment;
  mode: ParameterDef_ParameterMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <typedef.h>

(*
 * Define the class name as an object type
 *)
type
  TypeDef = Contained;
(*
 *  This interface is used to access information associated with
 *  typedefs, unions, enums, & structs defined in an IDL file.
 * 
 *  See CORBA 1.1, 7.5.8, p.137
 *)

(*
 * Start of bindings for IDL types
 *)

type
  TypeDef_TypeDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
    type_code: TypeCode;
  end;
  PTypeDef_TypeDescription = ^TypeDef_TypeDescription;
(*
 *  The inherited describe method returns an instance of this
 *  (TypeDescription) structure in the "value" member of the
 *  Description structure defined in the Contained interface.
 *)

(*
 * End of bindings for IDL types.
 *)

const
  TypeDef_MajorVersion = 2;
  TypeDef_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function TypeDefNewClass(
  somtmajorVersion: integer4 = TypeDef_MajorVersion;
  somtminorVersion: integer4 = TypeDef_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type TypeDefClassDataStructure = record
  classObject: SOMClass;
  _get_type: somMToken;
  _set_type: somMToken;
end;
PTypeDefClassDataStructure = ^TypeDefClassDataStructure;
function TypeDefClassData: PTypeDefClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type TypeDefCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PTypeDefCClassDataStructure = ^TypeDefCClassDataStructure;
function TypeDefCClassData: PTypeDefCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_TypeDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for TypeDef
 *)
function TypeDefNew: TypeDef;
function TypeDefRenew(buf: Pointer): TypeDef;

(*
 * New Method: _get_type
 *)
type
  somTP_TypeDef__get_type = function(somSelf: TypeDef; ev: PEnvironment):
    TypeCode; stdcall;
  somTD_TypeDef__get_type = somTP_TypeDef__get_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_TypeDef__get_type = '::TypeDef::_get_type';
function TypeDef__get_type(somSelf: TypeDef; ev: PEnvironment): TypeCode;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_type
 *)
type
  somTP_TypeDef__set_type = procedure(somSelf: TypeDef; ev: PEnvironment;
    type_code: TypeCode); stdcall;
  somTD_TypeDef__set_type = somTP_TypeDef__set_type;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_TypeDef__set_type = '::TypeDef::_set_type';
procedure TypeDef__set_type(somSelf: TypeDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <operatdf.h>

(*
 * Define the class name as an object type
 *)
type
  OperationDef = Container; // , Contained
(*
 *  This interface is used to access information associated with
 *  operations defined in an IDL interface.
 * 
 *  See CORBA 1.1, 7.5.6, pp.135-136
 *)

(*
 * Start of bindings for IDL types
 *)

type
  OperationDef_OperationMode = type LongWord;
const
  OperationDef_NORMAL = OperationDef_OperationMode(1);
  OperationDef_ONEWAY = OperationDef_OperationMode(2);
type
  _IDL_SEQUENCE_ParameterDef_ParameterDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PParameterDef_ParameterDescription;
  end;
  P_IDL_SEQUENCE_ParameterDef_ParameterDescription = ^_IDL_SEQUENCE_ParameterDef_ParameterDescription;
  _IDL_SEQUENCE_ExceptionDef_ExceptionDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PExceptionDef_ExceptionDescription;
  end;
  P_IDL_SEQUENCE_ExceptionDef_ExceptionDescription = ^_IDL_SEQUENCE_ExceptionDef_ExceptionDescription;
  OperationDef_OperationDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
    result_code: TypeCode;
    mode: OperationDef_OperationMode;
    contexts: _IDL_SEQUENCE_string;
    parameter: _IDL_SEQUENCE_ParameterDef_ParameterDescription;
    exceptions: _IDL_SEQUENCE_ExceptionDef_ExceptionDescription;
  end;
  POperationDef_OperationDescription = ^OperationDef_OperationDescription;
(*
 *  The inherited describe method returns an instance of this
 *  (OperationDescription) structure in the "value" member of the
 *  Description structure defined in the Contained interface.
 *  The inherited describe_contents method in the Container
 *  interface returns a sequence of these Description structures
 *  each carrying a reference to an OperationDescription structure
 *  in its "value" member.
 *)

(*
 * End of bindings for IDL types.
 *)

const
  OperationDef_MajorVersion = 2;
  OperationDef_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function OperationDefNewClass(
  somtmajorVersion: integer4 = OperationDef_MajorVersion;
  somtminorVersion: integer4 = OperationDef_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type OperationDefClassDataStructure = record
  classObject: SOMClass;
  _get_result: somMToken;
  _set_result: somMToken;
  _get_mode: somMToken;
  _set_mode: somMToken;
  _get_contexts: somMToken;
  _set_contexts: somMToken;
end;
POperationDefClassDataStructure = ^OperationDefClassDataStructure;
function OperationDefClassData: POperationDefClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type OperationDefCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
POperationDefCClassDataStructure = ^OperationDefCClassDataStructure;
function OperationDefCClassData: POperationDefCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_OperationDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for OperationDef
 *)
function OperationDefNew: OperationDef;
function OperationDefRenew(buf: Pointer): OperationDef;

(*
 * New Method: _get_result
 *)
type
  somTP_OperationDef__get_result = function(somSelf: OperationDef;
    ev: PEnvironment): TypeCode; stdcall;
  somTD_OperationDef__get_result = somTP_OperationDef__get_result;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_OperationDef__get_result = '::OperationDef::_get_result';
function OperationDef__get_result(somSelf: OperationDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_result
 *)
type
  somTP_OperationDef__set_result = procedure(somSelf: OperationDef;
    ev: PEnvironment; result_code: TypeCode); stdcall;
  somTD_OperationDef__set_result = somTP_OperationDef__set_result;
(*
 *  The TypeCode of the receiving object.  The memory used to hold
 *  the TypeCode is contained in the receiving object, which retains
 *  ownership.  Hence, do not free the returned TypeCode.  If you want
 *  to obtain a separate copy, use the TypeCode_copy operation.
 *)
const somMD_OperationDef__set_result = '::OperationDef::_set_result';
procedure OperationDef__set_result(somSelf: OperationDef;
  ev: PEnvironment; result_code: TypeCode);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_mode
 *)
type
  somTP_OperationDef__get_mode = function(somSelf: OperationDef;
    ev: PEnvironment): OperationDef_OperationMode; stdcall;
  somTD_OperationDef__get_mode = somTP_OperationDef__get_mode;
(*
 *  The OperationMode of the receiving object;
 *)
const somMD_OperationDef__get_mode = '::OperationDef::_get_mode';
function OperationDef__get_mode(somSelf: OperationDef; ev: PEnvironment):
  OperationDef_OperationMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_mode
 *)
type
  somTP_OperationDef__set_mode = procedure(somSelf: OperationDef; ev: PEnvironment;
    mode: OperationDef_OperationMode); stdcall;
  somTD_OperationDef__set_mode = somTP_OperationDef__set_mode;
(*
 *  The OperationMode of the receiving object;
 *)
const somMD_OperationDef__set_mode = '::OperationDef::_set_mode';
procedure OperationDef__set_mode(somSelf: OperationDef; ev: PEnvironment;
  mode: OperationDef_OperationMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_contexts
 *)
type
  somTP_OperationDef__get_contexts = function(somSelf: OperationDef;
    ev: PEnvironment): _IDL_SEQUENCE_string; stdcall;
  somTD_OperationDef__get_contexts = somTP_OperationDef__get_contexts;
(*
 *  The list of ContextIdentifiers associated with the
 *  receiving object.
 *)
const somMD_OperationDef__get_contexts = '::OperationDef::_get_contexts';
function OperationDef__get_contexts(somSelf: OperationDef; ev: PEnvironment):
  _IDL_SEQUENCE_string; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_contexts
 *)
type
  somTP_OperationDef__set_contexts = procedure(somSelf: OperationDef; ev: PEnvironment;
    contexts: P_IDL_SEQUENCE_string); stdcall;
  somTD_OperationDef__set_contexts = somTP_OperationDef__set_contexts;
(*
 *  The list of ContextIdentifiers associated with the
 *  receiving object.
 *)
const somMD_OperationDef__set_contexts = '::OperationDef::_set_contexts';
procedure OperationDef__set_contexts(somSelf: OperationDef;
  ev: PEnvironment; contexts: P_IDL_SEQUENCE_string);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <intfacdf.h>

(*
 * Define the class name as an object type
 *)
type
  InterfaceDef = Container; // , Contained
(*
 *  This interface is used to access information associated with
 *  interfaces defined in an IDL file.
 * 
 *  See CORBA 1.1, 7.5.4, p.134
 *)

(*
 * Start of bindings for IDL types
 *)

type
  _IDL_SEQUENCE_OperationDef_OperationDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: POperationDef_OperationDescription;
  end;
  P_IDL_SEQUENCE_OperationDef_OperationDescription = ^_IDL_SEQUENCE_OperationDef_OperationDescription;
  _IDL_SEQUENCE_AttributeDef_AttributeDescription = record
    _maximum: LongWord;
    _length: LongWord;
    _buffer: PAttributeDef_AttributeDescription;
  end;
  P_IDL_SEQUENCE_AttributeDef_AttributeDescription = ^_IDL_SEQUENCE_AttributeDef_AttributeDescription;
  InterfaceDef_FullInterfaceDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
    operation: _IDL_SEQUENCE_OperationDef_OperationDescription;
    attributes: _IDL_SEQUENCE_AttributeDef_AttributeDescription;
  end;
  PInterfaceDef_FullInterfaceDescription = ^InterfaceDef_FullInterfaceDescription;
  InterfaceDef_InterfaceDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
  end;
  PInterfaceDef_InterfaceDescription = ^InterfaceDef_InterfaceDescription;
(*
 *  The inherited describe method returns an instance of this
 *  (InterfaceDescription) structure in the "value" member of the
 *  Description structure defined in the Contained interface.
 *  The inherited describe_contents method in the Container
 *  interface returns a sequence of these Description structures
 *  each carrying a reference to an InterfaceDescription structure
 *  in its "value" member.
 *)

(*
 * End of bindings for IDL types.
 *)

const
  InterfaceDef_MajorVersion = 2;
  InterfaceDef_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function InterfaceDefNewClass(
  somtmajorVersion: integer4 = InterfaceDef_MajorVersion;
  somtminorVersion: integer4 = InterfaceDef_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type InterfaceDefClassDataStructure = record
  classObject: SOMClass;
  describe_interface: somMToken;
  _get_base_interfaces: somMToken;
  _set_base_interfaces: somMToken;
  _get_instanceData: somMToken;
  _set_instanceData: somMToken;
end;
PInterfaceDefClassDataStructure = ^InterfaceDefClassDataStructure;
function InterfaceDefClassData: PInterfaceDefClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type InterfaceDefCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PInterfaceDefCClassDataStructure = ^InterfaceDefCClassDataStructure;
function InterfaceDefCClassData: PInterfaceDefCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_InterfaceDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for InterfaceDef
 *)
function InterfaceDefNew: InterfaceDef;
function InterfaceDefRenew(buf: Pointer): InterfaceDef;

(*
 * New Method: _get_base_interfaces
 *)
type
  somTP_InterfaceDef__get_base_interfaces = function(somSelf: InterfaceDef;
    ev: PEnvironment): _IDL_SEQUENCE_string; stdcall;
  somTD_InterfaceDef__get_base_interfaces = somTP_InterfaceDef__get_base_interfaces;
(*
 *  The sequence of RepositoryIds for all of the interfaces that the
 *  receiving interface inherits.  Do not free the buffer,
 *  its storage is still owned by the InterfaceDef object.
 *)
const somMD_InterfaceDef__get_base_interfaces = '::InterfaceDef::_get_base_interfaces';
function InterfaceDef__get_base_interfaces(somSelf: InterfaceDef;
  ev: PEnvironment): _IDL_SEQUENCE_string;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_base_interfaces
 *)
type
  somTP_InterfaceDef__set_base_interfaces = procedure(somSelf: InterfaceDef;
    ev: PEnvironment; base_interfaces: P_IDL_SEQUENCE_string); stdcall;
  somTD_InterfaceDef__set_base_interfaces = somTP_InterfaceDef__set_base_interfaces;
(*
 *  The sequence of RepositoryIds for all of the interfaces that the
 *  receiving interface inherits.  Do not free the buffer,
 *  its storage is still owned by the InterfaceDef object.
 *)
const somMD_InterfaceDef__set_base_interfaces = '::InterfaceDef::_set_base_interfaces';
procedure InterfaceDef__set_base_interfaces(somSelf: InterfaceDef;
  ev: PEnvironment; base_interfaces: P_IDL_SEQUENCE_string);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: describe_interface
 *)
type
  somTP_InterfaceDef_describe_interface = function(somSelf: InterfaceDef;
    ev: PEnvironment): InterfaceDef_FullInterfaceDescription; stdcall;
  somTD_InterfaceDef_describe_interface = somTP_InterfaceDef_describe_interface;
(*
 *  Returns a description of all the operations and attributes in
 *  an interface.
 *)
const somMD_InterfaceDef_describe_interface = '::InterfaceDef::describe_interface';
function InterfaceDef_describe_interface(somSelf: InterfaceDef;
  ev: PEnvironment): InterfaceDef_FullInterfaceDescription;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _get_instanceData
 *)
type
  somTP_InterfaceDef__get_instanceData = function(somSelf: InterfaceDef;
    ev: PEnvironment): TypeCode; stdcall;
  somTD_InterfaceDef__get_instanceData = somTP_InterfaceDef__get_instanceData;
(*
 *  [SOM-unique extension]
 * 
 *  The instance data members (if any) described in the SOM
 *  implementation section of the IDL source file.
 *)
const somMD_InterfaceDef__get_instanceData = '::InterfaceDef::_get_instanceData';
function InterfaceDef__get_instanceData(somSelf: InterfaceDef;
  ev: PEnvironment): TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New Method: _set_instanceData
 *)
type
  somTP_InterfaceDef__set_instanceData = procedure(somSelf: InterfaceDef; ev: PEnvironment;
    instanceData: TypeCode); stdcall;
  somTD_InterfaceDef__set_instanceData = somTP_InterfaceDef__set_instanceData;
(*
 *  [SOM-unique extension]
 * 
 *  The instance data members (if any) described in the SOM
 *  implementation section of the IDL source file.
 *)
const somMD_InterfaceDef__set_instanceData = '::InterfaceDef::_set_instanceData';
procedure InterfaceDef__set_instanceData(somSelf: InterfaceDef;
  ev: PEnvironment; instanceData: TypeCode);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

// #include <moduledf.h>

(*
 * Define the class name as an object type
 *)
type
  ModuleDef = Container; // , Contained
(*
 *  This interface is used to access information associated with
 *  modules defined in an IDL file.
 * 
 *  See CORBA 1.1, 7.5.3, p.133
 *)

(*
 * Start of bindings for IDL types
 *)

type
  ModuleDef_ModuleDescription = record
    name: Identifier;
    id: RepositoryId;
    defined_in: RepositoryId;
  end;
  PModuleDef_ModuleDescription = ^ModuleDef_ModuleDescription;
(*
 *  The inherited describe method returns an instance of this
 *  (ModuleDescription) structure in the "value" member of the
 *  Description structure defined in the Contained interface.
 *  The inherited describe_contents method in the Container
 *  interface returns a sequence of these Description structures
 *  each carrying a reference to a ModuleDescription structure
 *  in its "value" member.
 *)

(*
 * End of bindings for IDL types.
 *)

const
  ModuleDef_MajorVersion = 2;
  ModuleDef_MinorVersion = 3;

(*
 * Declare the class creation procedure
 *)
function ModuleDefNewClass(
  somtmajorVersion: integer4 = ModuleDef_MajorVersion;
  somtminorVersion: integer4 = ModuleDef_MinorVersion): SOMClass; stdcall;

(*
 * Declare the ABI 2 ClassData structure
 *)
type ModuleDefClassDataStructure = record
  classObject: SOMClass;
end;
PModuleDefClassDataStructure = ^ModuleDefClassDataStructure;
function ModuleDefClassData: PModuleDefClassDataStructure;

(*
 * Declare the ABI 2 CClassData structure
 *)
type ModuleDefCClassDataStructure = record
  parentMtab: somMethodTabs;
  instanceDataToken: somDToken;
end;
PModuleDefCClassDataStructure = ^ModuleDefCClassDataStructure; 
function ModuleDefCClassData: PModuleDefCClassDataStructure;

(*
 * Class Object and Method Token Macros
 *)
function _SOMCLASS_ModuleDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}

(*
 * New and Renew macros for ModuleDef
 *)
function ModuleDefNew: ModuleDef;
function ModuleDefRenew(buf: Pointer): ModuleDef;

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
    SOMIR_Load_Variable(SOMIR_DLL_ContainedClassData, 'ContainedClassData');
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
    SOMIR_Load_Variable(SOMIR_DLL_ContainedCClassData, 'ContainedCClassData');
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
    SOMIR_Load_Variable(SOMIR_DLL_ContainerClassData, 'ContainerClassData');
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
    SOMIR_Load_Variable(SOMIR_DLL_ContainerCClassData, 'ContainerCClassData');
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
    SOMIR_Load_Variable(SOMIR_DLL_RepositoryClassData, 'RepositoryClassData');
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
    SOMIR_Load_Variable(SOMIR_DLL_RepositoryCClassData, 'RepositoryCClassData');
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

// #include <attribdf.h>

function AttributeDefNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_AttributeDefClassData: PAttributeDefClassDataStructure;

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

var
  SOMIR_DLL_AttributeDefCClassData: PAttributeDefCClassDataStructure;

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

function _SOMCLASS_AttributeDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := AttributeDefClassData.classObject;
end;

function AttributeDefNew: AttributeDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_AttributeDef;
  if not Assigned(cls) then cls := AttributeDefNewClass;
  Result := SOMClass_somNew(cls);
end;

function AttributeDefRenew(buf: Pointer): AttributeDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_AttributeDef;
  if not Assigned(cls) then cls := AttributeDefNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function AttributeDef__get_type(somSelf: AttributeDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PAttributeDefClassDataStructure;
begin
  cd := AttributeDefClassData;
  Result :=
    somTD_AttributeDef__get_type
     (SOM_Resolve(somSelf, cd.classObject, cd._get_type))(somSelf, ev);
end;

procedure AttributeDef__set_type(somSelf: AttributeDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PAttributeDefClassDataStructure;
begin
  cd := AttributeDefClassData;
  somTD_AttributeDef__set_type
   (SOM_Resolve(somSelf, cd.classObject, cd._set_type))
     (somSelf, ev, type_code);
end;

function AttributeDef__get_mode(somSelf: AttributeDef;
  ev: PEnvironment): AttributeDef_AttributeMode;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PAttributeDefClassDataStructure;
begin
  cd := AttributeDefClassData;
  Result :=
    somTD_AttributeDef__get_mode
     (SOM_Resolve(somSelf, cd.classObject, cd._get_mode))(somSelf, ev);
end;

procedure AttributeDef__set_mode(somSelf: AttributeDef; ev: PEnvironment;
  mode: AttributeDef_AttributeMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PAttributeDefClassDataStructure;
begin
  cd := AttributeDefClassData;
  somTD_AttributeDef__set_mode
   (SOM_Resolve(somSelf, cd.classObject, cd._set_mode))(somSelf, ev, mode);
end;

// #include <constdef.h>

function ConstantDefNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_ConstantDefClassData: PConstantDefClassDataStructure;

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

var
  SOMIR_DLL_ConstantDefCClassData: PConstantDefCClassDataStructure;

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

function _SOMCLASS_ConstantDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ConstantDefClassData.classObject;
end;

function ConstantDefNew: ConstantDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_ConstantDef;
  if not Assigned(cls) then cls := ConstantDefNewClass;
  Result := SOMClass_somNew(cls);
end;

function ConstantDefRenew(buf: Pointer): ConstantDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_ConstantDef;
  if not Assigned(cls) then cls := ConstantDefNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function ConstantDef__get_type(somSelf: ConstantDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PConstantDefClassDataStructure;
begin
  cd := ConstantDefClassData;
  Result :=
    somTD_ConstantDef__get_type
     (SOM_Resolve(somSelf, cd.classObject, cd._get_type))(somSelf, ev);
end;

procedure ConstantDef__set_type(somSelf: ConstantDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PConstantDefClassDataStructure;
begin
  cd := ConstantDefClassData;
  somTD_ConstantDef__set_type
   (SOM_Resolve(somSelf, cd.classObject, cd._set_type))
     (somSelf, ev, type_code);
end;

function ConstantDef__get_value(somSelf: ConstantDef; ev: PEnvironment): any;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PConstantDefClassDataStructure;
begin
  cd := ConstantDefClassData;
  Result :=
    somTD_ConstantDef__get_value
     (SOM_Resolve(somSelf, cd.classObject, cd._get_value))(somSelf, ev);
end;

procedure ConstantDef__set_value(somSelf: ConstantDef; ev: PEnvironment;
  value: Pany); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PConstantDefClassDataStructure;
begin
  cd := ConstantDefClassData;
  somTD_ConstantDef__set_value
   (SOM_Resolve(somSelf, cd.classObject, cd._set_value))
     (somSelf, ev, value);
end;

// #include <excptdef.h>

function ExceptionDefNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_ExceptionDefClassData: PExceptionDefClassDataStructure;

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

var
  SOMIR_DLL_ExceptionDefCClassData: PExceptionDefCClassDataStructure;

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

function _SOMCLASS_ExceptionDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ExceptionDefClassData.classObject;
end;

function ExceptionDefNew: ExceptionDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_ExceptionDef;
  if not Assigned(cls) then cls := ExceptionDefNewClass;
  Result := SOMClass_somNew(cls);
end;

function ExceptionDefRenew(buf: Pointer): ExceptionDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_ExceptionDef;
  if not Assigned(cls) then cls := ExceptionDefNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function ExceptionDef__get_type(somSelf: ExceptionDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PExceptionDefClassDataStructure;
begin
  cd := ExceptionDefClassData;
  Result :=
    somTD_ExceptionDef__get_type
     (SOM_Resolve(somSelf, cd.classObject, cd._get_type))(somSelf, ev);
end;

procedure ExceptionDef__set_type(somSelf: ExceptionDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PExceptionDefClassDataStructure;
begin
  cd := ExceptionDefClassData;
  somTD_ExceptionDef__set_type
   (SOM_Resolve(somSelf, cd.classObject, cd._set_type))
     (somSelf, ev, type_code);
end;

// #include <paramdef.h>

function ParameterDefNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_ParameterDefClassData: PParameterDefClassDataStructure;

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

var
  SOMIR_DLL_ParameterDefCClassData: PParameterDefCClassDataStructure;

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

function _SOMCLASS_ParameterDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ParameterDefClassData.classObject;
end;

function ParameterDefNew: ParameterDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_ParameterDef;
  if not Assigned(cls) then cls := ParameterDefNewClass;
  Result := SOMClass_somNew(cls);
end;

function ParameterDefRenew(buf: Pointer): ParameterDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_ParameterDef;
  if not Assigned(cls) then cls := ParameterDefNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function ParameterDef__get_type(somSelf: ParameterDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PParameterDefClassDataStructure;
begin
  cd := ParameterDefClassData;
  Result :=
    somTD_ParameterDef__get_type
     (SOM_Resolve(somSelf, cd.classObject, cd._get_type))(somSelf, ev);
end;

procedure ParameterDef__set_type(somSelf: ParameterDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PParameterDefClassDataStructure;
begin
  cd := ParameterDefClassData;
  somTD_ParameterDef__set_type
   (SOM_Resolve(somSelf, cd.classObject, cd._set_type))
     (somSelf, ev, type_code);
end;

function ParameterDef__get_mode(somSelf: ParameterDef; ev: PEnvironment):
  ParameterDef_ParameterMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PParameterDefClassDataStructure;
begin
  cd := ParameterDefClassData;
  Result :=
    somTD_ParameterDef__get_mode
     (SOM_Resolve(somSelf, cd.classObject, cd._get_mode))(somSelf, ev);
end;

procedure ParameterDef__set_mode(somSelf: ParameterDef; ev: PEnvironment;
  mode: ParameterDef_ParameterMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PParameterDefClassDataStructure;
begin
  cd := ParameterDefClassData;
  somTD_ParameterDef__set_mode
   (SOM_Resolve(somSelf, cd.classObject, cd._set_mode))(somSelf, ev, mode);
end;

// #include <typedef.h>

function TypeDefNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_TypeDefClassData: PTypeDefClassDataStructure;

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

var
  SOMIR_DLL_TypeDefCClassData: PTypeDefCClassDataStructure;

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

function _SOMCLASS_TypeDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := TypeDefClassData.classObject;
end;

function TypeDefNew: TypeDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_TypeDef;
  if not Assigned(cls) then cls := TypeDefNewClass;
  Result := SOMClass_somNew(cls);
end;

function TypeDefRenew(buf: Pointer): TypeDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_TypeDef;
  if not Assigned(cls) then cls := TypeDefNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function TypeDef__get_type(somSelf: TypeDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PTypeDefClassDataStructure;
begin
  cd := TypeDefClassData;
  Result :=
    somTD_TypeDef__get_type
     (SOM_Resolve(somSelf, cd.classObject, cd._get_type))(somSelf, ev);
end;

procedure TypeDef__set_type(somSelf: TypeDef; ev: PEnvironment;
  type_code: TypeCode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PTypeDefClassDataStructure;
begin
  cd := TypeDefClassData;
  somTD_TypeDef__set_type
   (SOM_Resolve(somSelf, cd.classObject, cd._set_type))
     (somSelf, ev, type_code);
end;

// #include <operatdf.h>

function OperationDefNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_OperationDefClassData: POperationDefClassDataStructure;

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

var
  SOMIR_DLL_OperationDefCClassData: POperationDefCClassDataStructure;

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

function _SOMCLASS_OperationDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := OperationDefClassData.classObject;
end;

function OperationDefNew: OperationDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_OperationDef;
  if not Assigned(cls) then cls := OperationDefNewClass;
  Result := SOMClass_somNew(cls);
end;

function OperationDefRenew(buf: Pointer): OperationDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_OperationDef;
  if not Assigned(cls) then cls := OperationDefNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function OperationDef__get_result(somSelf: OperationDef; ev: PEnvironment):
  TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: POperationDefClassDataStructure;
begin
  cd := OperationDefClassData;
  Result :=
    somTD_OperationDef__get_result
     (SOM_Resolve(somSelf, cd.classObject, cd._get_result))(somSelf, ev);
end;

procedure OperationDef__set_result(somSelf: OperationDef;
  ev: PEnvironment; result_code: TypeCode);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: POperationDefClassDataStructure;
begin
  cd := OperationDefClassData;
  somTD_OperationDef__set_result
   (SOM_Resolve(somSelf, cd.classObject, cd._set_result))
     (somSelf, ev, result_code);
end;

function OperationDef__get_mode(somSelf: OperationDef; ev: PEnvironment):
  OperationDef_OperationMode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: POperationDefClassDataStructure;
begin
  cd := OperationDefClassData;
  Result :=
    somTD_OperationDef__get_mode
     (SOM_Resolve(somSelf, cd.classObject, cd._get_mode))(somSelf, ev);
end;

procedure OperationDef__set_mode(somSelf: OperationDef; ev: PEnvironment;
  mode: OperationDef_OperationMode); {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: POperationDefClassDataStructure;
begin
  cd := OperationDefClassData;
  somTD_OperationDef__set_mode
   (SOM_Resolve(somSelf, cd.classObject, cd._set_mode))(somSelf, ev, mode);
end;

function OperationDef__get_contexts(somSelf: OperationDef; ev: PEnvironment):
  _IDL_SEQUENCE_string; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: POperationDefClassDataStructure;
begin
  cd := OperationDefClassData;
  Result :=
    somTD_OperationDef__get_contexts
     (SOM_Resolve(somSelf, cd.classObject, cd._get_contexts))(somSelf, ev);
end;

procedure OperationDef__set_contexts(somSelf: OperationDef;
  ev: PEnvironment; contexts: P_IDL_SEQUENCE_string);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: POperationDefClassDataStructure;
begin
  cd := OperationDefClassData;
  somTD_OperationDef__set_contexts
   (SOM_Resolve(somSelf, cd.classObject, cd._set_contexts))
     (somSelf, ev, contexts);
end;

// #include <intfacdf.h>

function InterfaceDefNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_InterfaceDefClassData: PInterfaceDefClassDataStructure;

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

var
  SOMIR_DLL_InterfaceDefCClassData: PInterfaceDefCClassDataStructure;

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

function _SOMCLASS_InterfaceDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := InterfaceDefClassData.classObject;
end;

function InterfaceDefNew: InterfaceDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_InterfaceDef;
  if not Assigned(cls) then cls := InterfaceDefNewClass;
  Result := SOMClass_somNew(cls);
end;

function InterfaceDefRenew(buf: Pointer): InterfaceDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_InterfaceDef;
  if not Assigned(cls) then cls := InterfaceDefNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

function InterfaceDef__get_base_interfaces(somSelf: InterfaceDef;
  ev: PEnvironment): _IDL_SEQUENCE_string;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PInterfaceDefClassDataStructure;
begin
  cd := InterfaceDefClassData;
  Result :=
    somTD_InterfaceDef__get_base_interfaces
     (SOM_Resolve(somSelf, cd.classObject, cd._get_base_interfaces))
       (somSelf, ev);
end;

procedure InterfaceDef__set_base_interfaces(somSelf: InterfaceDef;
  ev: PEnvironment; base_interfaces: P_IDL_SEQUENCE_string);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PInterfaceDefClassDataStructure;
begin
  cd := InterfaceDefClassData;
  somTD_InterfaceDef__set_base_interfaces
   (SOM_Resolve(somSelf, cd.classObject, cd._set_base_interfaces))
     (somSelf, ev, base_interfaces);
end;

function InterfaceDef_describe_interface(somSelf: InterfaceDef;
  ev: PEnvironment): InterfaceDef_FullInterfaceDescription;
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PInterfaceDefClassDataStructure;
begin
  cd := InterfaceDefClassData;
  Result :=
    somTD_InterfaceDef_describe_interface
     (SOM_Resolve(somSelf, cd.classObject, cd.describe_interface))
       (somSelf, ev);
end;

function InterfaceDef__get_instanceData(somSelf: InterfaceDef;
  ev: PEnvironment): TypeCode; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PInterfaceDefClassDataStructure;
begin
  cd := InterfaceDefClassData;
  Result :=
    somTD_InterfaceDef__get_instanceData
     (SOM_Resolve(somSelf, cd.classObject, cd._get_instanceData))(somSelf, ev);
end;

procedure InterfaceDef__set_instanceData(somSelf: InterfaceDef;
  ev: PEnvironment; instanceData: TypeCode);
  {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
var
  cd: PInterfaceDefClassDataStructure;
begin
  cd := InterfaceDefClassData;
  somTD_InterfaceDef__set_instanceData
   (SOM_Resolve(somSelf, cd.classObject, cd._set_instanceData))
     (somSelf, ev, instanceData);
end;

// #include <moduledf.h>

function ModuleDefNewClass; external SOMIR_DLL_Name;

var
  SOMIR_DLL_ModuleDefClassData: PModuleDefClassDataStructure;

function ModuleDefClassData: PModuleDefClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ModuleDefClassData) then
    Result := SOMIR_DLL_ModuleDefClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ModuleDefClassData, 'ModuleDefClassData');
    Result := SOMIR_DLL_ModuleDefClassData;
  end;
end;

var
  SOMIR_DLL_ModuleDefCClassData: PModuleDefCClassDataStructure;

function ModuleDefCClassData: PModuleDefCClassDataStructure;
begin
  if Assigned(SOMIR_DLL_ModuleDefCClassData) then
    Result := SOMIR_DLL_ModuleDefCClassData
  else
  begin
    SOMIR_Load_Variable(SOMIR_DLL_ModuleDefCClassData, 'ModuleDefCClassData');
    Result := SOMIR_DLL_ModuleDefCClassData;
  end;
end;

function _SOMCLASS_ModuleDef: SOMClass; {$IFDEF DELPHI_HAS_INLINE} inline; {$ENDIF}
begin
  Result := ModuleDefClassData.classObject;
end;

function ModuleDefNew: ModuleDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_ModuleDef;
  if not Assigned(cls) then cls := ModuleDefNewClass;
  Result := SOMClass_somNew(cls);
end;

function ModuleDefRenew(buf: Pointer): ModuleDef;
var
  cls: SOMClass;
begin
  cls := _SOMCLASS_ModuleDef;
  if not Assigned(cls) then cls := ModuleDefNewClass;
  Result := SOMClass_somRenew(cls, buf);
end;

initialization

finalization
  if SOMIR_DLL <> 0 then
  begin
    Windows.EnterCriticalSection(DLLLoad_CriticalSection);
    FreeLibrary(SOMIR_DLL);
    Windows.LeaveCriticalSection(DLLLoad_CriticalSection);
  end;
end.
