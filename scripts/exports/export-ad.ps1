$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\ad"

New-Item -ItemType Directory -Path $out -Force | Out-Null

Get-ADOrganizationalUnit -Filter * |
    Select-Object Name, DistinguishedName |
    Export-Csv (Join-Path $out "ou.csv") -NoTypeInformation -Encoding UTF8

Get-ADUser -Filter * -SearchBase "DC=lab,DC=local" |
    Select-Object Name, SamAccountName, Enabled, DistinguishedName |
    Export-Csv (Join-Path $out "users.csv") -NoTypeInformation -Encoding UTF8

Get-ADGroup -Filter * -SearchBase "DC=lab,DC=local" |
    Select-Object Name, GroupScope, GroupCategory, DistinguishedName |
    Export-Csv (Join-Path $out "groups.csv") -NoTypeInformation -Encoding UTF8

Get-ADComputer -Filter * -SearchBase "DC=lab,DC=local" |
    Select-Object Name, Enabled, DistinguishedName |
    Export-Csv (Join-Path $out "computers.csv") -NoTypeInformation -Encoding UTF8

Get-ADGroup -Filter * -SearchBase "OU=OU_Groups,DC=lab,DC=local" | ForEach-Object {
    $group = $_.Name
    Get-ADGroupMember $_ | Select-Object @{Name='Group';Expression={$group}}, Name, SamAccountName, objectClass
} | Export-Csv (Join-Path $out "group-members.csv") -NoTypeInformation -Encoding UTF8