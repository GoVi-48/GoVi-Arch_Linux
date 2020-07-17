#!/usr/bin/env bash
 
killall polybar

qdbus org.kde.KWin /Compositor resume

lutris lutris:rungameid/5 &

sleep 2

while pgrep -x wineserver > /dev/null; do sleep 1; done

if ! pgrep -x "wineserver" > /dev/null; then
    killall lutris
    polybar govi
    qdbus org.kde.KWin /Compositor resume
fi
