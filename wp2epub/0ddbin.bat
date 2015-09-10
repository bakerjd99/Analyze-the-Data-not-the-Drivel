echo off
title Running wp2epub to Dropbox source copy ...
pushd
setlocal

rem copy from the proper directory
set dbdir=C:\pd\blog\wp2epub
if "%CD%" == "%dbdir%" goto TestFiles
  echo ERROR: not in proper directory %CD%
  goto Exception01
:TestFiles
if exist "%dbdir%\*.markdown" set dbpath=C:\db\Dropbox\wp2epub\
if "%dbpath%" == "" goto Exception01

rem copy source files 
copy /y *.markdown %dbpath%
copy /y *.bat %dbpath%
copy /y *.sh %dbpath%
copy /y .gitignore %dbpath%
copy /y *.epub %dbpath%
copy /y *.mobi %dbpath%
copy /y *.xml %dbpath%
copy /y *.jpg %dbpath%
copy /y *.txt %dbpath%
copy /y *.ttf %dbpath%

title wp2epub to Dropbox complete!
goto TheEnd

:Exception01
echo ERROR: not in wp2epub project directory - nothing copied!
title wp2epub to Dropbox abended!
pause
goto TheEnd

:TheEnd
endlocal
popd
rem pause