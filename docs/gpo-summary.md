# GPO summary

## Domain policy

### `Default Domain Policy`
Applied at domain level.

Main settings:
- account lockout threshold: `3`
- account lockout duration: `15 minutes`
- reset account lockout counter after: `15 minutes`

## Computer policies

### `GPO_Baseline_Poste`
Linked to: `OU_Computers`

Main setting:
- always wait for the network at computer startup and logon

WMI filter:
- `WMI_Windows11`

### `GPO_PareFeu_Poste`
Linked to: `OU_Computers`

Main setting:
- Windows Defender Firewall enabled

### `GPO_Banniere_Legale`
Linked to: `OU_Computers`

Main settings:
- legal title: `Acces reserve`
- legal text shown before logon

### `GPO_LAPS_Poste`
Linked to: `OU_Computers`

Main settings:
- password backup directory: `Active Directory`
- managed local administrator password enabled
- password length: `14`
- password age: `30 days`

## User policies

### `GPO_Restriction_Users`
Linked to: `OU_Users`

Main setting:
- block access to Control Panel and PC Settings

### `GPO_Raccourci_Users`
Linked to: `OU_Users`

Main setting:
- deploy desktop shortcut `Partages`

### `GPO_FondEcran_Users`
Linked to: `OU_Users`

Main setting:
- enforce desktop wallpaper

### `GPO_Redirection_Dossiers`
Linked to: `OU_Users`

Main settings:
- redirect `Documents`
- redirect `Desktop`
- target path: `\\filesrv.lab.local\UsersData`

## Admin policy

### `GPO_Admins_Only`
Linked to: `OU_Admins`

Security filtering:
- `GG_Admins`

Main setting:
- remove shutdown access from Start menu