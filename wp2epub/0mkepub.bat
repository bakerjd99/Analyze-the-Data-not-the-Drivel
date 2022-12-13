echo off
title Running make EPUB  ...
pushd
setlocal

rem assemble bm.markdown 
if exist bm.epub erase bm.epub
if exist bm.markdown erase bm.markdown
call prjJepub.bat
if %ERRORLEVEL% NEQ 0 goto Error02
if not exist bm.markdown goto Error00

rem make bm.epub - last tuned for pandoc version 2.9.1.1
rem pandoc -S --epub-metadata=bmmetadata.xml --epub-cover-image=blogbanner06.jpg --epub-embed-font=apl385.ttf -o bm.epub bm.markdown
pandoc --epub-metadata=bmmetadata.xml --epub-cover-image=blogbanner06.jpg --epub-embed-font=apl385.ttf -o bm.epub bm.markdown
if %ERRORLEVEL% NEQ 0 goto Error04
if not exist bm.epub goto Error06

set /A ERRORLEVEL = 0
goto TheEnd

:Error00
  echo ERROR: bm.markdown not found
  goto BadEnd
:Error02
  echo ERROR: prjJepub.bat failed
  goto BadEnd
:Error04
  echo ERROR: pandoc command failed
  goto BadEnd
:Error06
  echo ERROR: bm.epub not found
  goto BadEnd
	
:BadEnd
  if %ERRORLEVEL% EQ 0 set /A ERRORLEVEL = 66
  echo EPUB build abended!
  title EPUB build abended!

:TheEnd
endlocal
popd

pause
exit /B %ERRORLEVEL%