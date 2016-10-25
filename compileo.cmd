@echo off
rem Compile simple tester of generated bindings (often to check for syntax errors)
rem Use SOMIRTest.DumpOut.pas bindings
rem Produce SOMIRTest.TestOut.dpr executable
call delphirunner.cmd 7 %~dp0 dcc32 SOMIRTest.TestOut.dpr
