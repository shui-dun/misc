#!/bin/bash

# 如果环境配置文件不存在，则创建它
CONFIGFILE="/etc/.shuidun-environment.sh"
ENVFILE="/etc/environment"

# 配置代理设置
echo "#!/bin/bash" > "$CONFIGFILE"
echo "export http_proxy=\"${http_proxy}\"" >> "$CONFIGFILE"
echo "export https_proxy=\"${https_proxy}\"" >> "$CONFIGFILE"

# 确保环境文件从 /etc/environment 中被引用（如果尚未引用）
SOURCE_LINE="source ${CONFIGFILE}"
if ! grep -q "$SOURCE_LINE" "$ENVFILE"; then
    echo "$SOURCE_LINE" >> "$ENVFILE"
fi
