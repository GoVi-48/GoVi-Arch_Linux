#!/bin/bash

# ======================================================================== #

# Game Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
PROCESS="re2.exe"

# Environment
export MANGOHUD=0
export ENABLE_VKBASALT=0

# ======================================================================== #

# Launch
gamemoderun steam steam://rungameid/10110539261779378176 & 

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
    ps -e | awk '/exe/ || /wine/ || /steam/ || /lutris/ || /gamemoded/ {print $1}' | xargs kill -9 &
    exit
