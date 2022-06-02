#!/usr/bin/env bash

# Destination
GOVI_ARCH_LINUX="$HOME/Proyects/Github/GoVi-Arch_Linux"

# ~/
rsync -arv ~/.easystroke "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.gtkrc-2.0 "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.gtkrc-3.0 "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.imwheelrc "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.nvidia-settings-rc "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.profile "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.xprofile "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.xinitrc "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.zshrc "$GOVI_ARCH_LINUX"/Dotfiles/

# ~/.config/
rsync -arv --exclude={'.directory','discord','email.sh','skypeforlinux','spotify','teamviewer','vivaldi','BraveSoftware','docs_config','startup.blend'} --delete ~/.config/ "$GOVI_ARCH_LINUX"/Dotfiles/.config/

# ~/.local/share/
mkdir -p "$GOVI_ARCH_LINUX"/Dotfiles/.local/share/
rsync -arv --exclude={'.directory','baloo','spotify','teamviewer15'} --delete ~/.local/share/ "$GOVI_ARCH_LINUX"/Dotfiles/.local/share/

# Backups
rsync -arv --delete ~/.password-store/ ~/Backups/Linux/.p-store/
rsync -arv --delete ~/Multimedia/Pictures/Icons/Themes/GoVi/ ~/Backups/Linux/Themes/GoVi/
rsync -arv --delete /etc/lightdm/ ~/Backups/Linux/Lightdm/
rsync -arv /etc/fstab ~/Backups/Linux/
rsync -arv /etc/X11/xorg.conf ~/Backups/Linux/
rsync -arv ~/.config/qtile/config.py ~/Backups/Linux/
rsync -arv --delete ~/Backups/Linux/ "$GOVI_ARCH_LINUX"/Backups/

# Gaming
rsync -arv  /etc/pacman.conf "$GOVI_ARCH_LINUX"/Gaming/
rsync -arv ~/.config/MangoHud/MangoHud.conf "$GOVI_ARCH_LINUX"/Gaming/
rsync -arv --delete ~/.config/vkBasalt/ "$GOVI_ARCH_LINUX"/Gaming/vkBasalt/

# Scripts
rsync -arv --exclude 'Games' --delete ~/Scripts/ "$GOVI_ARCH_LINUX"/Scripts/
rsync -arv --delete ~/Scripts/Shell/Games/ "$GOVI_ARCH_LINUX"/Gaming/Scripts/

# Git token
TOKEN="$(awk 'NR==3' ~/.git_token)"
cd "$GOVI_ARCH_LINUX"
git remote remove origin
git remote add origin https://${TOKEN}@github.com/GoVi-48/GoVi-Arch_Linux.git

# Push to Github
echo -e '\nUploading to Github...\n'; sleep 2
git add .
git commit -m "Updated"
git push -u origin master

notify-send -i '/usr/share/icons/GoVi/emblems/22/emblem-information.svg' "Info" "/home Backup Complete" -t 5000 &
paplay $HOME/.local/share/sounds/cause-and-effect.ogg

while true; do
    echo -e '\nPress "Enter" to Open Github or "Escape" to Exit\n'
    read -rsn1 INPUT
        if [[ $INPUT = "" ]]; then
            echo "Opening Github..."
            sleep 2
            brave https://github.com/GoVi-48/GoVi-Arch_Linux
            exit

        elif [[ $INPUT = $'\e' ]]; then
            exit

        else
            echo "Invalid Key"
        fi
done

