set currentdir=%~dp0
cd %currentdir%

@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

echo **** Setting Execution Policy ****
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy RemoteSigned -Force' -Verb RunAs}"
echo DONE

echo.
echo **** Installing NirCmd ****
call %currentdir%\files\.installNirCmd.bat

echo.
ECHO FINIHSED
PAUSE