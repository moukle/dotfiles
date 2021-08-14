alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

alias mkdir='mkdir -pv'
alias cp='cp -vri'
alias rm='rm -vi'
alias rmf='rm -rf'
alias path='echo -e ${PATH//:/\\n}'

# alias discord='discocss'

alias s='sudo '
alias p='sudo pacman'
alias e='$EDITOR'
alias ef='$EDITOR $(fzf)'
alias c='bat --theme=base16 --style=header'
alias cf='bat --theme=base16 --style=header $(fzf)'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

alias tb='taskbook'

# alias ls='ls -hN --color=auto --group-directories-first'
alias ls='exa --group-directories-first'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias big20='du -ahx $pwd | sort -rh | head -20'
# alias delete_old='find /path/to/directory/ -mindepth 1 -mtime +5 -delete'

alias ende='trans en:de'
alias deen='trans de:en'

alias jc='journalctl -xe'
alias sc=systemctl
alias ssc='sudo systemctl'

alias y='xclip -selection clipboard -in'
alias p='xclip -selection clipboard -out'

alias -g C='| xclip -selection clipboard'

alias -g V='| vi -'
alias -g L='| less'
alias -g M='| more'
alias -g S='| sort'

alias vcf='e ~/.config/nvim/init.vim'
alias zcf='e ~/.zshrc ~/.config/zsh/*.zsh'
alias xcf='e ~/.xinitrc ~/.Xresources'
alias bcf='e ~/.config/bspwm/bspwmrc'
alias scf='e ~/.config/sxhkd/sxhkdrc'
alias pcf='e ~/.config/polybar/config'
