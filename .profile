#!/bin/sh

# Path
PATH=/bin:/sbin:/usr/bin:/usr/sbin:~/node_modules/.bin:~/.config/composer/vendor/bin/:~/.local/bin:/opt/bin:/opt/sbin:/usr/local/bin:/usr/sbin:/usr/local/games:/usr/games

# Editor
EDITOR="emacsclient"

# Export variables
export PATH EDITOR

# Run bash, if in a shell.
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
	source ~/.bashrc
fi
