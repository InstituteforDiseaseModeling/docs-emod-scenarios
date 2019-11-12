$PROJECT_ROOT = (Join-Path $PSScriptRoot ".." -Resolve)
$SCENARIOS_ROOT = (Join-Path $PROJECT_ROOT "Scenarios" -Resolve)
$INPUT_ROOT = (Join-Path $PROJECT_ROOT "Demographics_Files" -Resolve)
$DLL_ROOT = (Join-Path $PROJECT_ROOT "dll" -Resolve)
$BIN_ROOT = (Join-Path $PROJECT_ROOT "bin" -Resolve)
$EMOD_EXE = (Join-Path $BIN_ROOT "Eradication")

Set-Variable -Name IsWindows -Value ($env:OS -eq "Windows_NT") -ErrorAction SilentlyContinue

. (Join-Path $PROJECT_ROOT "console.ps1")
Pop-Location