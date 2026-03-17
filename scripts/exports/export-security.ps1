$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\security"

New-Item -ItemType Directory -Path $out -Force | Out-Null

Get-ADDefaultDomainPasswordPolicy |
    Select-Object LockoutThreshold, LockoutDuration, LockoutObservationWindow, MinPasswordLength, MaxPasswordAge |
    Export-Csv (Join-Path $out "domain-password-policy.csv") -NoTypeInformation -Encoding UTF8

Get-LapsADPassword -Identity "PC-CLT01" |
    Select-Object ComputerName, Account, PasswordUpdateTime, ExpirationTimestamp, Source, DecryptionStatus |
    Export-Csv (Join-Path $out "laps-metadata.csv") -NoTypeInformation -Encoding UTF8

Invoke-Command -ComputerName PC-CLT01 -ScriptBlock {
    param($target)

    New-Item -ItemType Directory -Path $target -Force | Out-Null

    Get-MpComputerStatus |
        Select-Object AMServiceEnabled, AntivirusEnabled, RealTimeProtectionEnabled, AntivirusSignatureVersion |
        Export-Csv (Join-Path $target "defender-status.csv") -NoTypeInformation -Encoding UTF8

    Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4624,4625} -MaxEvents 30 |
        Select-Object TimeCreated, Id, ProviderName, MachineName |
        Export-Csv (Join-Path $target "audit-logon-events.csv") -NoTypeInformation -Encoding UTF8
} -ArgumentList $out