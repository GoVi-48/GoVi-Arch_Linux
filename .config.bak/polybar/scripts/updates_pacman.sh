#!/usr/bin/env bash

updates=$(echo $(pacman -Qu | wc -l))

if [ $updates -eq 0 ];then
    echo ""
    
elif [ $updates -gt 0 ];then
    echo %{F#0095ff}"  %{F-}$updates pacman"
 
fi
