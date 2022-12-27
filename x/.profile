# bin
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/bspwm"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"

# xdg
# export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"

# programs
export EDITOR="nvim"
# export BROWSER="qutebrowser"
export BROWSER="firefox"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
