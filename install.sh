#!/bin/bash
cd 
sudo pacman -S --noconfirm --needed base-devel git 
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S --noconfirm paru

cd FunkyOS
paru -S --needed --noconfirm cosmic firefox os-prober grub-customizer qt5-graphicaleffects qt5-quickcontrols qt5-quickcontrols2 qt5-svgqt5-quickcontrols-nemo sddm chromium hyprland fastfetch kitty nemo rofi swappy swaync wallust waybar wlogout nerd-fonts rofi wofi code konsole power-profiles-daemon upower acpi acpid fish 
cp ~/FunkyOs/config/* ~/.config



