#! /bin/bash
source $SRV_SCRIPT_INIT

_isRoot "exit"

apt update
apt install -y python python-pip

pip install docker-compose
