. ~/.profile
. ~/.cache/wal/colors.fish
. ~/.config/fish/aliases.fish
. ~/.config/fish/functions.fish

direnv hook fish | source

set fish_greeting
set -U SXHKD_SHELL /usr/bin/bash
set fzf_fd_opts --hidden --exclude=.git

fish_vi_key_bindings
fish_ssh_agent
ssh-add -q ~/.ssh/id_ed25519
# fzf_key_bindings

starship init fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/moritz/dev/google-cloud-sdk/path.fish.inc' ]; . '/home/moritz/dev/google-cloud-sdk/path.fish.inc'; end
