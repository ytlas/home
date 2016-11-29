# if running bash
if [ -n "$BASH_VERSION" ]; then
	if ! [[ $(ps x) == *"devmon"* ]] && [[ -f /usr/bin/devmon ]];then
	    devmon --no-mount>/dev/null&
	fi
	if ! [[ $(ps x) == *"emacs --daemon"* ]] && [[ -f /usr/bin/emacs ]];then
	    emacs --daemon>/dev/null&
        fi
	if ! [[ $(ps x) == *"pulseaudio"* ]] && [[ -f /usr/bin/pulseaudio ]];then
		pulseaudio&
	fi
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
