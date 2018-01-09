#!/bin/bash

### Personal bash configuration
## Init
GLOBIGNORE=".:.."
shopt -s dotglob
PD=~/.config/qwerty
source $PD/config

# Bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

# Functions
source $PD/bashfunctions

# Set editor, depending on what is available.
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
source $PD/bashaliases

# Prompt format
source $PD/bashcolors
PS1="${RED}\u${RESET}{${BLUE}\w${RESET}}-> "

# If ~/.config/.server exists, setup stuff for server environment
if [ "$ENV_TYPE" == server ];then
	PS1="[${PURPLE}SRV${RESET}]${PS1}"
fi

### EOF
