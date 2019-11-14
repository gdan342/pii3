#!/bin/bash
set -u

echo
echo
echo '      STARTING......'
echo
echo
echo '    _______ __________________ ______'
echo '   (  ____ )\__   __/\__   __// ___  \'
echo '   | (    )|   ) (      ) (   \/   \  \'
echo '   | (____)|   | |      | |      ___) /'
echo '   |  _____)   | |      | |     (___ ('
echo '   | (         | |      | |         ) \'
echo '   | )      ___) (______) (___/\___/  /'
echo '   |/       \_______/\_______/\______/'

# Raspian Buster Lite i3wm Install Script

echo 
echo '      Raspian Lite I3wm Install'
echo
echo '        Updated: 11/14/2019'


# Update and Upgrade
echo '     Updating......'
sudo apt-get update --yes
echo '     Upgrading......'
sudo apt-get upgrade --yes
set -e

# install x server
echo '     Installing X Server......'
sudo apt-get install --no-install-recommends xserver-xorg --yes
sudo apt-get install --no-install-recommends xinit --yes
set -e

#create xinitrc
echo '     Creating .xinitrc......'
echo "#!/bin/bash" >> ~/.xinitrc
echo "exec i3" > ~/.xinitrc
set -e

# install i3wm
echo '     Installing I3WM......'
sudo apt-get install i3 i3blocks i3status  --yes
set -e

echo '    _______ __________________ ______'
echo '   (  ____ )\__   __/\__   __// ___  \'
echo '   | (    )|   ) (      ) (   \/   \  \'
echo '   | (____)|   | |      | |      ___) /'
echo '   |  _____)   | |      | |     (___ ('
echo '   | (         | |      | |         ) \'
echo '   | )      ___) (______) (___/\___/  /'
echo '   |/       \_______/\_______/\______/'
echo 
echo
echo 
# install basic tools
echo '     Installing Dependancies and Basic Tools......'
sudo apt-get install leafpad htop python-pip ranger neofetch pcmanfm feh tmux links tty-clock wget suckless-tools lxterminal --yes
set -e

# install python packages
echo '     Installing Python Tools......'
sudo pip install --upgrade pip
#pip install
set -e

echo '    _______ __________________ ______'
echo '   (  ____ )\__   __/\__   __// ___  \'
echo '   | (    )|   ) (      ) (   \/   \  \'
echo '   | (____)|   | |      | |      ___) /'
echo '   |  _____)   | |      | |     (___ ('
echo '   | (         | |      | |         ) \'
echo '   | )      ___) (______) (___/\___/  /'
echo '   |/       \_______/\_______/\______/'
echo 
echo
echo 

echo '     Replacing config Files......'

# Make Directories
sudo mkdir ~/Documents
sudo mkdir ~/Downloads
sudo mkdir ~/bin

# Replace i3 Config
echo '     Replacing configs......'
sudo cp -TR ~/pii3/i3 .config/i3
#set -e

# Replace lxterminal config
#echo '     Replacing lxterminal config...... '
sudo cp -TR ~/pii3/lxterminal ~/.config/lxterminal
#set -e

# Copy i3 status
echo '     Replacing i3 status......'
sudo mkdir ~/.config/i3status
sudo cp ~/pii3/i3status/config ~/.config/i3status
#set -e

# Set backround
#echo '     Setting Feh......'
sudo mkdir ~/Backrounds
sudo cp ~/pii3/Backrounds/b1.jpg ~/Backrounds/

# Add ufetch to terminal
sudo echo "bash ~/pii3/ufetch//ufetch-raspbian" >> ~/.bashrc

#startx

# Reboot
echo '      Rebooting System......'
sudo reboot -h 0
