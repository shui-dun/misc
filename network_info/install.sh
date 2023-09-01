#!/bin/bash

# 将当前目录下的network_info文件拷贝到 /usr/local/bin 目录下
# /usr/local/bin 是为本地管理员（即系统管理员）安装的软件和自定义脚本而设的
# 这样做的好处是，它与默认的系统包管理器（如 apt、yum 或 pacman）安装的软件分开
cp $(dirname $0)/network_info /usr/local/bin
# 赋予其可执行权限
chmod +x /usr/local/bin/network_info
