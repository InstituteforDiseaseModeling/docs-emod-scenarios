@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\scripts\plotSIRChannels.py -c SEIRW -t "SEIRS" output\InsetChart.json
@ENDLOCAL
