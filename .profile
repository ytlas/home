#!/bin/sh

# Path
PATH=~/.local/bin
PATH=$PATH:~/node_modules/.bin
PATH=$PATH:~/.config/composer/vendor/bin
PATH=$PATH:/usr/local/php70/bin;
PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/opt/bin:/opt/sbin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/sbin
# PATH=$PATH:/usr/local/games
# PATH=$PATH:/usr/games

# Export variables
export PATH

# If in the first vt (tty1) and a specific file exists, run startx.
if [ "/dev/tty1" == "`tty`" ] && [ -f ~/.config/qwerty/startx ];then
	startx && exit 1
fi

# Run bash, if in a shell.
if [ -n "$BASH_VERSION" ] && [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
