#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. ../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script -c "Active TB Infections:QualityOfCare:None" -c "Active TB Infections:QualityOfCare:Private" -c "Active TB Infections:QualityOfCare:Public" -c "Statistical Population:QualityOfCare:None" -c "Statistical Population:QualityOfCare:Private" -c "Statistical Population:QualityOfCare:Public" -c "Infected:QualityOfCare:None" -c "Infected:QualityOfCare:Private" -c "Infected:QualityOfCare:Public" output/PropertyReportTB.json
