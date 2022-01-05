#!/usr/bin/env bash

# Github Repository
REPO="/Media/GoVi/Proyects/Github/GoVi-Proyects"

# Move to Repository
[ ! -d "$REPO"/Blender ] &&
    mv "/Media/GoVi/Proyects/Blender" "/Media/GoVi/Proyects/Github/GoVi-Proyects/Blender"

[ ! -d "$REPO"/Substance_Painter ] &&
    mv "/Media/GoVi/Proyects/Substance_Painter" "/Media/GoVi/Proyects/Github/GoVi-Proyects/Substance_Painter"

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
        1) cd "$REPO/Blender/Characters.blend.zips"
           [ -f "./Characters.blend.zip" ] && echo 'File already exist' && sleep 3 && break
           cd ../Characters && zip -s 48m -u -r "Characters.blend.zip" "Characters.blend"
           mv *.z* "$REPO/Blender/Characters.blend.zips"
           ;;
        2) cd "$REPO/Blender/Trees.blend.zips"
           [ -f "./Trees.blend.zip" ] && echo 'File already exist' && sleep 3 && break
           cd ../Trees && zip -s 48m -u -r "Trees.blend.zip" "Trees.blend"
           mv *.z* "$REPO/Blender/Trees.blend.zips"
           ;;
        3) cd "$REPO/Substance_Painter/Troll.spp.zips"
           [ -f "./Troll.spp.zip" ] && echo 'File already exist' && sleep 3 && break
           cd ../Characters/Troll && zip -s 48m -u -r "Troll.spp.zip" "Troll.spp"
           mv *.z* "$REPO/Substance_Painter/Troll.spp.zips"
           ;;
        4) cd "$REPO/Substance_Painter/Library/materials.zips"
           [ -f "./materials.zip" ] && echo 'File already exist' && sleep 3 && break
           cd .. && zip -s 48m -u -r "materials.zip" "materials"
           mv *.z* "$REPO/Substance_Painter/Library/materials.zips"
           mv ./materials.zips/smart-materials.zips .
           ;;
        5) cd "$REPO/Substance_Painter/Library/smart-materials.zips"
           [ -f "./smart-materials.zip" ] && echo 'File already exist' && sleep 3 && break
           cd .. && zip -s 48m -u -r "smart-materials.zip" "smart-materials"
           mv *.z* "$REPO/Substance_Painter/Library/smart-materials.zips"
           mv ./smart-materials.zips/materials.zips .
           ;;
        U|u) break;;
        Q|q) exit;;
        *) echo -e " \"$INPUT\" is an invalid option" && sleep 2;;
    esac
done

# Git token
TOKEN="$(awk 'NR==3' ~/.git_token)"
git remote remove origin
git remote add origin https://$TOKEN@github.com/GoVi-48/GoVi-Proyects.git

# Checking if are Updates to push
cd "$REPO"
GIT_SYNC="$(git diff --stat)"
[[ "$GIT_SYNC(wc -L)" == 0 ]] && echo 'Nothing to Update' && exit

# Push to Github
echo -e '\nUploading to Github...\n'; sleep 2
git add .
git commit -m "Updated"
git push -u origin main

# Notify
notify-send -i '/usr/share/icons/GoVi/emblems/22/emblem-information.svg' "Info" " Backup Complete" -t 5000 &
paplay $HOME/.local/share/sounds/cause-and-effect.ogg

# Move to Source
mv "/Media/GoVi/Proyects/Github/GoVi-Proyects/Blender" "/Media/GoVi/Proyects/Blender"
mv "/Media/GoVi/Proyects/Github/GoVi-Proyects/Substance_Painter" "/Media/GoVi/Proyects/Substance_Painter"

# Open Github
while true; do
    echo -e '\nPress "Enter" to Open Github or "Escape" to Exit\n'
    read -rsn1 INPUT
    if [[ $INPUT = "" ]]; then
        echo "Opening Github..."
        sleep 2
        firefox https://github.com/GoVi-48/GoVi-Proyects
        exit
    elif [[ $INPUT = $'\e' ]]; then
        exit
    elif
        sleep 10
        firefox https://github.com/GoVi-48/GoVi-Proyects
        exit
    else
        echo "Invalid Key"
    fi
done

