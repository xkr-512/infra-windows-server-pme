Infrastructure Windows Server pour une PME

Machines

- SRV-AD01
  - Windows Server 2022
  - Roles : AD DS, DNS, DHCP, partages SMB, DFS Namespace, IIS, sauvegarde

- PC-ADMIN01
  - Windows 11 Pro
  - Role : poste d administration avec RSAT

- PC-CLT01
  - Windows 11 Pro
  - Role : poste client du domaine pour les tests utilisateurs, GPO, acces fichiers et redirection

Domaine

- lab.local

Reseau LAB

- 192.168.175.0/24

Adresses principales

- SRV-AD01 : 192.168.175.10
- PC-ADMIN01 : reservation DHCP 192.168.175.60
- PC-CLT01 : bail DHCP
- PRN-FAKE : reservation DHCP 192.168.175.61

Services deployes

- Active Directory Domain Services
- DNS
- DHCP
- GPO
- Partages SMB et permissions NTFS
- Redirection de dossiers
- DFS Namespace
- Access-Based Enumeration
- Windows LAPS
- Audit des connexions
- Microsoft Defender
- RDP
- WinRM
- Synchronisation NTP
- IIS
- Windows Server Backup

Services metier

- RH
- Compta
- IT
- Direction