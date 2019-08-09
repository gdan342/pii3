#!/bin/bash

#   ____  _ _ _____   ___           _        _ _
#  |  _ \(_|_)___ /  |_ _|_ __  ___| |_ __ _| | |
#  | |_) | | | |_ \   | || '_ \/ __| __/ _` | | |
#  |  __/| | |___) |  | || | | \__ \ || (_| | | |
#  |_|   |_|_|____/  |___|_| |_|___/\__\__,_|_|_| by Brett Ling

# Raspian Buster Lite i3wm Install Script

# Update and Upgrade
#printf -- 'Updating and Upgrading...'
sudo apt-get update && sudo apt-get Upgrade --yes
set -e

# install display server
printf -- "Installing xserver..."
sudo apt-get install --no-install-recommends xserver-xorg && sudo apt-get install --no-install-recommends xinit --yes
set -e

echo "#!/bin/bash" >> ~/.xinitrc
echo "exec i3" >> ~/.xinitrc
set -e

# install i3wm
printf -- "Installing i3 and tools..."
sudo apt-get install i3 suckless-tools lxterminal dmenu --yes
set -e

# install basic tools
sudo apt-get install htop python-pip ranger neofetch feh git tmux links tty-clock wget --yes
set -e

# install python packages
pip install --upgrade pip
set -e

#startx

# Reboot
reboot
