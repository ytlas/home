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
#MISC
export EDITOR="nvim"
export PS1="[\u:\$PWD]\$"
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
#Laptop specific
alias getbat='cat /sys/class/power_supply/BAT0/capacity'
#Package manager
alias ym='${pmp}'
