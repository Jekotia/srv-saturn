#! /bin/bash
if [[ ! `id -u` == "0" ]] ; then
        echo "This script requires root/sudo!"
        exit 99
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/conf

apt update
apt install -y python python-pip

pip install docker-compose
