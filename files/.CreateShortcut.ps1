param([string]$hotkey="F8")


echo "Creating shortcut with hotkey: $hotkey"


$startMenuLocation="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\AWMute"
$shortcutLocation = "$startMenuLocation\MuteToggle.lnk"
echo "Creating startmenu location: $startMenuLocation"
New-Item -ItemType Directory -Force -Path $startMenuLocation

$scriptLocation="$PSScriptRoot"
$script = "$scriptLocation\MuteToggle.ps1"
echo "Script location: $script"

$parentLocation = Split-Path -Path $PSScriptRoot -Parent
echo "Creating shortcut: $shortcutLocation"

$WshShell=New-Object -comObject WScript.Shell
$Shortcut=$WshShell.CreateShortcut("$shortcutLocation")

$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-ExecutionPolicy ByPass -File $script"

$ShortCut.WorkingDirectory = "$startMenuLocation";
$Shortcut.Hotkey=$hotkey;
$ShortCut.WindowStyle = 0;
$ShortCut.Description = "This shortcut mutes the current active window";
$Shortcut.Save();
echo "Shortcut Created with hotkey: "$Shortcut.Hotkey