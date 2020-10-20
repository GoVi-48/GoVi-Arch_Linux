#!/usr/bin/env bash
 
qdbus org.kde.KWin /Compositor suspend
killall latte-dock
killall plasmashell
killall polybar

mangohud gamemoderun steam steam://rungameid/310560 &

sleep 10

while pgrep -x DirtRally > /dev/null; do sleep 1; done

if ! pgrep -x "DirtRally" > /dev/null; then
    killall DirtRally
    sleep 5
    killall steam
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 &
    exit
fi
