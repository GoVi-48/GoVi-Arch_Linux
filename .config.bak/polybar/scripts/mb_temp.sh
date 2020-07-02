#!/usr/bin/env bash

temp=$(cat /sys/devices/platform/it87.2608/hwmon/hwmon3/temp1_input | cut -c -2)

if [ $temp -ge 20 ];then
    echo 🌡 %{F#ff7700}"$temp"°C%{F-}
    
elif [ $temp -ge 50 ];then
    echo 🔥 %{F#fdbc4b}"$temp"°C%{F-}
    
elif [ $temp -ge 70 ];then
    echo 🔥 %{F#0095ff}"$temp"°C%{F-}
    
fi
