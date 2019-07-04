# {{{ Archiving - Compress/decompress various archive types with a single command
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
	} # }}}

# {{{ Restart wifi
function wifi-home(){
	sudo ip link set wlp4s0 down
	systemctl restart netctl@wlp4s0\\x2dKlein.service
}
function wifi-eduroam(){
	sudo ip link set wlp4s0 down
	systemctl restart netctl@wlp4s0\\x2deduroam.service
} # }}}

# {{{ Mount network HDD
function msebi(){
	if [ "$1" != "" ]
	then
		s mount -t cifs //192.168.192.$1/abgeben/ /media/austausch/ #fuser -km austausch
		# udevil mount //192.168.192.$1/abgeben
	else
		# udevil mount //192.168.192.62/abgeben
		s mount -t cifs //192.168.192.62/abgeben/ /media/austausch/ #fuser -km austausch
	fi
} # }}}

# {{{ Start DDnet and save logs
function ddnet(){
	DATE=`date +%Y-%m-%d_%H:%M:%S`
	#~/.bin/games/ddnet/./DDNet
	DDNet
	mv 1 ~/.teeworlds/logs/"${DATE}"
} # }}}

# {{{ fkill - kill process
function fkill() {
	pid=$(ps -ef | sed 1d | fzf-tmux -m | awk '{print $2}')

	if [ "x$pid" != "x" ]
	then
		kill -${1:-9} $pid
	fi
} # }}}

# {{{ MISC
fancy-ctrl-z () {
if [[ $#BUFFER -eq 0 ]]; then
	BUFFER="fg"
	zle accept-line
else
	zle push-input
fi
}
zle -N fancy-ctrl-z


add_sudo (){
	BUFFER="s $BUFFER"
	zle -w end-of-line
}
zle -N add_sudo
# }}}

# {{{ urxvt font-change
function font-change(){
	fc-match -av | grep -E "family\:|file\:" | sed 's/family: //' | sed 's/file: //' | tr -d '[:blank:]' | cut -d '"' -f2  | sed 'N;s/\n/\t/' | sort | uniq | fzf --bind "space:execute:(echo {} | cut -f2 | xargs ftview 12)" --bind "enter:execute:(echo {} | cut -f1 | xargs -L1 -I '$' urxvt-font-change 'xft:$:pixelsize=12')"
}

# }}}

# {{{ swap
function swap(){
	local TMPFILE=tmp.$$
	mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
} # }}}

# Run 'fff' with 'f' or whatever you decide to name the function.
f() {
	fff "$@"
	cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

lsdd() {
	lsd "$@" --group-dirs first
}
