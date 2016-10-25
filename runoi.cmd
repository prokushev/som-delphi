@echo off
rem Run copy of SOM Interface Repository importer compiled with the new bindings
rem Use SOM.IR database
rem Produce SOMIRTest.IRTestOut.DumpOut.pas bindings
call somrunner.cmd 2.1 %~dp0 SOMIRTest.IRTestOut.exe
