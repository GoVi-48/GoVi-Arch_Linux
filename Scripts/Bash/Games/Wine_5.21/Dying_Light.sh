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
export WINE=~/Wine/wine_5.21/wine-tkg-staging-fsync-git/usr/bin/wine
  
cd "$HOME/Games/-Library-/PC/Dying Light"
gamemoderun $WINE "DyingLightGame.exe"

sleep 5

while pgrep -x "DyingLightGame.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
