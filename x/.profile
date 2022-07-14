# PATH to bins
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/bspwm"
export PATH="$PATH:$HOME/.emacs.d/bin"

# CUDA
export PATH="$PATH:/opt/cuda/bin/:/opt/cuda/nsight_compute/"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/targets/x86_64-linux/lib/"

# Programs
export EDITOR="nvim"
export EXA_ICON_SPACING=1
export BROWSER="qutebrowser"
export TERM=xterm-256color

# Prompt
export STARSHIP_CONFIG=~/.config/starship.toml
