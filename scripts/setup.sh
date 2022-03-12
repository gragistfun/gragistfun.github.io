#!/usr/bin/env bash

echo "PREREQUISITES:"
if [ -f /etc/fedora-release ]; then
    echo "Running prerequisites for FEDORA"
    sudo dnf -y install git python libfido2
    sudo python -m pip install ansible
    echo 
else
    1>&2 echo "ERROR: Script does not support OS or distribution!"
    exit 1
fi

echo "Importing SSH key"
ssh-add -K
echo

echo "Starting configuration"
ansible-pull -U https://github.com/gragistfun/.gragistfun -d $HOME/.setup -K ansible/local.yml
