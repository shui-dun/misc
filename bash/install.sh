#!/bin/bash

# 将配置文件复制到主目录
cp $(dirname "$0")/.shuidun-bash-config ~/

# 将 source 行定义为变量
SOURCE_LINE="source ~/.shuidun-bash-config"

# 如果 .bashrc 中不存在 source 行，则添加
if ! grep -q "$SOURCE_LINE" ~/.bashrc; then
    echo "$SOURCE_LINE" >> ~/.bashrc
fi
