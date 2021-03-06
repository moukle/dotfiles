autoload -U colors && colors

# History in cache directory:
setopt inc_append_history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# Import seperate config files
for r in $HOME/.config/zsh/*.zsh; do
	if [[ $DEBUG > 0 ]]; then
		echo "zsh: sourcing $r"
	fi
	source $r
done

# for lf word splitting
set shell zsh
set shellopts '-eu:--shwordsplit'
set ifs "\n"
set filesep "\n"  # default already

LFCD="$HOME/.config/lf/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
	bindkey -s '^o' 'lfcd\n'  # zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
