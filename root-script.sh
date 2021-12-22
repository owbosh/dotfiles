#!/bin/bash

# sudo no password rights
sed -i 's/^# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
# pacman parallel downloads
sed -i 's/^#Para/Para/' /etc/pacman.conf
# pacman colors
sed -i 's/^#Color/Color/' /etc/pacman.conf
# enable multilib repo
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
pacman -Sy --noconfirm
# /etc/zshenv needed to make zsh look in ~/.config/zsh/
mkdir -p /etc/zsh
cp -f $(dirname $(realpath "$0"))/etc/zsh/zshenv /etc/zsh
# nvidia generated xorg.conf
cp -f $(dirname $(realpath "$0"))/etc/X11/xorg.conf /etc/X11/
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
fzf \
gnome-epub-thumbnailer \
imagemagick \
keepassxc \
libva-vdpau-driver \
linux-headers \
meson \
mpv \
neovim \
ninja \
noto-fonts-cjk \
noto-fonts-emoji \
picom \
poppler \
ranger \
rofi \
steam \
ttf-fira-sans \
wget \
xclip \
xcolor \
xdotool \
yt-dlp \
zsh \
zsh-autosuggestions \
zsh-syntax-highlighting \


