#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/conf

apt-get update

apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg2 \
software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
if ! apt-key fingerprint 0EBFCD88 ; then echo "Failed to match gpg key fingerprint!" ; exit 1 ; fi

add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/debian \
$(lsb_release -cs) \
stable"

apt-get update
apt-get install -y docker-ce

usermod -aG docker $user

docker run hello-world

cat >> /home/$user/.profile <<EOF

if [ -d "/saturn/docker/bin" ] ; then
    PATH="/saturn/docker/bin:$PATH"
fi
EOF
