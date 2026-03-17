# AD structure

## Domain

- `lab.local`

## Organizational Units

- `OU_Users`
- `OU_Computers`
- `OU_Servers`
- `OU_Groups`
- `OU_Admins`

## Global groups

- `GG_RH`
- `GG_Compta`
- `GG_IT`
- `GG_Direction`
- `GG_Admins`

## Domain local groups

- `DL_RH_RW`
- `DL_Compta_RW`
- `DL_IT_RW`
- `DL_Direction_RW`
- `DL_Commun_R`

## Users

### RH
- `rh01`
- `rh02`
- `rh03`

### Compta
- `compta01`
- `compta02`
- `compta03`

### IT
- `it01`
- `it02`
- `it03`

### Direction
- `dir01`
- `dir02`

### Administration
- `adm01`

## Access model

- `GG_RH -> DL_RH_RW -> C:\Shares\RH`
- `GG_Compta -> DL_Compta_RW -> C:\Shares\Compta`
- `GG_IT -> DL_IT_RW -> C:\Shares\IT`
- `GG_Direction -> DL_Direction_RW -> C:\Shares\Direction`
- `GG_RH -> DL_Commun_R -> C:\Shares\Commun`
- `GG_Compta -> DL_Commun_R -> C:\Shares\Commun`
- `GG_IT -> DL_Commun_R -> C:\Shares\Commun`
- `GG_Direction -> DL_Commun_R -> C:\Shares\Commun`

## Shares

- `\\filesrv.lab.local\Shares`
- `\\filesrv.lab.local\UsersData`
- `\\lab.local\Partages\Shares`