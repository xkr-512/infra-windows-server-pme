# Security summary

## Account security

### Separate admin account
A dedicated admin account was created:

- `adm01`

Administrative delegation was configured on `OU_Users` for:

- `GG_Admins`

Validated behavior:
- `adm01` can manage user objects in `OU_Users`

## Account lockout policy

Configured in:
- `Default Domain Policy`

Settings:
- lockout threshold: `3`
- lockout duration: `15 minutes`
- reset lockout counter after: `15 minutes`

Validated behavior:
- account lockout triggered after repeated failed logons

## Windows LAPS

Applied through:
- `GPO_LAPS_Poste`

Configuration:
- password backup directory: `Active Directory`
- password length: `14`
- password age: `30 days`

Validated behavior:
- local administrator password stored in AD
- password metadata readable from the domain
- password not exposed in the repository

## Logon auditing

Configured in:
- `Default Domain Policy`

Audit settings:
- successful logon events
- failed logon events

Validated behavior:
- event `4624` recorded for successful logons
- event `4625` recorded for failed logons

## Microsoft Defender

Validated on:
- `PC-CLT01`

Checks:
- antimalware service enabled
- antivirus enabled
- real-time protection enabled

## Firewall

Applied through:
- `GPO_PareFeu_Poste`

Validated behavior:
- Windows Defender Firewall enabled on client profiles

## Legal notice

Applied through:
- `GPO_Banniere_Legale`

Validated behavior:
- legal title displayed before logon
- legal message displayed before logon