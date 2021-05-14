#!/bin/bash

sudo apt install -y ssh

sshd_config="/etc/ssh/sshd_config"

if !(cat $sshd_config | grep -q 1773) ; then
  sudo sed -i "$ a Port 1773" $sshd_config
  sudo sed -i "$ a PermitRootLogin yes" $sshd_config
  sudo sed -i "$ a PasswordAuthentication yes" $sshd_config
fi

sudo systemctl restart ssh.service
