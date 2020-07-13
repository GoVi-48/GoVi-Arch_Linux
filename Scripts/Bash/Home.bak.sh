#!/usr/bin/env bash

# Remove
rm -rfv "$HOME/Proyectos/Github/GoVi-Arch-Linux/.config.bak/"*
rm -rfv "$HOME/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"*
rm -rfv "$HOME/Proyectos/Github/GoVi-Arch-Linux/Backups/"*
rm -rfv "$HOME/Proyectos/Github/GoVi-Arch-Linux/Games/"*
rm -rfv "$HOME/Proyectos/Github/GoVi-Arch-Linux/Scripts/"*

# Backup ~/.config
cp -rfv ~/.config/* "$HOME/Proyectos/Github/GoVi-Arch-Linux/.config.bak"

# Backup ~/.local
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/plasma/look-and-feel/GoVi" && cp -rfv ~/.local/share/plasma/look-and-feel/GoVi/* $_
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/aurorae/themes/GoVi-Wi" && cp ~/.local/share/aurorae/themes/GoVi-Wi/* $_
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/icons/GoVi-Cu" && cp -rfv ~/.local/share/icons/GoVi-Cu/* $_
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/icons/GoVi-Ic" && cp -rfv ~/.local/share/icons/GoVi-Ic/* $_
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/color-schemes" && cp -rfv ~/.local/share/color-schemes/* $_
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/onboard" && cp -rfv ~/.local/share/onboard/* $_

# Backup ~/
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/BacKups/Linux" && cp -rfv ~/Backups/Linux/* $_ 
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/Games/-Shortcuts-" && cp -rfv ~/Games/-Shortcuts-/* $_ 
mkdir -p "$HOME/Proyectos/Github/GoVi-Arch-Linux/Scripts" && cp -rfv ~/Scripts/* $_
cp -rfv ~/.bashrc "$HOME/Proyectos/Github/GoVi-Arch-Linux/"
cp -rfv ~/.vimrc "$HOME/Proyectos/Github/GoVi-Arch-Linux/"

# Push to Github
cd $HOME/Proyectos/Github/GoVi-Arch-Linux
git add .
git commit -m "Updated"
git push -u origin master
