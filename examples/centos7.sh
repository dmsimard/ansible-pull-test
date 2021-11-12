#!/bin/bash
# From a fresh CentOS7 image

yum -y update
yum -y install git python3 python3-pip
python3 -m pip install venv
python3 -m venv ~/venv
source ~/venv/bin/activate
pip install pip --upgrade
pip install ara ansible-core

export ANSIBLE_CALLBACK_PLUGINS=$(python3 -m ara.setup.callback_plugins)
export ARA_CALLBACK_THREADS=4
export ARA_API_CLIENT=http
export ARA_API_SERVER=https://server.example.org
# export ARA_API_USERNAME=username
# export ARA_API_PASSWORD=password

ansible-pull -U https://github.com/dmsimard/ansible-pull-test playbook.yml
