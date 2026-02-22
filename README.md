# ERP Fabless — Releases

This repository contains official release installers for **ERP Fabless**, the internal ERP system used at [Upliance.ai](https://upliance.ai).

> **Source code** is maintained in a private repository. This repo exists solely for distributing compiled installers and powering the in-app auto-update system.

---

## Download & Install

Go to the [Releases](https://github.com/prasoon-upliance/erp-fabless-releases/releases) page and download the installer for your platform.

| Platform | File to download |
|---|---|
| Windows | `erp-fabless_x.x.x_x64-setup.exe` or `.msi` |
| Linux (Debian/Ubuntu) | `erp-fabless_x.x.x_amd64.deb` |
| Linux (other) | `erp-fabless_x.x.x_amd64.AppImage` |
| macOS | `erp-fabless_x.x.x_x64.dmg` *(when available)* |

### Windows
Run the `.exe` or `.msi` installer. Follow the on-screen steps. No additional configuration needed.

### Linux (Debian/Ubuntu)
```bash
sudo dpkg -i erp-fabless_x.x.x_amd64.deb
```
Or double-click the `.deb` file in your file manager.

### Linux (AppImage)
```bash
chmod +x erp-fabless_x.x.x_amd64.AppImage
./erp-fabless_x.x.x_amd64.AppImage
```

---

## Updates

The app updates itself automatically. When a new version is released:

1. The app detects the update in the background on startup
2. Downloads the new installer silently
3. Installs and restarts — you'll be on the new version automatically

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
