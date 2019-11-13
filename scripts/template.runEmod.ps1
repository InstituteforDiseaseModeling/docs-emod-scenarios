Push-Location -Path $PSScriptRoot

. {helpers_script}

Push-Location -Path $PSScriptRoot
$emod = Resolve-Path -Relative -Path (Join-Path $BIN_ROOT "Eradication")

& $emod --config="config.json" --input-path="$INPUT_ROOT" --dll-path="$DLL_ROOT" --output-path="output"
Pop-Location