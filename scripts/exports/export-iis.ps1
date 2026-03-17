$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\iis"

New-Item -ItemType Directory -Path $out -Force | Out-Null

Get-Website |
    Select-Object Name, State, PhysicalPath, Bindings |
    Export-Csv (Join-Path $out "iis-sites.csv") -NoTypeInformation -Encoding UTF8

Get-WebBinding |
    Select-Object protocol, bindingInformation |
    Export-Csv (Join-Path $out "iis-bindings.csv") -NoTypeInformation -Encoding UTF8

Copy-Item "C:\Intranet\index.html" (Join-Path $out "index.html") -Force