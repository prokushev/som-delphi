@echo off
call somrunner.cmd 3.0 %~dp0 SOMIRTest.IRTestOut.exe
rem sc -simod -mdll=danimal.dll -mimod=$@ *.idl