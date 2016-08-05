# Adam's amazing bash configuration

# Inital important variables
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
export EDITOR="emacs -nw -q"

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
alias pg='ping google.com'
alias vi='env TERM=xterm $EDITOR'
alias sshls='ssh rabbit@leafscript.net'
alias sshfsls='sshfs rabbit@leafscript.net:/home/rabbit/leafscript.net ~/leafscript.net'
alias hiber='sudo sh -c "echo mem>/sys/power/state"'

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
alias adl='youtube-dl -x'
alias vdl='youtube-dl'
