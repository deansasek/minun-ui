#!/bin/bash

THEME_DIR="/roms/themes/minun-ui"
BOOT_LOGO="/boot/logo.bmp"
LAUNCH_IMAGE="/roms/launchimages/loading.jpg"

NEW_BOOT_LOGO="$THEME_DIR/_assets/boot/logo.bmp"
NEW_LAUNCH_IMG="$THEME_DIR/_assets/launch/loading.jpg"

echo "Checking for updates..."

smart_sync() {
    local SRC="$1"
    local DEST="$2"
    local NAME="$3"

    if [ ! -f "$SRC" ]; then
        return
    fi

    local SRC_HASH=$(md5sum "$SRC" | awk '{print $1}')
    local DEST_HASH=$(md5sum "$DEST" 2>/dev/null | awk '{print $1}')

    if [ "$SRC_HASH" != "$DEST_HASH" ]; then
        echo "Updating $NAME..."
        sudo cp -f "$SRC" "$DEST"
        return 0
    else
        echo "$NAME is already up to date."
        return 1
    fi
}

sudo mount -o remount,rw /boot

UPDATED=0

smart_sync "$NEW_BOOT_LOGO" "$BOOT_LOGO" "Boot Logo"
[ $? -eq 0 ] && UPDATED=1

smart_sync "$NEW_LAUNCH_IMG" "$LAUNCH_IMAGE" "Launch Image"
[ $? -eq 0 ] && UPDATED=1

sudo mount -o remount,ro /boot

if [ $UPDATED -eq 1 ]; then
    echo "SUCCESS: Updates applied!"
    sleep 2
else
    echo "SUCCESS: No update needed!"
    sleep 1
fi
