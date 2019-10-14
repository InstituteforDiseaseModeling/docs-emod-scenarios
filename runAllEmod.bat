@echo off
set /a Counter=1
call :treeProcess
goto :eof

:treeProcess
rem see https://stackoverflow.com/questions/8397674/windows-batch-file-looping-through-directories-to-process-files
rem and https://stackoverflow.com/questions/4340350/how-to-check-if-a-file-exists-from-inside-a-batch-file
rem Do whatever you want here over the files of this subdir, for example:
rem for %%f in (*.tif) do echo %%f
if exist runEMOD.* (
	set /a Counter+=1
	echo *************************************************************************
	echo Counter: %Counter%    Running: %cd%
	echo *************************************************************************	
	runEMOD
)
for /D %%d in (*) do (
    cd %%d
    call :treeProcess
    cd ..
)
exit /b