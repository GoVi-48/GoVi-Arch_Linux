#!/usr/bin/env bash

GOVI_ARCH_LINUX="$HOME/Proyectos/Github/GoVi-Arch_Linux"

# Remove
rm -rfv "$GOVI_ARCH_LINUX/.config.bak/"*
rm -rfv "$GOVI_ARCH_LINUX/.local.bak/share/"*
rm -rfv "$GOVI_ARCH_LINUX/Backups/"*
rm -rfv "$GOVI_ARCH_LINUX/Gaming/"*
rm -rfv "$GOVI_ARCH_LINUX/Scripts/"*

# Backup ~/.config/
mkdir -p "$GOVI_ARCH_LINUX/.config.bak/" && cp -rfv ~/.config/* $_

# Backup ~/.local/share/
mkdir -p "$GOVI_ARCH_LINUX/.local.bak/share/" && rsync -arv --exclude 'baloo' ~/.local/share/* $_

# Backup ~/
mkdir -p "$GOVI_ARCH_LINUX/BacKups/Linux/" && cp -rfv ~/Backups/Linux/* $_
mkdir -p "$GOVI_ARCH_LINUX/Scripts/" && cp -rfv ~/Scripts/* $_
cp -rfv /etc/fstab "$GOVI_ARCH_LINUX"
cp -rfv ~/.bashrc "$GOVI_ARCH_LINUX"
cp -rfv ~/.vimrc "$GOVI_ARCH_LINUX"

# Gaming
mkdir -p $GOVI_ARCH_LINUX/Gaming/ && cp -rfv /etc/pacman.conf $_
mkdir -p $GOVI_ARCH_LINUX/Gaming/ && cp -rfv ~/.config/MangoHud/MangoHud.conf $_
mkdir -p $GOVI_ARCH_LINUX/Gaming/vkBasalt/ && cp -rfv ~/.config/vkBasalt/* $_
ln -sf "$GOVI_ARCH_LINUX/Scripts/Bash/Games" "$GOVI_ARCH_LINUX/Gaming/"
mv "$GOVI_ARCH_LINUX/Gaming/Games" "$GOVI_ARCH_LINUX/Gaming/Scripts"

# Push to Github
cd "$GOVI_ARCH_LINUX"
git add .
git commit -m "Updated"
git push -u origin master

kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/emblems/22/emblem-information.svg" --passivepopup "Complete" 8 && paplay $HOME/.local/share/sounds/cause-and-effect.ogg

while true; do
    echo -en 'Press "Enter" to Continue or "Escape" to Exit'
    echo .
    read -rsn1 input
        if [[ $input = "" ]]; then
            echo "Opening Github..."
            sleep 2
            firefox https://github.com/GoVi-48/GoVi-Arch_Linux
            exit
            
        elif [[ $input = $'\e' ]]; then
            exit
            
        else 
            echo "Invalid Key."
        fi
done


# xdg-open https://github.com/GoVi-48/GoVi-Arch-Linux


