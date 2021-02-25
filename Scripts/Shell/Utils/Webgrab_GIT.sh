#!/usr/bin/env bash

echo ====================================================================================
echo
echo -Iniciado Webgrab
echo
~/Programs/Webgrab++/.wg++/./run.sh

echo
echo -Remplazando xmltv.xml
echo
cp -rfv ~/Programs/Webgrab++/.wg++/xmltv.xml ~/Proyects/Github/GoVi-EPG/
echo
echo ====================================================================================
echo
echo -Subiendo a Github

cd ~/Proyects/Github/GoVi-EPG/

# git config --global credential.helper store

echo
git add .
git commit -m "Updated"
git push -u origin master
echo
echo
echo -Completado
echo `date +%H:%M` - `date +%d/%m/%Y`
echo
echo ====================================================================================

# export DISPLAY=:0 && kate ~/Scripts/Logs/Cron/crontab_Webgrab.log

kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "Webgrab Updated" 8 && paplay $HOME/.local/share/sounds/cause-and-effect.ogg

