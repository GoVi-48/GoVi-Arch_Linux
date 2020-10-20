#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEPREFIX=~/Wine/wine-pfx_5.19/wine-pfx_SS4
export WINE=~/Wine/wine-build_5.19-tkg/usr/bin/wine64

ENABLE_VKBASALT=1

cd "$HOME/Games/-Library-/PC/Serious Sam 4/Bin/x64"
mangohud gamemoderun $WINE "Sam4.exe" +gfx_strAPI Vulkan +sfx_strAPI openal
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
