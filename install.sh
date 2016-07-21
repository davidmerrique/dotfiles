#!/bin/bash

export DOTFILES=$HOME/.dotfiles

BASE="$DOTFILES/home"
DEST=$HOME

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
. "lib/postinstall"

# deleting stale links, if any
for i in $HOME/.*; do
	[ ! -h $i ] && continue

	if [ ! -f $i ]; then
		echo "Deleting stale link: $i"
		rm $i
	fi
done
