#!/usr/bin/env bash

game_executable="DOOMEternalx64vk.exe"

export WINEDLLOVERRIDES="mscoree,mshtml="
export WINEFSYNC=1
export MANGOHUD=1
export ENABLE_VKBASALT=1


gamemoderun lutris lutris:rungameid/7 &


while ! pgrep -x $game_executable > /dev/null; do sleep 1; done
    sleep 5
    killall lutris
    killall polybar
    killall cairo-dock
    qdbus org.kde.KWin /Compositor suspend

while pgrep -x $game_executable > /dev/null; do sleep 1; done
    qdbus org.kde.KWin /Compositor resume
    /home/$USER/Scripts/Bash/Polybar/launch.sh
    cairo-dock > /dev/null 2>&1 &
    sleep 1
    killall gamemoded
    

##### Lutris Environment Variables ##### 
# RADV_PERFTEST llvm
# PROTON_NO_ESYNC 1
# +in_terminal 1
# +com_skipIntroVideo 1
# +com_skipKeyPressOnLoadScreens 1
# +com_skipSignInManager 1
