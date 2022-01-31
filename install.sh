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
  apt install figlet
fi

## Update
figlet UPDATE n UPGRADE
apt update
apt -y upgrade

## Basic
figlet git openssh curl net-tools
apt install -y git openssh-server curl net-tools

## Install VS Code
figlet VS Code
snap install --classic code

## NPM - Node
figlet nodejs - npm
apt install -y nodejs
npm install -g npm@latest

## PIP3
figlet pip3
apt install -y python3-pip

## Telegram
figlet telegram
snap install telegram-desktop

