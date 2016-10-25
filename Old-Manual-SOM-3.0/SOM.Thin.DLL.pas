unit SOM.Thin.DLL;

// aid in binding DLL variables

interface

uses
  Windows;

var
  DLLLoad_CriticalSection : Windows.TRTLCriticalSection;

const
  SOM_DLL_Name = 'som.dll';
  SOME_DLL_Name = 'some.dll';
  SOMC_DLL_Name = 'somc.dll';
  SOMTC_DLL_Name = 'somtc.dll';
  SOMDCOMM_DLL_Name = 'somdcomm.dll';
  SOMIR_DLL_Name = 'somir.dll';
  SOMD_DLL_Name = 'somd.dll';

implementation


initialization
  Windows.InitializeCriticalSection(DLLLoad_CriticalSection);
finalization
  Windows.DeleteCriticalSection(DLLLoad_CriticalSection);
end.
