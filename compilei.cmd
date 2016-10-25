@echo off
rem Compile SOM Interface Repository importer
rem Use SOMIRIMP.SOM.pas bindings
rem Produce SOMIRIMP.exe
call delphirunner.cmd 7 %~dp0 dcc32 SOMIRIMP.dpr
