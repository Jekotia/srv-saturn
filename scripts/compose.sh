#! /bin/bash

apt update
apt install -y python python-pip

pip install docker-compose

cat >> /home/$user/.profile <<EOF

if [ -d "$home/.local/bin" ] ; then
    PATH="${home}/.local/bin:$PATH"
fi
EOF
