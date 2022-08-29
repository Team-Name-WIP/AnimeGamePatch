#!/bin/bash

cd $HOME || exit 1
if [ -f "$PREFIX/bin/zex" ]; then
    rm $PREFIX/bin/zex
fi
if [ -d "$PREFIX/usr/share/animegamepatch" ]; then
    rm -rf "$PREFIX/usr/share/animegamepatch"
fi
folderName="AnimeGamePatch"
if ! command -v git &> /dev/null; then
    sudo apt install git -y
fi
clear
echo "Download Script..."
sleep 1s
if [ -d "$folderName" ]; then
    rm -rf "$folderName"
fi
git clone https://github.com/ElaXan/AnimeGamePatch.git
if [[ $? != 0 ]]; then
    echo "Install Failed!"
    exit 1
fi
cd $folderName
mv zex.sh $PREFIX/bin/zex
chmod +x $PREFIX/bin/zex
if [ -d "$PREFIX/usr/share/animegamepatch" ]; then
    rm -rf "$PREFIX/usr/share/animegamepatch"
fi
mv animegamepatch $PREFIX/usr/share
chmod +x /usr/share/animegamepatch/*
rm -rf $HOME/$folderName
if [ -f "$PREFIX/bin/zex" ] || [ -d "$PREFIX/usr/share/animegamepatch" ]; then
    clear
    echo "Install Success!!"
    echo "now enter command : zex"
    exit
else
    clear
    echo "Install Failed!"
    exit
fi
