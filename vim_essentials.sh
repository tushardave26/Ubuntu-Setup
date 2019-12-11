#!/usr/bin/env bash

# update and upgrade the Ubuntu
sudo apt full-upgrade

# remove all the pre-installed vim and associated files
# remove current vim
sudo apt remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common

# removes current link for vim
sudo rm -rf /usr/local/share/vim /usr/bin/vim

# add ppa for newest version of ruby (currently, as of 06/06/2017, ruby v2.4)
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt update

# installs everything needed to make/configure/build Vim
sudo apt -y install liblua5.1-dev luajit libluajit-5.1 python-dev python3-dev ruby-dev ruby2.5 ruby2.5-dev \
                    libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

#Optional: so vim can be uninstalled again via `dpkg -r vim`
sudo apt -y install checkinstall

# clones vim repository so we can build it from scratch
cd ~ || exit
git clone https://github.com/vim/vim
cd vim || exit
git pull

# In case Vim was already installed. This can throw an error if not installed, 
# it's the nromal behaviour. That's no need to worry about it
cd src || exit
make distclean
cd ..

# update to use the correct python 2.7/3.x config path also change 'YOUR NAME' to
# your real name
./configure \
--enable-multibyte \
--enable-perlinterp=dynamic \
--enable-rubyinterp=dynamic \
--with-ruby-command=/usr/bin/ruby \
--enable-pythoninterp=dynamic \
--with-python-config-dir=/usr/bin/python \
--enable-python3interp \
--with-python3-config-dir=/usr/bin/python3 \
--enable-luainterp \
--with-luajit \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
--with-x \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--with-compiledby="TUSHAR DAVE <tushardave26@gmail.com>" \
--enable-fail-if-missing

# this this is the compilation step. It should also create the symlink of the binary
# one /usr/bin folder
make && sudo make install

# To be able to access the new vim instaltion we need to refresh bash/zsh/fish
#exec bash # or exec zsh or exec fish

# install Vundle vim package manager

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# add vimrc file
touch ~/.vimrc

# system cleanup
sudo apt autoremove

exit;
