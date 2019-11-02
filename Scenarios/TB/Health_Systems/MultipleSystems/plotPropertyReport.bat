@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\..\scripts\plotPropertyReport.py -c "Active TB Infections" -c "Statistical Population" -c "Infected" output\PropertyReportTB.json
@ENDLOCAL

