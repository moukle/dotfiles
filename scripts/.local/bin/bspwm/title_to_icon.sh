#! /bin/env sh

icon=$1

case $1 in
	zsh)
		icon="  "
		;;
	*"browser"*)
		icon=" 爵"
		;;
	*"zathura"*)
		icon="  "
		;;
	*)
		icon=${icon:0:3}..
		;;
esac


echo $icon
