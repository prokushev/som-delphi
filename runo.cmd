@echo off
call somrunner.cmd 2.1 %~dp0 SOMIRTest.TestOut.exe
rem sc -simod -mdll=danimal.dll -mimod=$@ *.idl