# minun-ui
Minimal EmulationStation theme for R36S devices running ArkOS or darkOSRE.

## Installation
1. Download the repository & drag the ```minun-ui``` folder into ```/EASYROMS/tools/```.
2. Insert the microSD card back into the R36S & power it on.
3. Press Start, navigate to Options, Tools, and open the ```minun-ui``` folder.
4. Open ```install.sh``` - when the installer is complete, EmulationStation will restart and the installation is complete.

Installing will perform the following:
- Replaces the boot logo on the device with the minun-ui boot logo within  ```/BOOT/```, and backs up the existing boot logo for future uninstallation.
- Replaces the loading image on the device with the minun-ui loading image within  ```/EASYROMS/```, and backs up the existing loading image for future uninstallation.
- Adds the ```minun-ui``` folder to ```/EASYROMS/themes/```.

## Uninstallation
1. Press Start, navigate to Options, Tools, and open the ```minun-ui``` folder.
2. Open ```uninstall.sh``` - when the uninstaller is complete, EmulationStation will restart and the uninstallation is complete.

Uninstalling will perform the following:
- Restore the original boot logo within ```/BOOT/``` on the device that existed prior to installation.
- Restore the original loading image within ```/EASYROMS/``` on the device that existed prior to installation.
- Removes the ```minun-ui``` folder from ```/EASYROMS/themes/```.
