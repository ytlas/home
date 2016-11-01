# if running bash
if [ -n "$BASH_VERSION" ]; then
	devmon&
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
