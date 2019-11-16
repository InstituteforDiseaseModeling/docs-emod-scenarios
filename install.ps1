#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. (Join-Path $PSScriptRoot "console.ps1")

if(!$IsWindows){
    Get-ChildItem -Force -Recurse -Filter '*.ps1' -Name | ForEach-Object { & chmod +x $_.FullName}
}