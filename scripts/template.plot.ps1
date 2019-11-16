#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. {helpers_script}

Push-Location -Path $PSScriptRoot
$name = (PSScriptBaseName)
$script = $PLOT[$name]
& python $script {args}
