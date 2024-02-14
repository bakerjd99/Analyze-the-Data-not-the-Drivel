echo off
title Running J markdown preprocessor ...
pushd
setlocal

rem quick dependency checks
if not exist c:\j64\j950\bin\jconsole.exe goto Error00
if not exist c:\pd\blog\wordpress\TeXfrWpxml.ijs goto Error02
if not exist c:\pd\blog\wordpress\analyzethedatanotthedrivel.wordpress.xml goto Error04

rem set script executable from standard locations - assumes only one location
if exist c:\j64\j950\bin\jconsole.exe set jexe=c:\j64\j950\bin\jconsole -js
if "%jexe%" == "" goto Error00

rem set J script
set jscr="0!:0<'C:/pd/blog/wordpress/TeXfrWpxml.ijs'"

rem run J process and exit
%jexe% %jscr% "smoutput MainMarkdown 'c:/pd/blog/wordpress/analyzethedatanotthedrivel.wordpress.xml'" "exit 0"
title J markdown build complete!

set /A ERRORLEVEL = 0
goto TheEnd

:Error00
  echo ERROR: jconsole.exe not found
  goto BadEnd
:Error02
  echo ERROR: TeXfrWpxml script not found
  goto BadEnd
:Error04
  echo ERROR: analyzethedatanotthedrivel.wordpress.xml not found
  goto BadEnd

:BadEnd
  if %ERRORLEVEL% EQ 0 set /A ERRORLEVEL = 66
  echo MainMarkdown J script abended!
  title MainMarkdown J script abended!
  pause
  
:TheEnd
endlocal
popd

rem pause
exit /B %ERRORLEVEL%
