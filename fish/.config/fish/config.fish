# disable greeting
set fish_greeting

# set prompt
starship init fish | source

# set colors
source ~/.cache/wal/colors.fish

# use sh for sxhkd keybindings
set -U SXHKD_SHELL sh

# enable vim bindings
fish_vi_key_bindings

# set paths (currently done in ~/.profile)
# set PATH $HOME/.local/bin $PATH
# set PATH $HOME/.local/bin/bspwm $PATH
