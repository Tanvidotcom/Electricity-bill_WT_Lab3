@echo off
setlocal
set "TOMCAT_LIB=%~dp0..\lib"
if not exist "%JAVA_HOME%\bin\javac.exe" (
    echo Java JDK was not found. Please install JDK 8 or newer and set JAVA_HOME.
    exit /b 1
)
mkdir "%~dp0web\WEB-INF\classes" 2>nul
"%JAVA_HOME%\bin\javac" -cp "%CATALINA_HOME%\lib\servlet-api.jar" -d "%~dp0web\WEB-INF\classes" "%~dp0src\com\example\ElectricityBillServlet.java"
echo Compilation completed.
