#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar

export WINEFSYNC=0
export WINEDLLOVERRIDES="mscoree,mshtml="
export MANGOHUD=0
export ENABLE_VKBASALT=0

export WINEPREFIX=~/Wine/wine_Lutris/wine-pfx_Satisfactory
export WINE=~/Wine/wine_Lutris/wine-build_5.7.11/bin/wine64

cd "/Datos/Games/PC/Satisfactory"
gamemoderun $WINE "FactoryGame.exe" &

sleep 10

while pgrep -x "FactoryGame.exe" > /dev/null; do sleep 1; done
    killall FactoryGame-Win64-Shipping.exe
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar &
    latte-dock &
    exit
