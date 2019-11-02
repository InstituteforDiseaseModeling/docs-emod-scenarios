@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\scripts\plotSIRChannels.py -c SEIR -t "Generic SEIR" output\InsetChart.json
@ENDLOCAL
