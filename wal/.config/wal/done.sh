#!/bin/sh

# source colors of wal
source $HOME/.cache/wal/colors.sh

# set border colors
bspc config focused_border_color  $color15
bspc config normal_border_color   $background
bspc config active_border_color   $color0
bspc config presel_feedback_color $color2

# =================================================
# Symlink config files so programs can be started
# without referencing the cache directly
#
# Includes: zathura, dunst
# =================================================

mkdir -p  "${HOME}/.config/zathura"
mkdir -p  "${HOME}/.config/dunst"
ln -sf    "${HOME}/.cache/wal/zathurarc"  "${HOME}/.config/zathura/zathurarc"
ln -sf    "${HOME}/.cache/wal/dunstrc"    "${HOME}/.config/dunst/dunstrc"

# restart dunst
pkill dunst; dunst &
