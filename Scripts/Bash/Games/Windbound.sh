#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

ulimit -n 1048576
export WINEESYNC=1
export WINEDLLOVERRIDES="mscoree,mshtml="
__GL_THREADED_OPTIMIZATIONS=1 "$WINE" "$EXE"
# winetricks d3d11=native dxgi=native

export WINEPREFIX=~/Wine/wine-pfx_5.16/wine-pfx_5.16-dxvk-1.7.1-mf
export WINE=~/Wine/wine-build_5.16-tkg/usr/bin/wine64

cd "$HOME/Games/-Library-/PC/Windbound"
gamemoderun $WINE "Windbound.exe"

sleep 5

while pgrep -x "Windbound.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    killall lutris
    killall gamemoded
    killall UnrealCEFSubProcess.exe
    ~/Scripts/Bash/Polybar
