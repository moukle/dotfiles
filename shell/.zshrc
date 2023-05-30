source $HOME/.profile
source $HOME/.cache/wal/colors.sh

# xdg-ninja
export ZPLUG_HOME="$XDG_DATA_HOME/zplug"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
# compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# load plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/vim"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

# plug "zap-zsh/completions"
plug "Aloxaf/fzf-tab"

# Starship prompt
eval "$(starship init zsh)"

# aliases
alias v="nvim"
alias c="bat --plain --theme='base16-256'"
alias cp="advcp -gR"
alias mv="advmv -g"

# Run 'fff' with 'f' or whatever you decide to name the function.
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# fzf
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
