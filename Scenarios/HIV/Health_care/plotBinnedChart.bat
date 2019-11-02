@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\scripts\plotBinnedPopulation.py -c "Infected" output\BinnedReport.json
@ENDLOCAL
