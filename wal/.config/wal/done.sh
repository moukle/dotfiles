#!/bin/sh

# =================================================
# Symlink config files so programs can be started
# without referencing the cache directly
#
# Includes: zathura, dunst, discord, stylus, wezterm
# =================================================
mkdir -p  "${HOME}/.config/dunst"
mkdir -p  "${HOME}/.config/wezterm/colors"
mkdir -p  "${HOME}/.config/tofi"
# mkdir -p  "${HOME}/.config/zathura"
# mkdir -p  "${HOME}/.config/Code/User"

ln -sf "${HOME}/.cache/wal/dunstrc"              "${HOME}/.config/dunst/dunstrc"
ln -sf "${HOME}/.cache/wal/tofi"                 "${HOME}/.config/tofi/config"
ln -sf "${HOME}/.cache/wal/wezterm-wal.toml"     "${HOME}/.config/wezterm/colors/wal.toml"
# ln -sf "${HOME}/.cache/wal/zathurarc"          "${HOME}/.config/zathura/zathurarc"
# ln -sf "${HOME}/.cache/wal/vscode.json"        "${HOME}/.config/Code/User/settings.json"
# ln -sf "${HOME}/.cache/wal/colors-discord.css" "${HOME}/.config/discocss/colors-discord.css"

# set background
# $HOME/.cache/wal/wallpaper.sh

# ================
# restart programs
# ================
pkill dunst; dunst   & # dunst

# qutebrowser
# if pgrep -x "qutebrowser" > /dev/null; then
# 	qutebrowser :restart &> /dev/null
# fi

# ================
# rebuild programs
# ================
# colors-everything stylus
# ln -sf "${HOME}/.cache/wal/colors-everything-css.styl" "${HOME}/dev/solarized-everything-css/themes/wal/colors.styl"
# (cd ${HOME}/dev/solarized-everything-css && \
# 	make clean >> /dev/null && \
# 	make >> /dev/null)

# tabbed
# tabbed_dir=$(where tabbed | xargs dirname)
# (cd $HOME/.local/bin/tabbed && \
# 	make clean >> /dev/null && \
# 	make >> /dev/null)
