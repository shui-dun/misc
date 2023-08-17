# misc

各种软件的配置文件

以及其中部分软件在Debian系下的一键配置脚本

## 配置单个软件

```sh
sh 软件名/install.sh
```

## 配置所有软件

```sh
sh config.sh
```

## 注意

- 执行上述脚本时不要加sudo，因为有些命令加了sudo无法正常运行，例如`chsh -s /bin/zsh`
- 在执行之前最好设置好 `http_proxy` 和 `https_proxy`，因为一些脚本会读取这两个环境变量进行一些配置
