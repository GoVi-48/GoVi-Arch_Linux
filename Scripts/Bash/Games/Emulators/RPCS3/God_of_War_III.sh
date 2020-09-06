#!/usr/bin/env bash

killall polybar
qdbus org.kde.KWin /Compositor suspend

rpcs3 "$HOME/Games/-Library-/Sony/Playstation 3/God of War III/BCES00510/PS3_GAME/USRDIR/eboot.bin"

qdbus org.kde.KWin /Compositor resume
~/Scripts/Bash/Polybar
