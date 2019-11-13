Push-Location -Path $PSScriptRoot

. {helpers_script}

Push-Location -Path $PSScriptRoot

$sc = (Get-Content -Path ".scenario" | ConvertFrom-Json -AsHashtable)
$key = (Split-Path $MyInvocation.MyCommand.Name -LeafBase)
$config = $sc[$key]
$pyscript = (Join-Path "$BIN_ROOT" $config.script)
& python $pyscript --title="$($config.title)" $config.report
