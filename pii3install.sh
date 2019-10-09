#!/bin/bash
set -u

#    _______ __________________ ______
#   (  ____ )\__   __/\__   __// ___  \
#   | (    )|   ) (      ) (   \/   \  \
#   | (____)|   | |      | |      ___) /
#   |  _____)   | |      | |     (___ (
#   | (         | |      | |         ) \
#   | )      ___) (______) (___/\___/  /
#   |/       \_______/\_______/\______/

# Raspian Buster Lite i3wm Install Script


echo '      Raspian Lite I3wm Install......'

# Update and Upgrade
echo '     Updating......'
sudo apt-get update
echo '     Upgrading......'
sudo apt-get Upgrade --yes
set -e

# install x server
echo '     Installing X Server......'
sudo apt-get install --no-install-recommends xserver-xorg && sudo apt-get install --no-install-recommends xinit --yes
set -e

#create xinitrc
echo '     Creating .xinitrc......'
touch .xinitrc && echo '#!/bin/bash' >> .xinitrc && echo 'exec i3' >> ~/.xinitrc
set -e

# install i3wm
echo '     Installing I3WM......'
sudo apt-get install i3  --yes
set -e

# install basic tools
echo '     Installing Dependancies and Basic Tools......'
sudo apt-get install htop python-pip ranger neofetch pcmanfm feh git tmux links tty-clock wget suckless-tools lxterminal dmenu --yes
set -e

# install python packages
echo '     Installing Python Tools......'
pip install --upgrade pip
#pip install pywal

set -e

echo
# Reboot
echo '      Rebooting System......'
echo '      Type startx On Reboot......'
reboot
