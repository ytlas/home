# if running bash
if [ -n "$BASH_VERSION" ]; then
	if ! [[ $(ps x) == *"devmon"* ]];then
	    devmon&
	fi
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
