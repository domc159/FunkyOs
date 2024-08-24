#!/bin/bash
cd 
sudo pacman -S --noconfirm --needed base-devel git 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S --noconfirm paru

cd FunkyOS
paru -S --needed --noconfirm - < packets.txt
mv -r ~/.config ~/.config_bak
cp -r config ~/.config

bash ./grub.sh



