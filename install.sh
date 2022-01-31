#!/bin/bash

# Check if the user is root
(( EUID != 0 )) && exec sudo -- "$0" "$@"
if ((EUID != 0))
then
  echo "You must be root to run this script!"
  exit
fi

if ! command -v figlet &> /dev/null
then
  apt install figlet
fi

## Update
figlet UPDATE n UPGRADE
apt update
apt upgrade
