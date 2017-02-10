# if running bash
if [ -n "$BASH_VERSION" ]; then
	# if ! [[ $(ps x) == *"devmon"* ]] && [[ -f /usr/bin/devmon ]];then
	#     devmon --no-mount>/dev/null&
	# fi
	# if ! [[ $(ps x) == *"emacs --daemon"* ]] && [[ -f /usr/bin/emacs ]];then
	#     emacs --daemon>/dev/null&
	# fi
	if ! [[ $(ps x) == *"pulseaudio"* ]] && [[ -f /usr/bin/pulseaudio ]];then
		pulseaudio&
	fi
	# include .bashrc if it exists
	PANEL_FIFO=/tmp/panel-fifo
	PANEL_HEIGHT=24
	PANEL_FONT="-Misc-Fixed-Medium-R-Normal--18-120-100-100-C-90-ISO10646-1"
	PANEL_WM_NAME=bspwm_panel
	export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME
	export PATH="$HOME/bin:$HOME/node_modules/.bin:$PATH:/sbin:/usr/sbin"

    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
