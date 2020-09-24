#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

gamemoderun rpcs3 "$HOME/Games/-Library-/Sony/Playstation 3/God of War III/BCES00510/PS3_GAME/USRDIR/EBOOT.BIN"

killall rpcs3
killall lutris
killall gamemoded
qdbus org.kde.KWin /Compositor resume
$HOME/Scripts/Bash/Polybar
latte-dock &
plasmashell > /dev/null 2>&1 & exit
