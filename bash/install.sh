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
