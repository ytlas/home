# if running bash
if [ -n "$BASH_VERSION" ]; then
	if ! [[ $(ps x) == *"devmon"* ]] && [[ -f /usr/bin/devmon ]];then
	    devmon --no-mount&
	fi
	if ! [[ $(ps x) == *"emacs --daemon"* ]] && [[ -f /usr/bin/emacs ]];then
	    emacs --daemon&
        fi
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
