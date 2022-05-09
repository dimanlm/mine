#!/bin/bash

# Check if the user is root
(( EUID != 0 )) && exec sudo -- "$0" "$@"
if ((EUID != 0))
then
  echo "You must be root to run this script!"
  exit
fi

## Figlet
if ! command -v figlet &> /dev/null
then
  apt install -y figlet
fi

## Update
figlet UPDATE n UPGRADE
add-apt-repository universe
apt update
apt -y upgrade

## Basic
figlet git openssh curl net-tools
apt install -y git openssh-server curl net-tools

## Virtualbox
figlet Virtualbox
apt install -y virtualbox

## Install VS Code
figlet VS Code
snap install --classic code

## NPM - Node
figlet nodejs - npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
apt install -y nodejs
npm install -g npm@latest

## PIP3
figlet pip3
apt install -y python3-pip

## Telegram
figlet telegram
snap install telegram-desktop

## Discord 
figlet Discord
snap install discord

## Postman
figlet Postman
snap install postman

## Starship - CLI
figlet Starship
# fonts
apt-get install fonts-powerline
apt install fonts-firacode
# cli
curl -sS https://starship.rs/install.sh | sh
echo "Add the following line at the end of your ~/.bashrc file:"
echo "eval '$(starship init bash)'"