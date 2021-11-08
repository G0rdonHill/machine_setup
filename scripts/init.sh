#!/bin/bash
set -xe

function check_user() {
     user=${1:-"$(whoami)"}
     echo "USER: ${user}"
     if [[ $user ==  'root' ]]; then
          echo -e "ERROR, user is root!\nRe-run script without sudo!"
          exit 1
     fi
}

function apt_dependencies() {
     sudo apt-get update
     sudo apt-get upgrade -y
     sudo apt-get install -y python3-pip
}

function pip_dependencies() {
	if ! grep -Fxq ".local/bin" ~/.profile ; then 
          echo "PATH=$$PATH:/home/${USERNAME}/.local/bin" >> ~/.profile
     fi
     pip3 install setuptools wheel
     pip3 install virtualenv
     which virtualenv
}

function installer_virtualenv() {
     mkdir -p /home/${user}/.installer
     virtualenv /home/${user}/.installer
     source /home/${user}/.installer/bin/activate
     pip3 install ansible==2.10.3
     ansible --version
}
