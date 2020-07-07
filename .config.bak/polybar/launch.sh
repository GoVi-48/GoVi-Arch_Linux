#!/usr/bin/env bash

killall -q polybar

polybar govi >> /tmp/polygovi.log 2>&1 &

sleep 1

killall -q polybar

polybar govi >> /tmp/polygovi.log 2>&1 &
