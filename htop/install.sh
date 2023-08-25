#!/bin/bash

# 安装htop
sudo apt-get install -y htop

# 复制配置文件(如果没有配置文件目录，需要手动创建)
mkdir -p ~/.config/htop
# 注意：``和$()都是应用程序替换的语法，``是老的语法，$()是新的语法，推荐使用$()
cp `dirname $0`/htoprc ~/.config/htop/htoprc
