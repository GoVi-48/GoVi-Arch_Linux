#!/usr/bin/env bash

# Bad lectures
#sensors | grep "Package id 0:" | tr -d 'Package id 0:(hh=8.,rt=1.+)' | cut -c -5

# Works on terminal not in polybar though
#     echo -e 🌡 "\e[38;5;26m"$temp" °C"

# Search temperature output
# for i in /sys/class/hwmon/hwmon*/temp*_input; do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; done

temp=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input | cut -c -2)

if [ $temp -ge 20 -a $temp -lt 50 ]; then
    echo "  "%{F#0095ff}"$temp"°C%{F-}
    
elif [ $temp -ge 50 -a $temp -lt 70 ]; then
    echo 🔥 %{F#fdbc4b}"$temp"°C%{F-}
    
elif [ $temp -ge 70 ]; then
    echo 🔥 %{F#f90e39}"$temp"°C%{F-}
    
fi
