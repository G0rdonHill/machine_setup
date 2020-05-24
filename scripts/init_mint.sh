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

mkdir /home/${user}/.ansible2.9

virtualenv /home/${user}/.ansible2.9

source /home/${user}/.ansible2.9/bin/activate

pip3 install ansible==2.9

which make > /dev/null
if [[ $? -ne 0 ]]; then
    echo "make not installed. Installing.."
    sudo apt-get update -y
    sudo apt-get install make -y
fi