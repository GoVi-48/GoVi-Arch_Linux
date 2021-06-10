#!/bin/bash

# ======================================================================== #

# Game Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
EXE="./Launcher.exe"
PROCESS="Launcher.exe"
ARGS=""

# Environment
export WINEDLLOVERRIDES="d3d12=n,b;mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

# ======================================================================== #

# Wine Directories
LAUNCH_GAME="$(find "${DIR}/Wine" -type f -iname "Launch-*")"

while true; do
    if [ ! -f "$LAUNCH_GAME" ]; then
        clear & sleep 1
        echo -e '\nThis Script needs to be in a folder called "Wine" inside the Current (Game) folder.'
        [ ! -d "${DIR}/Wine" ] &&
        echo -e "\nCreating one in the current directory..." &&
        sleep 2 && mkdir -p "${DIR}/Wine"
        echo -e '\nPlease, put this script in it and put "Wine" folder whatever you want in the Game folder.'
        read -rsn1 -p "$(echo -e "\nPress any key to close this script and make the changes...")"
        echo "" & exit
    else
        break
    fi
done

while true; do
    if [ ! -f "${DIR}/Wine/wine-pfx/system.reg" ]; then
        clear & sleep 1
        echo -e "\nThere is not a valid wine-pfx folder.\nThis is neccesary to run this script."
        [ ! -d "${DIR}/Wine/wine-pfx" ] &&
        echo -e "\nCreating wine-pfx folder..." && sleep 2 &&
        mkdir -p "${DIR}/Wine/wine-pfx"
        echo -e '\nPlease, copy a valid wine-prefix in "wine-pfx" folder or delete the created folder and create a symlink to a valid wineprefix and call the symlink "wine-pfx"'
        read -rsn1 -p "$(echo -e "\nPress any key to continue...")"

    elif [ -f "${DIR}/Wine/wine-pfx/system.reg" ]; then
        break
    fi
done

while true; do
    if [ ! -d "${DIR}/Wine/wine-build" ] && [ ! -f "${DIR}/Wine/wine" ]; then
        clear & sleep 1
        echo -e '\nThere is not a valid "wine-build folder" or symlink to a "wine" file\nThis is neccesary to run this script'
        [ ! -d "${DIR}/Wine/wine-build" ] &&
        echo -e "\nCreating wine-build folder..." && sleep 2 &&
        mkdir -p "${DIR}/Wine/wine-build"
        echo -e '\nPlease, copy a valid wine-build in "wine-build" folder or delete the created folder and create a symlink to a valid "wine-build" folder and call the symlink "wine-build.\nOr create a symlink to a "wine" file"'
        read -rsn1 -p "$(echo -e "\nPress any key to continue...")"

    elif [ -d "${DIR}/Wine/wine-build" ]; then
        WINE_BUILD=$(find -L "${DIR}/Wine/wine-build" -type f -iname "wine") 2> /dev/null
        [ -f "$WINE_BUILD" ] && ln -sf "$WINE_BUILD" "${DIR}/Wine/wine" > /dev/null 2>&1
        break

    elif [ -f "${DIR}/Wine/wine" ]; then
        [ -d "${DIR}/Wine/wine-build" ] &&
        WINE_BUILD=$(find -L "${DIR}/Wine/wine-build" -type f -iname "wine") 2> /dev/null &&
        ln -sf "$WINE_BUILD" "${DIR}/Wine/wine" > /dev/null 2>&1
        break
    fi
done

WINE="$DIR/Wine/wine"
WINEPREFIX="$DIR/Wine/wine-pfx/"

# ======================================================================== #

# Launch
cd "$DIR"
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" $ARGS &
echo -e "\nLaunching $DIR/$EXE\n" | sed 's/\.\///g'

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
    killall gamemoded
    exit