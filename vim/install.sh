#!/bin/bash

# 安装vim
sudo apt install -y vim
# 复制vimrc文件到用户目录
cp $(dirname "$0")/vimrc ~/.vimrc
# 安装vim插件管理器
curl -sS -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 安装vim插件
vim +PlugInstall +qall
