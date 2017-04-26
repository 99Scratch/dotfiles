#!/bin/bash

pacman -Syu

pacman -S --needed base-devel

# non-gui
pacman -S sudo git vim bash-completion cowsay fortune-mod openssh sshuttle mpv screen tmux curl wget go go-tools nmap bind-tools htop nethogs smartmontools usbutils vnstat zsh zsh-completions whois

# GUI
pacman -S i3-wm i3lock i3status mpv firefox pidgin pidgin-otr gimp libreoffice chromium file-roller gedit gnome-terminal gparted gwenview kile liteide meld midori okular opera screenfetch xnviewmp volumeicon

# Network Manager
pacman -S networkmanager network-manager-applet

# yaourt

git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..

yaourt -Syua
yaourt -S slurm cntlm visual-studio-code-oss

# TODO
#ntp
#ssh

