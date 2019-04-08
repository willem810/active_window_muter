set currentdir=%~dp0
cd %currentdir%

@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

for /f "delims== tokens=1,2" %%G in (param.txt) do set %%G=%%H
echo ***********************
echo ***********************************
echo ***********************************************
echo.
echo Running setup with hotkey: %HOTKEY% 
echo.
echo ***********************************************
echo ***********************************
echo *****************

echo.
echo.
echo **********************************
echo **** Setting Execution Policy ****
echo **********************************
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy RemoteSigned -Force' -Verb RunAs}"
echo DONE

echo.
echo.
echo ***************************
echo **** Creating shortcut ****
echo ***************************
powershell -ExecutionPolicy ByPass -File %currentdir%\files\.CreateShortcut.ps1 -hotkey %HOTKEY%

echo.
ECHO FINIHSED
PAUSE