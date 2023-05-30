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
# plug "zsh-users/zsh-syntax-highlighting"
plug "zdharma-continuum/fast-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "hlissner/zsh-autopair"
plug "Aloxaf/fzf-tab"
plug "zap-zsh/completions"

# Starship prompt
eval "$(starship init zsh)"

# various
setopt SHARE_HISTORY
export SUDO_PROMPT=$'Password for ->\033[32;05;16m %u\033[0m  '

# aliases
alias v="nvim"
alias c="bat --plain --theme='base16-256'"
alias cp="advcp -gR"
alias mv="advmv -g"
alias mkdir="mkdir -p"

# funcs
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

function extract() {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|.zlib|.cso>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in "$@"
        do
            if [ -f "$n" ] ; then
                case "''${n%,}" in
                    *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                        tar xvf "$n"       ;;
                    *.lzma)      unlzma ./"$n"      ;;
                    *.bz2)       bunzip2 ./"$n"     ;;
                    *.cbr|*.rar) unrar x -ad ./"$n" ;;
                    *.gz)        gunzip ./"$n"      ;;
                    *.cbz|*.epub|*.zip) unzip ./"$n"   ;;
                    *.z)         uncompress ./"$n"  ;;
                    *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                        7z x ./"$n"        ;;
                    *.xz)        unxz ./"$n"        ;;
                    *.exe)       cabextract ./"$n"  ;;
                    *.cpio)      cpio -id < ./"$n"  ;;
                    *.cba|*.ace) unace x ./"$n"     ;;
                    *.zpaq)      zpaq x ./"$n"      ;;
                    *.arc)       arc e ./"$n"       ;;
                    *.cso)       ciso 0 ./"$n" ./"$n.iso" && \
                        extract "$n.iso" && \rm -f "$n" ;;
                                        *.zlib)      zlib-flate -uncompress < ./"$n" > ./"$n.tmp" && \
                                            mv ./"$n.tmp" ./"''${n%.*zlib}" && rm -f "$n"   ;;
                                                                                *)
                                                                                    echo "extract: '$n' - unknown archive method"
                                                                                    return 1
                                                                                    ;;
                                                                            esac
                                                                        else
                                                                            echo "'$n' - file doesn't exist"
                                                                            return 1
            fi
        done
    fi
}

# fzf
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
