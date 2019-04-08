
echo "Going back 1 program, not focussing this script"
$obj = new-object -com wscript.shell 
$obj.SendKeys("%{ESC}")

echo "Muting volume of focused app"
nircmd muteappvolume focused 2