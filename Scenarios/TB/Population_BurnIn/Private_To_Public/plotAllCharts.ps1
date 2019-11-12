Push-Location -Path $PSScriptRoot

. ../../../../scripts/helpers.ps1

$chart = (Join-Path "output" "InsetChart.json")
$pyscript = (Join-Path "$BIN_ROOT" "plotAllCharts.py")
$pytitle = "Private to public health care"
& python $pyscript $chart "$pytitle"
