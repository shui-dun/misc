Set ws = WScript.CreateObject("WScript.Shell")
' 执行wsl命令
ws.run "wsl.exe sudo service ssh start",0
' 执行普通命令
ws.run "jupyter-notebook.exe",0
' 切换文件夹
ws.CurrentDirectory = "D:\nginx"
ws.run "D:\nginx\nginx.exe",0
' 执行多条wsl命令（wsl.exe command只能接一个命令，要执行多条命令，需要使用sh -c执行多条命令）
ws.run "wsl.exe sh -c ""cd /mnt/d/file/ziliao/notebook && git add . && git commit -m update && git push origin master""",0