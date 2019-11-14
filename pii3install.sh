#!/bin/bash
set -u

echo '    _______ __________________ ______'
echo '   (  ____ )\__   __/\__   __// ___  \'
echo '   | (    )|   ) (      ) (   \/   \  \'
echo '   | (____)|   | |      | |      ___) /'
echo '   |  _____)   | |      | |     (___ ('
echo '   | (         | |      | |         ) \'
echo '   | )      ___) (______) (___/\___/  /'
echo '   |/       \_______/\_______/\______/'

# Raspian Buster Lite i3wm Install Script


echo '      Raspian Lite I3wm Install'

# Update and Upgrade
echo '     Updating......'
sudo apt-get update --yes
echo '     Upgrading......'
sudo apt-get Upgrade --yes
set -e

# install x server
echo '     Installing X Server......'
sudo apt-get install --no-install-recommends xserver-xorg --yes
sudo apt-get install --no-install-recommends xinit --yes
set -e

#create xinitrc
echo '     Creating .xinitrc......'
sudo touch ~/.xinitrc
echo "#!/bin/bash" >> ~/.xinitrc
echo "exec i3" >> ~/.xinitrc
set -e

# install i3wm
echo '     Installing I3WM......'
sudo apt-get install i3 i3blocks i3status  --yes
set -e

# install basic tools
echo '     Installing Dependancies and Basic Tools......'
sudo apt-get install leafpad htop python-pip ranger neofetch pcmanfm feh tmux links tty-clock wget suckless-tools lxterminal dmenu --yes
set -e

# install python packages
echo '     Installing Python Tools......'
sudo pip install --upgrade pip
#pip install pywal
set -e

echo '     Replacing config Files......'

# Make Directories
#

# Replace i3 Config
echo '     Replacing i3 config......'
sudo cp -TR ~/pii3/i3 .config/i3
#set -e

# Replace lxterminal config
echo '     Replacing lxterminal config...... '
sudo cp -TR ~/pii3/lxterminal ~/.config/lxterminal
#set -e

# Copy i3 status
echo '     Replacing i3 status......'
sudo mkdir ~/.config/i3status
sudo cp ~/pii3/i3status/config ~/.config/i3status
#set -e

# Set backround
echo '     Setting Feh......'
sudo mkdir ~/Backrounds
sudo cp ~/pii3/Backrounds/b1.jpg ~/Backrounds/

# Add ufetch to terminal
echo "bash ~/pii3/ufetch//ufetch-raspbian" >> ~/.bashrc

# Reboot
echo '      Rebooting System......'
reboot
