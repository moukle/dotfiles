. ~/.config/fish/aliases.fish
. ~/.config/fish/functions.fish

# enable direnv
direnv hook fish | source

# disable greeting
set fish_greeting

# set prompt
starship init fish | source

# set colors
source ~/.cache/wal/colors.fish

# set shell for sxhkd keybindings
set -U SXHKD_SHELL /usr/bin/bash

# enable vim bindings
fish_vi_key_bindings

# add ssh-key (quiet)
# also: https://github.com/ivakyb/fish_ssh_agent
fish_ssh_agent
# AddKeysToAgent yes
# ssh-add -q ~/.ssh/moritz

# set paths (currently done in ~/.profile)
source ~/.profile

# fzf show hidden
set fzf_fd_opts --hidden --exclude=.git
