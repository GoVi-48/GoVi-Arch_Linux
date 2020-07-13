#!/bin/bash
cd $(dirname $0)
killall conky
mkdir ~/.fonts > /dev/null 2>&1 
cp fonts/*.*tf ~/.fonts > /dev/null 2>&1 
mkdir ~/.local/share/fonts/ > /dev/null 2>&1 
cp fonts/*.*tf ~/.local/share/fonts/ > /dev/null 2>&1 
fc-cache ~/.fonts

conky -q -c  infofile
conky -q -c  disks
conky -q -c  processes
conky -q -c  cpu
conky -q -c  temps
conky -q -c  memory
conky -q -c  network

# conky -q -c  clockfile
# conky -q -c  clockfile01
#conky -q -c rssfile

python poll_disk.py || python3 poll_disk.py &
python poll_day.py  || python3 poll_day.py &
notify-send -i ~/.config/conky/GoVi-HUD/img/information.png \
"Information" \
"GoVi-HUD is started
To move the widgets around the desktop,
use Alt+ left-Click"
