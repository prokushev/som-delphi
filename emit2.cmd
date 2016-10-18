@echo off
call somrunner.cmd 3.0 %~dp0 sc -v -sdelphi -m"namespace=TestEmit" emit2.idl
rem sc -simod -mdll=danimal.dll -mimod=$@ *.idl
