Push-Location -Path $PSScriptRoot

. ../../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script -c SEIR -t "Improve quality in the private system" output/InsetChart.json
