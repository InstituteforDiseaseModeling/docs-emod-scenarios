@SETLOCAL
@SET PATH=%PATH%;C:\Python36
python ..\..\..\..\Scripts\plotPropertyReport.py -c "Active TB Infections:QualityOfCare:None" -c "Active TB Infections:QualityOfCare:Private" -c "Active TB Infections:QualityOfCare:Public" -c "Statistical Population:QualityOfCare:None" -c "Statistical Population:QualityOfCare:Private" -c "Statistical Population:QualityOfCare:Public" -c "Infected:QualityOfCare:None" -c "Infected:QualityOfCare:Private" -c "Infected:QualityOfCare:Public" output\PropertyReportTB.json
@ENDLOCAL

