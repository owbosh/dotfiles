#!/bin/bash
# Install paru
cd /tmp && git clone https://aur.archlinux.org/paru.git &&
cd paru && makepkg -si &&

