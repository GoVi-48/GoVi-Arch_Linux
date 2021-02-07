#!/usr/bin/env bash

# Destination
GOVI_ARCH_LINUX="$HOME/Proyects/Github/GoVi-Arch_Linux"

# ~/
rsync -arv ~/.xinitrc "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.zshrc "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.bashrc "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.vim/.vimrc "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.profile "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.xprofile "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.easystroke "$GOVI_ARCH_LINUX"/Dotfiles/
rsync -arv ~/.gtkrc-3.0 "$GOVI_ARCH_LINUX"/Dotfiles/

# ~/.config/
rsync -arv --exclude={'.directory','discord','email.sh','skypeforlinux','spotify','teamviewer','vivaldi'} --delete ~/.config/ "$GOVI_ARCH_LINUX"/Dotfiles/.config/

# ~/.local/share/
rsync -arv --exclude={'baloo','spotify','teamviewer15'} --delete ~/.local/share/ "$GOVI_ARCH_LINUX"/Dotfiles/.local/share/

# Backups
rsync -arv --delete ~/.password-store/ ~/Backups/Linux/.p-store/
rsync -arv --delete ~/Backups/Linux/ "$GOVI_ARCH_LINUX"/Backups/
rsync -arv /etc/fstab "$GOVI_ARCH_LINUX"/Backups/
rsync -arv ~/.config/liferea/feedlist.opml "$GOVI_ARCH_LINUX"/Backups/

# Gaming
rsync -arv  /etc/pacman.conf "$GOVI_ARCH_LINUX"/Gaming/
rsync -arv ~/.config/MangoHud/MangoHud.conf "$GOVI_ARCH_LINUX"/Gaming/
rsync -arv --delete ~/.config/vkBasalt/ "$GOVI_ARCH_LINUX"/Gaming/vkBasalt/

# Scripts
rsync -arv --exclude 'Games' --delete ~/Scripts/ "$GOVI_ARCH_LINUX"/Scripts/
rsync -arv --delete ~/Scripts/Bash/Games/ "$GOVI_ARCH_LINUX"/Gaming/Scripts/

# Push to Github
cd "$GOVI_ARCH_LINUX"
echo -e '\nUploading to Github...\n'; sleep 2
git add .
git commit -m "Updated"
git push -u origin master

zenity --info --text "Complete" 2> /dev/null & paplay $HOME/.local/share/sounds/cause-and-effect.ogg

while true; do
    echo -e '\nPress "Enter" to Open Github or "Escape" to Exit\n'
    read -rsn1 INPUT
        if [[ $INPUT = "" ]]; then
            echo "Opening Github..."
            sleep 2
            firefox https://github.com/GoVi-48/GoVi-Arch_Linux
            exit

        elif [[ $INPUT = $'\e' ]]; then
            exit

        else
            echo "Invalid Key"
        fi
done

