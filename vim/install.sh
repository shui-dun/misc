#!/bin/bash

# 添加vim源（apt官方源中的vim版本太低）
sudo add-apt-repository ppa:jonathonf/vim
# 安装vim
sudo apt install -y vim
# 安装ctags（用于生成tags文件）
sudo apt install -y universal-ctags
# 复制vimrc文件到用户目录
cp $(dirname "$0")/vimrc ~/.vimrc
# 安装vim插件管理器
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 创建~/.vim/swap文件夹
mkdir -p ~/.vim/swap
