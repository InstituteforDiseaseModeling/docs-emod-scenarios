#!/usr/bin/env pwsh

$env:PROJECT_ROOT = $PSScriptRoot

Push-Location -Path "$env:PROJECT_ROOT"
Set-Variable -Name "IsWindows" -Value ($env:OS -eq "Windows_NT") -ErrorAction SilentlyContinue

$VENV = (Join-Path $env:PROJECT_ROOT ".venv")
$VENV_PROMPT = 'emod-scenarios'

function prompt {
    "PS $($executionContext.SessionState.Path.CurrentLocation)`n$('>' * ($nestedPromptLevel + 1)) ";
}


function _activate_virtualenv(){
    if($IsWindows){
        $VENV_BIN = "Scripts"
    } else {
        $VENV_BIN = "bin"
    }
    $activate_ps1 = (Join-Path $VENV "$VENV_BIN/Activate.ps1")
    if (!(Test-Path $activate_ps1)){
        $template = (Get-Content -Path (Join-Path $env:PROJECT_ROOT 'scripts' 'Activate.ps1') | Out-String)
        $contents = ($template -replace "{virtual_env_path}", $VENV -replace "{virtual_env_prompt}", $VENV_PROMPT -replace "{virtual_env_bin}", $VENV_BIN)
        $contents > $activate_ps1
    }
    . "$activate_ps1"
}

function create_virtualenv(){
    $opts = @('-m', 'venv', '--copies', "--prompt=`"$VENV_PROMPT`"", "$VENV")
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
