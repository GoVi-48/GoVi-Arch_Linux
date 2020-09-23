#!/usr/bin/env bash
 
qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall polybar
killall plasmashell

lutris lutris:rungameid/16 &

sleep 2

while pgrep -x "ShooterGame.exe" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
