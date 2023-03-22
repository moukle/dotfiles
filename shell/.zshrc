source $HOME/.profile

# load plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/sudo"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# vim
bindkey -v
bindkey -M emacs '^F' sudo-command-line
bindkey -M vicmd '^F' sudo-command-line
bindkey -M viins '^F' sudo-command-line

# Starship prompt
eval "$(starship init zsh)"

# aliases
alias v='nvim'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
