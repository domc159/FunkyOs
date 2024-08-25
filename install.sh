#!/bin/bash
cd 
sudo pacman -S --noconfirm --needed base-devel git 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S --noconfirm paru

cd FunkyOS
sudo pacman -S --needed --noconfirm cosmic firefox os-prober grub-customizer qt5-graphicaleffects qt5-quickcontrols qt5-quickcontrols2 sddm hyprland fastfetch nemo rofi swappy swaync waybar nerd-fonts rofi wofi code konsole power-profiles-daemon upower acpi acpid fish vlc
yay -S --needed --noconfirm wallust wlogout
cp -r ~/FunkyOs/config/* ~/.config/

sudo chmod 777 ~/.config/hypr/UserScripts/*
sudo chmod 777 ~/.config/hypr/scripts/*



