#!/bin/bash
# ERP Fabless — Linux Installer
# Installs the app + all PDF dependencies in one shot.
# Tested on Ubuntu 22.04 (Jammy). Run with: bash install.sh

set -e

GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}=== ERP Fabless Installer ===${NC}"

# --- 1. Fetch latest release version ---
echo "Fetching latest version..."
LATEST=$(curl -s https://api.github.com/repos/prasoon-upliance/erp-fabless-releases/releases/latest \
  | grep '"tag_name"' | sed 's/.*"tag_name": "v\([^"]*\)".*/\1/')
echo "  Latest version: $LATEST"

# --- 2. Download and install ERP Fabless ---
DEB="erp-fabless_${LATEST}_amd64.deb"
echo "Downloading ERP Fabless..."
wget -q --show-progress "https://github.com/prasoon-upliance/erp-fabless-releases/releases/latest/download/${DEB}"
sudo dpkg -i "$DEB"
rm "$DEB"

# --- 3. Install PDF dependencies (xvfb + fonts) ---
echo "Installing PDF dependencies..."
sudo apt-get update -qq
sudo apt-get install -y xvfb xfonts-75dpi

# --- 4. Install wkhtmltopdf (patched Qt build) ---
# The Ubuntu apt version is unpatched and does not support footer flags.
# Always use the official release from the wkhtmltopdf GitHub page.
if command -v wkhtmltopdf &> /dev/null; then
    echo "wkhtmltopdf already installed — skipping."
else
    echo "Downloading wkhtmltopdf (patched Qt build)..."
    WKDEB="wkhtmltox_0.12.6.1-3.jammy_amd64.deb"
    wget -q --show-progress \
      "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/${WKDEB}"
    sudo dpkg -i "$WKDEB"
    sudo apt-get install -f -y
    rm "$WKDEB"
fi

echo ""
echo -e "${GREEN}=== Installation complete! ===${NC}"
echo "Launch 'ERP Fabless' from your applications menu."
echo "Default credentials: ask your administrator."
