#!/usr/bin/env bash

rm -rfv ~/Backups/Kodi/Backups/Builds/Current/.kodi

cp -rfv ~/.kodi ~/Backups/Kodi/Backups/Builds/Current

cd ~/Backups/Kodi/Backups/Builds/Current/.kodi/

zip -r $HOME/Escritorio/Kodi-GoVi_Build.zip "addons" "media" "userdata" 

mv ~/Escritorio/Kodi-GoVi_Build.zip ~/Dropbox

dropbox
