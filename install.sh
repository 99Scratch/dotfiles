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
	if [ ! -f /usr/share/scite/locale.properties ] 
	then
		echo "copying german locale for scite"
		sudo cp locale.de.properties /usr/share/scite/locale.properties
	fi
fi

# copy vim plugins
cp -r vim/* ~/.vim/

# dir for the snippetsEmu vim script
if [ ! -d ~/.vim/after/ftplugin ]
then
	echo "creating ~/.vim/after/ftplugin"
	mkdir -p ~/.vim/after/ftplugin
fi

