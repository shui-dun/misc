#!/bin/bash

# 根据http_proxy和https_proxy为apt设置代理
# apt的配置文件是按字母数字顺序读取的。给文件前缀添加数字可以帮助确定读取的顺序。99proxy是一个命名约定，以确保这个特定的代理配置是最后被读取的，从而覆盖其他可能的设置
PROXY_CONF="/etc/apt/apt.conf.d/99proxy.conf"

# 如果文件已经存在，删除文件
if [ -f $PROXY_CONF ]; then
    sudo rm -f $PROXY_CONF
fi

# 判断环境变量是否存在，并写入到文件中
# -z 用于测试字符串长度是否为零。如果为零（即字符串为空），则返回真。
if [ ! -z "$http_proxy" ]; then
    # tee 命令用于读取标准输入并将其内容写入标准输出和文件。
    # -a 选项告诉 tee 将输出追加到指定的文件，而不是覆盖它。
    echo "Acquire::http::Proxy \"$http_proxy\";" | sudo tee -a $PROXY_CONF
fi

if [ ! -z "$https_proxy" ]; then
    echo "Acquire::https::Proxy \"$https_proxy\";" | sudo tee -a $PROXY_CONF
fi

# 如果两个环境变量都不存在，删除文件
if [ -z "$http_proxy" ] && [ -z "$https_proxy" ]; then
    sudo rm -f $PROXY_CONF
fi

