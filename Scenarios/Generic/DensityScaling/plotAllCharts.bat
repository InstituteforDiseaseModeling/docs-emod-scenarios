@SETLOCAL
@SET "PROJECT_ROOT=%~dp0\..\..\.."
@SET "PATH=%PATH%;%PROJECT_ROOT%\.venv\Scripts"
python plotAllCharts.py output\InsetChart.json "Density Scaling"
@ENDLOCAL
