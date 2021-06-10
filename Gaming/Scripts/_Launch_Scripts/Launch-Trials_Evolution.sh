#!/bin/bash

# ======================================================================== #

# Game Executable Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
EXE="datapack/trialsFMX.exe"
PROCESS="trialsFMX.exe"
ARGS=""

# Wine Directories
WINE="$DIR/Wine/wine"
WINEPREFIX="$DIR/Wine/wine-pfx/"

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
while ! pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor suspend
    killall polybar
    sleep 5
    killall lutris
    killall cairo-dock

# After Launch
while pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    ~/.config/polybar/launch.sh
    cairo-dock > /dev/null 2>&1 &
    sleep 5
    killall gamemoded &
    exit

# ======================================================================== #
