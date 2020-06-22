echo off
title Running make EPUB  ...
pushd
setlocal

rem assemble bm.markdown
if exist bm.markdown erase bm.markdown
call prjJepub.bat
if not exist bm.markdown goto Exception01

rem make bm.epub
rem pandoc -S --epub-metadata=bmmetadata.xml --epub-cover-image=blogbanner06.jpg --epub-embed-font=apl385.ttf -o bm.epub bm.markdown
pandoc --epub-metadata=bmmetadata.xml --epub-cover-image=blogbanner06.jpg --epub-embed-font=apl385.ttf -o bm.epub bm.markdown
goto TheEnd

REM title EPUB complete - browsing generated file!
REM if not exist "c:\Program Files\FBReader\FBReader.exe" goto Reader02
  REM "c:\Program Files\FBReader\FBReader.exe" bm.epub
  REM goto TheEnd
REM :Reader02
REM if not exist "c:\uap\FBReader\FBReader.exe" goto Reader03
  REM "c:\uap\FBReader\FBReader.exe" bm.epub
  REM goto TheEnd
REM :Reader03
  REM c:\FBReader\FBReader.exe bm.epub
  REM goto TheEnd

:Exception01
echo ERROR: bm.markdown not found
title EPUB build abended!
goto Halt
:Halt
  pause

:TheEnd
endlocal
popd

pause