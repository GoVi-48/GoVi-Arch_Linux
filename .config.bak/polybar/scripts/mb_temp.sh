#!/usr/bin/env bash

temp=$(cat /sys/devices/platform/it87.2608/hwmon/hwmon3/temp1_input | cut -c -2)

if [ $temp > 30 ];then
    echo 🌡 %{F#fdbc4b}"$temp"°C%{F-}
    
elif [ $temp  > 50 ];then
    echo 🔥 %{F#fdbc4b}"$temp"°C%{F-}
    
elif [ $temp  > 30 ];then
    echo 🔥 %{F#0095ff}"$temp"°C%{F-}
    
fi
