Push-Location -Path $PSScriptRoot

. {helpers_script}

Push-Location -Path $PSScriptRoot

& $EMOD --config="config.json" --input-path="$INPUT_ROOT" --dll-path="$DLL_ROOT" --output-path="output"
Pop-Location