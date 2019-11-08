
$PROJECT_ROOT = (Join-Path $PSScriptRoot ".." -Resolve)

Set-Location -Path $PROJECT_ROOT

$SCENARIOS_ROOT = (Join-Path $PROJECT_ROOT "Scenarios" -Resolve)
$INPUT_ROOT = (Join-Path $PROJECT_ROOT "Demographics_Files" -Resolve)
$DLL_ROOT = (Join-Path $PROJECT_ROOT "dll" -Resolve)
$BIN_ROOT = (Join-Path $PROJECT_ROOT "bin" -Resolve)

$EMOD_EXE = (Join-Path $BIN_ROOT "Eradication")

$contents = @"
& $EMOD_EXE -C config.json -I $INPUT_ROOT -D $DLL_ROOT -O output
"@

$scenarios = (Get-ChildItem -Path "$SCENARIOS_ROOT" -Recurse -Filter "config.json" -Name | Split-Path -Parent)

foreach ($scenario in $scenarios){
    $runfile = (Join-Path $SCENARIOS_ROOT $scenario "runEmod.ps1")
    $contents > $runfile
}