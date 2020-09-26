#!/usr/bin/env bash

# export WINEPREFIX=$HOME/Wine/wine-pfx_lutris/wine-pfx_dxvk-1.7.1-mf
# export WINE=$HOME/Wine/wine-build_Lutris/wine-build_5.7.10-lutris/bin/wine64
# 
# cd "/Datos/Games/Epic Games/rocketleague/Binaries/Win64"
# gamemoderun $WINE "RocketLeague.exe" -epicportal

export WINEPREFIX=~/Wine/wine-pfx_5.17/wine-pfx_dxvk-1.7.1-mf
export WINE=$HOME/Wine/wine-build_Lutris/wine-build_5.7.10-lutris/bin/wine64

_GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1

cd "$HOME/Wine/wine-pfx_5.17/wine-pfx_dxvk-1.7.1-mf/drive_c/Program Files (x86)/Epic Games/Launcher/Engine/Binaries/Win64"
gamemoderun $WINE "EpicGamesLauncher.exe" -opengl -SkipBuildPatchPrereq

if pgrep -x "RocketLeague.exe" > /dev/null
    qdbus org.kde.KWin /Compositor suspend
    killall latte-dock
    killall polybar
    killall plasmashell
fi

sleep 5

if ! pgrep -x "EpicGamesLaunch" > /dev/null; do sleep 1; done
    killall lutris
    killall gamemoded
    qdbus org.kde.KWin /Compositor resume
    $HOME/Scripts/Bash/Polybar
    latte-dock &
    plasmashell > /dev/null 2>&1 & exit
fi
    
# com.epicgames.launcher://apps/Sugar?action=launch&silent=true
