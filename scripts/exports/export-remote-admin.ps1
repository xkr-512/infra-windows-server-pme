$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\remote-admin"

New-Item -ItemType Directory -Path $out -Force | Out-Null

(Test-WSMan PC-CLT01 | Out-String) | Set-Content (Join-Path $out "winrm-test-pc-clt01.txt") -Encoding UTF8

Get-ItemProperty "HKLM:\System\CurrentControlSet\Control\Terminal Server" |
    Select-Object @{Name='RDPEnabled';Expression={($_.fDenyTSConnections -eq 0)}} |
    Export-Csv (Join-Path $out "rdp-server-status.csv") -NoTypeInformation -Encoding UTF8

Get-NetFirewallRule |
Where-Object { $_.DisplayName -like "*Bureau*" -or $_.DisplayGroup -like "*Bureau*" } |
Select-Object DisplayName, Enabled, Direction, Action |
Export-Csv (Join-Path $out "rdp-firewall-rules.csv") -NoTypeInformation -Encoding UTF8

(w32tm /query /source | Out-String) | Set-Content (Join-Path $out "ntp-source.txt") -Encoding UTF8
(w32tm /query /status | Out-String) | Set-Content (Join-Path $out "ntp-status.txt") -Encoding UTF8

Invoke-Command -ComputerName PC-CLT01 -ScriptBlock {
    param($target)

    New-Item -ItemType Directory -Path $target -Force | Out-Null

    (w32tm /query /source | Out-String) | Set-Content (Join-Path $target "ntp-source-client.txt") -Encoding UTF8
    (w32tm /query /status | Out-String) | Set-Content (Join-Path $target "ntp-status-client.txt") -Encoding UTF8
} -ArgumentList $out