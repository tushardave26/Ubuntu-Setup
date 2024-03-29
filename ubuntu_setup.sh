#!/usr/bin/env bash

# update and upgrade the Ubuntu
sudo apt update
sudo apt upgrade

# install media codecs
sudo apt -y install ubuntu-restricted-extras

# install tweak tool
sudo apt -y install gnome-tweak-tool

# install tlp and tlp-dw for prolong your battery and prevent overheating
sudo apt -y install tlp tlp-rdw
sudo tlp start

# install dependency of DropBox
sudo apt -y install libatomic1

# install htop and iotop
sudo apt -y install htop iotop

# install btop
sudo snap install btop

# install ncdu
sudo apt -y install ncdu

# system cleanup
sudo apt autoremove

exit;
