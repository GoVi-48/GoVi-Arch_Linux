#!/usr/bin/env bash

notf_sound=~/.config/polybar/scripts/notf_sound

if [ -f $notf_sound ]; then
    rm -f $notf_sound
    
else
    touch $notf_sound
    
fi
