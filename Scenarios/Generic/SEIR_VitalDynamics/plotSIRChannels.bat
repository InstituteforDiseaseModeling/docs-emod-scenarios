@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\Scripts\plotSIRChannels.py -c SEIR -t "Generic SEIR with vital dynamics" output\InsetChart.json
@ENDLOCAL
