#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. ../../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script --title="Move individuals with no health care to the public system" output/InsetChart.json
