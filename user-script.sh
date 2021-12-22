#!/bin/bash
# sudo no password rights
sudo sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
# pacman parallel downloads
sudo sed -i 's/^#Para/Para/' /etc/pacman.conf
# pacman colors
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
# enable multilib repo
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Sy --noconfirm
# /etc/zshenv needed to make zsh look in ~/.config/zsh/
sudo mkdir -p /etc/zsh
sudo cp -f $(dirname $(realpath "$0"))/etc/zsh/zshenv /etc/zsh
# nvidia generated xorg.conf
sudo cp -f $(dirname $(realpath "$0"))/etc/X11/xorg.conf /etc/X11/
# install official repo packages
sudo pacman -S --needed --noconfirm \
amd-ucode \
base-devel \
bat \
bspwm \
cmake \
code \
discord \
dunst \
extra-cmake-modules \
feh \
ffmpegthumbnailer \
firefox \
firefox-dark-reader \
firefox-ublock-origin \
fzf \
gnome-epub-thumbnailer \
imagemagick \
keepassxc \
libva-vdpau-driver \
linux-headers \
meson \
mpv \
neofetch \
neovim \
ninja \
noto-fonts-cjk \
noto-fonts-emoji \
picom \
poppler \
ranger \
rofi \
steam \
sxhkd \
ttf-fira-sans \
ueberzug \
wget \
xclip \
xcolor \
xdotool \
yt-dlp \
zsh \
zsh-autosuggestions \
zsh-syntax-highlighting \
# copy in config files
mkdir -p ~/.config
cp -rf $(dirname $(realpath "$0"))/.config/* ~/.config
# copy in scripts
mkdir -p ~/.local/bin
cp -rf $(dirname $(realpath "$0"))/.local/bin/* ~/.local/bin
# set wallpaper
mkdir -p ~/img/wallpapers
cp $(dirname $(realpath "$0"))/swamp.jpg ~/img/wallpapers
cp -l ~/img/wallpapers/swamp.jpg ~/img/wallpapers/.current-wall
# install paru
cd /tmp && git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin && makepkg -si
# install aur packages
paru -S --needed --noconfirm \
code-marketplace \
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
cd st && sudo make install
# install personal sxiv
cd ~/repo && git clone https://github.com/owbosh/sxiv
cd sxiv && sudo make install
update-desktop-database ~/.local/share/applications
# change shell
chsh -s /bin/zsh owbosh
# done
echo "Complete, exit back to the live environment and reboot"