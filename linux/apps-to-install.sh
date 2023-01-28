#!/bin/bash

set -eu -o pipefail # fail on error and report it, debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

echo " "
echo installing the must-have pre-requisites
sudo apt-get update

while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    curl
    wget
    zip unzip
    git
    htop
    tldr
    cmatrix
EOF
)

echo " "
echo installing the nice-to-have pre-requisites
echo you have 5 seconds to proceed ...
echo or
echo hit Ctrl+C to quit
echo -e "\n"
sleep 6

sudo add-apt-repository -y universe
sudo apt-get update

while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    nala
    trash-cli
    timeshift
    ncdu
    gnome-tweaks
    synaptic
    ubuntu-restricted-extras
EOF
)

echo " "
echo installing snap apps the nice-to-have pre-requisites
echo you have 5 seconds to proceed ...
echo or
echo hit Ctrl+C to quit
echo -e "\n"
sleep 6

sudo snap install bitwarden
sudo snap install postman
sudo snap install dbeaver-ce

echo " "
if ! [ -x "$(command -v /usr/bin/google-chrome-stable)" ]; then
    echo downloading google chrome...
    curl -o ~/Downloads/google-chrome-stable.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    echo installing google chrome...
    sudo apt install ~/Downloads/google-chrome-stable.deb
else
    echo google chrome is already installed
fi

echo " "
if ! [ -x "$(command -v code)" ]; then
    echo downloading vscode...
    curl -o ~/Downloads/vscode.deb https://az764295.vo.msecnd.net/stable/97dec172d3256f8ca4bfb2143f3f76b503ca0534/code_1.74.3-1673284829_amd64.deb
    echo installing vscode...
    sudo apt install ~/Downloads/vscode.deb
else
    echo vscode is already installed
fi

echo " "
if ! [ -x "$(command -v nvm)" ]; then
    echo downloading and installing nvm...
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
else
    echo nvm is already installed
fi

sudo apt-get upgrade

echo " "
echo installation completed.
sleep 6
