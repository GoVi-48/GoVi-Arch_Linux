#!/usr/bin/env bash

killall polybar

cd "/Windows/Portables/Adobe/Adobe Photoshop 2020"

WINEPREFIX=~/Wine/wine-pfx_lutris/wine-pfx_lutris-opengl ~/Wine/wine-build_5.15-tkg/bin/wine64 "Photoshop.exe"

~/Scripts/Bash/Polybar

ps -e | awk '$4 ~ "Adobe" || $4 ~ ".exe" {print $4}' | xargs kill -9 $4
sleep 1
pkill Adobe
