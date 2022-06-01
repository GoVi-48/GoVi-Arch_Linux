#!/usr/bin/env bash

# Github Repository
REPO="/Media/GoVi/Proyects/Github/Blender-Proyects"
NOTIFY(){
    notify-send -i '/usr/share/icons/GoVi/emblems/22/emblem-information.svg' "Info" "Complete" -t 5000 &
    paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    }

# Move to Repository
[ ! -d "$REPO"/Blender ] &&
    mv "/Media/GoVi/Proyects/Blender" "$REPO"
[ ! -d "$REPO"/Blender ] &&[ ! -d "$REPO"/Blender ] &&
    mv "/Media/GoVi/Proyects/Blender" "$REPO"
    mv "/Media/GoVi/Proyects/Blender" "$REPO"
# Menu
while true; do
    clear && echo
    echo 'Choose an option: ====== >>>'
    echo
    echo ' 1) Update Characters.blend'
    echo ' 2) Update Trees.blend'
    echo ' U) Upload to Github'
    echo ' Q) Quit'
    echo
    echo '<<< ========================'
    echo

# Compress if files differ
    read -rsn1 INPUT
    case $INPUT in
        1) cd "$REPO/Blender/Characters"
        zip -s 48m -u -r -v "Characters.blend.zip" "Characters.blend"
        mv *.z* "$REPO/Blender/Characters/Characters.blend.zips" &&
        NOTIFY
        ;;
        2) cd "$REPO/Blender/Trees"
        zip -s 48m -u -r -v "Trees.blend.zip" "Trees.blend"
        mv *.z* "$REPO/Blender/Trees/Trees.blend.zips"
        NOTIFY
        ;;
        U|u) break;;
        Q|q) exit;;
        *) echo -e " \"$INPUT\" is an invalid option" && sleep 2;;
    esac
done

# Checking if are Updates to push
echo -e '\nUploading to Github...\n'; sleep 2
cd "$REPO"
GIT_SYNC="$(git diff --stat)"
[[ "$GIT_SYNC(wc -L)" == 0 ]] && echo 'Nothing to Update' && sleep 4 && exit

# Git token
TOKEN="$(awk 'NR==3' ~/.git_token)"
git remote remove origin
git remote add origin https://$TOKEN@github.com/GoVi-48/Blender-Proyects.git

# Push to Github
git add .
git commit -m "Updated"
git push -u origin main

NOTIFY

# Move to Source
mv "$REPO/Blender" "/Media/GoVi/Proyects/Blender"

# Open Github
while true; do
    echo -e '\nPress "Enter" to Open Github or "Escape" to Exit\n'
    read -rsn1 INPUT
    if [[ $INPUT = "" ]]; then
        echo "Opening Github..."
        sleep 2
        brave "https://github.com/GoVi-48/Blender-Proyects"
        exit
    elif [[ $INPUT = $'\e' ]]; then
        exit
    else
        sleep 10 &&
        brave "https://github.com/GoVi-48/GoVi-Proyects"
        exit
    fi
done

