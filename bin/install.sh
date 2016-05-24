#!/bin/sh
echo "Installing packages from $HOME/Documents/package-list..."
sudo apt-get install $(grep -vE "^\s*#" "$HOME/Documents/package-list"  | tr "\n" " ")

mkdir ~/.fonts
mkdir ~/.icons

git clone https://github.com/numixproject/numix-icon-theme $HOME/.icons/numix
git clone https://github.com/numixproject/numix-icon-theme-circle $HOME/.icons/numix-circle

mv $HOME/.icons/numix*/Numix* $HOME/.icons/
rm -rfv $HOME/.icons/numix*/*&&touch $HOME/.icons/numix*/dummy