# Backup and recovery summary

## Backup tool

- `Windows Server Backup`

## Backup storage

- dedicated backup disk mounted as `E:`
- backup volume label: `BACKUP`

## File backup test

Source folder:
- `C:\Backup-Test`

Test file:
- `test.txt`

Validated behavior:
- backup created successfully
- test file deleted
- folder and file restored successfully from backup

## Backup evidence

Validated elements:
- `WindowsImageBackup` present on backup disk
- backup version listed with `wbadmin get versions`

## GPO backup and restore test

Tested with:
- `GPO_Banniere_Legale`

Validated behavior:
- GPO backup created successfully
- GPO deleted
- GPO restored successfully

## Scheduled tasks

Created tasks:
- `Export Services Report`
- `Export AD Users Report`

Validated behavior:
- both scheduled tasks created successfully
- export files generated as expected