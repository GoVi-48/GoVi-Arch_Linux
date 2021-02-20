#!/bin/bash

killall cairo-dock & sleep 2 && cairo-dock > /dev/null 2>&1 &
exit
