#!/bin/bash

# ======================================================================== #

# Game Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Compositor
COMP_Disabled="killall picom"
COMP_Enabled="picom -cCGb"

# Game Executable
EXE="./bin/x64/Cyberpunk2077.exe"
PROCESS="Cyberpunk2077.exe"
ARGS=""

# Wine Directories
WINE="$DIR/Wine/wine64"
WINEPREFIX="$DIR/Wine/wine-pfx/"

# Environment
export PULSE_LATENCY_MSEC=60
export WINEDLLOVERRIDES="xaudio2_7=n,b,mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

# ======================================================================== #

# Launch
cd "$DIR"
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" $ARGS &
echo -e "\nLaunching $DIR/$EXE\n" | sed 's/\.\///g'

# Before Launch
while ! pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    $COMP_Disabled
    sleep 5
    killall lutris
    killall cairo-dock

# After Launch
while pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    $COMP_Enabled
    cairo-dock > /dev/null 2>&1 &
    sleep 5
    killall gamemoded &
    exit
