Push-Location $PSScriptRoot

$scenarios = (Get-ChildItem -Force -Recurse -Filter "config.json" | Split-Path -Parent)
$config_file = ".scenario"

$log = (Join-Path $PSScriptRoot 'scripts.log')

$contents = (Get-Content -Path $log)
$data = @{ }
foreach ($line in $contents){
    $parts = $line -split ';'
    $file = $parts[0]
    $dir = (Split-Path -Path $file -Parent)
    $filename = (Split-Path -Path $file -LeafBase)
    $inputdata = @{
        "script" = "$filename.py"
        "commandline" = $parts[1];
    }
    if ($data.ContainsKey($dir)) {
        $data[$dir].Add($filename, $inputdata)
    } else {
        $data.Add($dir, @{
            "$filename" = $inputdata
        })
    }
}

foreach ($scenario in $data.Keys){
    $title_file = (Join-Path $scenario "title.txt")
    $title = (Get-Content -Path $title_file) -join ""
    $data[$scenario].Add('plotAllCharts', @{
        "script" = "plotAllCharts.py";
        "title" = $title;
        "report" = "output/InsetChart.json"
    })

    $outfile = (Join-Path $scenario $config_file)
    ConvertTo-Json -InputObject $data[$scenario] | Out-File -FilePath $outfile -Encoding utf8
}

Write-Host "Done!"