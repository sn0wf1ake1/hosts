#
# hosts.ps1
#
# 2017-10-25 Pipeing Add-Content via Start-BitsTransfer stopped working. Fixed by making per action commands.
# Also noticed file permissions errors while Chrome was running. Best solution is to close it while running the script.
#

$hosts = "$env:windir\System32\drivers\etc\hosts"
$hosts_custom = Get-Content "C:\Users\sn0wflake\OneDrive\Projects\hosts\hosts\hosts.custom.txt"

Start-BitsTransfer -Source https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -Destination $hosts
Add-Content $hosts $hosts_custom

C:\WINDOWS\system32\cmd.exe /C C:\WINDOWS\system32\ipconfig.exe /flushdns
