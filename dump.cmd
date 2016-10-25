@echo off
call somrunner.cmd 2.1 %~dp0 irdump > dump.txt
rem sc -simod -mdll=danimal.dll -mimod=$@ *.idl
