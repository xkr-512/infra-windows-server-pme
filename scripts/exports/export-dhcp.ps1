$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\dhcp"

New-Item -ItemType Directory -Path $out -Force | Out-Null

Get-DhcpServerv4Scope |
    Select-Object ScopeId, Name, State, StartRange, EndRange, SubnetMask |
    Export-Csv (Join-Path $out "dhcp-scopes.csv") -NoTypeInformation -Encoding UTF8

Get-DhcpServerv4OptionValue -ScopeId 192.168.175.0 |
ForEach-Object {
    [pscustomobject]@{
        OptionId = $_.OptionId
        Name     = $_.Name
        Value    = ($_.Value | ForEach-Object { $_.ToString() }) -join "; "
    }
} |
Where-Object { $_.OptionId -in 6,15,51 } |
Export-Csv (Join-Path $out "dhcp-options.csv") -NoTypeInformation -Encoding UTF8

Get-DhcpServerv4Reservation -ScopeId 192.168.175.0 |
    Select-Object IPAddress, ClientId, Name, Type |
    Export-Csv (Join-Path $out "dhcp-reservations.csv") -NoTypeInformation -Encoding UTF8

Get-DhcpServerv4Lease -ScopeId 192.168.175.0 |
Where-Object {
    $_.HostName -like "PC-ADMIN01*" -or
    $_.HostName -like "PC-CLT01*" -or
    $_.HostName -eq "PRN-FAKE"
} |
Select-Object IPAddress, HostName, ClientId, AddressState |
Export-Csv (Join-Path $out "dhcp-leases.csv") -NoTypeInformation -Encoding UTF8