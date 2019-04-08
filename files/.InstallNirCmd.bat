@echo off

set currentdir=%~dp0
cd %currentdir%

echo Creating NirCmd directory, if not exist: C:\Program Files (x86)\nircmd
if not exist "C:\Program Files (x86)\nircmd" mkdir "C:\Program Files (x86)\nircmd"

echo.
echo Copying NirCmd.exe to directory: C:\Program Files (x86)\nircmd
copy %currentdir%\nircmd.exe "C:\Program Files (x86)\nircmd"

echo Updating Path to include new NirCmd location
if not exist %userprofile%\.tmpforwillem mkdir %userprofile%\.tmpforwillem
echo %PATH% > %userprofile%\.tmpforwillem\PATHBACKUP.txt
echo Backup of PATH is stored at location: %userprofile%\.tmpforwillem\PATHBACKUP.txt

setx /M PATH "%PATH%;C:\Program Files (x86)\nircmd"