#!/usr/bin/env bash

updates=$(echo $(pacman -Qu | wc -l))

if [ $updates -eq 0 ];then
    echo "🚀"
    
elif [ $updates -gt 0 ];then
    echo %{F#e29519}"  %{F-}$updates pacman"
 
fi
