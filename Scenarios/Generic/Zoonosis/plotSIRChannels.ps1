#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. ../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script -c SEIRW -t "Zoonosis" output/InsetChart.json
