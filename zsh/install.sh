#!/bin/bash

# 安装zsh
sudo apt install -y zsh 
# 将用户的默认shell更改为zsh
chsh -s /bin/zsh
# 指定输出的配置文件位置
path=/etc/zshrc
if [ -d /etc/zsh/ ]; then
    path=/etc/zsh/zshrc
fi
# 复制文件
sudo cp $(dirname "$0")/zshrc $path
# 如果存在 `http_proxy` 和 `https_proxy` 环境变量，写入配置文件
if [ -n "$http_proxy" ]; then
    echo "export http_proxy=$http_proxy" | sudo tee -a $path
fi
if [ -n "$https_proxy" ]; then
    echo "export https_proxy=$https_proxy" | sudo tee -a $path
fi

