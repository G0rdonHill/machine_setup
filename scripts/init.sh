#!/bin/bash
set -xe
user=${1:-"$(whoami)"}
echo "USER: ${user}"
if [[ $user ==  'root' ]]; then
     echo -e "ERROR, user is root!\nRe-run script without sudo!"
     exit 1
fi

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y python3-pip
sudo apt-get install -y ansible
ansible --version