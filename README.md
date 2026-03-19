# minun-ui

minun-ui is a EmulationStation theme for R36S devices running ArkOS or dArkOSRE, inspired by [MinUI](https://github.com/shauninman/MinUI).

Looking to install? Follow the [installation guide](https://github.com/deansasek/minun-ui/tree/main?tab=readme-ov-file#installation).

<p align="left">
  <img src="https://github.com/deansasek/minun-ui/raw/refs/heads/main/minun-ui/minun-ui/_assets/logo.bmp" width="250" />
  <img src="https://github.com/deansasek/minun-ui/blob/main/minun-ui/minun-ui/_assets/minun-ui-systems.png?raw=true" width="250" />
  <img src="https://github.com/deansasek/minun-ui/blob/main/minun-ui/minun-ui/_assets/minun-ui-gamelist.png?raw=true" width="250" />
</p>

## Features
- **Grayscale UI:** Simple black, grey, and white design.
- **Auto-Config:** Sets transitions, view style, and battery icons on install.
- **System Branding:** Replaces the stock boot logo and game-loading screens.
- **Maintenance Scripts:**
  - `install.sh`: Deploys the theme and system assets.
  - `uninstall.sh`: Reverts all changes and restores original files.
  - `update.sh`: Refreshes assets or `theme.xml` without a full reinstall.

## Installation
1. Download the latest [release](https://github.com/deansasek/minun-ui/releases) & drag the `minun-ui` folder into `/EASYROMS/tools/`.
2. On your R36S, go to **Options** > **Tools** and open the `minun-ui` folder.
3. Run `install.sh`.

**The installer will:**
- Backup and replace the `/BOOT/` logo.
- Backup and replace the loading image in `/EASYROMS/`.
- Patch `es_settings.cfg` for the correct UI layout.
- Add the theme to `/EASYROMS/themes/`.

## Uninstallation
Run `uninstall.sh` in **Options** > **Tools**.

**The uninstaller will:**
- Restore the original boot logo and loading image.
- Delete the `minun-ui` theme folder.
- Revert EmulationStation settings.

## Updating
Overwrite the `minun-ui` folder in `/tools/` with a new version from [releases](https://github.com/deansasek/minun-ui/releases) and run `update.sh` in **Options** > **Tools**.

**The updater will:**
- Replace the boot logo and loading images if new ones are included.
- Update `theme.xml` and assets in `/_assets/`.

## Project Structure
```text
minun-ui/
├── _assets/          # Font file & images
├── backups/          # Original system files (created on install)
├── install.sh        # Install script
├── uninstall.sh      # Uninstall script
├── update.sh         # Theme updater script
└── theme.xml         # ES theme file
