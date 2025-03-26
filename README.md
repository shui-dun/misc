# misc

各种软件的配置文件以及在Debian系下的一键配置脚本

## 使用

### proxy设置

先设置好 `http_proxy` 和 `https_proxy`，因为后续一些脚本会读取这两个环境变量进行一些配置

### 执行脚本

```sh
bash config.sh 2> >(tee -a error.log)
```

其中：

- `>(tee -a error.log)` 是一个进程替代，它将stderr (`2>`)的内容传递给tee命令。tee命令将stderr的内容写入error.log文件并同时输出到控制台。
- 执行上述脚本时不要加sudo，因为有些命令加了sudo无法正常运行，例如`chsh -s /bin/zsh`
