$repoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$out = Join-Path $repoRoot "exports\gpo"

New-Item -ItemType Directory -Path $out -Force | Out-Null

$gpos = @(
    "Default Domain Policy",
    "GPO_Baseline_Poste",
    "GPO_PareFeu_Poste",
    "GPO_Restriction_Users",
    "GPO_Raccourci_Users",
    "GPO_FondEcran_Users",
    "GPO_Banniere_Legale",
    "GPO_Admins_Only",
    "GPO_LAPS_Poste",
    "GPO_Redirection_Dossiers"
)

foreach ($gpo in $gpos) {
    Get-GPOReport -Name $gpo -ReportType Html -Path (Join-Path $out "$gpo.html")
}