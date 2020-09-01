#!/usr/bin/env bash

ENABLE_VKBASALT=0

killall polybar

gamemoderun steam steam://rungameid/244210 &

sleep 20

while pgrep -x AssettoCorsa.ex > /dev/null; do sleep 1; done
    killall steam
    sleep 1
    killall lutris
    killall gamemoded
    ~/Scripts/Bash/Polybar
