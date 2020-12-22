#!/usr/bin/env bash

qdbus org.kde.KWin /Compositor suspend
killall cairo-dock
killall polybar

gamemoderun rpcs3 "home/$USER/Games/Sony/Playstation 3/God of War III/BCES00510/PS3_GAME/USRDIR/EBOOT.BIN"


killall rpcs3
qdbus org.kde.KWin /Compositor resume
/home/$USER/Scripts/Bash/Polybar 
cairo-dock
sleep 1
killall gamemoded
