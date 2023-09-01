#!/bin/bash

sudo apt update
sudo apt upgrade -y
# 安装基本的工具
# duf是升级版的df
# ncdu是升级版的du
# bat是升级版的cat（但调用命令是batcat）
sudo apt install -y gcc g++ gdb net-tools trash-cli vim tree net-tools zsh ssh neofetch htop cmake sl cowsay cmatrix nodejs docker docker-compose openjdk-17-jdk silversearcher-ag ripgrep duf ncdu bat

# zsh的安装应该尽可能的早，因为后面的配置可能会修改zsh的配置文件
bash $(dirname $0)/zsh/install.sh
bash $(dirname $0)/apt/install.sh
bash $(dirname $0)/ssh/install.sh
bash $(dirname $0)/htop/install.sh
bash $(dirname $0)/git/install.sh
bash $(dirname $0)/fzf/install.sh
bash $(dirname $0)/vim/install.sh
