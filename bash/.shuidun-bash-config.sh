# 一些软件会放置在~/.local/bin下，需要将其加入PATH
export PATH="$HOME/.local/bin:$PATH"

# fd 相关配置
alias fd='fdfind'

# ranger 相关配置
alias r='source ranger' # source的目的是让ranger能够修改当前shell的当前目录等
