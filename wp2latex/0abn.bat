echo off

title Running One Pass Blog Master/LaTeX  ...

lualatex bm

title Blog Master/LaTeX complete displaying PDF ...
call 0showpdf.bat bm.pdf

rem display pdf - point to preferred PDF reader
REM if not exist "C:\Program Files\SumatraPDF\SumatraPDF.exe" goto Win64
REM "C:\Program Files\SumatraPDF\SumatraPDF.exe" bm.pdf
REM goto TheEnd

REM :Win64
REM if not exist "C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe" goto Error00
REM "C:\Program Files (x86)\SumatraPDF\SumatraPDF.exe" bm.pdf
REM goto TheEnd

REM :Error00
REM echo PDF viewer not found

REM :TheEnd
