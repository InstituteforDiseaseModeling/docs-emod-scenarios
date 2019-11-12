Push-Location -Path $PSScriptRoot

. {helpers_script}

$chart = (Join-Path "output" "InsetChart.json")
$pyscript = (Join-Path "$BIN_ROOT" "plotAllCharts.py")
$pytitle = "{title}"
& python $pyscript $chart "$pytitle"
