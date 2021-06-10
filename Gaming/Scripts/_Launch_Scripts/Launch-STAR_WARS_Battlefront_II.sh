#!/bin/bash

# ======================================================================== #

# Game Directory
DIR=$(dirname "$(realpath "$0")" | sed -s "s|/Wine||g")

# Game Executable
EXE="./starwarsbattlefrontii.exe"
PROCESS="starwarsbattlef"

# Wine Directories
WINE="$DIR/Wine/wine"
WINEPREFIX="$DIR/Wine/wine-pfx"

# Environment
export WINEDLLOVERRIDES="OriginThinSetupInternal.exe=;nvapi,nvapi64=;winedbg.exe=d"
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=0

# ======================================================================== #

# Launch
cd "$DIR"
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE"

# Before Launch
while ! pgrep -x "$PROCESS" >/dev/null; do sleep 1; done
qdbus org.kde.KWin /Compositor suspend
killall polybar
sleep 5
killall lutris
killall cairo-dock

# After Launch
while pgrep -x "$PROCESS" >/dev/null; do sleep 1; done
qdbus org.kde.KWin /Compositor resume
~/.config/polybar/launch.sh
cairo-dock >/dev/null 2>&1 &
sleep 5
killall EpicGamesLaunch
killall Origin.exe
sleep 5
killall gamemoded &
exit

# ======================================================================== #
