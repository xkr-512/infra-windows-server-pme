# File services summary

## SMB shares

### `\\filesrv.lab.local\Shares`
Main shared folder for business units.

Subfolders:
- `RH`
- `Compta`
- `IT`
- `Direction`
- `Commun`

Share access:
- `Everyone` -> `Read`

Enumeration:
- `Access-Based Enumeration` enabled

### `\\filesrv.lab.local\UsersData`
Folder redirection target for domain users.

Share access:
- `Everyone` -> `Full Control`

Enumeration:
- `Access-Based Enumeration` enabled

## DFS Namespace

### `\\lab.local\Partages\Shares`
DFS path used to access the shared folders through the domain namespace.

Namespace:
- domain-based DFS namespace

Enumeration:
- `Access-Based Enumeration` enabled

## NTFS access model

### `RH`
- `DL_RH_RW` -> `Modify`

### `Compta`
- `DL_Compta_RW` -> `Modify`

### `IT`
- `DL_IT_RW` -> `Modify`

### `Direction`
- `DL_Direction_RW` -> `Modify`

### `Commun`
- `DL_Commun_R` -> `Read and Execute`

## Access logic

Access was assigned with the following model:

- `Users -> Global Groups -> Domain Local Groups -> NTFS permissions`

Examples:
- `rh01/rh02/rh03 -> GG_RH -> DL_RH_RW -> RH`
- `compta01/compta02/compta03 -> GG_Compta -> DL_Compta_RW -> Compta`
- `it01/it02/it03 -> GG_IT -> DL_IT_RW -> IT`
- `dir01/dir02 -> GG_Direction -> DL_Direction_RW -> Direction`

Common read access:
- `GG_RH -> DL_Commun_R`
- `GG_Compta -> DL_Commun_R`
- `GG_IT -> DL_Commun_R`
- `GG_Direction -> DL_Commun_R`

## Folder redirection

Folder redirection target:
- `\\filesrv.lab.local\UsersData`

Configured folders:
- `Documents`
- `Desktop`

Validated behavior:
- user folders are created on the server
- `Documents` and `Desktop` point to the shared location