#!/bin/bash

# ======================================================================== #

# Game Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
EXE="./bin/x64/Game.exe"
PROCESS="Game.exe"
FLAGS="-vulkan"

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
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" $FLAGS &
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
    $HOME/Scripts/Bash/Polybar/launch.sh
    cairo-dock > /dev/null 2>&1 &
    sleep 5
    killall gamemoded &
    exit

# ======================================================================== #
