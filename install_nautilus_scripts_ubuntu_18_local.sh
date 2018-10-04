#!/bin/bash

# Dieses kleine Script uebernimmt die Installation von nautilus-scripts
# Aufruf in dem Verzeichnis, in dem das zu installierende Script liegt
#
# This script install nautilus-scripts from the current directory.
# since ubuntu 13.04
#
# Author: Joerg Sorge
# Distributed under the terms of GNU GPL version 2 or later
# Copyright (C) Joerg Sorge joergsorge at googell
# 2013-07-25


echo "Install Nautilus-Scripts..."

for i in *.*
do
   :
	if [ "$i" = "install_nautilus_scripts_ubuntu_18_local.sh" ]
		then
		continue
	fi
	if [ "$i" = "update_nautilus_scripts.sh" ]
		then
		continue
	fi
	if [ "$i" = "update_nautilus_scripts_ubuntu_18_local.sh" ]
		then
		continue
	fi
    if [ "$i" = "LICENSE" ]
		then
		continue
	fi
    if [ "$i" = "README.md" ]
		then
		continue
	fi
	echo "$i"

	filename=$(basename "$i")
    # replace underlines with spaces for better reading as nautilus scripts
    filename="$filename" | sed -r 's/[_]+/ /g'
	cp $i /home/$USER/.local/share/nautilus/scripts/$filename
	chmod +x /home/$USER/.local/share/nautilus/scripts/$filename

done
echo "Install Libs..."
if [ $UID -eq 0 ] ; then
	sudo apt-get install \
	lame mp3val libid3-tools mp3gain mp3info sox ffmpeg libsox-fmt-mp3 \
	curl gawk links libtranslate-bin
else
	echo "You are not Admin, Install of Libs uncompleted..."
	echo "Maybe, libs already installed. If not: Do so as Admin!"
fi

# nautius reset
nautilus -q

echo "finito"
exit
