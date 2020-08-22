#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

export WINEPREFIX=~/Wine/wine-pfx_proton/wine-pfx_Proton-5.0.9-NMS/pfx
export WINE=~/Wine/wine-build_Proton/wine-build_Proton-5.0/dist/bin/wine

cd "/Datos/Games/PC/No Man's Sky GOG/Binaries"
gamemoderun $WINE "NMS.exe"

sleep 5

while pgrep -x "NMS.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
