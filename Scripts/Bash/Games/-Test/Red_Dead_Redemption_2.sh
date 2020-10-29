#!/usr/bin/env bash

# qdbus org.kde.KWin /Compositor suspend
# killall latte-dock
# killall polybar
# killall plasmashell

export WINEFSYNC=0
WINEDEBUG=-all,relay
PULSE_LATENCY_MSEC=60
export WINEDLLOVERRIDES="dxgi=n,b"
export WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_RDR2
export WINE=~/Wine/wine-build_5.19-tkg/usr/bin/wine64

export MANGOHUD=0
ENABLE_VKBASALT=1

cd "$HOME/Games/-Library-/PC/Red Dead Redemption 2"
$WINE "Launcher.exe" & sleep 10

PID=$(pgrep RDR2.exe)
kill -s SIGSTOP $PID
kill -s SIGCONT $PID

# sleep 5
# 
# while pgrep -x "RDR2.exe" > /dev/null; do sleep 1; done
#     killall lutris
#     killall gamemoded
#     qdbus org.kde.KWin /Compositor resume
#     $HOME/Scripts/Bash/Polybar
#     latte-dock &
#     plasmashell > /dev/null 2>&1 &
#     exit
