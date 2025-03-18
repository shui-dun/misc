#!/bin/bash

# 定义配置文件路径
CONFIG_NAME=.shuidun-bash-config.sh
CONFIG_FILE=~/$CONFIG_NAME

# 将配置文件复制到主目录
cp $(dirname "$0")/$CONFIG_NAME $CONFIG_FILE

# 配置代理设置
echo "export http_proxy=\"${http_proxy}\"" >> $CONFIG_FILE
echo "export https_proxy=\"${https_proxy}\"" >> $CONFIG_FILE

# 将 source 行定义为变量
SOURCE_LINE="source $CONFIG_FILE"

# 如果 .bashrc 中不存在 source 行，则添加
if ! grep -q "$SOURCE_LINE" ~/.bashrc; then
    echo "$SOURCE_LINE" >> ~/.bashrc
fi

# fzf是一个命令行模糊搜索工具，可以用来快速搜索历史命令、文件、进程等
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# zoxide是一个快速跳转工具，类似于autojump
# 通过z来跳转到最近的目录，zi来进行交互性的选择
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
ZOXIDE_INIT_CMD='eval "$(zoxide init bash)"'
if ! grep -q "$ZOXIDE_INIT_CMD" ~/.bashrc; then
    echo "$ZOXIDE_INIT_CMD" >> ~/.bashrc
fi

# 原本想弄好用的补全&主题，例如ble.sh，但奈何和warp冲突就不弄了