#!/usr/bin/env bash

rm -rfv "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.config.bak/"*
rm -rfv "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"*
rm -rfv "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/Backups/Linux/"*
rm -rfv "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/Games/-Shortcuts-/"*
rm -rfv "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/Scripts/"*

# ~/.config
cp -rfv ~/.config/* "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.config.bak"

# ~/.local
cp -rfv ~/.local/share/aurorae/themes/GoVi-Wi "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/aurorae/themes/"
cp -rfv ~/.local/share/color-schemes "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"
cp -rfv ~/.local/share/icons/GoVi-Cu "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/icons/"
cp -rfv ~/.local/share/icons/GoVi-Ic "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/icons/"
cp -rfv ~/.local/share/onboard "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"
cp -rfv ~/.local/share/plasma/look-and-feel/GoVi "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/plasma/look-and-feel/"

# ~/
cp -rfv ~/Backups/Linux/* "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/"
cp -rfv ~/Games/-Shortcuts-/* "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/Games/-Shortcuts-"
cp -rfv ~/Scripts/* "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/Scripts"
cp -rfv ~/.bashrc "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/"
cp -rfv ~/.vimrc "/Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux/"

# Push to Github
cd /Datos/GoVi/Proyectos/Github/GoVi-Arch-Linux
git add .
git commit -m "Updated"
git push -u origin master
