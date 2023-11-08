# bin
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/bspwm"
export PATH="$PATH:$HOME/.config/emacs/bin"

# XDG (xdg-ninja)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# clean up ~
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# langs
export CARGO_HOME="$XDG_DATA_HOME"/cargo        # rust
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv     # cuda
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker  # docker
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"

export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export NIMBLE_DIR="$XDG_DATA_HOME/nimble"

# programs
export EDITOR="nvim"
export BROWSER="chromium"

# vars
export EXA_ICON_SPACING=2

# HiDPI
# export QT_DEVICE_PIXEL_RATIO=2
# export QT_AUTO_SCREEN_SCALE_FACTOR=true

# fff
export FFF_KEY_GO_DIR=":"
export FFF_KEY_GO_HOME="~"
export FFF_KEY_GO_TRASH="t"
export FFF_KEY_REFRESH="e"

# wayland
export MOZ_ENABLE_WAYLAND=1

# python
# export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
