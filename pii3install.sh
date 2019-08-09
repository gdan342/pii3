#!/bin/bash

#   ____  _ _ _____   ___           _        _ _
#  |  _ \(_|_)___ /  |_ _|_ __  ___| |_ __ _| | |
#  | |_) | | | |_ \   | || '_ \/ __| __/ _` | | |
#  |  __/| | |___) |  | || | | \__ \ || (_| | | |
#  |_|   |_|_|____/  |___|_| |_|___/\__\__,_|_|_| by Brett Ling

# Raspian Buster Lite i3wm Install Script

# Update and Upgrade
printf -- 'Updating and Upgrading...'
sudo apt-get update -y && sudo apt-get upgrade -y
set -e

# install display server
printf -- 'Installing xserver...'
sudo apt-get install --no-install-recommends xserver-xorg -y && sudo apt-get install --no-install-recommends xinit --yes
set -e
sudo touch ~/.xinitrc
set -e
echo '#!/bin/sh' >> ~/.xinitrc
set -e
echo 'exec i3' >> ~/.xinitrc
set -e

# install i3wm
#printf -- 'Installing i3 and tools...'
sudo apt-get install i3 suckless-tools lxterminal dmenu --yes
set -e

# install basic tools
sudo apt-get install htop ranger neofetch feh git  wget --yes
set -e

# install graphical tools
sudo apt-get install chromium-browser vlc pcmanfm synaptic --yes

# install pip and pip packages
sudo apt-get install python-pip --yes
set -e

# Reboot
reboot
