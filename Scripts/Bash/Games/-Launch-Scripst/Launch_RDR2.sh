#!/bin/bash

# ======================================================================== #

# Game Executable Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
EXE="./RDR2.exe"
PROCESS="RDR2.exe"
ARGS="-ignorepipelinecache -vulkan"

# Wine Directories
WINE="$DIR/Wine/wine"
WINEPREFIX="$DIR/Wine/wine-pfx"

# Environment
export PULSE_LATENCY_MSEC=60
export WINEDLLOVERRIDES="dxgi=n,b"
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

# ======================================================================== #

# Launch
cd "$DIR"
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" $ARGS &
echo "Launching $DIR/$EXE"

sleep 10

if pgrep -x "$PROCESS"; then
    PID=$(pgrep "$PROCESS")
    kill -s SIGSTOP $PID
    kill -s SIGCONT $PID
fi

sleep 5

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
