#
# hosts.ps1
#

$hosts = "$env:windir\System32\drivers\etc\hosts"
$hosts_custom = "C:\Users\$env:UserName\OneDrive\hosts.custom.txt"

Invoke-WebRequest -Uri https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -OutFile $hosts
if (Test-Path -Path $hosts_custom) {Get-Content $hosts_custom | Add-Content -Path $hosts}
C:\WINDOWS\system32\cmd.exe /C C:\WINDOWS\system32\ipconfig.exe /flushdns