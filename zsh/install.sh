#!/bin/bash

# 安装zsh
sudo apt install -y zsh 
# 将用户的默认shell更改为zsh
chsh -s /bin/zsh
# 安装antigen
curl -L git.io/antigen >.antigen.zsh
# 复制文件到家目录
path=$HOME/.zshrc
sudo cp $(dirname "$0")/zshrc $path
# 如果存在 `http_proxy` 和 `https_proxy` 环境变量，写入配置文件
if [ -n "$http_proxy" ]; then
    echo "export http_proxy=$http_proxy" | sudo tee -a $path
fi
if [ -n "$https_proxy" ]; then
    echo "export https_proxy=$https_proxy" | sudo tee -a $path
fi

