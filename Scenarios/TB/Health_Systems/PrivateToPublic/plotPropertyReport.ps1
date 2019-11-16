Push-Location -Path $PSScriptRoot

. ../../../../../scripts/helpers.ps1

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script -c "Active TB Infections" -c "Statistical Population" -c "Infected" output/PropertyReportTB.json
