#!/usr/bin/env bash

killall polybar

WINEPREFIX=~/Wine/wine-pfx_tkg-4.6 ~/Wine/wine-build_5.14-tkg/bin/wine64 "/Windows/Portables/Adobe/Adobe Photoshop 2020/Photoshop.exe"

~/Scripts/Bash/Polybar

ps -e | awk '$4 ~ "Adobe" || $4 ~ ".exe" {print $4}' | xargs kill -9 $4
sleep 1
pkill Adobe
