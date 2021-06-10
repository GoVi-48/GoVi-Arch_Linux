#!/bin/bash

# Game Executable
EXE="Cemu.exe"
ARGS=""

# Wine Directories
WINE="$HOME/Wine/wine_Lutris/wine-build_5.21/bin/wine"
WINEPREFIX="/Datos/Games/Emulators/Cemu/wine-pfx"

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
gamemoderun WINEPREFIX="$WINEPREFIX" "$WINE" "$EXE" -g "Z:/Media/Games/Nintendo/Wii U/The Legend of Zelda Breath of the Wild/code/U-King.rpx" -f
echo "Launching $HOME/Games/PC/-Emulators/Cemu/$EXE" "$@"

# After Launch
qdbus org.kde.KWin /Compositor resume
~/.config/polybar/launch.sh
cairo-dock > /dev/null 2>&1 &
sleep 5
killall gamemoded
