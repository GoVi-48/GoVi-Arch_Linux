#!/bin/bash

# ======================= # Parameters to modify # ======================= #

# Game Executable Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
EXE="ride4.exe"
ARGS=""

# Wine Directories
WINE="$HOME/Wine/wine_Proton/Proton-5.13/dist/bin/wine"
WINEPREFIX="$DIR/Wine/wine-pfx/pfx/"

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

    
