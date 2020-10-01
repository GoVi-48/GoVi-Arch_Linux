#!/usr/bin/env bash

# export WINEPREFIX=$HOME/Wine/wine-pfx_lutris/wine-pfx_Epic_Games
# export WINE=$HOME/Wine/wine-build_Lutris/wine-build_5.7.10/bin/wine64
# 
# cd "/Datos/Games/Epic Games/rocketleague/Binaries/Win64"
# gamemoderun $WINE "RocketLeague.exe" -epicportal

export WINEPREFIX=$HOME/Wine/wine-pfx_lutris/wine-pfx_Epic_Games
export WINE=$HOME/Wine/wine-build_Lutris/wine-build_5.7.10/bin/wine64

_GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

cd "$HOME/Wine/wine-pfx_lutris/wine-pfx_Epic_Games/drive_c/Program Files (x86)/Epic Games/Launcher/Engine/Binaries/Win64"
gamemoderun $WINE "EpicGamesLauncher.exe" -opengl -SkipBuildPatchPrereq &

while ! pgrep -x "RocketLeague.exe" > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor suspend
    killall latte-dock
    killall polybar

while pgrep -x "RocketLeague.exe" > /dev/null; do sleep 1; done
    sleep 5
    killall EpicGamesLaunch
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar &
    latte-dock & exit
    
    
# com.epicgames.launcher://apps/Sugar?action=launch&silent=true
