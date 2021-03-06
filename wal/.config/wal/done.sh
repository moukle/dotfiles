#!/bin/sh

# =================================================
# Symlink config files so programs can be started
# without referencing the cache directly
#
# Includes: zathura, dunst, discord
# =================================================

mkdir -p  "${HOME}/.config/zathura"
mkdir -p  "${HOME}/.config/dunst"

ln -sf "${HOME}/.cache/wal/zathurarc"          "${HOME}/.config/zathura/zathurarc"
ln -sf "${HOME}/.cache/wal/dunstrc"            "${HOME}/.config/dunst/dunstrc"
ln -sf "${HOME}/.cache/wal/colors-discord.css" "${HOME}/.config/discocss/colors-discord.css"

# rebuild tabbed
# tabbed_dir=$(where tabbed | xargs dirname)
(cd $HOME/.local/bin/tabbed && \
	make clean >> /dev/null && \
	make >> /dev/null)

# restart programs
pkill dunst; dunst   & # dunst
bspc wm -r             # bspwm

# qutebrowser
if pgrep -x "qutebrowser" > /dev/null; then
	qutebrowser :restart &
fi
