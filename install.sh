#!/bin/bash
cd 
sudo pacman -S --noconfirm --needed base-devel git 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S --noconfirm paru




