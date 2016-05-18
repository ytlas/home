# Important initial setup
export GTK_THEME="raleigh"
export PATH="$PATH:$HOME/bin"

# Starts an Xserver if the DISPLAY variable is not set
if ! [[ $DISPLAY ]];then
    startx && exit
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
export EDITOR="vi"

# Aliases
alias m='sudo mount'
alias s='sudo '
alias h='sudo sh -c "echo mem>/sys/power/state"'
alias l='ls --color=auto -l'
alias r='rm -rfv'
alias m='mv -v'
alias c='cp -av'
alias mk='mkdir -vp'
alias sp='sudo poweroff'
alias sr='sudo reboot'
alias nethogs='sudo TERM=xterm nethogs'
alias wifi='sudo TERM=xterm nmtui'

# Laptop specific
alias getbat='cat /sys/class/power_supply/BAT0/capacity'

# Package manager
alias y='${pmp}'
alias i='${pmp} install'
alias r='${pmp} remove'
alias c='${pmp} autoremove && ${pmp} autoclean'
alias u='${pmp} update && ${pmp} -u dist-upgrade'
alias s='${pmp} search'

# dpkg
alias ly='${lpmp}'
alias li='${lpmp} -i'

# Media
alias adl='youtube-dl -x --audio-format vorbis'
alias vdl='youtube-dl'