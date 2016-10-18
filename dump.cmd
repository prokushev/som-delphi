@echo off
call somrunner.cmd 3.0 SOM\3.0\etc irdump > dump.txt
rem sc -simod -mdll=danimal.dll -mimod=$@ *.idl
