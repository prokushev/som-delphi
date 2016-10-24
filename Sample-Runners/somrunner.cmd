@echo off
rem somrunner SOM-version directory command
rem Sample: somrunner 3.0 SOM\3.0\bin somcorba.cmd
setlocal
pushd
cd %~dp0..
set SOMBASE=%CD%\SOM\%1
call %SOMBASE%\bin\somenv
cd %2
chcp 1251 > nul
shift
shift
call %1 %2 %3 %4 %5 %6 %7 %8 %9
chcp 866 > nul
popd
endlocal