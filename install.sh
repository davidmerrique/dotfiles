#!/bin/bash

export DOTFILES=$HOME/.dotfiles

BASEDIR="$DOTFILES/home"
DEST=$HOME

link() {
	for i in $(find $1 -mindepth 1 -maxdepth 1); do
		BASEFILE=$DEST/$(realpath --relative-to="$BASEDIR" "$i")
		FILEDIR=`dirname $i`
		FILE=`basename $i`

		if [ ! -d $i ]; then
			if [ -f $BASEFILE -o -h $BASEFILE ]; then
		    echo "Replacing file: $BASEFILE"
		    rm $BASEFILE
			else
		    echo "Creating link: $BASEFILE"
			fi

			ln -s $i $BASEFILE
		else
			if [ ! -d "$BASEFILE" ]; then
				echo "Creating directory: $BASEFILE"
			  mkdir $BASEFILE
			fi

			link $i
		fi
	done
}

link $BASEDIR
. "hooks/post-up"

# deleting stale links, if any
for i in $HOME/.*; do
  [ ! -h $i ] && continue

  if [ ! -f $i ]; then
    echo "Deleting stale link: $i"
    rm $i
  fi
done
