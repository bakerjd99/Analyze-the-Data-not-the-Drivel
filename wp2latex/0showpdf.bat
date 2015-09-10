rem display pdf - point to preferred PDF reader
if not exist "C:\Program Files\SumatraPDF\SumatraPDF.exe" goto Win64
"C:\Program Files\SumatraPDF\SumatraPDF.exe" %1
goto TheEnd

:Win64
if not exist "C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe" goto Error00
"C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe" %1
goto TheEnd

:Error00
echo PDF viewer not found

:TheEnd