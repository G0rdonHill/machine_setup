#!/bin/bash
set -xe
user=$(whoami)
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y python3-pip #python-virtualenv
# setuptools
# wheel
# pip3 install virtualenv
which virtualenv
exit 1
##using python2
mkdir /home/vagrant/.ansible2.9

virtualenv /home/vagrant/.ansible2.9

source /home/vagrant/.ansible2.9/bin/activate

pip3 install ansible==2.9

# deactivate

which make > /dev/null
if [[ $? -ne 0 ]]; then
    echo "make not installed. Installing.."
    sudo apt-get update -y
    sudo apt-get install make -y
fi