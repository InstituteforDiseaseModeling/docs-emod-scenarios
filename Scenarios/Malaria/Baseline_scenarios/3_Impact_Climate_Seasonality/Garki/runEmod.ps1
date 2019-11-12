Push-Location -Path $PSScriptRoot
& ../../../../../bin/Eradication -C config.json -I ../../../../../Demographics_Files -D ../../../../../dll -O output
Pop-Location