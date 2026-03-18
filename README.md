# minun-ui
Minimal EmulationStation theme for R36S devices running ArkOS or darkOSRE, inspired by [MinUI](https://github.com/shauninman/MinUI).

## Installation
1. Download the [latest release](https://github.com/deansasek/minun-ui/releases/) & drag the ```minun-ui``` folder into ```/EASYROMS/tools/```.
2. Insert the microSD card back into the R36S & power it on.
3. Press Start, navigate to Options, Tools, and open the ```minun-ui``` folder.
4. Open the ```install``` file - when the installer is complete, EmulationStation will restart and the installation is complete.

Installing will perform the following:
- Replaces the boot logo on the device with the minun-ui boot logo within  ```/BOOT/```, and backs up the existing boot logo for future uninstallation.
- Replaces the loading image on the device with the minun-ui loading image within  ```/EASYROMS/```, and backs up the existing loading image for future uninstallation.
- Adds the ```minun-ui``` folder to ```/EASYROMS/themes/```.

## Uninstallation
1. Press Start, navigate to Options, Tools, and open the ```minun-ui``` folder.
2. Open the ```uninstall``` file - when the uninstaller is complete, EmulationStation will restart and the uninstallation is complete.

Uninstalling will perform the following:
- Restore the original boot logo within ```/BOOT/``` on the device that existed prior to installation.
- Restore the original loading image within ```/EASYROMS/``` on the device that existed prior to installation.
- Removes the ```minun-ui``` folder from ```/EASYROMS/themes/```.

## Updating
1. Download the [latest release](https://github.com/deansasek/minun-ui/releases/) & drag the ```minun-ui``` folder into ```/EASYROMS/tools/``` - overwrite any existing files as prompted.
2. Insert the microSD card back into the R36S & power it on.
3. Press Start, navigate to Options, Tools, and open the ```minun-ui``` folder.
4. Open the ```update``` file - when the updater is complete, EmulationStation will restart and the update is complete.

Updating will perform the following:
- If a new boot logo is found, the boot logo within ```/BOOT/``` will be updated.
- If a new loading image is found, the loading image within ```/EASYROMS/``` will be updated.
- If theme changes have been made to  ```theme.xml```, the theme will be updated.
- If assets in  ```/_assets/``` are updated, the assets will be updated.
