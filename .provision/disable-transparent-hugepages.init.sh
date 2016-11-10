#!/bin/bash

sudo apt-get install -y dos2unix
# Disable THP
if ! [ -e /etc/systemd/system/disable-transparent-hugepages.service ]; then
  echo 'File /etc/systemd/system/disable-transparent-hugepages.service is generating...'
  sudo cp ~/disable-transparent-hugepages.service /etc/systemd/system/
  sudo rm -rf ~/disable-transparent-hugepages.service
  sudo chown root:root /etc/systemd/system/disable-transparent-hugepages.service
  sudo chmod 644 /etc/systemd/system/disable-transparent-hugepages.service
  sudo dos2unix /etc/systemd/system/disable-transparent-hugepages.service
  sudo systemctl enable /etc/systemd/system/disable-transparent-hugepages.service
else
  echo 'File /etc/systemd/system/disable-transparent-hugepages.service already exists.'
fi
sudo systemctl start disable-transparent-hugepages.service
