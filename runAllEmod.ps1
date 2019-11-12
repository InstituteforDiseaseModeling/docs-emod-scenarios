$PROJECT_ROOT = $PSScriptRoot

Set-Location -Path $PROJECT_ROOT

function hr($before="",$after=""){
	$width = ($Host.UI.RawUI.WindowSize.Width - 2)
	$line = " " + ("=" * $width)
	return "$before$line$after"
}
function header($heading=''){
	$nl = "`n"
	Write-Output (hr -before $nl)
	Write-Output "  $heading"
	Write-Output (hr -after $nl)
}
function line(){
	Write-Output (hr -before "`n" -after "`n")
}

$targets = (Get-ChildItem -Recurse -Filter 'runEmod.ps1')

foreach ($target in $targets){
	header -heading "Executing $target"
	& $target
	line
}