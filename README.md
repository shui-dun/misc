# misc

各种软件的配置文件以及在Debian系下的一键配置脚本

## 使用

### proxy设置

先设置好 `http_proxy` 和 `https_proxy`，因为后续一些脚本会读取这两个环境变量进行一些配置

### 执行脚本

```sh
bash config.sh
```

注意：

- 加上 `-i` 参数会在执行过程中询问是否安装某个软件
- 执行上述脚本时不要加sudo，因为有些命令加了sudo无法正常运行，例如`chsh -s /bin/zsh`
- 错误信息会自动记录到 `error.log` 文件中，同时在控制台显示
