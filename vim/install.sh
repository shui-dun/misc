#!/bin/bash

# 安装vim
sudo apt install -y vim
# 复制vimrc文件到用户目录
cp $(dirname "$0")/vimrc ~/.vimrc
# 安装vim插件管理器
# -sS 使得curl不会将进度条输出到stderr，但输出错误信息到stderr
curl -sS -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# 安装vim插件
vim +PlugInstall +qall
