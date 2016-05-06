export GTK_THEME="raleigh"
# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export PATH="$PATH:$HOME/bin"

# Put your fun stuff here.
#PS1 prompt
#colors
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
BLUE="\[$(tput setaf 6)\]"
PINK="\[$(tput setaf 5)\]"
RESET="\[$(tput sgr0)\]"
export PS1="${BLUE}\u${RESET}@${RED}\${PWD}${RESET}>"

#MISC
export EDITOR="emacs -nw"

#Variables
export pmp='sudo apt-get'

#Aliases
#Ez life
alias mount='sudo mount'
alias sudo='sudo '
alias vi="emacsclient"
alias e="emacs -nw"
alias hibernate='sudo sh -c "echo mem>/sys/power/state"'
alias ls='ls --color=auto -l'
alias rm='rm -rfv'
alias mv='mv -v'
alias cp='cp -av'
alias mkdir='mkdir -vp'
alias sp='sudo poweroff'
alias sr='sudo reboot'

#Laptop specific
alias getbat='cat /sys/class/power_supply/BAT0/capacity'

#Package manager
alias ym='${pmp}'
alias upgrade='${pmp} -uDU --with-bdeps=y @world'
alias clean='${pmp} -av --depclean'

#Media
alias adl='youtube-dl -x --audio-format vorbis'
alias vdl='youtube-dl'

if [ $TERM = 'linux' -a $SHELL == '/bin/bash' ] ; then
    echo -e '\033[?17;0;64c'
fi
