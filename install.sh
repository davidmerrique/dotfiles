#!/bin/bash

export DOTFILES=$HOME/.dotfiles

BASE="$DOTFILES/home"
DEST=$HOME
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

link() {
	for i in $(find $1 -mindepth 1 -maxdepth 1); do
		file=$DEST${i/$BASE/""}

		if [ ! -d $i ]; then
			if [ -f $file -o -h $file ]; then
				echo "Replacing file: $file"
				rm $file
			else
				echo "Creating link: $file"
			fi

			ln -s $i $file
		else
			if [ ! -d "$file" ]; then
				echo "Creating directory: $file"
				mkdir $file
			fi

			link $i
		fi
	done
}

link $BASE
. "lib/postinstall.sh"

IFS=$SAVEIFS
