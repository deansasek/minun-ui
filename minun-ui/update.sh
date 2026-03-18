#!/bin/bash

THEME_DIR="/roms/themes/minun-ui"
BOOT_LOGO="/boot/logo.bmp"
LAUNCH_IMAGE="/roms/launchimages/loading.jpg"
SOURCE_DIR="$THEME_DIR/_dev"
DEST_ASSETS="$THEME_DIR/_assets"

echo "Scanning for changes..."

UPDATED=0

sync_file() {
    local SRC="$1"
    local DEST="$2"
    local NAME="$3"

    if [ ! -f "$SRC" ]; then return 1; fi

    local SRC_HASH=$(md5sum "$SRC" | awk '{print $1}')
    local DEST_HASH=$(md5sum "$DEST" 2>/dev/null | awk '{print $1}')

    if [ "$SRC_HASH" != "$DEST_HASH" ]; then
        echo "Updating $NAME..."
        sudo cp -f "$SRC" "$DEST"
        return 0
    fi
    return 1
}

if [ -d "$SOURCE_DIR/_assets" ]; then
    mkdir -p "$DEST_ASSETS"
    
    for src_file in "$SOURCE_DIR/_assets"/*; do
        filename=$(basename "$src_file")
        dest_file="$DEST_ASSETS/$filename"
        
        if [ -f "$src_file" ]; then
            src_h=$(md5sum "$src_file" | awk '{print $1}')
            dest_h=$(md5sum "$dest_file" 2>/dev/null | awk '{print $1}')
            
            if [ "$src_h" != "$dest_h" ]; then
                echo "Syncing asset: $filename"
                cp -f "$src_file" "$dest_file"
                UPDATED=1
            fi
        fi
    done
fi

sudo mount -o remount,rw /boot

if sync_file "$SOURCE_DIR/logo.bmp" "$BOOT_LOGO" "Boot Logo"; then UPDATED=1; fi
if sync_file "$SOURCE_DIR/loading.jpg" "$LAUNCH_IMAGE" "Launch Image"; then UPDATED=1; fi

sudo mount -o remount,ro /boot

if [ $UPDATED -eq 1 ]; then
    echo "SUCCESS: Update complete."
    echo "Restarting EmulationStation..."
    sleep 2
    sudo systemctl restart emulationstation
else
    echo "SUCCESS: No updates required."
    sleep 1
fi
