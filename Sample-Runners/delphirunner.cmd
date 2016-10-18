@echo off
rem delphirunner Delphi-version directory command
rem Sample: delphirunner 7 %~dp0 dcc32 MyProject.dpr
setlocal
pushd
cd %~dp0..
set PATH=%CD%\Delphi\%1\Bin;%PATH%
cd %2
chcp 1251 > nul
shift
shift
call %1 %2 %3 %4 %5 %6 %7 %8 %9
chcp 866 > nul
popd
endlocal
