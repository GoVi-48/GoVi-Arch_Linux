#!/usr/bin/env bash

killall polybar

qdbus org.kde.KWin /Compositor suspend

cd "/Datos/Games/PC/No Man's Sky GOG/Binaries"

gamemoderun WINEPREFIX="/Datos/Games/PC/No Man's Sky GOG/wine-pfx_NMS/pfx" ~/Wine/wine-build_Proton/wine-build_Proton-5.0/dist/bin/wine "NMS.exe"

sleep 5

while pgrep -x "NMS.exe" > /dev/null; do sleep 1; done

qdbus org.kde.KWin /Compositor resume

killall lutris
killall gamemoded

~/Scripts/Bash/Polybar
