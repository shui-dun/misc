# vim配置

为了减少记忆成本：

- 命令/快捷键的设置尽量与IDE或者vim保持一致。例如：
    - `nnoremap x "_x` 没有改变 `x` 这个命令的快捷键，只是修改其功能，在执行 `x` 命令时，不会改变寄存器内容。
    - `nnoremap <C-h> :.,$s/\V//gc<left><left><left><left>` Ctrl+h 替换，和IDE一致
- 自定义命令以 `O` 开头，例如 OComment 用于注释