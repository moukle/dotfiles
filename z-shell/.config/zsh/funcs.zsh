# Archiving - Compress/decompress various archive types with a single command
ex() {
	case $1 in

		e)
			case $2 in
				*.tar.bz2)   tar xvjf $2      ;;
				*.tar.gz)    tar xvzf $2      ;;
				*.bz2)       bunzip2 $2       ;;
				*.rar)       unrar x $2       ;;
				*.gz)        gunzip $2        ;;
				*.tar)       tar xvf $2       ;;
				*.tbz2)      tar xvjf $2      ;;
				*.tgz)       tar xvzf $2      ;;
				*.zip)       unzip $2         ;;
				*.Z)         uncompress $2    ;;
				*.7z)        7z x $2          ;;
				*)           echo "'$2' kann nicht mit >ark< entpackt werden" ;;
			esac ;;

		c)
			case $2 in
				*.tar.*)    arch=$2; shift 2;
					tar cvf ${arch%.*} $@
					case $arch in
						*.gz)   gzip -9r ${arch%.*}   ;;
						*.bz2)  bzip2 -9zv ${arch%.*} ;;
					esac                                ;;
				*.rar)      shift; rar a -m5 -r $@; rar k $1    ;;
				*.zip)      shift; zip -9r $@                   ;;
				*.7z)       shift; 7z a -mx9 $@                 ;;
				*)          echo "Kein gültiger Archivtyp"      ;;
			esac ;;

		*)
			echo "WATT?" ;;

		esac
	}

# Run 'fff' with 'f' or whatever you decide to name the function.
f() {
	fff "$@"
	cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

# Add sudo to start of the line
add_sudo (){
	BUFFER="s $BUFFER"
	zle -w end-of-line
}
zle -N add_sudo

# lf with cd on quit
lfcd () {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
	local pid
	if [ "$UID" != "0" ]; then
		pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
	else
		pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
	fi

	if [ "x$pid" != "x" ]
	then
		echo $pid | xargs kill -${1:-9}
	fi
}
