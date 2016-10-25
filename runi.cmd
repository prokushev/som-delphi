@echo off
rem Run SOM Interface Repository importer
rem Use SOM.IR database
rem Produce SOMIRTest.DumpOut.pas bindings
call somrunner.cmd 2.1 %~dp0 SOMIRIMP.exe
