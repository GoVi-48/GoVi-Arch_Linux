#!/usr/bin/env bash

GoVi_Arch_Linux="$HOME/Proyectos/Github/GoVi-Arch-Linux"

# Remove
rm -rfv "$GoVi_Arch_Linux/.config.bak/"*
rm -rfv "$GoVi_Arch_Linux/.local.bak/share/"*
rm -rfv "$GoVi_Arch_Linux/Backups/"*
rm -rfv "$GoVi_Arch_Linux/Scripts/"*

# Backup ~/.config
cp -rfv ~/.config/* "$GoVi_Arch_Linux/.config.bak"

# Backup ~/.local
mkdir -p "$GoVi_Arch_Linux/.local.bak/share/plasma/look-and-feel/GoVi" && cp -rfv ~/.local/share/plasma/look-and-feel/GoVi/* $_
mkdir -p "$GoVi_Arch_Linux/.local.bak/share/aurorae/themes/GoVi-Wi" && cp ~/.local/share/aurorae/themes/GoVi-Wi/* $_
mkdir -p "$GoVi_Arch_Linux/.local.bak/share/icons/GoVi-Cu" && cp -rfv ~/.local/share/icons/GoVi-Cu/* $_
mkdir -p "$GoVi_Arch_Linux/.local.bak/share/icons/GoVi-Ic" && cp -rfv ~/.local/share/icons/GoVi-Ic/* $_
mkdir -p "$GoVi_Arch_Linux/.local.bak/share/color-schemes" && cp -rfv ~/.local/share/color-schemes/* $_
mkdir -p "$GoVi_Arch_Linux/.local.bak/share/onboard" && cp -rfv ~/.local/share/onboard/* $_

# Backup ~/
mkdir -p "$GoVi_Arch_Linux/BacKups/Linux" && cp -rfv ~/Backups/Linux/* $_ 
mkdir -p "$GoVi_Arch_Linux/Scripts" && cp -rfv ~/Scripts/* $_
cp -rfv ~/.bashrc "$GoVi_Arch_Linux"
cp -rfv ~/.vimrc "$GoVi_Arch_Linux"

# Push to Github
cd $HOME/Proyectos/Github/GoVi-Arch-Linux
git add .
git commit -m "Updated"
git push -u origin master

kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "Complete" 8 && paplay $HOME/.local/share/sounds/cause-and-effect.ogg

echo "Press 'Enter' to continue"
count=0
while : ; do
    read -n 1 k <&1
if [[ $k = Enter ]] ; then
    printf "\nOpening Github\n"
fi
done

# xdg-open https://github.com/GoVi-48/GoVi-Arch-Linux
firefox https://github.com/GoVi-48/GoVi-Arch-Linux

