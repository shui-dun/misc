#!/bin/bash

bash $(dirname $0)/environment/install.sh
# 应该先配置apt，因为后面的安装会用到apt
bash $(dirname $0)/apt/install.sh
sudo apt update
sudo apt upgrade -y
# 安装有趣的命令
sudo apt install -y sl cowsay figlet cmatrix neofetch lolcat caca-utils
# 安装docker
sudo apt install -y docker docker-compose
# 安装实用工具
sudo apt install -y net-tools nmap trash-cli tree ssh lrzsz \
    ripgrep fd-find duf gdu ranger

bash $(dirname $0)/bash/install.sh
bash $(dirname $0)/ssh/install.sh
bash $(dirname $0)/htop/install.sh
bash $(dirname $0)/git/install.sh
bash $(dirname $0)/vim/install.sh
bash $(dirname $0)/hexer/install.sh
bash $(dirname $0)/zoxide/install.sh
