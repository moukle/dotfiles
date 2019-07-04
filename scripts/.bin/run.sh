#!/bin/sh
# customized dmenu_run

PREFIX="RUN"

IFS=:
stest -flx ${PATH} | sort -u | dmenu -p ${PREFIX} -i -fn "Hack:size=16:style=regular" -sf '#09090d' -sb '#8c6e43' -nf '#839496' -nb '#09090d' "${@}" | sh &
