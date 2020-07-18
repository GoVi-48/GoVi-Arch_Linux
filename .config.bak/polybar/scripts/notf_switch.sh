#!/usr/bin/env bash

notf_on=~/.config/polybar/scripts/notf_on
notf_off=~/.config/polybar/scripts/notf_off

if [ -f $notf_on ]; then
    rm -f $notf_on
    touch $notf_off
    
else
    touch $notf_on
    rm $notf_off
fi
