# Machine  Setup

![CI](https://github.com/g1212/machine_setup/workflows/CI/badge.svg?branch=master)

Ansible repo designed to set up machine with necessary Dev(Ops) tooling.
Included various browsers, spotify and calibre for convenience.  

I started experimenting with molecule, to run tests against roles.
The `molecule` role is a copy of the playbook, used by GitHub Actions.
I could not find an example of running molecule against all roles. Molecule is still fairly new to me, so feel free to suggest improvements.

Assumed that the playbook will run against local host.

For now, this is will be targeted for ubuntu-based linux distros.

The playbook currently installs the following:

* Git
* Docker
* Docker-compose
* Azure CLI
* Google Cloud CLI
* Bash-it
* Virtual Box
* Vagrant
* Terraform
* Kubectl
* Helm
* VS Code
* Molecule (in virtualenv)
* Multiboot
* Chrome
* Brave
* Tor
* Calibre
* Spotify



## Getting Started

1. Clone this repo to your local disk.
2. Change the encrypted group vars to include your git variables (see git role defaults).
3. Open in terminal, and run:

    `make install`