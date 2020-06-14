#!/usr/bin/env bash

echo ====================================================================================
echo
echo -Iniciado Webgrab
echo
~/Programas/Webgrab++/.wg++/./run.sh

echo
echo -Remplazando xmltv.xml
echo
cp -rfv ~/Programas/Webgrab++/.wg++/xmltv.xml /Datos/THC/Proyectos/Github/GoVi-EPG/
echo

echo
echo -Subiendo a Github

cd /Datos/THC/Proyectos/Github/GoVi-EPG/

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

