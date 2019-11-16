#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. ../../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot

& $EMOD --config="config.json" --input-path="$INPUT_ROOT" --dll-path="$DLL_ROOT" --output-path="output"
Pop-Location