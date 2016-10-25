{$R-}
{$WARN UNSAFE_TYPE OFF}

unit SOM.Thin.RTL;

// Bindings to SOM-specific C runtime library (stdio and brothers)
// Required for e. g. Emitter Framework

interface

uses
  SOM.DelphiFeatures;

{$INCLUDE 'SOM.DelphiFeatures.inc'}

type
  PFILE = type Pointer;



implementation

end.
