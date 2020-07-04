#!/usr/bin/env bash

updates=$(echo $(yay -Qua | wc -l))

if [ $updates -eq 0 ];then
    echo ""
    
elif [ $updates -gt 0 ];then
    echo %{F#e29519}"  %{F-}$updates AUR"
 
fi
