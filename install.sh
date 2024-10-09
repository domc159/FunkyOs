#!/bin/bash
cd 
sudo pacman -S --noconfirm --needed base-devel git 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S --noconfirm paru

cd FunkyOS
yay -S --noconfirm hyprpaper hyprpicker hypridle hyprlock hyprcursor xdg-desktop-portal-hyprland xorg-xwayland xwaylandvideobridge os-prober grub-customizer qt5-graphicaleffects qt5-quickcontrols qt5-quickcontrols2 qt5-svg qt5-quickcontrols-nemo sddm fastfetch kitty nemo rofi swappy swaync wallust waybar wlogout nerd-fonts wofi code konsole power-profiles-daemon upower acpi acpid fish uwsm
cp -r ~/FunkyOs/config/* ~/.config/

sudo chmod 777 ~/.config/hypr/UserScripts/*
sudo chmod 777 ~/.config/hypr/scripts/*



