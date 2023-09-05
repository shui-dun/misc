#!/bin/bash

sudo apt update
sudo apt upgrade -y
# 安装基本的工具
# 安装c/c++环境
sudo apt install -y gcc g++ gdb cmake
# 安装java环境
sudo apt install -y openjdk-17-jdk
# 安装有趣的命令
sudo apt install -y sl cowsay figlet cmatrix neofetch lolcat
# 安装docker
sudo apt install -y docker docker-compose
# 安装实用工具
sudo apt install -y net-tools trash-cli tree zsh ssh lrzsz \
    htop silversearcher-ag ripgrep fd-find duf ncdu bat

# zsh的安装应该尽可能的早，因为后面的配置可能会修改zsh的配置文件
bash $(dirname $0)/zsh/install.sh
bash $(dirname $0)/apt/install.sh
bash $(dirname $0)/ssh/install.sh
bash $(dirname $0)/htop/install.sh
bash $(dirname $0)/git/install.sh
bash $(dirname $0)/fzf/install.sh
bash $(dirname $0)/vim/install.sh
bash $(dirname $0)/network_info/install.sh
bash $(dirname $0)/hexer/install.sh
bash $(dirname $0)/node/install.sh
