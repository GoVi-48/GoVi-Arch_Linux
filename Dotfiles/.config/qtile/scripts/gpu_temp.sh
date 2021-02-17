#!/usr/bin/env bash

#temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
temp=$(sensors | awk '$1 ~ /^edge:/ {print substr($0,16,2)}')

if [ $temp -ge 20 -a $temp -lt 55 ]; then
    echo "${temp}°C "

elif [ $temp -ge 55 -a $temp -lt 70 ]; then
    echo "🔥 ${temp}°C "

elif [ $temp -ge 70 ]; then
    echo "🔥 ${temp}°C "

fi
