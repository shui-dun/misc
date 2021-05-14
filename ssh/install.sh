#!/bin/bash

sudo apt install -y ssh

sshd_config="/etc/ssh/sshd_config"

# ssh的配置文件是后面的覆盖前面的，因此加到开头
if !(cat $sshd_config | grep -q HAS_BEEN_MODIFIED) ; then
  sudo sh -c "cat $(dirname $0)/my_sshd_config $sshd_config > $sshd_config.tmp"
  sudo mv ${sshd_config}.tmp $sshd_config
fi

sudo systemctl restart ssh.service
