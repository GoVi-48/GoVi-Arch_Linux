#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEFSYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=1
export ENABLE_VKBASALT=1

export WINEPREFIX=~/Wine/wine_5.21/wine-pfx_mf-dxvk-1.7.2
export WINE=~/Wine/wine_Proton/Proton-5.21-GE-1/dist/bin/wine64

cd "$HOME/Games/-Library-/PC/Crysis Remastered/Bin64"
gamemoderun $WINE "CrysisRemastered.exe"

sleep 5

while pgrep -x "CrysisRemastered.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
