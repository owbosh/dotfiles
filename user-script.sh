#!/bin/bash
# copy in config files
mkdir -p ~/.config
cp -rf $(dirname $(realpath "$0"))/.config/* ~/.config
# copy in scripts
mkdir -p ~/.local/bin
cp -rf $(dirname $(realpath "$0"))/.local/bin/* ~/.local/bin
# set wallpaper
mkdir -p ~/img/wallpapers
cp $(dirname $(realpath "$0"))/swamp.jpg ~/img/wallpapers
cp -l ~/img/wallpapers/swamp.jpg ~/img/wallpapers/.current-wallpaper
# install paru
cd /tmp && git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin && makepkg -si
# install aur packages
paru -S --needed --noconfirm \
dashbinsh \
dracula-gtk-theme \
dracula-icons-git \
dragon-drag-and-drop-git \
nerd-fonts-jetbrains-mono \
pmount \
polybar \
# make home directories
xdg-user-dirs-update
mkdir -p ~/repo
# install personal st
cd ~/repo && git clone https://github.com/owbosh/st
cd st && make DESTDIR=~/ PREFIX=.local install
# install personal sxiv
cd ~/repo && git clone https://github.com/owbosh/sxiv
cd sxiv && make DESTDIR=~/ PREFIX=.local APP_PREFIX=.local/share/applications install
update-desktop-database ~/.local/share/applications
# change shell
chsh -s /bin/zsh owbosh
# done
echo "Complete, exit back to the live environment and reboot"