@echo off
call somrunner.cmd 3.0 %~dp0 irdump > dump.txt
rem sc -simod -mdll=danimal.dll -mimod=$@ *.idl
