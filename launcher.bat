@echo off

setlocal

set "SCRIPT_ROOT=%~dp0"
set "PROJECT_ROOT=%SCRIPT_ROOT:~0,-1%"
set "SCRIPT_ROOT="

@pushd "%PROJECT_ROOT%"

@cmd /k "%PROJECT_ROOT%/bin/console.bat"

endlocal