# Adam's amazing bash configuration

# Inital important variables
export GTK_THEME="raleigh"
export PATH="$PATH:/sbin:/usr/sbin:$HOME/bin"
export EDITOR="nano -w"

GLOBIGNORE=".:.."
shopt -s dotglob
umask -S u=rwx,g=,o=

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

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
TERM=xterm

# Aliases
alias sudo='sudo '
alias m='sudo mount'
alias um='sudo umount'
alias h='sudo sh -c "echo mem>/sys/power/state"'
alias ls='ls --color=auto -lF'
alias cl='clear'
alias mv='mv -v'
alias cp='cp -v'
alias mkdir='mkdir -vp'
alias sp='sudo poweroff'
alias sr='sudo reboot'
alias nh='sudo TERM=xterm nethogs'
alias wifi='sudo TERM=xterm nmtui'
alias pg='ping google.com'
alias vi='env TERM=xterm $EDITOR'
alias f='fork'
alias sshls='ssh glas@leafscript.net'
alias sftpls='sftp glas@leafscript.net'
alias sshfsls='sshfs glas@leafscript.net:/home/glas/leafscript.net ~/leafscript.net'
alias sshfssg='sshfs glas@leafscript.net:/sg ~/sg'
alias hiber='sudo sh -c "echo mem>/sys/power/state"'

# Package manager
if [ -f "$HOME/.debian" ];then
    pmp="sudo apt-get"
    alias y='${pmp}'
    alias i='${pmp} install'
    alias r='${pmp} remove'
    alias c='${pmp}-get autoremove && ${pmp}-get autoclean'
    alias u='${pmp} update && ${pmp} -u dist-upgrade'
    alias s='apt search'
    alias ly='${lpmp}'
    alias li='${lpmp} -i'
elif [ -f "$HOME/.slack" ];then
    pmp="sudo slackpkg"
    alias y='${pmp}'
    alias i='${pmp} install'
    alias r='${pmp} remove'
    alias c='sudo pkgtool'
    alias u='${pmp} update&&${pmp} upgrade-all'
    alias s='${pmp} search'
    alias li='sudo installpkg'
    alias lr='sudo removepkg'
fi

# Media
alias adl='youtube-dl -x'
alias vdl='youtube-dl'
