#!/bin/bash

# 安装zsh
sudo apt install -y zsh 
# 将用户的默认shell更改为zsh
chsh -s /bin/zsh
# 安装antigen到家目录
curl -L git.io/antigen > $HOME/.antigen.zsh
# 复制文件到家目录
path=$HOME/.zshrc
sudo cp $(dirname "$0")/zshrc $path
# 如果存在 `http_proxy` 环境变量，写入配置文件开头
# 之所以要写到开头，是为了确保zsh的插件成功安装
# 这里使用了 sed 的 -i 选项，它允许直接修改文件
# "1i表示在第一行之前插入内容
if [ -n "$http_proxy" ]; then
    sudo sed -i "1iexport http_proxy=$http_proxy" $path
fi

# 如果存在 `https_proxy` 环境变量，写入配置文件开头
if [ -n "$https_proxy" ]; then
    sudo sed -i "1iexport https_proxy=$https_proxy" $path
fi
