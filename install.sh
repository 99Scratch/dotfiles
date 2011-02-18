#!/bin/bash
cp bashrc ~/.bashrc
cp bash_aliases ~/.bash_aliases
cp screenrc ~/.screenrc
cp vimrc ~/.vimrc
cp gitconfig  ~/.gitconfig
cp SciTEUser.properties ~/.SciTEUser.properties
cp -r bin ~
if [ -d /usr/share/scite ] 
then
	sudo cp locale.de.properties /usr/share/scite/locale.properties
#	echo "scite locale de copied"
fi

