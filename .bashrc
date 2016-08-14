### Adam's amazing bash configuration

## Inital important setup
export GTK_THEME="raleigh"
export PATH="$PATH:/sbin:/usr/sbin:$HOME/bin"
export EDITOR="nano -w"
GLOBIGNORE=".:.."
shopt -s dotglob
umask -S u=rwx,g=,o=>/dev/null
# Bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
# Startx if in the first virtual terminal (tty1)
if ! [[ $(tty) == *"/pts/"* ]] && [[ $(tty) == *"tty1"* ]];then
    if [ -f "$HOME/.xinitrc" ];then
	startx
	exit
    fi
fi

## Variables
TERM=xterm
PS1="\u^\w>"

## Aliases
alias sudo='sudo '
alias m='sudo mount'
alias um='sudo umount'
alias h='sudo sh -c "echo mem>/sys/power/state"'
alias ls='ls -lF'
alias cl='clear'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias t='touch'
alias mkdir='mkdir -vp'
alias nh='sudo TERM=xterm nethogs'
alias nmtui='sudo TERM=xterm nmtui'
alias pg='ping google.com'
alias vi='env TERM=xterm $EDITOR'
alias f='fork'
alias sshls='ssh glas@leafscript.net'
alias sftpls='sftp glas@leafscript.net'
alias sshfsls='sshfs glas@leafscript.net:/home/glas/leafscript.net ~/leafscript.net'
alias sshfssg='sshfs glas@leafscript.net:/sg ~/sg'
# Media aliases
alias adl='youtube-dl -x'
alias vdl='youtube-dl'
# Package manager
# If ~/.debian exists, setup stuff for debian
if [ -f "$HOME/.debian" ];then
    pmp="sudo apt-get"
    alias y='${pmp}'
    alias i='${pmp} install'
    alias r='${pmp} remove'
    alias c='${pmp} autoremove && ${pmp} autoclean'
    alias u='${pmp} update && ${pmp} -u dist-upgrade'
    alias s='apt search'
    alias ly='${lpmp}'
    alias li='${lpmp} -i'
# If ~/.slack exists, setup stuff for slackware
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
elif [ -f "$HOME/.rhel" ];then
    pmp="sudo yum"
    alias y='${pmp}'
    alias i='${pmp} install'
    alias r='${pmp} erase'
    alias u='${pmp} check-update&&${pmp} update'
    alias s='${pmp} search'
fi
# If ~/.server exists, setup stuff for server environment
if [ -f "$HOME/.server" ];then
    PS1="[SERVER] ${PS1}"
fi

### End
