#!/bin/bash
cp bashrc ~/.bashrc
cp bash_aliases ~/.bash_aliases
cp screenrc ~/.screenrc
cp vimrc ~/.vimrc
cp gitconfig  ~/.gitconfig
cp SciTEUser.properties ~/.SciTEUser.properties
cp -r bin ~

# clean up personal vim dir
if [ -d ~/.vim ]
then
  rm -rf ~/.vim
fi
# copy vim plugins
mkdir ~/.vim
cp -r vim/* ~/.vim/

# scite
if [ -d /usr/share/scite ] 
then
	if [ ! -f /usr/share/scite/locale.properties ] 
	then
		echo "copying german locale for scite"
		sudo cp locale.de.properties /usr/share/scite/locale.properties
	fi
fi

# if radiotray installed, copy its configs
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

# get git submodules: gitflow, gitflow-completion, vundle
git submodule init
git submodule update

# git-flow installation
if [ ! -x /usr/local/bin/git-flow ]
then
	wget --no-check-certificate -q -O - https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh | sudo bash
fi

# git-flow-completion
if [ ! -d ~/.bash_completion.d ]
then
	mkdir ~/.bash_completion.d
fi
cp gitflowcompletion/git-flow-completion.bash ~/.bash_completion.d/

# vundle initialisation
vim +BundleInstall +qall

cp mimeapps.list ~/.local/share/applications/mimeapps.list
