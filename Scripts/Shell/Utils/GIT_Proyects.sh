#!/usr/bin/env bash

# Github Repository
REPO="/Media/GoVi/Proyects/Github/GoVi-Proyects"
NOTIFY(){
    notify-send -i '/usr/share/icons/GoVi/emblems/22/emblem-information.svg' "Info" "Complete" -t 5000 &
    paplay $HOME/.local/share/sounds/cause-and-effect.ogg
    }

# Move to Repository
[ ! -d "$REPO"/Blender ] &&
    mv "/Media/GoVi/Proyects/Blender" "$REPO/Blender"

[ ! -d "$REPO"/Substance_Painter ] &&
    mv "/Media/GoVi/Proyects/Substance_Painter" "$REPO/Substance_Painter"

# Menu
while true; do
    clear && echo
    echo 'Choose an option: ====== >>>'
    echo
    echo ' 1) Update Characters.blend'
    echo ' 2) Update Trees.blend'
    echo ' 3) Update Troll.spp'
    echo ' 4) Update Substance materials'
    echo ' 5) Update Substance smart-materials'
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
        mv *.z* "$REPO/Blender/Characters.blend.zips" &&
        NOTIFY
        ;;
        2) cd "$REPO/Blender/Trees"
        zip -s 48m -u -r -v "Trees.blend.zip" "Trees.blend"
        mv *.z* "$REPO/Blender/Trees.blend.zips"
        NOTIFY
        ;;
        3) cd "$REPO/Substance_Painter/Characters/Troll"
        zip -s 48m -u -r -v "Troll.spp.zip" "Troll.spp"
        mv *.z* "$REPO/Substance_Painter/Troll.spp.zips"
        NOTIFY
        ;;
        4) cd "$REPO/Substance_Painter/Library"
        zip -s 48m -u -r -v "materials.zip" "materials"
        mv *.z* "$REPO/Substance_Painter/Library/materials.zips"
        mv ./materials.zips/smart-materials.zips .
        NOTIFY
        ;;
        5) cd "$REPO/Substance_Painter/Library"
        zip -s 48m -u -r -v "smart-materials.zip" "smart-materials"
        mv *.z* "$REPO/Substance_Painter/Library/smart-materials.zips"
        mv ./smart-materials.zips/materials.zips .
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
git remote add origin https://$TOKEN@github.com/GoVi-48/GoVi-Proyects.git

# Push to Github
git add .
git commit -m "Updated"
git push -u origin main

NOTIFY

# Move to Source
mv "$REPO/Blender" "/Media/GoVi/Proyects/Blender"
mv "$REPO/Substance_Painter" "/Media/GoVi/Proyects/Substance_Painter"

# Open Github
while true; do
    echo -e '\nPress "Enter" to Open Github or "Escape" to Exit\n'
    read -rsn1 INPUT
    if [[ $INPUT = "" ]]; then
        echo "Opening Github..."
        sleep 2
        firefox "https://github.com/GoVi-48/GoVi-Proyects"
        exit
    elif [[ $INPUT = $'\e' ]]; then
        exit
    elif
        sleep 10
        firefox "https://github.com/GoVi-48/GoVi-Proyects"
        exit
    else
        echo "Invalid Key"
    fi
done

