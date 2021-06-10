#!/bin/bash

# ======================================================================== #

# Game Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
PROCESS="witcher3.exe"

# Environment
export MANGOHUD=0
export ENABLE_VKBASALT=0

# ======================================================================== #

# Launch
gamemoderun steam steam://rungameid/14004081648526688256 &

# Before Launch
while ! pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor suspend
    killall polybar
    sleep 5
    killall cairo-dock

# After Launch
while pgrep -x "$PROCESS" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    ~/.config/polybar/launch.sh
    cairo-dock > /dev/null 2>&1 &
    sleep 5
    killall steam
    sleep 5
    killall gamemoded &
    exit

# ======================================================================== #
