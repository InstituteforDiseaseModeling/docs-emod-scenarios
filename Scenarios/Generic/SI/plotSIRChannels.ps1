Push-Location -Path $PSScriptRoot

. ../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script -c SI -t "SI" output/InsetChart.json
