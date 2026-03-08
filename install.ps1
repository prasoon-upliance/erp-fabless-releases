# ERP Fabless — Windows Installer
# Installs the app + wkhtmltopdf in one shot.
# Run in PowerShell as Administrator:
#   Set-ExecutionPolicy Bypass -Scope Process -Force
#   .\install.ps1

$ErrorActionPreference = "Stop"

Write-Host "=== ERP Fabless Installer ===" -ForegroundColor Cyan

# --- 1. Fetch latest release version ---
Write-Host "Fetching latest version..."
$release = Invoke-RestMethod "https://api.github.com/repos/prasoon-upliance/erp-fabless-releases/releases/latest"
$version = $release.tag_name.TrimStart("v")
Write-Host "  Latest version: $version"

# --- 2. Download and install ERP Fabless ---
$erpUrl = "https://github.com/prasoon-upliance/erp-fabless-releases/releases/latest/download/erp-fabless_${version}_x64-setup.exe"
$erpInstaller = "$env:TEMP\erp-fabless-setup.exe"
Write-Host "Downloading ERP Fabless..."
Invoke-WebRequest -Uri $erpUrl -OutFile $erpInstaller -UseBasicParsing
Write-Host "Installing ERP Fabless (follow the installer)..."
Start-Process -FilePath $erpInstaller -Wait
Remove-Item $erpInstaller

# --- 3. Install wkhtmltopdf if not already present ---
$wkPresent = Get-Command wkhtmltopdf -ErrorAction SilentlyContinue
if ($wkPresent) {
    Write-Host "wkhtmltopdf already installed — skipping."
} else {
    $wkUrl = "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox-0.12.6.1.3.msvc2015-win64.exe"
    $wkInstaller = "$env:TEMP\wkhtmltox-setup.exe"
    Write-Host "Downloading wkhtmltopdf..."
    Invoke-WebRequest -Uri $wkUrl -OutFile $wkInstaller -UseBasicParsing
    Write-Host "Installing wkhtmltopdf (follow the installer)..."
    Start-Process -FilePath $wkInstaller -Wait
    Remove-Item $wkInstaller
}

Write-Host ""
Write-Host "=== Installation complete! ===" -ForegroundColor Green
Write-Host "Launch 'ERP Fabless' from your Start menu."
Write-Host "Default credentials: ask your administrator."
