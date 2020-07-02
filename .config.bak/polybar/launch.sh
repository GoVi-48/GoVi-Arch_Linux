#!/usr/bin/env bash

killall -q polybar

polybar govi >>/tmp/polygovi.log 2>&1 &
#polybar govi2 >>/tmp/polygovi2.log 2>&1 &
