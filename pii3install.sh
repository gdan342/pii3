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
echo '  Raspian Lite I3wm Install by Brett Ling'
echo
echo '           Edited: 11/14/2019'
echo
echo

# Update and Upgrade
echo
echo '     UPDATING......'
echo
sudo apt-get update --yes
echo
echo '     UPGRADING......'
echo
sudo apt-get upgrade --yes
set -e

# install x server
echo
echo '     INSTALLING X SERVER......'
echo
sudo apt-get install --no-install-recommends xserver-xorg --yes
sudo apt-get install --no-install-recommends xinit --yes
set -e

#create xinitrc
#echo '     Creating .xinitrc......'
echo
sudo mv ~/pii3/.xinitrc ~/
#echo "#!/bin/bash" >> ~/.xinitrc
#echo "exec i3" > ~/.xinitrc
#set -e

# install i3wm
echo
echo '     INSTALLING I3WM......'
echo
sudo apt-get install i3 i3blocks i3status  --yes
set -e

echo
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
echo
echo
echo '     INSTALLING TOOLS......'
echo
sudo apt-get install leafpad htop python-pip ranger neofetch pcmanfm feh tmux links tty-clock wget suckless-tools lxterminal --yes
set -e

# install python packages
echo '     UPDATE PIP & INSTALL TOOLS......'
sudo pip install --upgrade pip
#pip install
set -e

echo
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

echo '     REPLACING CONFIG FILES......'
echo
# Make Directories
sudo mkdir ~/Documents
sudo mkdir ~/Downloads
sudo mkdir ~/bin

# Replace i3 Config
#echo '     Replacing configs......'
sudo cp -TR ~/pii3/i3 ~/.config/i3
set -e

# Replace lxterminal config
echo '     Replacing lxterminal config...... '
sudo mv ~/pii3/lxterminal ~/.config/lxterminal
#set -e

# Copy i3 status
echo '     Replacing i3 status......'
sudo mkdir ~/.config/i3status
sudo mv ~/pii3/i3status/config ~/.config/i3status
#set -e

# Set backround
#echo '     Setting Feh......'
sudo mkdir ~/Backrounds
sudo mv ~/pii3/Backrounds/b1.jpg ~/Backrounds/

# Add ufetch to terminal
sudo echo "bash ~/pii3/ufetch//ufetch-raspbian" >> ~/.bashrc

  echo
  echo '      FINiSHED'
  echo
startx

# Reboot
#echo '      Rebooting System......'
#sudo reboot -h 0
