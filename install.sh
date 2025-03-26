#!/bin/bash

# 获取脚本所在绝对路径
SCRIPT_DIR=$(dirname $0)
LOG_FILE="$SCRIPT_DIR/error.log"

# 解析命令行参数
INTERACTIVE=false
while getopts "i" opt; do
    case $opt in
        i) INTERACTIVE=true ;;
        *) ;;
    esac
done

# 交互式确认函数
confirm_install() {
    local component=$1
    if [ "$INTERACTIVE" = true ]; then
        while true; do
            read -p "是否安装 $component? [Y/n] " response
            case $response in
                [yY][eE][sS]|[yY]) return 0 ;;
                [nN][oO]|[nN]) return 1 ;;
                *) echo "无效输入，请输入 Y 或 n。" ;;
            esac
        done
    else
        return 0
    fi
}

# 安装组件
install_component() {
    local component=$1 # 局部变量的作用域仅限于当前函数
    if confirm_install "$component"; then
        echo ">>>>> START INSTALL $component" | tee -a "$LOG_FILE"
        bash "$SCRIPT_DIR/$component/install.sh" 2> >(tee -a "$LOG_FILE") # 这是一个进程替代，它将stderr (`2>`)的内容传递给tee命令。tee命令将stderr的内容写入error.log文件并同时输出到控制台。
        echo ">>>>> FINISH INSTALL $component" | tee -a "$LOG_FILE"
    else
        echo ">>>>> SKIP INSTALL $component" | tee -a "$LOG_FILE"
    fi
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

echo ">>>>> FINISH INSTALL ALL COMPONENTS" | tee -a "$LOG_FILE"
