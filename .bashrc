#!/bin/bash

### Personal bash configuration
## Init
GLOBIGNORE=".:.."
shopt -s dotglob

# Bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

# Functions
if [ -f ~/.bashfunctions ]; then source ~/.bashfunctions; fi

# Editor
if exists emacs && test -e /tmp/emacs1000/server; then
	EDITOR=emacsclient
elif exists emacs; then
	EDITOR="emacs -nw -q"
elif exists nano; then
	EDITOR=nano
elif exists vi; then
	EDITOR=vi
fi

# Aliases
if [ -f ~/.bashaliases ]; then source ~/.bashaliases; fi

# Prompt format
if [ -f ~/.bashcolors ]; then
	source ~/.bashcolors
	PS1="${RED}\u${RESET}{${BLUE}\w${RESET}}-> "

	# If ~/.config/.server exists, setup stuff for server environment
	if [ -f "$HOME/.config/.server" ];then
		PS1="[${PURPLE}SRV${RESET}]${PS1}"
	fi
fi

### EOF
