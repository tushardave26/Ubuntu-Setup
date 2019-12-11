#!/usr/bin/env bash

# update and upgrade the Ubuntu
sudo apt full-upgrade

# install essential package to build system packages
sudo apt -y install build-essential
sudo apt -y install libxml2 libxml2-dev libgeoip-dev libxslt1-dev ruby-dev libbz2-dev libncurses5-dev \
                    libncursesw5-dev liblzma-dev manpages-dev man-db manpages-posix-dev libx11-dev zlib1g-dev \
                    libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libcurl4-openssl-dev \
                    software-properties-common libffi-dev wget gdebi-core curl git

# C programming language essentials
sudo apt -y install libgtk-3-doc gstreamer1.0-doc libwebkit2gtk-4.0-doc libgda-5.0-doc

# C++ programming language essentials
sudo apt -y install g++ libgtkmm-3.0-dev libgstreamermm-1.0-dev libgdamm5.0-dev libgtkmm-3.0-doc libcluttermm-1.0-doc \
                    libgdamm5.0-doc

# Python2 programming laguage essentials
# Following commnd line will also install Python 2
sudo apt -y install python-pip

# R & RStudio
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
sudo apt update
sudo apt -y install r-base
cd ~/Downloads || exit
wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.5019-amd64.deb
sudo gdebi rstudio-server-1.2.5019-amd64.deb
cd ~ || exit

# Ruby
sudo apt -y install ruby-full

# Nodejs
cd ~ || exit
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt -y install nodejs
rm nodesource_setup.sh

sudo npm install -g semantic-release          \
    @semantic-release/changelog               \
    @semantic-release/commit-analyzer         \
    @semantic-release/exec                    \
    @semantic-release/git                     \
    @semantic-release/release-notes-generator

# MySQL
sudo apt -y install mysql-server mysql-client libmysqlclient-dev mysql-workbench

# PostgreSQL
# sudo apt -y install postgresql-11 libpq-dev

# system cleanup
sudo apt autoremove

exit;
