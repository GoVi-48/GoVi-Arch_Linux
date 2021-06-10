#!/bin/bash

# ======================================================================== #

# Current Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Compositor
COMP_Disabled="killall picom"
COMP_Enabled="picom -cCGb"

# Game Executable
EXE='"./run.sh" "valheim.x86_64"'
PROCESS="valheim.x86_64"
ARGS="-vulkan"

# Environment
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$DIR"
#export __GL_THREADED_OPTIMIZATIONS=1 # NVIDIA

# ========================================================================

# Launch
cd "$DIR/game/"
gamemoderun  "./steam-runtime/run.sh" "./valheim.x86_64" &
echo -e "\nLaunching $DIR/$EXE\n" | sed 's/\.\///g'

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
    ps -e | awk '/lutris/ || /gamemoded/ {print $1}' | xargs kill -9 &
    exit
