Push-Location -Path $PSScriptRoot

. ../../../../scripts/helpers.ps1

$chart = (Join-Path "output" "InsetChart.json")
$pyscript = (Join-Path "$BIN_ROOT" "plotTbResults_Progression_Comparison.py")
& python $pyscript -b ..\SEIR\output\InsetChart.json -C output\InsetChart.json -c "Latent TB Prevalence" -c "Active Presymptomatic Prevalence" -c "Active Symptomatic Prevalence" -c "Active Sx Smear pos Prevalence" -c "Active Sx Smear neg Prevalence" -c "Active Sx Extrapulm Prevalence"
