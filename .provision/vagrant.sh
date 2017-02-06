#!/bin/bash

# This shell is running on vagrant
# Requires: Ubuntu Xenial64 with 1G memory and 2 cpu cores

# Parameters BEGIN
VAGRANT_NODE_VERSION=v6 #define which node version to install (node: latest nodejs stable)
# Parameters END

echo ''
echo '=========================================='
echo '====                                  ===='
echo '====                                  ===='
echo '====    Installing System Package     ===='
echo '====                                  ===='
echo '====                                  ===='
echo '=========================================='

# Add Git apt repo
if ! [ -e /etc/apt/sources.list.d/ppa-git-core.list ]; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0xA1715D88E1DF1F24
  echo "deb http://ppa.launchpad.net/git-core/ppa/ubuntu "$(lsb_release -sc)" main" | sudo tee /etc/apt/sources.list.d/ppa-git-core.list
  sudo apt-get update
fi
# Add OpenJDK Repo
sudo add-apt-repository -y ppa:openjdk-r/ppa

# Upgrade system
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

# Install packages
sudo apt-get -y install vim git ruby ntp
# Install libs
sudo apt-get -y install build-essential chrpath libssl-dev libxft-dev \
                        fontconfig libfontconfig1 libfontconfig1 libfontconfig1-dev libfreetype6 libfreetype6-dev \
                        libkrb5-dev
# Install OpenJRE 8
sudo apt-get -y install openjdk-8-jre

echo ''
echo '=========================================='
echo '====                                  ===='
echo '====                                  ===='
echo '====        Installing NodeJS         ===='
echo '====                                  ===='
echo '====                                  ===='
echo '=========================================='
# Install nodejs
if ! [ -f ~/.nvm/nvm.sh ]; then
  echo 'Install nvm now...'
  sudo apt-get -y install make gcc g++ clang python
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install $VAGRANT_NODE_VERSION
  nvm alias default $VAGRANT_NODE_VERSION
else
  echo 'nvm already installed.'
  source ~/.nvm/nvm.sh
fi
# Upgrade npm
npm update -g npm

echo ''
echo '=========================================='
echo '====                                  ===='
echo '====                                  ===='
echo '====    Installing NodeJS Packages    ===='
echo '====                                  ===='
echo '====                                  ===='
echo '=========================================='
# Instal Common Package
# Install yarn
if [ -z "$(command -v yarn)" ]; then
  npm install -g yarn
else
  npm update -g yarn
fi

echo ''
echo '=========================================='
echo '====                                  ===='
echo '====                                  ===='
echo '====    Installing MERN               ===='
echo '====                                  ===='
echo '====                                  ===='
echo '=========================================='
# Install Sass
sudo gem update
sudo gem install sass

# Cleanup
sudo apt-get -y autoremove
