#!/bin/bash

# 安装htop
sudo apt-get install -y htop

# 复制配置文件(如果没有配置文件目录，需要手动创建)
# 这个配置文件相比于默认的配置文件，就是将各个cpu核心的使用率替换为平均使用率，避免当cpu核心数较多时，显示不全的问题
mkdir -p ~/.config/htop
# 注意：``和$()都是应用程序替换的语法，``是老的语法，$()是新的语法，推荐使用$()
cp `dirname $0`/htoprc ~/.config/htop/htoprc
