#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
BACKUP_DIR="$SCRIPT_DIR/backups"
ES_CONFIG="/home/ark/.emulationstation/es_settings.cfg"
THEME_DIR="/roms/themes"

echo "Uninstalling minun-ui..."

if [ ! -d "$BACKUP_DIR" ]; then
    echo "ERROR: Backup folder is missing."
    sleep 5
    exit 1
fi

echo "Accessing boot partition..."
sudo mount -o remount,rw /boot

if [ -f "$BACKUP_DIR/logo.bmp.bak" ]; then
    echo "Restoring original boot logo..."
    sudo cp -f "$BACKUP_DIR/logo.bmp.bak" /boot/logo.bmp
fi

if [ -f "$BACKUP_DIR/loading.jpg.bak" ]; then
    echo "Restoring original launch image..."
    cp -f "$BACKUP_DIR/loading.jpg.bak" /roms/launchimages/loading.jpg
fi

if [ -d "$THEME_DIR/minun-ui" ]; then
    echo "Removing minun-ui theme folder..."
    rm -rf "$THEME_DIR/minun-ui"
fi

if [ -f "$ES_CONFIG" ]; then
    FALLBACK_THEME=$(ls -d "$THEME_DIR"/*/ 2>/dev/null | grep -v "minun-ui" | head -n 1 | xargs basename)

    if [ -n "$FALLBACK_THEME" ]; then
        echo "Reverting system theme to $FALLBACK_THEME..."
        sed -i "s|<string name=\"ThemeSet\" value=\".*\" />|<string name=\"ThemeSet\" value=\"$FALLBACK_THEME\" />|g" "$ES_CONFIG"
    else
        echo "WARNING: No other themes found."
    fi
fi

sudo mount -o remount,ro /boot
echo "SUCCESS: minun-ui uninstalled!"
echo "Restarting EmulationStation..."
sleep 2

sudo systemctl restart emulationstation