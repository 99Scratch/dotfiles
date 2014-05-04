#!/bin/bash
cp bashrc ~/.bashrc
cp bash_aliases ~/.bash_aliases
cp -r bin ~
cp gitconfig  ~/.gitconfig
cp screenrc ~/.screenrc
cp vimrc ~/.vimrc

# clean up personal vim dir
if [ -d ~/.vim ]
then
  rm -rf ~/.vim
fi
# vim plugins
mkdir ~/.vim
cp -r vim/* ~/.vim/

# i3
if [ -d ~/.i3 ]
then
  rm -rf ~/.i3
fi
cp -r i3 ~/.i3

# bash-completion
if [ ! -d ~/.bash_completion.d ]
then
	mkdir ~/.bash_completion.d
fi

# scite
if [ -d /usr/share/scite ] 
then
	if [ ! -f /usr/share/scite/locale.properties ] 
	then
		echo "copying german locale for scite"
		sudo cp locale.de.properties /usr/share/scite/locale.properties
	fi
  cp SciTEUser.properties ~/.SciTEUser.properties
fi

# radiotray
if [ -x /usr/bin/radiotray ]
then
	radiotraydir="$HOME/.local/share/radiotray/"
	echo "copying radio tray config and senders"
	if [ ! -d $radiotraydir ]
	then
		mkdir -p $radiotraydir
		echo $?
	fi
	cp radiotray/config.xml $radiotraydir
	cp radiotray/bookmarks.xml $radiotraydir
fi

# no capslock pls
cp Xmodmap ~/.Xmodmap

# git submodules
git submodule init
git submodule update

# git-flow installation
if [ ! -x /usr/local/bin/git-flow ]
then
	wget --no-check-certificate -q -O - https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh | sudo bash
fi

# git-flow-completion
if [ -x /usr/local/bin/git-flow ]
then
  cp gitflowcompletion/git-flow-completion.bash ~/.bash_completion.d/
fi

# initialiaze gibo
cp gibo/gibo ~/bin/
cp gibo/gibo-completion.bash ~/.bash_completion.d/
~/bin/gibo -u

# vundle initialisation
vim +BundleInstall +qall

if [ -d ~/.local/share/applications/ ]
then
  cp mimeapps.list ~/.local/share/applications/mimeapps.list
fi

