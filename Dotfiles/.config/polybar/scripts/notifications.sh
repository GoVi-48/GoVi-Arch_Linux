#!/usr/bin/env bash
 
NOTF_SOUND=~/.config/polybar/scripts/NOTF_SOUND
 
if [ -f $NOTF_SOUND ]; then
    echo "%{T3}%{F#e6db74}9%{F-}%{T-}"
    
else
    echo "%{T3}%{F#f90e39}9%{F-}%{T-}"
fi
