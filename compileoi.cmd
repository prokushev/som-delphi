@echo off
rem Compile copy of SOM Interface Repository importer with new bindings
rem Use SOMIRTest.DumpOut.pas bindings
rem Produce SOMIRTest.IRTestOut.exe executable
call delphirunner.cmd 7 %~dp0 dcc32 SOMIRTest.IRTestOut.dpr
