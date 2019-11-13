Set-Location -Path $PSScriptRoot

Write-Host "For test.ps1:"
Write-Output -InputObject "`tMyInvocation.PSCommandPath: $($MyInvocation.PSCommandPath)"
Write-Output -InputObject "`tPSCommandPath: $PSCommandPath"

. "./command.ps1"
"From test.ps1 using function from command.ps1:"
PsScriptBaseName