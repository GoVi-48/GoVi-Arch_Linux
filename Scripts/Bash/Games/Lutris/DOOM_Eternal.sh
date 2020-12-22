#!/usr/bin/env bash

game_executable="DOOMEternalx64vk.exe"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1

gamemoderun lutris lutris:rungameid/7 &


while ! pgrep -x $game_executable > /dev/null; do sleep 1; done

if pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor suspend
    killall cairo-dock
    killall polybar
fi

while pgrep -x $game_executable > /dev/null; do sleep 1; done
    
if ! pgrep -x $game_executable; then
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar 
    cairo-dock > /dev/null 2>&1 &
    killall lutris
    sleep 1
    killall gamemoded
fi
    

##### Lutris Environment Variables ##### 
# RADV_PERFTEST llvm
# PROTON_NO_ESYNC 1
# +in_terminal 1
# +com_skipIntroVideo 1
# +com_skipKeyPressOnLoadScreens 1
# +com_skipSignInManager 1
