#!/bin/bash
set -u

pii3_banner () {
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
echo
echo
echo '       Raspian Lite I3wm Easy Install'
echo
echo
}

# Update and Upgrade
update_upgrade () {
	echo 'UPDATING'
	sudo apt-get update --yes
	echo 'UPGRADING'
	sudo apt-get upgrade --yes
}

# install x server
xserver_install () {
	echo 'INSTALLING X SERVER'
	sudo apt-get install --no-install-recommends xserver-xorg --yes
	sudo apt-get install --no-install-recommends xinit --yes
	sudo cp -TR ~/pii3/.xinitrc ~/.xinitrc
}

# install i3wm
i3wm_install () {
	echo 'INSTALLING I3WM'
	sudo apt-get install i3 i3blocks i3status suckless-tools  --yes
}            

# install basic tools
pkgs_install() {
	echo 'INSTALLING PKGS'
	sudo apt-get install leafpad htop python-pip ranger neofetch pcmanfm feh tmux links --yes
	sudo apt-get install tty-clock wget lxterminal nano wicd compton --yes
}

# install python packages
upgrade_pip () {
	echo 'UGRADE PIP'
	sudo pip install --upgrade pip
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
	echo 'SETTING CONFIG FILES'
	sudo mkdir ~/.config/i3
	sudo mv ~/pii3/i3/config ~/.config/i3/config 
	
	sudo mkdir ~/.config/lxterminal
	sudo mv ~/pii3/lxterminal/lxterminal.conf ~/.config/lxterminal/lxterminal.conf 

	sudo mkdir ~/.config/i3status
	sudo mv ~/pii3/i3status/config ~/.config/i3status/config
	
	sudo cp ~/pii3/Pirctures ~/Pictures/
}

# Add ufetch to terminal
	bash ~/pii3/ufetch//ufetch-raspbian >> ~/.bashrc

#####MAIN#####
pii3_banner
update_upgrade
xserver_install
i3wm_install
pkgs_install
upgrade_pip
make_directories
config_i3
pii3_banner
echo '     FINISHED.....'
startx
