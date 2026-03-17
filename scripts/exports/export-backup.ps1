$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\backup"

New-Item -ItemType Directory -Path $out -Force | Out-Null

(wbadmin get versions -backuptarget:E: | Out-String) |
    Set-Content (Join-Path $out "wbadmin-versions.txt") -Encoding UTF8

(Get-ChildItem E:\ -Force | Select-Object Name, FullName, Length, LastWriteTime | Out-String) |
    Set-Content (Join-Path $out "backup-drive-content.txt") -Encoding UTF8

Get-ScheduledTask |
Where-Object { $_.TaskName -in @("Export Services Report","Export AD Users Report") } |
Select-Object TaskName, State, TaskPath |
Export-Csv (Join-Path $out "scheduled-tasks.csv") -NoTypeInformation -Encoding UTF8