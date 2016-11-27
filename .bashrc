### Adam's amazing bash configuration

## Inital important setup
export GTK_THEME="raleigh"
export PATH="$HOME/bin:$HOME/node_modules/.bin:$PATH:/sbin:/usr/sbin"
export EDITOR="emacsclient"
GLOBIGNORE=".:.."
shopt -s dotglob
umask -S u=rwx,g=,o=>/dev/null
# Bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
# Startx if in the first virtual terminal (tty1) if ~/.stx exists
if ! [[ $(tty) == *"/pts/"* ]] && [[ $(tty) == *"tty1"* ]] && [ -f "$HOME/.stx" ];then
    if [ -f "$HOME/.xinitrc" ];then
	startx
	exit
    fi
fi

## Variables
TERM=xterm
PS1="\u{\w}\$ "

## Aliases
alias sudo='sudo '
alias E="SUDO_EDITOR=\"emacsclient\" sudo -e"
alias m='devmon --mount'
alias um='devmon --unmount'
alias mall='devmon -ag'
alias umall='devmon -rg'
alias hiber='sudo sh -c "echo mem>/sys/power/state"&&sudo systemctl restart NetworkManager'
alias ls='ls -lF'
alias lsa='ls -lFA'
alias cl='clear'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias ln='ln -v'
alias t='touch'
alias mkdir='mkdir -vp'
alias nh='sudo TERM=xterm nethogs'
alias nmtui='nmtui'
alias pg='ping google.com'
alias vi='env TERM=xterm $EDITOR'
alias f='fork'
alias sshls='ssh glas@leafscript.net'
alias sftpls='sftp glas@leafscript.net'
alias sshfsls='sshfs glas@leafscript.net:/home/glas/leafscript.net ~/leafscript.net'
alias sshfssg='sshfs glas@leafscript.net:/sg ~/sg'
alias fl='du -hsx * | sort -rh | head -n'
# Media aliases
alias adl='youtube-dl -x'
alias vdl='youtube-dl'
alias gcp='git commit -m ":)"&&git push'
alias gcap='git commit -a -m ":)"&&git push'
# Package manager
# If ~/.debian exists, setup stuff for debian-type systems
if [ -f "$HOME/.debian" ];then
    pmp="sudo apt"
    alias y='${pmp}'
    alias i='${pmp} install'
    alias r='${pmp} remove'
    alias c='sudo apt-get autoremove && sudo apt-get autoclean'
    alias u='${pmp} update && ${pmp} -u dist-upgrade'
    alias s='${pmp} search'
    alias ly='${lpmp}'
    alias li='${lpmp} -i'
    alias sctl='sudo systemctl'
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
# If ~/.rhel exists, setup stuff for RHEL-type systems
elif [ -f "$HOME/.rhel" ];then
    pmp="sudo yum"
    alias y='${pmp}'
    alias i='${pmp} install'
    alias r='${pmp} erase'
    alias u='${pmp} check-update&&${pmp} update'
    alias s='${pmp} search'
# If ~/.arch exists, setup stuff for arch-linux-type systems
elif [ -f "$HOME/.arch" ];then
    pmp="sudo pacman"
    alias y='${pmp}'
    alias i='${pmp} -S'
    alias r='${pmp} -Rns'
    alias u='${pmp} -Syu'
fi
# If ~/.server exists, setup stuff for server environment
if [ -f "$HOME/.server" ];then
    PS1="[SERVER] ${PS1}"
fi

## Functions
# Make it easier to dd as I do it so often.
function dda(){
    sudo dd bs=4M if=${1} of=${2}
}

function makea(){
    gcc $1.c -o $1
}

### EOF
