@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\Scripts\plotSIRChannels.py -c SEIRW -t "SEIRS" output\InsetChart.json
@ENDLOCAL