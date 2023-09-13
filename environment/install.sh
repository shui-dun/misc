#!/bin/bash

# 设置代理
# 这是为了保证所有用户（包括sudo时）都能正常联网
if [ -n "$http_proxy" ]; then
    # 这里不能写成sudo echo "http_proxy=$http_proxy" >> /etc/environment，因为它的作用是：
    # 使用sudo权限执行echo "http_proxy=$http_proxy"
    # 使用当前用户权限试图将输出重定向到/etc/environment
    echo "http_proxy=$http_proxy" | sudo tee -a /etc/environment > /dev/null
fi

if [ -n "$https_proxy" ]; then
    echo "https_proxy=$https_proxy" | sudo tee -a /etc/environment > /dev/null
fi

