echo off
title Running J markdown preprocessor ...
pushd
setlocal

rem set script executable from standard locations - assumes only one location
rem if exist c:\j64\j901\bin\jconsole.exe set jexe=c:\j64\j901\bin\jconsole -js
if exist c:\j64\j901\bin\jconsole.exe set jexe=c:\j64\j901\bin\jconsole -js
if "%jexe%" == "" goto Exception01

rem set J script
set jscr="0!:0<'c:/jod/docs/script/TeXfrWpxml.ijs'"

rem run J process and exit
%jexe% %jscr% "smoutput MainMarkdown 'c:/pd/blog/wordpress/analyzethedatanotthedrivel.wordpress.xml'" "exit 0"
title  J markdown build complete!
goto TheEnd

:Exception01
echo ERROR: jconsole.exe not found
title J markdown preprocessor abended!
pause

:TheEnd
endlocal
popd