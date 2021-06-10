#!/bin/bash

# Source
# https://github.com/HansKristian-Work/vkd3d-proton/releases

DIR=$(dirname "$(realpath "$0")")

cd "$DIR"

wget https://github.com/HansKristian-Work/vkd3d-proton/releases/download/v2.3.1/vkd3d-proton-2.3.1.tar.zst

tar xvzf "$DIR"/vkd3d-proton-2.3.1.tar.zst -C "$DIR"
rm -rfv "$DIR"/vkd3d-proton-2.3.1.tar.zst


[ ! -d "$DIR/wine-build" ] &&
echo "There is no wine-build to insert dlls" &&
echo "Put this script and the vkd3d release in the same directory of the wine-build you want to insert the libraries" &&
exit

mv "$DIR/wine-build/dist/lib/wine/vkd3d-proton/d3d12.dll" "$DIR/wine-build/dist/lib/wine/vkd3d-proton/d3d12.dll.old"
mv "$DIR/wine-build/dist/lib64/wine/vkd3d-proton/d3d12.dll" "$DIR/wine-build/dist/lib64/wine/vkd3d-proton/d3d12.dll.old"

cp  "$DIR/vkd3d-proton-2.3.1/x86/d3d12.dll" "$DIR/wine-build/dist/lib/wine/vkd3d-proton/"
cp  "$DIR/vkd3d-proton-2.3.1/x64/d3d12.dll" "$DIR/wine-build/dist/lib64/wine/vkd3d-proton/"