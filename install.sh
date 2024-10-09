#!/bin/bash
cd 
sudo pacman -S --noconfirm --needed base-devel git 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S --noconfirm paru

cd FunkyOS
yay -S --needed --noconfirm 
cp -r ~/FunkyOs/config/* ~/.config/

sudo chmod 777 ~/.config/hypr/UserScripts/*
sudo chmod 777 ~/.config/hypr/scripts/*



