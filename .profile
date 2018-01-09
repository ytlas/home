#!/bin/sh

# Path
PATH=~/.local/bin
PATH=$PATH:~/node_modules/.bin
PATH=$PATH:~/.config/composer/vendor/bin
PATH=$PATH:/usr/local/php70/bin
PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/opt/bin:/opt/sbin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/games
PATH=$PATH:/usr/games

# Editor
if exists emacs && test -e /tmp/emacs1000/server; then export EDITOR=emacsclient
elif exists emacs; then	export EDITOR="emacs -nw -q"
elif exists nano; then export EDITOR=nano
fi

# Export variables
export PATH EDITOR

if [ "/dev/tty1" == "`tty`" ] && [ -f ~/.config/.stx ];then
	startx && exit
fi

# Run bash, if in a shell.
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
	source ~/.bashrc
fi
