$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\dns"

New-Item -ItemType Directory -Path $out -Force | Out-Null

Get-DnsServerZone |
    Select-Object ZoneName, ZoneType, IsDsIntegrated, IsReverseLookupZone |
    Export-Csv (Join-Path $out "dns-zones.csv") -NoTypeInformation -Encoding UTF8

$records = foreach ($r in Get-DnsServerResourceRecord -ZoneName "lab.local") {
    $data = switch ($r.RecordType) {
        "A"     { $r.RecordData.IPv4Address.IPAddressToString }
        "CNAME" { $r.RecordData.HostNameAlias }
        "PTR"   { $r.RecordData.PtrDomainName }
        "NS"    { $r.RecordData.NameServer }
        "SRV"   { "$($r.RecordData.DomainName) | Port=$($r.RecordData.Port) | Priority=$($r.RecordData.Priority) | Weight=$($r.RecordData.Weight)" }
        default { $r.RecordData.ToString() }
    }

    [pscustomobject]@{
        HostName   = $r.HostName
        RecordType = $r.RecordType
        Data       = $data
    }
}

$records | Export-Csv (Join-Path $out "dns-records-lab-local-clean.csv") -NoTypeInformation -Encoding UTF8

Get-DnsServerResourceRecord -ZoneName "175.168.192.in-addr.arpa" |
    Select-Object HostName, RecordType, Timestamp, @{Name='Data';Expression={$_.RecordData}} |
    Export-Csv (Join-Path $out "dns-records-reverse.csv") -NoTypeInformation -Encoding UTF8