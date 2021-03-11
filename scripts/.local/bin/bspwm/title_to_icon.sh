#! /bin/env sh

icon=$1

case $1 in
	"kitty" | "zsh")
		icon="  "
		;;
	*"browser")
		icon=" 爵"
		;;
	*"Chrome" | "Chromium")
		icon=" "
		;;
	*"Typora")
		icon=" "
		;;
	*"zathura"* | *".pdf" )
		icon="  "
		;;
	*)
		icon=" "
		;;
esac


echo $icon
