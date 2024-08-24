#!/bin/bash

# Preveri, če je skripta zagnana s sudo
if [[ $EUID -ne 0 ]]; then
   echo "Prosimo, zaženite skripto s sudo."
   exit 1
fi

# Namesti GRUB in os-prober
echo "Namestitev GRUB in os-prober..."
pacman -S --needed grub os-prober

# Namesti GRUB na disk (posodobite /dev/sdX glede na vaš sistem)
echo "Namestitev GRUB na disk..."
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB

# Posodobi GRUB konfiguracijo in zaženi os-prober
echo "Posodabljanje GRUB konfiguracije..."
os-prober
grub-mkconfig -o /boot/grub/grub.cfg

# Poišče temo v trenutnem direktoriju
script_dir=$(dirname "$(readlink -f "$0")")
theme_dir=$(find "$script_dir" -maxdepth 1 -type d -name "grub_theme")

if [ -z "$theme_dir" ]; then
    echo "GRUB tema ni bila najdena v trenutnem direktoriju."
    exit 1
fi

# Kopira temo v GRUB direktorij
echo "Kopiranje teme v GRUB direktorij..."
cp -r "$theme_dir" /boot/grub/themes/

# Dodajanje teme v GRUB konfiguracijo
theme_name=$(basename "$theme_dir")
if grep -q '^GRUB_THEME=' /etc/default/grub; then
  sed -i "s|^GRUB_THEME=.*|GRUB_THEME=/boot/grub/themes/$theme_name/theme.txt|" /etc/default/grub
else
  echo "GRUB_THEME=/boot/grub/themes/$theme_name/theme.txt" >> /etc/default/grub
fi

# Posodobi GRUB konfiguracijo z novo temo
echo "Posodabljanje GRUB konfiguracije z novo temo..."
grub-mkconfig -o /boot/grub/grub.cfg

echo "GRUB je uspešno nameščen in konfiguriran z izbrano temo."
