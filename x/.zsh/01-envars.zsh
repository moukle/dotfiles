export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export BIN_HOME="$HOME/.bin"

export PANEL_FIFO="/tmp/panel-fifo"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH=$PATH:$HOME/.bin/
export PATH=$PATH:$HOME/.bin/rofi-scripts
export PATH=$PATH:$HOME/.config/bspwm/scripts
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/.bin/programs/squash/

export WORDCHARS=''
export KEYTIMEOUT=1

export FZF_DEFAULT_OPTS='--height 40% --reverse --border --color hl+:1,bg+:4,fg+:15,marker:3,pointer:3'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'

export FZF_ALT_C_COMMAND=''
export FZF_ALT_C_OPTS="--preview 'tree -CdL 2 {} | head -200'"

export EDITOR='nvim'
export MANPAGER='less'
export PAGER='less'
export BROWSER='firefox'

export TERMINAL='st'

export _JAVA_AWT_WM_NONREPARENTING=1

export LD_LIBRARY_PATH=/opt/cuda/lib64/
