#!/bin/bash

# zoxide是一个快速跳转工具，类似于autojump
# 通过z来跳转到最近的目录，zi来进行交互性的选择

# 判断zoxide是否安装
if command -v zoxide &> /dev/null
then
    echo "zoxide has been installed"
    exit
fi

# 安装zoxide到~/.local/bin
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# zshrc中添加zoxide的初始化脚本
ZOXIDE_INIT_CMD='eval "$(zoxide init bash)"'
BASHRC_FILE=~/.bashrc

if grep -q "$ZOXIDE_INIT_CMD" "$BASHRC_FILE"; then
    echo "zoxide initialization already exists in $BASHRC_FILE"
else
    echo "$ZOXIDE_INIT_CMD" >> "$BASHRC_FILE"
fi
