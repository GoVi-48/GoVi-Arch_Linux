#!/usr/bin/env bash

username1="alexpeed48@gmail.com"
password1="Somostu*48"
username2="alexpeedpainting@gmail.com"
password2="donchartpaint*33351"

email1_count=$(
curl -u $username1:$password1 --silent "https://mail.google.com/mail/feed/atom" |
grep -oP '(?<=<fullcount>).*(?=</fullcount>)'
)

email2_count=$(
curl -u $username2:$password2 --silent "https://mail.google.com/mail/feed/atom" |
grep -oP '(?<=<fullcount>).*(?=</fullcount>)'
)

email_count=$(( email1_count + email2_count ))

email1_title=$(
curl -u $username1:$password1 --silent "https://mail.google.com/mail/feed/atom" |
awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' |
sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
)

email2_title=$(
curl -u $username2:$password2 --silent "https://mail.google.com/mail/feed/atom" |
awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' |
sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
)

email_title=$(echo $email1_title ; echo $email2_title)
sound_email_off=$HOME/.config/polybar/scripts/sound_email_off

if [ $email_count -eq 0 ]; then
    echo "📭"
    if [ -f $sound_email_off ]; then
        rm -rf $sound_email_off
    fi   

elif [ $email_count -gt 0 ] && [ ! -f "$sound_email_off" ] && ! pgrep -x "vlc|elisa|kodi" > /dev/null; then
    echo "📬 $email_count"
    kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/gmail.svg" --passivepopup "$email_title" 8 &
    paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    touch $sound_email_off

else
    echo "📬 $email_count"
    kdialog --icon "$HOME/.local/share/icons/GoVi-Ic/apps/64/gmail.svg" --passivepopup "$email_title" 8 &
fi
