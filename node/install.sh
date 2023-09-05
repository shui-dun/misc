# 如果node存在并且版本大于等于16，就直接返回
# command -v node >/dev/null：如果node存在，就返回0,其中-v表示不执行node，只是检查是否存在
# tr -d 'v'：删除v，比如v16.0.0 -> 16.0.0
# cut -d. -f1：以.为分隔符，取第一个字段，比如16.0.0 -> 16
if command -v node >/dev/null && [[ $(node -v | tr -d 'v' | cut -d. -f1) -ge 16 ]]; then
    echo "node exists and version >= 16"
    exit 0
fi

# 下载node到/opt/node
mkdir -p /opt/node
wget -O /opt/node.tar.xz https://nodejs.org/dist/v18.17.1/node-v18.17.1-linux-x64.tar.xz
# 解压（并命名为node）
# --strip-components 1：去掉第一层目录(node-v18.17.1-linux-x64)
tar -xf /opt/node.tar.xz -C /opt/node --strip-components 1
# 删除压缩包
rm -f /opt/node.tar.xz

# 为bash和zsh分别设置环境变量
# /etc/profile是bash会执行的，但是zsh不会
echo 'export PATH=/opt/node/bin:$PATH' >> /etc/profile
mkdir -p /etc/zsh
echo 'export PATH=/opt/node/bin:$PATH' >> /etc/zsh/zshrc
