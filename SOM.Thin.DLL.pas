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

implementation


initialization
  Windows.InitializeCriticalSection(DLLLoad_CriticalSection);
finalization
  Windows.DeleteCriticalSection(DLLLoad_CriticalSection);
end.
