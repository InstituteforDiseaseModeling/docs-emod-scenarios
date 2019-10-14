@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\Scripts\plotBinnedPopulation.py -c "Infected" output\BinnedReport.json
@ENDLOCAL