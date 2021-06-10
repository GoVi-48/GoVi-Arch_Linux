#!/bin/bash

# Current Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Compositor
COMP_Disabled="killall picom"
COMP_Enabled="picom -cCGb"

# Game Executable
EXE="./GH.exe"
PROCESS="GH.exe"
ARGS=""

# Environment
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export VKBASALT_CONFIG_FILE="$HOME/.config/vkBasalt/vkBasalt.conf"
export ENABLE_VKBASALT=1
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$DIR"
# export __GL_THREADED_OPTIMIZATIONS=1 # NVIDIA

# ======================================================================== #

# Chech if the script is in Wine directory
LAUNCH_GAME="$(find "${DIR}/Wine" -type f -iname "Launch-*")"

while true; do
    [ ! -f "$LAUNCH_GAME" ] && clear && sleep 1 &&
        echo -e '\nThis Script needs to be in a folder called "Wine", with the prename "Launch-" inside the Game folder.' &&
        echo -e "Example: Launch-My_Game.sh\n" &&
        exit || break
done

# Chech if wine-pfx exist
while true; do
    [ ! -f "${DIR}/Wine/wine-pfx/system.reg" ] && clear && sleep 1 &&
        echo -e "\nThere is not a valid wine-pfx folder.\n" &&
        exit || break
done

# Chech if wine-build or symlink to wine file exist
while true; do
    WINE_LINK=$(find -L "${DIR}/Wine/wine-build" -type f -iname "wine") > /dev/null 2>&1
    ln -sf "$WINE_LINK" "${DIR}/Wine/wine" > /dev/null 2>&1
    [ ! -f "${DIR}/Wine/wine" ] && clear && sleep 1 &&
        echo -e '\nThere is not a valid "wine-build folder" or symlink to a "wine" file.\n' &&
        exit
    [ -d "${DIR}/Wine/wine-build" ] && break
    [ -f "${DIR}/Wine/wine" ] && break
done

# Set wine-build & wineprefix
WINE="$DIR/Wine/wine"
WINEPREFIX="$DIR/Wine/wine-pfx/"

# ======================================================================== #

KILL_L="$(ps -e | awk '/exe/ || /easystroke/ || /lutris/ || /cairo-dock/ {print $1}' | xargs kill -9)"
KILL_E="$(ps -e | awk '/exe/ || /wine/ || /gamemoded/ {print $1}' | xargs kill -9)"

# Launch
cd "$DIR"
echo -e "\nLaunching $DIR/$EXE\n" | sed 's/\.\///g'
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" $ARGS &

# After Launch
while ! pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    $COMP_Disabled
    sleep 5
    $KILL_L

# After Exit
while pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    $COMP_Enabled
    cairo-dock > /dev/null 2>&1 &
    easystroke &
    sleep 10
    $KILL_E &
    exit
