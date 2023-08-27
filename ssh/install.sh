#!/bin/bash

# 本脚本用于安装ssh服务，并修改配置文件（允许root登录，允许密码登录，修改端口号）

sudo apt install -y ssh

sshd_config="/etc/ssh/sshd_config"

# ssh的配置文件是前面的覆盖后面的，因此加到开头
if !(cat $sshd_config | grep -q HAS_BEEN_MODIFIED) ; then
  sudo sh -c "cat $(dirname $0)/my_sshd_config $sshd_config > $sshd_config.tmp"
  sudo mv ${sshd_config}.tmp $sshd_config
fi

sudo systemctl restart ssh.service
