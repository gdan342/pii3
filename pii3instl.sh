#!/bin/bash
set -u
pii3_banner

##### WELCOME TO PII3 #####
#### LAST UPDATE: 7/2/21 #### 

# UNCOMENT OPTIONS BEFORE RUNNING
# Update and upgrade 
update_upgrade

# Install X
xserver_install

# I3WM install
i3wm_install

# Install basic packages
basic_pkgs

# Install custom packages (edit own pkg list)
custom_pkgs

# SDR packages (sofware defined radio)
sdr_pkgs

# Hacking tools packages
hack_pkgs

# Upgrade python package manager
upgrade_pip

# Setup configs and enviroment
make_directories
config_i3
bashrc_edit
echo '     FINISHED.....'


 
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
	
	sudo mv /home/pi/pii3/Pictures /home/pi/
}

# Add ufetch to terminal
bashrc_edit () {
	echo 'bash /home/pi/pii3/ufetch/ufetch-raspbian' >> ~/.bashrc
}


pii3_banner () {
echo
echo '      STARTING......'
echo
echo
echo '            __  __  /'__`\   '
echo '     _____ /\_\/\_\/\_\L\ \  '
echo '    /\ '__`\/\ \/\ \/_/_\_<_ '
echo '    \ \ \L\ \ \ \ \ \/\ \L\ \'
echo '     \ \ ,__/\ \_\ \_\ \____/'
echo '      \ \ \/  \/_/\/_/\/___/ '
echo '       \ \_\'
echo '        \/_/ '                

echo 'Raspian Buster Lite i3wm Easy Install'
echo 'Last update: 7/2/2021'
echo
}


