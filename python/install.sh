#!/bin/bash

# 安装python3和pip3
sudo apt install -y python3 python3-pip
# 安装pipenv
# 注意不要用apt安装，apt安装的pipenv版本太低，会导致无法使用
sudo pip3 install pipenv
# pipenv依赖于pyenv来安装python，所以需要安装pyenv
# 首先判断是否已经安装了pyenv
if [ ! -d ~/.pyenv ]; then
    # 安装pyenv
    curl https://pyenv.run | bash
    # 将pyenv的环境变量添加到~/.zshrc中
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
fi
# pyenv依赖于一些库才能安装python
sudo apt-get install -y libbz2-dev libffi-dev libreadline-dev libssl-dev

