#!/usr/bin/env bash

wal --theme $@
# $HOME/.config/wal/done.sh

if [[ "$*" == *"-l"* ]]
then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
fi
