echo off
rem process blog posting (bm.tex) root file 

if not exist C:\Users\baker\AppData\Local\SumatraPDF\SumatraPDF.exe goto Location2

title Running Blog Master/LaTeX  ...

rem first pass for aux file needed by bibtex
lualatex bm

rem generate/reset bbl file
rem bibtex bm

makeindex bm

rem resolve all internal references - may
rem comment out when debugging entire document
lualatex bm
lualatex bm

rem display pdf 
title Blog Master/LaTeX complete displaying PDF ...
if exist C:\Users\baker\AppData\Local\SumatraPDF\SumatraPDF.exe goto Location0 
if exist C:\PROGRA~2\SumatraPDF\SumatraPDF.exe goto Location1
goto TheEnd

:Location0
    C:\Users\baker\AppData\Local\SumatraPDF\SumatraPDF.exe bm.pdf
    goto TheEnd
:Location1
    C:\PROGRA~2\SumatraPDF\SumatraPDF.exe bm.pdf
    goto TheEnd
:Location2
    echo bm.pdf missing or paths not set or invalid - edit and rerun
	pause
	goto TheEnd

:TheEnd
