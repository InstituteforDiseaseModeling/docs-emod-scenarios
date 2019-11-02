@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\..\scripts\plotPropertyReport.py -c "Active TB Infections" -c "Infected" -c "Active Smearpos TB Infections" -c "Statistical Population" -g InterventionStatus output\PropertyReportTB.json
@ENDLOCAL
