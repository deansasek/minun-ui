#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
BACKUP_DIR="$SCRIPT_DIR/backups"
ES_CONFIG="/home/ark/.emulationstation/es_settings.cfg"
THEME_DEST="/roms/themes/minun-ui"
ASSET_SRC="$SCRIPT_DIR/minun-ui/_assets"

set_es_setting() {
    local TYPE=$1
    local NAME=$2
    local VALUE=$3
    
    if grep -q "name=\"$NAME\"" "$ES_CONFIG"; then
        sed -i "s|<${TYPE} name=\"${NAME}\" value=\".*\" />|<${TYPE} name=\"${NAME}\" value=\"${VALUE}\" />|g" "$ES_CONFIG"
    else
        sed -i "s|</settings>|\t<${TYPE} name=\"${NAME}\" value=\"${VALUE}\" />\n</settings>|g" "$ES_CONFIG"
    fi
}

echo "Installing minun-ui..."

mkdir -p "$BACKUP_DIR"

echo "Copying theme files..."
mkdir -p "$THEME_DEST"
cp -rf "$SCRIPT_DIR/minun-ui/"* "$THEME_DEST/"

echo "Accessing boot partition..."
sudo mount -o remount,rw /boot
if [ -f "/boot/logo.bmp" ] && [ ! -f "$BACKUP_DIR/logo.bmp.bak" ]; then
    cp /boot/logo.bmp "$BACKUP_DIR/logo.bmp.bak"
fi

if [ -f "$ASSET_SRC/logo.bmp" ]; then
    sudo cp -f "$ASSET_SRC/logo.bmp" /boot/logo.bmp
fi

echo "Copying launch images..."
mkdir -p /roms/launchimages
if [ -f "/roms/launchimages/loading.jpg" ] && [ ! -f "$BACKUP_DIR/loading.jpg.bak" ]; then
    cp /roms/launchimages/loading.jpg "$BACKUP_DIR/loading.jpg.bak"
fi

if [ -f "$ASSET_SRC/loading.jpg" ]; then
    cp -f "$ASSET_SRC/loading.jpg" /roms/launchimages/loading.jpg
fi

if [ -f "$ES_CONFIG" ]; then
    echo "Applying settings..."
    set_es_setting "string" "ThemeSet" "minun-ui"
    set_es_setting "string" "GamelistViewStyle" "basic"
    set_es_setting "string" "UIMode" "Full"
    set_es_setting "string" "TransitionStyle" "instant"
    set_es_setting "string" "GameTransitionStyle" "instant"
    set_es_setting "string" "StartupSystem" "none"
    set_es_setting "bool" "BootOnGamelist" "false"
    set_es_setting "bool" "HideSystemView" "false"
    set_es_setting "bool" "QuickSystemSelect" "true"
    set_es_setting "bool" "CarouselTransitions" "true"
    set_es_setting "bool" "ShowHelpPrompts" "true"
    set_es_setting "string" "ShowBattery" "icon only"
    set_es_setting "bool" "ShowFilenames" "false"
    set_es_setting "bool" "IgnoreArticles" "false"
    set_es_setting "bool" "EnableFilters" "true"
    set_es_setting "bool" "ScanPortsOnBoot" "false"
    set_es_setting "string" "GameLoadingImageMode" "pic"
    set_es_setting "string" "GameLoadingImage" "image"
    set_es_setting "string" "GameLoadingImageDelay" "1.5"
fi

sudo mount -o remount,ro /boot
echo "SUCCESS: minun-ui installed!"
echo "Restarting EmulationStation..."
sleep 2

sudo systemctl restart emulationstation