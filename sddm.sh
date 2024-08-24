#!/bin/bash

# Preveri, če je skripta zagnana s sudo
if [[ $EUID -ne 0 ]]; then
   echo "Prosimo, zaženite skripto s sudo."
   exit 1
fi

# Preveri, če mapa sddm_theme obstaja
if [ ! -d "sddm_theme" ]; then
  echo "Mapa sddm_theme ne obstaja v trenutnem imeniku. Preveri, ali si jo pravilno prenesel."
  exit 1
fi

# Preveri, če ima mapa sddm_theme datoteko theme.conf (običajno za SDDM temo)
if [ ! -f "sddm_theme/theme.conf" ]; then
  echo "V mapi sddm_theme ni datoteke theme.conf. Preveri, ali je tema pravilno prenesena."
  exit 1
fi

# Ustvari imenik za teme SDDM (če še ne obstaja)
sudo mkdir -p /usr/share/sddm/themes

# Kopiraj temo v /usr/share/sddm/themes
sudo cp -r sddm_theme /usr/share/sddm/themes/

# Nastavi novo temo v SDDM konfiguraciji
THEME_NAME=$(basename "sddm_theme")
SDDM_CONF_FILE="/etc/sddm.conf"

# Preveri, ali obstaja konfiguracijska datoteka za SDDM
if [ ! -f "$SDDM_CONF_FILE" ]; then
    echo "[Theme]" | sudo tee -a $SDDM_CONF_FILE
    echo "Current=$THEME_NAME" | sudo tee -a $SDDM_CONF_FILE
else
    # Uredi obstoječo konfiguracijsko datoteko, da nastavi novo temo
    if grep -q 'Current=' $SDDM_CONF_FILE; then
        sudo sed -i "s|^Current=.*|Current=$THEME_NAME|" $SDDM_CONF_FILE
    else
        sudo sed -i "/^\[Theme\]/a Current=$THEME_NAME" $SDDM_CONF_FILE
    fi
fi

echo "SDDM tema je uspešno nameščena in nastavljena."
