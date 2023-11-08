source $HOME/.profile
source $HOME/.cache/wal/colors.sh

# xdg-ninja
export ZPLUG_HOME="$XDG_DATA_HOME/zplug"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
# compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# plugins
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "Aloxaf/fzf-tab"
plug "Tarrasch/zsh-bd"
plug "hlissner/zsh-autopair"
plug "le0me55i/zsh-extract"
plug "zdharma-continuum/fast-syntax-highlighting"
# plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/vim"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/completions"

# various
setopt SHARE_HISTORY
export SUDO_PROMPT=$'Password for ->\033[32;05;16m %u\033[0m  '

# aliases
alias v="nvim"
alias c="bat --plain --theme='base16-256'"
alias cp="advcp -gR"
alias mv="advmv -g"

# funcs
mc () {
  mkdir -p $1 && cd $1
}

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# fzf
export FZF_DEFAULT_OPTS="
    $FZF_DEFAULT_OPTS
    --multi
    --height=80% --reverse --padding=1
    --color fg:$foreground,bg:$background,hl:1,fg+:$foreground,bg+:0,hl+:15
    --color info:7,prompt:7,spinner:0,pointer:$background,marker:7
"

# Starship prompt
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
