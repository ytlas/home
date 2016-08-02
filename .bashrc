# Adam's amazing bash configuration
export GTK_THEME="raleigh"
export PATH="$PATH:$HOME/bin"
if ! [[ $(tty) == *"/pts/"* ]] && [[ $(tty) == *"tty1"* ]];then
    startx
    exit
fi

# Color variables
GREEN="\[$(tput setaf 2)\]"
RED="\[$(tput setaf 1)\]"
BLUE="\[$(tput setaf 6)\]"
PINK="\[$(tput setaf 5)\]"
YELLOW="\[$(tput setaf 3)\]"
RESET="\[$(tput sgr0)\]"

# Sets bash prompt text
export PS1="\u${PINK}@${GREEN}:${RESET}\w${YELLOW}\$${RESET} "

# Variables
export pmp='sudo apt'
export lpmp='sudo dpkg'
export EDITOR="emacs -nw"

# Aliases
alias sudo='sudo '
alias m='sudo mount'
alias um='sudo umount'
alias h='sudo sh -c "echo mem>/sys/power/state"'
alias ls='ls --color=auto -l'
alias cl='clear'
alias rm='rm -rfv'
alias mv='mv -v'
alias cp='cp -av'
alias mkdir='mkdir -vp'
alias sp='sudo poweroff'
alias sr='sudo reboot'
alias nh='sudo TERM=xterm nethogs'
alias wifi='sudo TERM=xterm nmtui'
alias pg='ping leafscript.net'
alias vi='env TERM=xterm $EDITOR'
alias ..='cd ..'
alias sshls='ssh rabbit@leafscript.net'
alias sshfsls='sshfs rabbit@leafscript.net:/home/rabbit/leafscript.net ~/leafscript.net'

# Laptop specific
alias getbat='cat /sys/class/power_supply/BAT0/capacity'

# Package manager
alias y='${pmp}'
alias i='${pmp} install'
alias r='${pmp} remove'
alias c='${pmp}-get autoremove && ${pmp}-get autoclean'
alias u='${pmp} update && ${pmp} -u dist-upgrade'
alias s='${pmp} search'

# dpkg
alias ly='${lpmp}'
alias li='${lpmp} -i'

# Media
alias adl='youtube-dl -x --audio-format vorbis'
alias vdl='youtube-dl'
