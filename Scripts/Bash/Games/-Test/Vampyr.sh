#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.16-tkg/usr/bin/wine64

qdbus org.kde.plasmashell /PlasmaShell evaluateScript "p = panelById(panelIds[0]); p.height = 0 - p.height;"    

cd "$HOME/Games/-Library-/PC/Vampyr/AVGame/Binaries/Win64"
gamemoderun $WINE "AVGame-Win64-Shipping.exe"

sleep 5

while pgrep -x "AVGame-Win64-Shipping.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.plasmashell /PlasmaShell evaluateScript "p = panelById(panelIds[0]); p.height = 0 - p.height;"    
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
