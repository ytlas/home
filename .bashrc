export TERM="xterm"
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

#if [[ $DISPLAY ]];then
    #ls -l
#else
    #startx
    #exit
#fi

# Put your fun stuff here.
#PS1 prompt
#colors
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
BLUE="\[$(tput setaf 6)\]"
PINK="\[$(tput setaf 5)\]"
RESET="\[$(tput sgr0)\]"
export PS1="${PINK}[${RESET}${BLUE}\u${RESET}@${RED}\h${RESET}:\$PWD${PINK}]${RESET}-${GREEN}>${RESET}"
#MISC
export EDITOR="nvim"
export PATH="$PATH:$HOME/bin"
#Variables
export pmp='sudo emerge --color n'

#Aliases
#Ez life
alias sudo='sudo '
alias vi="nvim"
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