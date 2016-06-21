#!/bin/bash

printf "\nInstalling packages from $HOME/Documents/package-list..."
sudo apt-get install $(grep -vE "^\s*#" "$HOME/Documents/package-list"  | tr "\n\n" " ")

printf "\n\nDoes $HOME/.fonts/ exist?"
if ! [ -d $HOME/.fonts/ ];then
    printf "\nNo, creating that directory."
    mkdir ~/.fonts
else
    printf "\nYes, proceeding..."
fi

printf "\n\nDoes $HOME/.icons/ exist?"
if ! [ -d $HOME/.icons/ ];then
    printf "\nNo, creating that directory."
    mkdir ~/.icons
else
    printf "\nYes, proceeding..."
fi

# printf "\n\nAre numix icons installed?"
# if ! [ -d $HOME/.icons/Numix ];then
#     printf "\nNo, attempting to install."
#     git clone https://github.com/numixproject/numix-icon-theme $HOME/.icons/numix
#     git clone https://github.com/numixproject/numix-icon-theme-circle $HOME/.icons/numix-circle
#     mv $HOME/.icons/numix*/Numix* $HOME/.icons/
#     rm -rfv $HOME/.icons/numix*/*&&touch $HOME/.icons/numix*/dummy
# else
#     printf "\nYes, skipping..."
# fi

printf "\n\nAre Ubuntu fonts installed?"
if ! [ -d $HOME/.fonts/ubuntu-fonts ];then
    printf "\nNope, installing."
    wget http://font.ubuntu.com/download/ubuntu-font-family-0.83.zip -O /tmp/u-fonts.zip
    7z x -o${HOME}/.fonts/ /tmp/u-fonts.zip
    mv $HOME/.fonts/ubuntu-font-family-0.83 $HOME/.fonts/ubuntu-fonts
else
    printf "\nYes, skipping..."
fi

# printf "\n\nIs Emacs source code downloaded in $HOME/src/emacs/?"
# if ! [ -d $HOME/src/emacs/ ];then
#     wget ftp://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz -O /tmp/emacs.tar.xz
#     7z x -o/tmp/ /tmp/emacs.tar.xz
#     7z x -o${HOME}/src/ /tmp/emacs.tar
#     mv $HOME/src/emacs-24.5 $HOME/src/emacs
# else
#     printf "\nYes, skipping..."
# fi

printf "\n\nDoes /usr/bin/node exist?"
if [ ! -f /usr/bin/node ]; then
    printf "\nNo, linking it from /usr/bin/nodejs."
    sudo ln -s /usr/bin/nodejs /usr/bin/node
else
    printf "\nYes, skipping..."
fi

printf "\n\nIs peerflix installed?"
if ! [[ $(npm list -g peerflix) == *"peerflix"* ]];then
    printf "\nNo, installing."
    sudo npm install peerflix -g
else
    printf "\nYes, skipping..."
fi

printf "\n\nIs youtube-dl installed?"
if ! [[ $(pip list) == *"youtube-dl"* ]];then
    printf "\nNo, installing."
    sudo pip install youtube-dl
else
    printf "\nYes, skipping..."
fi

# printf "\n\nIs Firefox-esr installed in /usr/local/firefox/?"
# if ! [ -d /usr/local/firefox ];then
#     printf "\nNo, installing..."
#     wget "https://download.mozilla.org/?product=firefox-esr-latest&os=linux64&lang=en-US" -O /tmp/firefox.tar.bz2
#     7z x -o/tmp/ /tmp/firefox.tar.bz2
#     rm /tmp/firefox.tar.bz2
#     7z x -o/tmp/ /tmp/firefox*.tar
#     rm /tmp/firefox*.tar
#     sudo mv /tmp/firefox/ /usr/local/firefox/
#     sudo ln -s /usr/local/firefox/firefox /usr/local/bin/firefox-esr
# else
#     printf "\nYes, skipping..."
# fi

printf "\n\nIs TeamSpeak installed in /usr/local/teamspeak/?"
if ! [ -d /usr/local/teamspeak ];then
    printf "\nNo, installing..."
    wget http://dl.4players.de/ts/releases/3.0.19.1/TeamSpeak3-Client-linux_amd64-3.0.19.1.run -O /tmp/teamspeak.run
    chmod +x /tmp/teamspeak.run
    /tmp/teamspeak.run
    rm /tmp/teamspeak.run
    sudo mv $PWD/TeamSpeak3-Client-linux_amd64* /usr/local/teamspeak/
    rm -rf $PWD/TeamSpeak3-Client-linux_amd64*
    sudo ln -s /usr/local/teamspeak/ts3client_runscript.sh /usr/local/bin/teamspeak
else
    printf "\nYes, skipping..."
fi

printf "\n\nIs pcspkr loaded?"
if [[ $(lsmod) == *"pcspkr"* ]];then
    printf "\nYes, unloading."
    sudo modprobe -r pcspkr
    printf "\n\nAlso assuming that it's not blacklisted, attempting to blacklist module..."
    sudo sh -c 'echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf'
else
    printf "\nNo, skipping..."
fi

printf "\n\n"
