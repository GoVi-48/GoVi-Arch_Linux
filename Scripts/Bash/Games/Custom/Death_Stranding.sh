#!/usr/bin/env bash
 
qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

ENABLE_VKBASALT=1
export WINEFSYNC=1
export MANGOHUD=1
export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEPREFIX=~/Wine/wine-pfx_5.19/wine-pfx_DS
export WINE=~/Wine/wine-build_5.19-tkg/usr/bin/wine64

cd "$HOME/Games/-Library-/PC/Death Stranding"
gamemoderun $WINE "ds.exe"

sleep 5

while pgrep -x "ds.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
