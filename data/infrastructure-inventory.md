# Infrastructure inventory

Windows Server infrastructure for a small business environment.

## Domain

- `lab.local`

## Network

- LAB network: `192.168.175.0/24`

## Main systems

### `SRV-AD01`
- OS: `Windows Server 2022`
- IP: `192.168.175.10`
- Roles:
  - `Active Directory Domain Services`
  - `DNS`
  - `DHCP`
  - `SMB file sharing`
  - `DFS Namespace`
  - `IIS`
  - `Windows Server Backup`

### `PC-ADMIN01`
- OS: `Windows 11 Pro`
- IP: `DHCP reservation 192.168.175.60`
- Role:
  - administration workstation with `RSAT`

### `PC-CLT01`
- OS: `Windows 11 Pro`
- IP: `DHCP lease`
- Role:
  - domain client workstation for user, GPO, file access, and folder redirection tests

## DHCP reservations

- `PC-ADMIN01` -> `192.168.175.60`
- `PRN-FAKE` -> `192.168.175.61`

## Deployed services

- `AD DS`
- `DNS`
- `DHCP`
- `Group Policy`
- `SMB shares`
- `NTFS permissions`
- `Folder Redirection`
- `DFS Namespace`
- `Access-Based Enumeration`
- `Windows LAPS`
- `Logon auditing`
- `Microsoft Defender`
- `RDP`
- `WinRM`
- `NTP time synchronization`
- `IIS`
- `Windows Server Backup`

## Business units

- `RH`
- `Compta`
- `IT`
- `Direction`