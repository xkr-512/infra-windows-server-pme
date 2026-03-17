$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\files"

New-Item -ItemType Directory -Path $out -Force | Out-Null

Get-SmbShare |
    Select-Object Name, Path, Description, ScopeName, FolderEnumerationMode |
    Export-Csv (Join-Path $out "smb-shares.csv") -NoTypeInformation -Encoding UTF8

Get-SmbShareAccess -Name "Shares" |
    Select-Object Name, AccountName, AccessControlType, AccessRight |
    Export-Csv (Join-Path $out "smb-share-access-shares.csv") -NoTypeInformation -Encoding UTF8

Get-SmbShareAccess -Name "UsersData" |
    Select-Object Name, AccountName, AccessControlType, AccessRight |
    Export-Csv (Join-Path $out "smb-share-access-usersdata.csv") -NoTypeInformation -Encoding UTF8

$folders = @("RH","Compta","IT","Direction","Commun")

foreach ($folder in $folders) {
    Get-Acl "C:\Shares\$folder" |
        Select-Object -ExpandProperty Access |
        Select-Object @{Name='Folder';Expression={$folder}},
                      IdentityReference,
                      FileSystemRights,
                      AccessControlType,
                      IsInherited |
        Export-Csv (Join-Path $out "ntfs-$folder.csv") -NoTypeInformation -Encoding UTF8
}

Get-Acl "C:\UsersData" |
    Select-Object -ExpandProperty Access |
    Select-Object @{Name='Folder';Expression={"UsersDataRoot"}},
                  IdentityReference,
                  FileSystemRights,
                  AccessControlType,
                  IsInherited |
    Export-Csv (Join-Path $out "ntfs-UsersDataRoot.csv") -NoTypeInformation -Encoding UTF8