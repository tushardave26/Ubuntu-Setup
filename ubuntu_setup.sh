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

# system cleanup
sudo apt autoremove

exit;
