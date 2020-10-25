export ZPLUG_HOME=$HOME/.zplug
source $HOME/.zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zdharma/fast-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

zplug "b4b4r07/enhancd", use:init.sh, at:2ccdaca
zplug "Tarrasch/zsh-bd"

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pipenv", from:oh-my-zsh

zplug "plugins/colored-man-pages", from:oh-my-zsh

zplug load

# to revieve job management < https://github.com/zplug/zplug/issues/374 >
# rm ~/.zplug/log/job.lock 
