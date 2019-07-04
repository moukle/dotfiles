export ZPLUG_HOME=/home/moritz/.zplug
source /home/moritz/.zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# zplug "hchbaw/auto-fu.zsh"
zplug "Tarrasch/zsh-bd"
zplug "plugins/wd", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh

# zplug "changyuheng/zsh-interactive-cd"

zplug "djui/alias-tips"
zplug "plugins/git",   from:oh-my-zsh
# zplug "StackExchange/blackbox"

zplug load
#--verbose
