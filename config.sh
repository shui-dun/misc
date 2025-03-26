#!/bin/bash

# 获取脚本所在绝对路径
SCRIPT_DIR=$(dirname $0)

# 安装组件
install_component() {
    local component=$1 # 局部变量的作用域仅限于当前函数
    echo ">>>>> START INSTALL $component"
    bash "$SCRIPT_DIR/$component/install.sh"
    echo ">>>>> FINISH INSTALL $component"
}

# 优先安装的组件
PRIORITY_COMPONENTS=("apt")
for component in "${PRIORITY_COMPONENTS[@]}"; do # shell中的数组遍历需要"${arr[@]}"，挺奇怪的
    if [ -f "$SCRIPT_DIR/$component/install.sh" ]; then
        install_component "$component"
    fi
done

# 安装其他组件
for dir in "$SCRIPT_DIR"/*/ ; do
    if [ -d "$dir" ];then
        dirname=$(basename "$dir")
        # 跳过已经安装的优先级组件
        if [[ ! " ${PRIORITY_COMPONENTS[@]} " =~ " ${dirname} " ]]; then
            if [ -f "$dir/install.sh" ]; then
                install_component "$dirname"
            fi
        fi
    fi
done

echo ">>>>> FINISH INSTALL ALL COMPONENTS"
