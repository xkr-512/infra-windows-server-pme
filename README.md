# Windows Server infrastructure for a small business

This project documents the design, deployment, validation, and export of a Windows Server infrastructure built for a small business environment.

The goal was to implement a complete on-premises Windows domain with centralized identity management, network services, workstation administration, file access control, security hardening, remote administration, and backup validation.

## Scope

The environment includes:

- Active Directory Domain Services
- DNS
- DHCP
- Group Policy
- SMB shares and NTFS permissions
- Folder Redirection
- DFS Namespace
- Access-Based Enumeration
- Windows LAPS
- Logon auditing
- Microsoft Defender validation
- RDP
- WinRM
- NTP time synchronization
- IIS
- Windows Server Backup

## Infrastructure

### Domain
- `lab.local`

### Network
- `192.168.175.0/24`

### Systems

#### `SRV-AD01`
- Windows Server 2022
- AD DS, DNS, DHCP, file services, DFS Namespace, IIS, backup

#### `PC-ADMIN01`
- Windows 11 Pro
- administration workstation with RSAT
- DHCP reservation: `192.168.175.60`

#### `PC-CLT01`
- Windows 11 Pro
- domain client workstation used for GPO, file access, folder redirection, and security validation

## Business units

- `RH`
- `Compta`
- `IT`
- `Direction`

## AD design

### Organizational Units
- `OU_Users`
- `OU_Computers`
- `OU_Servers`
- `OU_Groups`
- `OU_Admins`

### Global groups
- `GG_RH`
- `GG_Compta`
- `GG_IT`
- `GG_Direction`
- `GG_Admins`

### Domain local groups
- `DL_RH_RW`
- `DL_Compta_RW`
- `DL_IT_RW`
- `DL_Direction_RW`
- `DL_Commun_R`

### Access model
Permissions were assigned using the following model:

`Users -> Global Groups -> Domain Local Groups -> NTFS permissions`

## Main implementations

### Identity and access
- domain deployment with `lab.local`
- OU structure for users, computers, groups, and admins
- dedicated admin account delegation with `adm01`
- AGDLP-based access model

### Network services
- AD-integrated DNS
- forward and reverse lookup zones
- DHCP scope with DNS options and reservations

### Workstation administration
- RSAT administration from `PC-ADMIN01`
- domain join for admin and client workstations
- computer-targeted and user-targeted GPOs
- WMI filtering for Windows 11

### File services
- SMB share for business folders
- NTFS permissions based on domain local groups
- common read-only area
- folder redirection for `Documents` and `Desktop`
- DFS namespace with ABE enabled

### Security
- account lockout policy
- dedicated admin account model
- Windows LAPS integrated with AD
- successful and failed logon auditing
- Microsoft Defender validation
- legal banner before logon
- firewall policy applied through GPO

### Remote administration and services
- RDP enabled and tested
- WinRM enabled and tested
- time synchronization validated
- IIS intranet site published on `http://intranet.lab.local`

### Backup and recovery
- file backup created with Windows Server Backup
- backup restored successfully
- GPO backup and restore tested
- scheduled export tasks created on the server

## Validation

The following points were tested successfully:

- domain join
- DNS resolution
- reverse DNS resolution
- DHCP lease assignment
- DHCP reservation assignment
- GPO application
- security filtering
- folder redirection
- SMB and NTFS access by business role
- DFS access
- ABE behavior
- account lockout
- LAPS password storage in AD
- audit events `4624` and `4625`
- Defender active status
- RDP connectivity
- WinRM connectivity
- NTP client synchronization
- IIS access from the client
- backup and restore operations

## Repository content

This repository is organized into the following folders:

- `configs`
  - static configuration references such as AD structure and access model

- `data`
  - environment inventory and project reference data

- `docs`
  - readable technical summaries for GPO, security, file services, backup, and network services

- `exports`
  - real evidence generated from the deployed environment
  - includes AD, DNS, DHCP, GPO, file services, security, remote administration, IIS, and backup exports

- `scripts/exports`
  - PowerShell scripts used to regenerate the exported evidence

## Evidence

This repository contains real exports generated from the deployed environment:

- AD inventory exports
- DNS zone and record exports
- DHCP scope, options, reservations, and lease exports
- GPO HTML reports
- SMB and NTFS permission exports
- LAPS metadata export
- Defender status export
- audit event export
- WinRM, RDP, and NTP validation exports
- IIS site exports
- backup validation exports

## Scripts

The `scripts/exports` folder contains PowerShell scripts used to regenerate the exported evidence stored in the repository.

## Notes

- sensitive secrets were not exported to the repository
- LAPS password values were intentionally excluded from committed evidence
- the repository focuses on reproducible configuration evidence and technical validation