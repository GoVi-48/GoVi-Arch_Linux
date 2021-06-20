#!/bin/bash

# Current Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Compositor
COMP_Disabled="killall picom"
COMP_Enabled="picom -cCGb"

# Game Executable
EXE="./DOOMEternalx64vk.exe"
PROCESS="DOOMEternalx64vk.exe"
ARGS="--waitforpreload --nologo --gc2"

# Environment
export +com_skipIntroVideo=1
export +com_skipKeyPressOnLoadScreens=1
export +com_skipSignInManager=1
export +in_terminal=1
export RADV_PERFTEST="llvm"
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1
export __GL_THREADED_OPTIMIZATIONS=1
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$DIR"

# ======================================================================== #

# Chech if wine-pfx exist
while true; do
    WINE_PFX=$(find -L "${DIR}/Wine/wine-pfx" -maxdepth 1 -type f -iname "system.reg")
    [ ! -f "$WINE_PFX" ] && clear && sleep 1 &&
        echo -e "\nThere is not a valid wine-pfx.\n" &&
        exit || break
done

# Chech if wine-build or symlink to wine file exist
while true; do
    WINE_BUILD=$(find -L "${DIR}/Wine/wine-build" -path "*/dosdevices" -prune -o -path "*/drive_c" -prune -o -type f -iname "wine" -print)
    [ -f "${DIR}/Wine/wine" ] && break ||
    ln -sf "$WINE_BUILD" "${DIR}/Wine/wine" > /dev/null 2>&1
    [ ! -f "${DIR}/Wine/wine" ] && clear && sleep 1 &&
        echo -e '\nThere is not a valid wine-build or symlink to a wine file.\n' &&
        exit
done

# Set wine-build & wineprefix
WINE="$DIR/Wine/wine"
WINEPREFIX="$DIR/Wine/wine-pfx/"

# ======================================================================== #

# Launch
cd "$DIR"
echo -e "\nLaunching $DIR/$EXE\n" | sed 's/\.\///g'
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" $ARGS &

# After Launch
while ! pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    $COMP_Disabled
    sleep 5
    ps -e | awk '/easystroke/ || /cairo-dock/ {print $1}' | xargs kill -9

# After Exit
while pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    $COMP_Enabled
    cairo-dock > /dev/null 2>&1 &
    easystroke &
    sleep 10
    ps -e | awk '/exe/ || /wine/ || /lutris/ || /gamemoded/ {print $1}' | xargs kill -9 &
    exit
