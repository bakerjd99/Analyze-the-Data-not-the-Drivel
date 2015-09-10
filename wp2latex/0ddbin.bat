echo off
title Running wp2latex to Dropbox source copy ...
pushd
setlocal

rem copy from the proper directory
set dbdir=C:\pd\blog\wp2latex
if "%CD%" == "%dbdir%" goto TestFiles
  echo ERROR: not in proper directory %CD%
  goto Exception01
:TestFiles
if exist "%dbdir%\*.tex" set dbpath=C:\db\Dropbox\wp2latex\
if "%dbpath%" == "" goto Exception01

rem copy source files 
copy /y *.tex %dbpath%
copy /y *.bat %dbpath%
copy /y *.sh %dbpath%
copy /y .gitignore %dbpath%
copy /y *.bib %dbpath%
copy /y *.pdf %dbpath%
copy /y *.txt %dbpath%
copy /y inclusions %dbpath%inclusions\

title wp2latex to Dropbox complete!
goto TheEnd

:Exception01
echo ERROR: not in wp2latex project directory - nothing copied!
title wp2latex to Dropbox abended!
pause
goto TheEnd

:TheEnd
endlocal
popd
rem pause