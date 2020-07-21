SHELL := /bin/bash
USERNAME := $(shell whoami)

init-ubuntu:
	@./scripts/init_ubuntu.sh ${USERNAME}

provision: 
	ansible-playbook -u ${USERNAME} -i inventory/inventory playbooks/machine_setup.yaml

provision-debug:
	ansible-playbook -u ${USERNAME} -i inventory/inventory playbooks/machine_setup.yaml --tags debug

ubuntu18:
	@vagrant up ubuntu_bionic --provision

ubuntu20:
	@vagrant up ubuntu_focal --provision

mint:
	@vagrant up mint --provision

mint20:
	@vagrant up mint20 --provision

clean-ubuntu18:
	@vagrant destroy ubuntu_bionic -f

clean-ubuntu20:
	@vagrant destroy ubuntu_focal -f

clean-mint:
	@vagrant destroy mint -f

con-ubuntu18:
	@vagrant ssh ubuntu_bionic

con-ubuntu20:
	@vagrant ssh ubuntu_focal

con-mint:
	@vagrant ssh mint

con-mint20:
	@vagrant ssh mint20

down-ubuntu18:
	@vagrant suspend ubuntu_bionic

down-ubuntu20:
	@vagrant suspend ubuntu_focal

down-mint:
	@vagrant suspend mint