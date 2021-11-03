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

pip3 install setuptools wheel
pip3 install virtualenv
which virtualenv

mkdir -p /home/${user}/.installer

virtualenv /home/${user}/.installer

source /home/${user}/.installer/bin/activate

pip3 install ansible==2.10.3

ansible --version