source ~/.zprofile
autoload -U compinit
compinit

setopt prompt_subst
#PROMPT='$(cat /sys/class/power_supply/BAT0/capacity)[%D{%L:%M:%S}]%f:%F${${(%):-%~}}%f$ %b'
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}
cd ${HOME}

#-Fuck-
export PATH=${PATH}:${HOME}/bin
export EDITOR='nvim'
export WINEDLLOVERRIDES='winemenubuilder.exe=d'
export DISPLAY=:0
export GTK_THEME=Raleigh

#-RC vars-
emerge='sudo /usr/bin/emerge --nospinner'

#-Aliases-
#Making life easier..
alias sudo='sudo '
alias vi='/usr/bin/nvim'
alias cp='cp -av'
alias rm='sudo rm -rfv'
alias mv='mv -v'
alias mkdir='mkdir -vp'
alias getip='internetconnection&&echo "A connection to the internet was successfully established\nGetting ip...\n"&&curl ytlas.com/ip.php'
alias ls='ls --color=auto -l'
alias visudo='sudo env EDITOR="nvim" visudo'
alias mount='sudo mount'
#Package management
alias ym=$emerge
alias upgrade='${emerge} -uDU --with-bdeps=y @world'
alias clean='${emerge} -av --depclean'
alias update='sudo etc-update'
alias news='sudo eselect news read'
alias layman='sudo layman'
alias search='${emerge} --search'
#Power management
alias poweroff='sudo poweroff'
alias reboot='sudo reboot'
alias hibernate='sudo echo "mem">/sys/power/state'
#Applications
alias flix='peerflix -md'
alias steam='env LD_LIBRARY_PATH="/usr/lib32/opengl/nvidia/lib" nohup ~/.steam/steam/steam.sh>/dev/null 2>&1&'
alias teamspeak='nohup /usr/share/teamspeak/ts3client_runscript.sh>/dev/null 2>&1&'
alias stepmania='nohup /usr/local/stepmania-5.0/stepmania>/dev/null 2>&1&'
alias torrent='transmission-daemon -p 8000'
#Miscellaneous
alias reloadXB='killall xbindkeys&&xbindkeys'

#powerline bash
#. /usr/lib64/python3.4/site-packages/powerline/bindings/bash/powerline.sh

#-Functions-
#Mounts cloud in ~/cloud with sshfs
function cloud(){
	local username=rabbit
	local dns=ytlas.com
	local full=${username}@${dns}
	line=$(mount|grep -i ${HOME}/cloud)
	if [ $? -eq 1 ]
	   then
		   printf "Attempting to mount the \033[0;35mcloud\033[0m in \033[0;34m${username}\033[0m's home directory through ssh...\n"
		   sshfs $full:/home/${username}/cloud $HOME/cloud
	else
		printf "Attempting to unmount the current \033[0;35mcloud\033[0m...\n"
		fusermount -u $HOME/cloud
	fi
	printf "Done \033[0;32m:-)\033[0m\n"
}
#Mounts a web directory in /home/user/www with sshfs
function www(){
	local username=rabbit
	local dns=ytlas.com
	local full=${username}@${dns}
	line=$(mount|grep -i ${HOME}/www)
	if [ $? -eq 1 ]
	   then
		   printf "Attempting to mount the \033[0;31mwww\033[0m in \033[0;34m${username}\033[0m's home directory through ssh...\n"
		   sshfs $full:/home/${username}/www $HOME/www
	else
		printf "Attempting to unmount the current \033[0;31mwww\033[0m...\n"
		fusermount -u $HOME/www
	fi
	printf "Done \033[0;32m:-)\033[0m\n"
}
# Launches the tor browser with a weird method because tor browser for Linux is weird.
function tor(){
    local wd=${PWD}
    cd /usr/share/tor-browser
    /usr/share/tor-browser/start-tor-browser.desktop
    cd ${wd}
}
# Makes livestreamer nicer & easier to use.
function stream(){
    if [ -z ${1} ]
	then
	printf "Invalid syntax: *stream \033[0;32mstreamer \033[0;34mquality\033[0m*\n"
    else
	if [ -z ${2} ]
	    then
	    printf "You didn't specify a quality: *stream \033[0;32mstreamer \033[0;34mquality\033[0m*\n"
	else
	    printf "Attempting to play twitch.tv/\033[0;32m${1}\033[0m in \033[0;34m${2}\033[0m quality...\n"
	    nohup livestreamer -p "mplayer" http://www.twitch.tv/${1} ${2}>/dev/null 2>&1&
	fi
    fi
}
#Returns 0 or 1 depending on if the user can successfully connect to google.com throught the internet.
internetconnection(){
        wget -q --spider http://google.com
        if [ $? -eq 0 ]; then
                return 0
        else
                return 1
        fi
}
fork(){
    echo ${*}
    if [ -z ${1} ];then
	printf "Syntax: fork executable\n"
    else
	nohup "${*}">/dev/null 2>&1&
    fi
    printf "Executable forked to background.\n"
}
getPath(){
    printf "${PWD}/${1}\n"
}
