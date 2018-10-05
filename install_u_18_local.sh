#!/bin/bash

# Dieses kleine Script uebernimmt die Installation von nautilus-scripts
# Aufruf in dem Verzeichnis, in dem das zu installierende Script liegt
#
# This script install nautilus-scripts from the current directory.
# ubuntu 18.04!!
#
# Author: Joerg Sorge
# Distributed under the terms of GNU GPL version 2 or later
# Copyright (C) Joerg Sorge joergsorge at googell
# 2018-10-05

echo ""
echo "Install Nautilus-Scripts local..."
echo "You may this script running at least on ubuntu 18.04!!!"
echo ""
read -p "Are you sure to proceed? (y/n) " -n 1
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
	echo ""
	echo "Installation aborted"
	exit
fi

for file in $PWD/*
do
   :
	if [ $(basename "$file") = "install_u_18_local.sh" ]
		then
            echo "skip $(basename "$file")"
            continue
	fi
	if [ $(basename "$file") = "update_nautilus_scripts.sh" ]
		then
            echo "skip $(basename "$file")"
            continue
	fi
	if [ $(basename "$file") = "README.md" ]
        then
            echo "skip $(basename "$file")"
            continue
	fi
    if [ $(basename "$file") = "LICENSE" ]
        then
            echo "skip $(basename "$file")"
            continue
	fi

	filename=$(basename "$file")
    # keep off extentions
	#filename="${filename%.*}"
    # Replace undelines with spaces for better reading nautilus menu
    filename=$(echo "$filename" | sed -r 's/[_]+/ /g')
    echo "copy $(basename "$file") to $filename"
	cp $file "/home/$USER/.local/share/nautilus/scripts/$filename"
	chmod u+x "/home/$USER/.local/share/nautilus/scripts/$filename"

done

echo ""
echo "Install libs..."
sudo apt install \
lame mp3val libid3-tools mp3gain mp3info sox ffmpeg libsox-fmt-mp3 \
curl gawk links libtranslate-bin

# nautius reset
nautilus -q
echo ""
echo "finito"
exit
