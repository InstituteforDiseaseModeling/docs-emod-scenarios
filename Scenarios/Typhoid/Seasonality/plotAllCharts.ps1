Push-Location -Path $PSScriptRoot

. ../../../scripts/helpers.ps1

$sc = (Get-Content -Path ".scenario" | ConvertFrom-Json -AsHashtable)
$key = (Split-Path $MyInvocation.MyCommand.Name -LeafBase)
$config = $sc[$key]
$pyscript = (Join-Path "$BIN_ROOT" $config.script)
& python $pyscript --title="$($config.title)" $config.report
