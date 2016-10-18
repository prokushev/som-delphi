{$R-}
{$WARN UNSAFE_TYPE OFF}

unit SOM.Thin.InterfaceRepository;

// Define everything that becomes available in C when doing "#include <repository.h>"

interface

uses
  SOM.DelphiFeatures, SOM.Thin;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

// #include <somir.h>


// #include <containd.h>
// #include <containr.h>


// #include <repository.h>






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




end.

