#!/bin/bash
set -u

echo
echo '      STARTING......'

pii3_banner () {
echo
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
echo
echo
echo '   Raspian Buster Lite I3wm Easy Install'
echo
echo
}

# Update and Upgrade
update_upgrade () {
	echo 'UPDATE...'
	sudo apt-get update --yes
	echo 'UPGRADE...'
	sudo apt-get upgrade --yes
}

# install x server
xserver_install () {
	echo 'INSTALLING X SERVER...'
	sudo apt-get install --no-install-recommends xserver-xorg --yes
	sudo apt-get install --no-install-recommends xinit --yes
	sudo mv /home/pi/pii3/.xinitrc /home/pi/
}

# install i3wm
i3wm_install () {
	echo 'INSTALLING I3WM...'
	sudo apt-get install i3 i3blocks i3status suckless-tools  --yes
}            

# install basic tools
pkgs_install() {
	echo 'INSTALLING PKGS...'
	sudo apt-get install leafpad htop python-pip ranger neofetch pcmanfm feh tmux links --yes
	sudo apt-get install tty-clock wget lxterminal nano wicd compton --yes
}

# install python packages
upgrade_pip () {
	echo 'UGRADE PIP...'
	sudo pip install --upgrade pip
	#pip install catt lolcat 
}

# Make Directories
make_directories () {
	cd $HOME
	sudo mkdir ~/Pictures
	sudo mkdir ~/Documents
	sudo mkdir ~/Downloads
	sudo mkdir ~/.bin
}

# Replace i3 Configs
config_i3 () {
	echo 'SETTING CONFIG FILES...'
	sudo mkdir /home/pi/.config
	sudo mkdir /home/pi/.config/i3
	sudo mv /home/pi/pii3/i3/config /home/pi/.config/i3/
	
	sudo mkdir ~/.config/lxterminal
	sudo mv /home/pi/pii3/lxterminal/lxterminal.conf /home/pi/.config/lxterminal/

	sudo mkdir /home/pi/.config/i3status
	sudo mv /home/pi/pii3/i3status/config /home/pi/.config/i3status/
	
	sudo mv /home/pi/pii3/Pictures /home/pi/Pictures/
}

# Add ufetch to terminal
bashrc_edit () {
	echo 'bash /home/pi/pii3/ufetch//ufetch-raspbian' >> ~/.bashrc
}

#####MAIN#####
pii3_banner
update_upgrade
xserver_install
i3wm_install
pkgs_install
upgrade_pip
make_directories
config_i3
bashrc_edit
pii3_banner
echo '     FINISHED.....'

startx
