# Pii3 Install 
Simple script for installing i3wm in Raspian Lite
 
 # Install i3wm and basic tools
This will install i3wm and recomended Raspbian tools

     sudo apt-get install git
     git clone https://github.com/gdan42/pii3.git
     cd pii3
     sudo bash pii3install.sh
     
After the script has finished, the system will reboot     
     

#  Install custom configs 
This will install custom config files(i3 config, i3status, bashrc, xrecources)

     cd pii3
     sudo bash pii3custom.sh

