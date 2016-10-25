@echo off
call somrunner.cmd 3.0 %~dp0 sc -sdelphi -m"namespace=TestEmit" C:\home\OCTAGRAM\SOM_AND_OD\SOM\3.0\include\somobj.idl
rem sc -simod -mdll=danimal.dll -mimod=$@ *.idl
