#! /bin/env sh

icon=""
lower=${1,,}

# echo $lower

case $lower in
	"kitty" | "zsh")
		icon="  "
		;;
	*"browser" | "min")
		icon="爵 "
		;;
	*"zoom")
		icon=" "
		;;
	*"firefox")
		icon=" "
		;;
	*"chrome" | *"chromium")
		icon=" "
		;;
	*"emacs")
		icon=" "
		;;
	*"typora")
		icon=" "
		;;
	"pwmt" | "zathura" | *".pdf" )
		icon="  "
		;;
	"bitwarden")
		icon=" "
		;;
	"code") 
		icon=" "
		;;
	*)
		icon=" "
		;;
esac


echo $icon
