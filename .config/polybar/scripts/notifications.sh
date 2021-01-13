#!/usr/bin/env bash
 
notf_sound=~/.config/polybar/scripts/notf_sound
 
if [ -f $notf_sound ]; then
    echo "%{T3}%{F#e6db74}9 %{F-}%{T-}"
    
else
    echo "%{T3}%{F#f90e39}9 %{F-}%{T-}"
fi
