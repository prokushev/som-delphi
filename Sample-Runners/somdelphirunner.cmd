@echo off
rem runner SOM-version Delphi-version directory command
rem Sample: runner 3.0 7 SOM\3.0\bin somcorba.cmd
rem echo %1 %2 %3 %4 %5 %6 %7 %8 %9
setlocal
pushd
cd %~dp0..
set PATH=%CD%\Delphi\%2\Bin;%PATH%
set SOMBASE=%CD%\SOM\%1
call %SOMBASE%\bin\somenv
cd %3
chcp 1251 > nul
shift
shift
shift
call %1 %2 %3 %4 %5 %6 %7 %8 %9
chcp 866 > nul
popd
endlocal