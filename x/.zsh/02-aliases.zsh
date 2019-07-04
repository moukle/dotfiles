# VARIOUS
alias x='startx'

# SUDO
alias s='sudo '
alias please='sudo $(fc -ln -1)'

# CD
alias ..='cd ..'
alias ...='cd ../..'
alias cdb='cd ~/.bin/scripts/'

# VPN
alias gvpnDE='systemctl start openvpn@ger'
alias svpnDE='systemctl stop openvpn@ger'
alias gvpnCH='systemctl start openvpn@ch'
alias svpnCH='systemctl stop openvpn@ch'
alias gvpnCH2='systemctl start openvpn@ch2'
alias svpnCH2='systemctl stop openvpn@ch2'

# TRUECRYPT
alias tcm='s truecrypt --text --fs-options="uid=1000,umask=0002" /dev/sdb1 /mnt/platte'
alias tcu='s truecrypt -d /mnt/platte'

# MOUNTING
alias mount='s mount'
alias umount='s umount'

# MARKS
alias m='mark'
alias um='unmark'
alias j='jump'

# TMUX
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'

# CP
alias cp='cp -rv'
alias rsync='rsync -rv --progress --stats '

# RM
alias rm='rm --verbose'
alias rmf='rm -rf'

# MKDIR
alias mk='mkdir -p'
alias mkdir='mkdir -p'

# VERBOSE
alias mv='mv --verbose '
alias ln='ln -v '
alias curl='curl -v '
alias chown='chown -v '
alias chmod='chmod -v '
alias rename='rename -v '

# PIPE
alias -g C='| mycopy'
alias -g V='| vi -'
alias -g L='| less'
alias -g M='| more'
alias -g S='| sort'

# VIM
alias vi='$EDITOR'
alias vic='vi *.{cpp,h}'

alias less='$PAGER'
alias zless='$PAGER'

# CHMOD
alias chmox='chmod +x'
alias chreg='chmod 644'

# DEFAULT PARAMS
alias ping='ping -c 5'
alias du='du -c -h'
alias df='df -h'
alias da='date "+%A, %B %d, %Y [%T]"'
alias ln='ln -snf'

# NET
#alias weather='inxi -xxxW Bensheim,Deutschland'
alias weather='curl --silent wttr.in/64625 | head -38'
alias localscan='s nmap -sP 192.168.192.*'

# SCREENSHOT
alias region='maim -s -c 1,0,0,0.6 ~/Media/scrots/$(date +%b_%d_%s).png'

# LAPTOP POWER
alias wbb='iw dev wlp4s0 link && xbacklight && acpi'

# TRANSLATE
alias de='trans :de'

# TOILET
alias happy='toilet -f term -w 200 -t --gay'
alias metal='toilet -f term -w 200 -t --metal'
alias gay='toilet -f future -F gay'

# CONFIGS
alias vcf='vi ~/.vimrc'
alias zcf='vi ~/.zshrc ~/.zsh/*.zsh'
alias xcf='vi ~/.xinitrc ~/.Xresources'
alias bcf='vi ~/.config/bspwm/bspwmrc'
alias scf='vi ~/.config/sxhkd/sxhkdrc'
alias pcf='vi ~/.config/polybar/config'
alias acf='vi ~/.config/alacritty/alacritty.yml'

# LS
alias ls='ls-i --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

# lsd = lsd "$@" --group-dirs first
# alias l='lsdd'
# alias la='lsdd -a'
# alias ll='lsdd -l'
# alias lla='lsdd -la'
# alias lt='lsdd --tree'

alias exa='exa --group-directories-first'
# alias ls='exa --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias lsa='exa -a'
# alias lsd='exa -d *(/)'
alias ll='exa -l'
alias lla='exa -la'
alias llg='exa -l --git'
#alias t="tree"
#alias ta="tree -a"
#alias td="tree -dl"
alias tl="tree -L 2 --dirsfirst"
alias tla="tree -a -L 2 --dirsfirst"

# GIT
alias gl='git pull '
alias gc='git commit '
alias gcmsg='git commit -m '
alias ga='git add '
alias gap='git add -p '
alias gp='git push '

# PACMAN
alias pacins='s pacman -S'
alias pacrem='s pacman -Rs'
alias pacupgrade='s pacman -Syu'
alias paclist='pacman -Q'
alias pacinfo='pacman -Qi'
alias pacsrch='pacman -Ss'
alias paccount='pacman -Q | wc -l'
alias pacorphans='pacman -Qdt'

# VOICE PLAYBACK
alias voiceRec='pactl load-module module-loopback latency_msec=1000'
alias voiceStop='pactl unload-module module-loopback'

# TRANSLATE
alias ende='trans en:de'
alias deen='trans de:en'

# HDA
alias vpnHda='s openconnect firewall.fbi.h-da.de -u istmoklei'
