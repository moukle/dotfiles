autoload -U colors && colors
autoload -U compinit && compinit
autoload -U vcs_info && vcs_info

zmodload zsh/complist
zmodload zsh/terminfo

# setopt
setopt \
	autocd \
	ksh_glob \
	extendedglob \
	prompt_subst \
	inc_append_history \
	interactivecomments

# -- MISC
HISTFILE=~/.zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd

#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Import seperate config files
#=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
eval $( dircolors -b ~/.zsh/lscolours)
# export LS_COLORS=$(ls_colors_generator)

for r in $HOME/.zsh/*.zsh; do
	if [[ $DEBUG > 0 ]]; then
		echo "zsh: sourcing $r"
	fi
	source $r
done

#export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# vim: foldmethod=marker foldlevel=0

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
