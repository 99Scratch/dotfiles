#!/bin/bash
set -u
set -o xtrace
trap "echo ABBRUCH ; exit 1" SIGINT

# as root
if [ $UID -eq 0 ]
then
  useradd -m -G wheel -s /bin/bash strubbl
  mkdir /home/strubbl
  chown strubbl: /home/strubbl
  passwd strubbl
  pacman -Syu
  pacman -S sudo
  echo "%sudo	ALL=(ALL) ALL" >> /etc/sudoers
  usermod -a -G sudo strubbl

# as user
else
  sudo pacman -S --needed base-devel

  # non-gui
  sudo pacman -S sudo git vim bash-completion cowsay fortune-mod openssh sshuttle screen tmux curl wget go go-tools nmap bind-tools htop nethogs smartmontools usbutils vnstat zsh zsh-completions whois

  # GUI
  sudo pacman -S i3 mpv firefox pidgin pidgin-otr gimp libreoffice chromium file-roller gedit gnome-terminal gparted gwenview kile liteide meld midori okular opera screenfetch xnviewmp volumeicon mpv

  # Network Manager
  sudo pacman -S networkmanager network-manager-applet

  # yaourt
  mkdir ~/git && cd ~/git
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
fi

