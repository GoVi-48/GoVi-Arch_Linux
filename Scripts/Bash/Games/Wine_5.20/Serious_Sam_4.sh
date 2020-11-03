#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

export WINEPREFIX=~/Wine/wine_5.20/wine-pfx_SS4
export WINE=~/Wine/wine_5.20/wine-build_5.20-tkg/usr/bin/wine64

cd "$HOME/Games/-Library-/PC/Serious Sam 4/Bin/x64"
$WINE "Sam4.exe" +gfx_strAPI Vulkan +sfx_strAPI openal
# +gfxapi VLK

sleep 5

while pgrep -x "Sam4.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
