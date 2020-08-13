#!/usr/bin/env bash
 
notf_on=~/.config/polybar/scripts/notf_on
 
if [ -f $notf_on ]; then
    echo %{T3}%{F#e6db74}9 %{F-}%{T-}
    
else
    echo %{T3}%{F#f90e39}9 %{F-}%{T-}
fi
