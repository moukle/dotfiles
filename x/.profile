# PATH to bins
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/bspwm"
export PATH="$PATH:$HOME/.emacs.d/bin"

# Wayland
# export CLUTTER_BACKEND=wayland
# export GBM_BACKEND=nvidia-drm
# export LIBSEAT_BACKEND=logind
# export MOZ_ENABLE_WAYLAND=1
# export MOZ_USE_XINPUT2=1
# export QT_QPA_PLATFORM=wayland
# export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
# export SDL_VIDEODRIVER=wayland
# export WLR_NO_HARDWARE_CURSORS=1
# export WLR_RENDERER=vulkan
# export XDG_SESSION_TYPE=wayland
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export __GL_GSYNC_ALLOWED=0
# export __GL_VRR_ALLOWED=0

# CUDA
export PATH="$PATH:/opt/cuda/bin/:/opt/cuda/nsight_compute/"

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/cuda/targets/x86_64-linux/lib/"

# Programs
export EDITOR="nvim"
export EXA_ICON_SPACING=1
export BROWSER="qutebrowser"
export TERM=xterm-256color

# Prompt
export STARSHIP_CONFIG=$HOME/.config/starship.toml
