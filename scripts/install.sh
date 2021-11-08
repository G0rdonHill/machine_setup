#!/bin/bash
USERNAME=$(whoami)
if [[ -z $1 ]]; then
    TAGS=""
else
    TAGS="--tags $1"
fi
set -e
if [[ -f /home/${USERNAME}/.local/bin/virtualenv ]]; then
    echo "Virtualenv detected. Skipping init script setup."
    if [[ -f /home/${USERNAME}/.virtualenvs/molecule/bin/activate ]]; then
        echo "Molecule virtualenv detected. Using this for ansible playbook."
        . /home/${USERNAME}/.virtualenvs/molecule/bin/activate
    elif [[ -f /home/${USERNAME}/.installer/bin/activate ]]; then
        echo "Installer virtualenv detected. Using this for ansible playbook."
        . /home/${USERNAME}/.installer/bin/activate
    else
        echo "No virtualenv detected for running ansible playbook."
        echo "Setting up installer virtualenv..."
    	source ./scripts/init.sh 
        installer_virtualenv
	    . /home/${USERNAME}/.installer/bin/activate
	fi
else
	source ./scripts/init.sh 
    check_user ${USERNAME}
    apt_dependencies
    pip_dependencies
    installer_virtualenv
	. /home/${USERNAME}/.installer/bin/activate
fi

sudo -k
ansible-playbook \
    --user ${USERNAME} \
    --inventory inventory/hosts.yaml \
    ${TAGS} \
    --ask-become-pass \
    playbooks/machine_setup.yaml
rm -rf ~/.installer
