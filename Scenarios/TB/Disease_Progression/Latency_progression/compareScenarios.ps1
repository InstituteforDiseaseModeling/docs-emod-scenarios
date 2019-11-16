#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. ../../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script -b ../SEIR/output/InsetChart.json -C output/InsetChart.json -c "Latent TB Prevalence" -c "Active Presymptomatic Prevalence" -c "Active Symptomatic Prevalence"  -c "Active Sx Smear pos Prevalence" -c "Active Sx Smear neg Prevalence" -c "Active Sx Extrapulm Prevalence" -c "Latent TB Prevalence" -c "Latent Fast TB Prevalence" -c "Latent Slow TB Prevalence"
