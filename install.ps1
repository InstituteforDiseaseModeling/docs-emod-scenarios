#!/usr/bin/env pwsh
Push-Location -Path $PSScriptRoot

. (Join-Path $PSScriptRoot "env.ps1")

if(!$IsWindows){
    Get-ChildItem -Force -Recurse -Filter '*.ps1'  | ForEach-Object {
      $path = $_.FullName
      & chmod '+x' "$path"
    }
}
