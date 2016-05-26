#!/bin/sh
echo "Installing packages from $HOME/Documents/package-list..."
sudo apt-get install $(grep -vE "^\s*#" "$HOME/Documents/package-list"  | tr "\n" " ")
echo "\nDoes $HOME/.fonts/ exist?"
if ! [ -d $HOME/.fonts/ ];then
    echo "No, creating that directory."
    mkdir ~/.fonts
else
    echo "Yes, proceeding..."
fi

echo "\nDoes $HOME/.icons/ exist?"
if ! [ -d $HOME/.icons/ ];then
    echo "No, creating that directory."
    mkdir ~/.icons
else
    echo "Yes, proceeding..."
fi

echo "\nAre numix icons installed?"
if ! [ -d $HOME/.icons/Numix ];then
    echo "No, attempting to install."
    git clone https://github.com/numixproject/numix-icon-theme $HOME/.icons/numix
    git clone https://github.com/numixproject/numix-icon-theme-circle $HOME/.icons/numix-circle
    mv $HOME/.icons/numix*/Numix* $HOME/.icons/
    rm -rfv $HOME/.icons/numix*/*&&touch $HOME/.icons/numix*/dummy
else
    echo "Yes, skipping..."
fi

echo "\nAre Ubuntu fonts installed?"
if ! [ -d $HOME/.fonts/ubuntu-fonts ];then
    echo "Nope, installing."
    wget http://font.ubuntu.com/download/ubuntu-font-family-0.83.zip -O /tmp/u-fonts.zip
    7z x -o${HOME}/.fonts/ /tmp/u-fonts.zip
    mv $HOME/.fonts/ubuntu-font-family-0.83 $HOME/.fonts/ubuntu-fonts
else
    echo "Yes, skipping..."
fi

echo "\nIs Emacs source code downloaded in $HOME/src/emacs/?"
if ! [ -d $HOME/src/emacs/ ];then
    wget ftp://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz -O /tmp/emacs.tar.xz
    7z x -o/tmp/ /tmp/emacs.tar.xz
    7z x -o${HOME}/src/ /tmp/emacs.tar
    mv $HOME/src/emacs-24.5 $HOME/src/emacs
else
    echo "Yes, skipping..."
fi