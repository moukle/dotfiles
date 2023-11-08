set -U fish_greeting
set -x PATH $HOME/.local/bin $PATH

zoxide init fish | source

starship init fish | source

alias v "nvim"
alias cp "advcp -gR"
alias mv "advmv -g"

alias ls "exa --icons --group-directories-first"
alias ll "ls -l"
alias la "ls -a"
