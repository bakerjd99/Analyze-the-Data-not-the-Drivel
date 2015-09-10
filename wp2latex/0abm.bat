echo off
rem process blog posting (bm.tex) root file 

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

title Blog Master/LaTeX complete displaying PDF ...
call 0showpdf.bat bm.pdf
