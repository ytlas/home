### Personal bash configuration
## Init
GLOBIGNORE=".:.."
shopt -s dotglob

# Bash completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

## Variables
PS1="\u{\w}-> "

## Aliases
alias sudo='sudo '
alias nano='emacsclient -nw'
alias edit=$EDITOR
alias E="SUDO_EDITOR=\"emacsclient\" sudo -e"
alias mall='devmon -ag'
alias umall='devmon -rg'
alias m='sudo mount -o uid=1000'
alias hiber='sudo sh -c "echo mem>/sys/power/state" && sudo systemctl restart NetworkManager'
alias ls='ls -1F --color=always'
alias lsa='ls -lFA'
alias cl='clear'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias ln='ln -v'
alias t='touch'
alias mkdir='mkdir -vp'
alias pg='ping google.com'
alias vi='$EDITOR'
alias fl='du -hsx * | sort -rh | head -n'

# SystemD aliases
alias ctl=systemctl
alias ctlo='systemctl stop'
alias ctls='systemctl start'
alias ctlr='systemctl restart'
alias ctle='systemctl enable'
alias ctld='systemctl disable'

# Media aliases
alias adl='youtube-dl -x'
alias vdl='youtube-dl'
alias gcp='git commit && git push'
alias gcap='git commit -a && git push'
alias gcapa='git commit -a -m ":)" && git push'

## Package manager
# If ~/.debian exists, setup stuff for debian-type systems
if [ -f "$HOME/.config/.debian" ];then
	pmp="sudo apt"
	lpmp="sudo dpkg"
	alias y='${pmp}'
	alias i='${pmp} install'
	alias r='${pmp} remove'
	alias c='sudo apt autoclean && sudo aptitude purge ~c'
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

# Gentoo
elif [ -f "$HOME/.gentoo" ];then
	pmp="sudo emerge"
	alias y='${pmp}'
	alias i='${pmp} --ask --verbose'
	alias r='${pmp} -cav'
	alias s='emerge --search'
fi

# If ~/.server exists, setup stuff for server environment
if [ -f "$HOME/.server" ];then
	PS1="[SERVER] ${PS1}"
fi

## Functions
# Make it easier to dd as I do it so often.
function dda(){
	sudo dd bs=4M if=$PWD/${1} of=${2}
}

function makea(){
	gcc $1.c -o $1
}

### EOF
