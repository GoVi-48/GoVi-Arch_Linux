#!/usr/bin/env bash

temp=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon1/temp1_input | cut -c -2)

if [ $temp -ge 20 -a $temp -lt 55 ]; then
    echo "$temp°C "
    
elif [ $temp -ge 55 -a $temp -lt 70 ]; then
    echo "$temp°C "

elif [ $temp -ge 70 ]; then
    echo "$temp°C "

fi
