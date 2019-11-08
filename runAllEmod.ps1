
$PROJECT_ROOT = $PSScriptRoot

Set-Location -Path $PROJECT_ROOT


$targets = (Get-ChildItem -Recurse -Filter 'runEmod.ps1')

foreach ($target in $targets){
	$dir = (Split-Path -Path $target -Parent)
	Set-Location -Path $dir
	Write-Output @"

"@
	& $target
}