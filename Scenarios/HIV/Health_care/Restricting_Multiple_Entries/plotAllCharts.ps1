Push-Location -Path $PSScriptRoot

. ../../../../scripts/helpers.ps1

$chart = (Join-Path "output" "InsetChart.json")
$pyscript = (Join-Path "$BIN_ROOT" "plotAllCharts.py")
$pytitle = "HIV Cascade Multiple Entries"
& python $pyscript $chart "$pytitle"
