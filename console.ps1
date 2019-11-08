
$env:PROJECT_ROOT = $PSScriptRoot

Set-Location -Path "$env:PROJECT_ROOT"

$VENV = (Join-Path $env:PROJECT_ROOT ".venv" -Resolve)
Set-Variable -Name "IsWindows" -Value ($env:OS -eq "Windows_NT") -ErrorAction SilentlyContinue

function prompt {
    "PS $($executionContext.SessionState.Path.CurrentLocation)`n$('>' * ($nestedPromptLevel + 1)) ";
}


function _activate_virtualenv(){
    if($IsWindows){
        $VENV_BIN = "Scripts"
    } else {
        $VENV_BIN = "bin"
    }
    $activate_ps1 = (Join-Path $VENV "$VENV_BIN/Activate.ps1" -Resolve)
    . "$activate_ps1"
}

function create_virtualenv(){
    opts = @(-m venv --copies --prompt="emod-scenarios" "$VENV")
    if($IsWindows){
        & py -3.6 @opts
    } else {
        & python3 @opts
    }
    _activate_virtualenv
    & python -m pip install -U pip setuptools
    & pip install "$env:PROJECT_ROOT"
}

if(!(Test-Path $VENV)){
    create_virtualenv
} else {
    _activate_virtualenv
}
