# ERP Fabless — Releases

This repository contains official release installers for **ERP Fabless**, the internal ERP system used at [Upliance.ai](https://upliance.ai).

> **Source code** is maintained in a private repository. This repo exists solely for distributing compiled installers and powering the in-app auto-update system.

---

## Quick Install (Recommended)

Use the one-shot install scripts — they download and install the app **and** all PDF dependencies automatically.

### Linux (Ubuntu/Debian)
```bash
wget https://raw.githubusercontent.com/prasoon-upliance/erp-fabless-releases/main/install.sh
bash install.sh
```

### Windows (PowerShell as Administrator)
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/prasoon-upliance/erp-fabless-releases/main/install.ps1" -OutFile install.ps1
.\install.ps1
```

---

## Manual Install

If you prefer to install step by step, download the installer for your platform from the [Releases](https://github.com/prasoon-upliance/erp-fabless-releases/releases) page.

| Platform | File to download |
|---|---|
| Windows | `erp-fabless_x.x.x_x64-setup.exe` or `.msi` |
| Linux (Debian/Ubuntu) | `erp-fabless_x.x.x_amd64.deb` |
| Linux (other) | `erp-fabless_x.x.x_amd64.AppImage` |
| macOS | `erp-fabless_x.x.x_x64.dmg` *(when available)* |

### Windows

1. Run the `.exe` or `.msi` installer and follow the on-screen steps.
2. Download and install [wkhtmltopdf](https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.msvc2015-win64.exe) — required for PDF generation. The installer adds it to PATH automatically.

### Linux (Debian/Ubuntu)

**Step 1 — Install the app:**
```bash
sudo dpkg -i erp-fabless_x.x.x_amd64.deb
```

**Step 2 — Install PDF dependencies** (required for generating PO, DC, GRN documents):
```bash
# Virtual framebuffer and fonts
sudo apt-get install xvfb xfonts-75dpi

# wkhtmltopdf — use the official patched build, NOT the apt version
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.jammy_amd64.deb
sudo dpkg -i wkhtmltox_0.12.6.1-3.jammy_amd64.deb
sudo apt-get install -f
```

> **Why not `apt install wkhtmltopdf`?** The Ubuntu apt version is unpatched and does not support the footer flags required for document numbering. Always use the official `.deb` from the wkhtmltopdf GitHub releases.

### Linux (AppImage)

```bash
chmod +x erp-fabless_x.x.x_amd64.AppImage
./erp-fabless_x.x.x_amd64.AppImage
```

Install PDF dependencies as described in the Debian/Ubuntu section above.

---

## Updates

The app checks for updates automatically on every startup. When a new version is available:

1. The update downloads silently in the background
2. A notification appears: *"Update downloaded. Restart the app to apply."*
3. Finish what you're doing, then restart — the new version will run automatically

No manual re-installation is needed for updates.

---

## First-Time Setup

On first launch the app will:
1. Connect to the central database and sync all data locally
2. Show the login screen

Contact your administrator for your login credentials.

---

## Source Code

Source code is maintained in a **private repository** at [prasoon-upliance/erp-fabless](https://github.com/prasoon-upliance/erp-fabless).

Access is restricted to the development team at Upliance.ai.

---

## Issues & Support

This is an internal tool. For bugs, feature requests, or access issues contact:

- **Internal:** Raise a request with the development team at Upliance.ai
- **Do not open GitHub Issues** on this repository — it is not monitored for support

---

## About

ERP Fabless is a custom offline-first ERP built for Upliance.ai, covering:
- Inventory management
- Purchase Orders (PO)
- Delivery Challans (DC)
- Goods Receipt Notes (GRN)
- Vendor management
- Role-based access control

Built with [Tauri 2](https://tauri.app) + React 19 + Rust + SQLite.

---

*© Upliance.ai — Internal use only*
