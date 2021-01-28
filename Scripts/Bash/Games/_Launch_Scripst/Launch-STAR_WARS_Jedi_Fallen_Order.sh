#!/bin/bash

# ======================================================================== #

# Game Executable Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine|/SwGame/Binaries/Win64|g")

# Game Executable
EXE="starwarsjedifallenorder.exe"
ARGS=""

# Wine Directories
WINE="$HOME/Wine/wine_6.0/wine-build_tkg/usr/bin/wine64"
WINEPREFIX="$HOME/Wine/wine_6.0/wine-pfx_mf-dxvk-1.7.3/"

# Environment
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$DIR/nv-shaders"
export WINE_LARGE_ADDRESS_AWARE=1
export WINEDLLOVERRIDES="mscoree,mshtml=;nvapi,nvapi64="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

# ======================================================================== #

# Launch
cd "$DIR"
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" ARGS &
echo "Launching $DIR/$EXE"

# Before Launch
while ! pgrep -x "$EXE" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor suspend
    killall polybar
    sleep 5
    killall lutris
    killall cairo-dock

# After Launch
while pgrep -x "$EXE" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar/launch.sh
    cairo-dock > /dev/null 2>&1 &
    sleep 5
    killall gamemoded &
    exit

# ======================================================================== #
