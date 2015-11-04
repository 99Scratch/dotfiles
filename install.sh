#!/bin/bash

VERBOSE_FLAG="" # for debug purpose set to -v
#VERBOSE_FLAG="-v" # for debug purpose set to -v

# git submodules
git submodule init
git submodule update

cp $VERBOSE_FLAG bashrc ~/.bashrc
cp $VERBOSE_FLAG aliases ~/.aliases
cp $VERBOSE_FLAG bash_profile ~/.bash_profile
cp $VERBOSE_FLAG -r bin ~
cp $VERBOSE_FLAG screenrc ~/.screenrc
cp $VERBOSE_FLAG vimrc ~/.vimrc

if [ ! -f ~/.gitconfig ]
then
  cp $VERBOSE_FLAG gitconfig  ~/.gitconfig
fi

# VIM
# clean up personal vim dir
if [ -d ~/.vim ]
then
  rm -rf ~/.vim
fi
# vim plugins
mkdir ~/.vim
cp $VERBOSE_FLAG -r vim/* ~/.vim/
# vundle initialisation
vim +PluginInstall +qall


# i3
if [ -d ~/.i3 ]
then
  rm -rf ~/.i3
fi
cp $VERBOSE_FLAG -r i3 ~/.i3

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
		sudo cp $VERBOSE_FLAG locale.de.properties /usr/share/scite/locale.properties
	fi
  cp $VERBOSE_FLAG SciTEUser.properties ~/.SciTEUser.properties
fi

# radiotray
if [ -x /usr/bin/radiotray ]
then
	radiotraydir="$HOME/.local/share/radiotray/"
	if [ ! -d $radiotraydir ]
	then
		mkdir -p $radiotraydir
		echo $?
	fi
	cp $VERBOSE_FLAG radiotray/config.xml $radiotraydir
	cp $VERBOSE_FLAG radiotray/bookmarks.xml $radiotraydir
fi

# no capslock pls
cp $VERBOSE_FLAG Xmodmap ~/.Xmodmap

# initialiaze gibo
cp $VERBOSE_FLAG gibo/gibo ~/bin/
cp $VERBOSE_FLAG gibo/gibo-completion.bash ~/.bash_completion.d/
~/bin/gibo -u

if [ -d ~/.local/share/applications/ ]
then
  cp $VERBOSE_FLAG mimeapps.list ~/.local/share/applications/mimeapps.list
fi

# dunst
if [ -x /usr/bin/dunst ]
then
  if [ ! -d ~/.config/dunst/ ]
  then
    mkdir -p ~/.config/dunst/
  fi

  cp $VERBOSE_FLAG dunstrc ~/.config/dunst/dunstrc

  if [ -d ~/.config/systemd/user/ ]
  then
    cp $VERBOSE_FLAG systemd/dunst.service ~/.config/systemd/user/
  fi

  if [ -x /usr/bin/systemctl  ] && [ ! -f .config/systemd/user/default.target.wants/dunst.service ]
  then
    systemctl --user enable dunst.service
    systemctl --user start dunst.service
  fi
fi

# global gitignore
if [ ! -d $HOME/.config/git/ ]
then
  mkdir -p $HOME/.config/git/
fi
if [ -d $HOME/.config/git/ ]
then
  cp $VERBOSE_FLAG gitignore $HOME/.config/git/ignore
fi

# zsh
if [ -d $HOME/.oh-my-zsh ]
then
  rm -rf $HOME/.oh-my-zsh
fi
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp zshrc ~/.zshrc
cp bullet-train-oh-my-zsh-theme/bullet-train.zsh-theme ~/.oh-my-zsh/themes/

