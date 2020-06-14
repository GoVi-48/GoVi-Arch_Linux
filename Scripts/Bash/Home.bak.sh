#!/usr/bin/env bash

rm -rfv "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/.config.bak/"*
rm -rfv "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"*
rm -rfv "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/Scripts/"*
rm -rfv "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/Games/-Shortcuts-/"*

cp -rfv ~/.config/* "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/.config.bak"

cp -rfv ~/.local/share/aurorae "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"
cp -rfv ~/.local/share/color-schemes "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"
cp -rfv ~/.local/share/icons "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"
cp -rfv ~/.local/share/onboard "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"
cp -rfv ~/.local/share/plasma "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/.local.bak/share/"

cp -rfv ~/Scripts/* "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/Scripts"
cp -rfv ~/Games/-Shortcuts-/* "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/Games/-Shortcuts-"

cp -rfv ~/.bashrc "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/"
cp -rfv ~/.vimrc "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/"

cp -rfv "/Datos/THC/Sistema/Programas/Linux/Howto Arch" "/Datos/THC/Proyectos/Github/GoVi-Arch-Linux/"

cd /Datos/THC/Proyectos/Github/GoVi-Arch-Linux
git add .
git commit -m "Updated"
git push -u origin master
