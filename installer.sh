#!/bin/bash

#
# installer.sh: installs multiple ubuntu apps at once
#
# Copyright (C) 2015 Khudaydad Mahmoodi
#

# make sure only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# add repositories whatever you need
sudo add-apt-repository -y ppa:tualatrix/ppa  #ubuntu-tweak
sudo add-apt-repository -y ppa:webupd8team/java -y  #oracle-java
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2  #sublime
sudo apt-add-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"  #skype
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -  #google-chrome-stable
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'  #google-chrome-stable
notify-send --expire-time=3000 "All repositories are added successfully."

# update the source list and upgrade the packages
sudo apt-get -yq update
sudo apt-get -yq upgrade
notify-send --expire-time=3000 "Update & Upgrade" "Update & upgrade successfully completed."

# add package names to array below you want to install them
apps=(
    "aptitude"
    "ubuntu-restricted-extras"
    "ubuntu-tweak"
    "oracle-java8-installer"
    "oracle-java8-set-default"
    "google-chrome-stable"
    "vim"
    "guake"
    "pidgin" 
    "gcolor2" 
    "gparted" 
    "rar" 
    "samba" 
    "clementine" 
    "vlc" 
    "bijiben" 
    "tree" 
    "meld" 
    "inkscape" 
    "whois" 
    "libxml2-utils" 
    "skype"
    "winff"
    "sublime-text"
    "qbittorrent"
)

for app in "${apps[@]}"
do
    sudo apt-get -yq install $app
    #notify-send --expire-time=3000 "$app" "Installed successfully."
    echo ">>> >>> >>> $app installed."
    sleep 2
done
