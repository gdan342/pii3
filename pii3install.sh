#!/bin/bash

#   ____  _ _ _____   ___           _        _ _
#  |  _ \(_|_)___ /  |_ _|_ __  ___| |_ __ _| | |
#  | |_) | | | |_ \   | || '_ \/ __| __/ _` | | |
#  |  __/| | |___) |  | || | | \__ \ || (_| | | |
#  |_|   |_|_|____/  |___|_| |_|___/\__\__,_|_|_| by Brett Ling

# Raspian Buster Lite i3wm Install Script

# Update and Upgrade
sudo apt-get install update && sudo apt-get install Upgrade

# install display server
sudo apt-get install --no-install-recommends xserver-xorg && sudo apt-get install --no-install-recommends xinit --yes
sudo mkfile ~/.xinitrc
echo '#!/bin/sh' >> ~/.xinitrc
echo 'exec i3' >> ~/.xinitrc

# install i3wm
sudo apt-get install i3 suckless-tools lxterminal dmenu --yes

# install basic tools
sudo apt-get install htop ranger neofetch feh git  wget --yes

# install graphical tools
sudo apt-get install chromium-browser vlc pcmanfm synaptic --yes
# install pip and pip packages
sudo apt-get install python-pip --yes

# install python packages
pip install lolcat pywal

reboot
