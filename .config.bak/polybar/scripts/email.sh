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

if [ $email_count -eq 0 ]; then
    echo "📭"
else
    echo "📬 $email_count"
    kdialog --title "📬 $email_count" --passivepopup "$email1_title $email2_title" 5 &
fi    
    
