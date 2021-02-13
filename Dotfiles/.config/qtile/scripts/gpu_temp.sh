#!/usr/bin/env bash

temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

if [ $temp -ge 20 -a $temp -lt 55 ]; then
    echo "${temp}°C" > ~/.config/qtile/scripts/gpu_temp

elif [ $temp -ge 55 -a $temp -lt 70 ]; then
    echo "🔥 ${temp}°C" > ~/.config/qtile/scripts/gpu_temp

elif [ $temp -ge 70 ]; then
    echo "🔥 ${temp}°C" > ~/.config/qtile/scripts/gpu_temp

fi
