Push-Location -Path $PSScriptRoot
& {emod} -C config.json -I {input} -D {dll} -O output
Pop-Location