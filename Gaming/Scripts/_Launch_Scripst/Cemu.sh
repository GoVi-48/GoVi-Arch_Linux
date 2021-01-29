#!/bin/bash

# Game Executable
EXE="./Cemu.exe"
PROCESS="Cemu.exe"
FLAGS=""

# Wine Directories
WINE="$HOME/Wine/wine_Lutris/wine-build_5.21/bin/wine"
WINEPREFIX="$HOME/Wine/wine_5.21/wine-pfx_Cemu"

# Environment
export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree=;mshtml=;dbghelp.dll=n,b"
export MANGOHUD=1
export ENABLE_VKBASALT=1

# Before Launch
qdbus org.kde.KWin /Compositor suspend
killall polybar
killall cairo-dock

# Launch
cd ~/.cemu
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" $FLAGS
echo "Launching $HOME/Games/PC/-Emulators/Cemu/$EXE"

# After Launch
qdbus org.kde.KWin /Compositor resume
$HOME/Scripts/Bash/Polybar/launch.sh
cairo-dock > /dev/null 2>&1 &
sleep 5
killall gamemoded
