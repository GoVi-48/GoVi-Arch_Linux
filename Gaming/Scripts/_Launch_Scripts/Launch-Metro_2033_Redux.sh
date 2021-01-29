#!/bin/bash

# ======================= # Parameters to modify # ======================= #

# Game Executable Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
EXE="metro.exe"
ARGS="-epicportal"

# Wine Directories
WINE="$HOME/Wine/wine_6.0-RC4/wine-build_tkg/usr/bin/wine"
WINEPREFIX="$HOME/Wine/wine_6.0-RC4/wine-pfx_mf-dxvk-1.7.3/"

# Environment
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

# ======================================================================== #


# Launch
cd "$DIR"
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" $ARGS &
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
