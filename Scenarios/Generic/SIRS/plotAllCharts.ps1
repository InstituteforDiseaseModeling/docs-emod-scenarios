Push-Location -Path $PSScriptRoot

. ../../../scripts/helpers.ps1

$chart = (Join-Path "output" "InsetChart.json")
$pyscript = (Join-Path "$BIN_ROOT" "plotAllCharts.py")
$pytitle = "SIRS"
& python $pyscript $chart "$pytitle"
