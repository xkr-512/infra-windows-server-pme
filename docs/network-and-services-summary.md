# Network and services summary

## Domain

- `lab.local`

## LAB network

- subnet: `192.168.175.0/24`

## Main systems

### `SRV-AD01`
- IP: `192.168.175.10`
- roles:
  - `AD DS`
  - `DNS`
  - `DHCP`
  - `SMB file server`
  - `DFS Namespace`
  - `IIS`
  - `Windows Server Backup`

### `PC-ADMIN01`
- IP: `192.168.175.60`
- source: `DHCP reservation`
- role:
  - `administration workstation`
  - `RSAT`

### `PC-CLT01`
- IP: `DHCP lease`
- role:
  - `domain client workstation`

## DNS

Main zone:
- `lab.local`

Reverse zone:
- `175.168.192.in-addr.arpa`

Important records:
- `srv-ad01.lab.local` -> `192.168.175.10`
- `filesrv.lab.local` -> `192.168.175.10`
- `partage.lab.local` -> alias to `filesrv.lab.local`
- `intranet.lab.local` -> alias to `filesrv.lab.local`

Validated behavior:
- forward resolution working
- reverse resolution working
- AD DNS records present

## DHCP

Scope:
- `Client-LAN`

Range:
- `192.168.175.50` to `192.168.175.100`

Options:
- DNS server: `192.168.175.10`
- DNS domain name: `lab.local`

Reservations:
- `PC-ADMIN01` -> `192.168.175.60`
- `PRN-FAKE` -> `192.168.175.61`

Validated behavior:
- domain client receives IP from DHCP
- DNS suffix is applied
- reservation is working

## Remote administration

### RDP
- enabled on `SRV-AD01`
- tested successfully from `PC-ADMIN01`

### WinRM
- enabled on `PC-CLT01`
- tested successfully from `SRV-AD01`

## Time synchronization

Server:
- internal time reference for the lab

Client:
- synchronized with `SRV-AD01.lab.local`

## IIS

Site:
- `Intranet-LAB`

Binding:
- `http` on `192.168.175.10:80`

Access:
- `http://intranet.lab.local`

Validated behavior:
- site reachable from the client workstation