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

# nvim ~/Programs/Webgrab++/webgrab.log

notify-send -i "$HOME/Programs/Webgrab++/.wg++/WebGrab+Plus.ico" "Webgrab" "Updated" -t 5000 &
paplay $HOME/.local/share/sounds/cause-and-effect.ogg

