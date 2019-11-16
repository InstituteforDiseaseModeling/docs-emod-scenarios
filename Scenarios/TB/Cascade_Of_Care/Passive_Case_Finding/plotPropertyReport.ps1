#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. ../../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script -c "Active TB Infections" -c "Infected" -c "Active Smearpos TB Infections" -c "Statistical Population" -g InterventionStatus output/PropertyReportTB.json
