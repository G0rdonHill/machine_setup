SHELL := /bin/bash
USERNAME := $(shell whoami)

init-ubuntu:
	@./scripts/init_ubuntu.sh

provision: 
	ansible-playbook -u ${USERNAME} -i inventory/inventory playbooks/machine_setup.yaml

provision-debug:
	ansible-playbook -u ${USERNAME} -i inventory/inventory playbooks/machine_setup.yaml --tags debug

ubuntu:
	@vagrant up ubuntu --provision

clean:
	@vagrant destroy ubuntu -f