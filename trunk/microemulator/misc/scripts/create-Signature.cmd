@echo off
rem @version $Revision$ ($Author$)  $Date$
SETLOCAL

call %~dp0environment.cmd %*
if errorlevel 1 (
    echo Error calling environment.cmd
    endlocal
    pause
    exit /b 1
)

java -cp "%GATLING_SIGNATURE_TOOL_CP%" com.motorola.signature.tools.SignatureTool -source %WTK_HOME%\lib\cldcapi11.jar

if errorlevel 1 goto errormark
echo [Launched OK]
goto endmark
:errormark
	ENDLOCAL
	echo Error in start
	rem pause
:endmark
ENDLOCAL
