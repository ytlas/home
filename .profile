# PANEL_FIFO=/tmp/panel-fifo
# PANEL_HEIGHT=24
# PANEL_FONT="-Misc-Fixed-Medium-R-Normal--18-120-100-100-C-90-ISO10646-1"
# PANEL_WM_NAME=bspwm_panel
PATH="/bin:/usr/bin:/usr/sbin:$HOME/node_modules/.bin:/sbin:$HOME/.local/bin:/opt/bin:/opt/sbin:$HOME/.config/composer/vendor/bin/:/usr/local/bin:/sbin:/usr/sbin:/usr/local/games:/usr/games"
EDITOR="emacsclient"

export PATH EDITOR

if [ -n "$BASH_VERSION" ]; then
	 if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
	 fi
fi
# export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME

# if running bash
# if ! [[ $(tty) == *"/pts/"* ]] && [[ $(tty) == *"tty1"* ]] && [ -f "$HOME/.stx" ] && [ -f "$HOME/.xinitrc" ];then
#	startx
#	exit
# elif [ -n "$BASH_VERSION" ]; then
#     if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#     fi
# fi
