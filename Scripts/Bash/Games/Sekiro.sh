#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

export WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_Sekiro
export WINE=~/Wine/wine-build_Lutris/wine-build_5.7.10/bin/wine64

cd "$HOME/Games/-Library-/PC/Sekiro - Shadows Die Twice"
gamemoderun $WINE "sekiro.exe"

sleep 5

while pgrep -x "sekiro.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
