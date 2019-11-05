@echo off

if not defined PROJECT_ROOT set "PROJECT_ROOT=%~dp0.."
set "PATHEXT=.PY;%PATHEXT%"
set "PATH=%PROJECT_ROOT%/bin;%PATH%"
if not exist "%PROJECT_ROOT%/.venv" (
    @py -3.6 -m venv --copies "%PROJECT_ROOT%/.venv"
    @call "%PROJECT_ROOT%/.venv/Scripts/activate.bat"
    @python -m pip install -U pip setuptools wheel
    @pip install "%PROJECT_ROOT%"
) else (
    @call "%PROJECT_ROOT%/.venv/Scripts/activate.bat"
)

