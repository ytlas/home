export GTK_THEME="raleigh"
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi
export PATH="$PATH:$HOME/bin"
if ! [[ $DISPLAY ]];then
    startx && exit
fi

#colors
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
BLUE="\[$(tput setaf 6)\]"
PINK="\[$(tput setaf 5)\]"
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"

export PS1="\u@\h>"

#MISC
export EDITOR="vi"

#Variables
export pmp='sudo apt'

#Aliases
#Ez life
alias mount='sudo mount'
alias sudo='sudo '
alias hibernate='sudo sh -c "echo mem>/sys/power/state"'
alias ls='ls --color=auto -l'
alias rm='rm -rfv'
alias mv='mv -v'
alias cp='cp -av'
alias mkdir='mkdir -vp'
alias sp='sudo poweroff'
alias sr='sudo reboot'
alias nethogs='sudo TERM=xterm nethogs'

#Laptop specific
alias getbat='cat /sys/class/power_supply/BAT0/capacity'

#Package manager
alias ym='${pmp}'
alias install='${pmp} install'
alias remove='${pmp} remove'
alias clean='${pmp} autoremove && ${pmp} autoclean'
alias upgrade='${pmp} update && ${pmp} -u dist-upgrade'
alias search='${pmp} search'

#Media
alias adl='youtube-dl -x --audio-format vorbis'
alias vdl='youtube-dl'

if [ $TERM = 'linux' -a $SHELL == '/bin/bash' ] ; then
    echo -e '\033[?17;0;64c'
fi
