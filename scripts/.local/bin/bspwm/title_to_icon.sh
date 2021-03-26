#! /bin/env sh

icon=""
lower=${1,,}

# echo $lower

case $lower in
	"kitty" | "zsh")
		icon="  "
		;;
	*"browser")
		icon=" 爵"
		;;
	*"chrome" | *"chromium")
		icon=" "
		;;
	*"typora")
		icon=" "
		;;
	"pwmt" | "zathura" | *".pdf" )
		icon="  "
		;;
	"code") 
		icon=" "
		;;
	*)
		icon=" "
		;;
esac


echo $icon
