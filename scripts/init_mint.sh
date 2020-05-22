#!/bin/bash
set -xe
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y python3-pip
pip3 install setuptools
pip3 install wheel
pip3 install virtualenv
which virtualenv

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