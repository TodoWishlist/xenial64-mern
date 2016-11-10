#!/bin/bash

sudo apt-get install -y xvfb dos2unix
# Setup XVFB
if ! [ -e /etc/systemd/system/xvfb.service ]; then
  echo 'File /etc/systemd/system/xvfb.service is generating...'
  sudo cp ~/xvfb.service /etc/systemd/system/
  sudo rm -rf ~/xvfb.service
  sudo chown root:root /etc/systemd/system/xvfb.service
  sudo chmod 644 /etc/systemd/system/xvfb.service
  sudo dos2unix /etc/systemd/system/xvfb.service
  sudo systemctl enable /etc/systemd/system/xvfb.service
  echo '' | tee >> ~/.bashrc
  echo 'export DISPLAY=:99' | tee >> ~/.bashrc
else
  echo 'File /etc/systemd/system/xvfb.service already exists.'
fi
sudo systemctl start xvfb.service
