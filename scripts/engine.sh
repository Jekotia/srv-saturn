#! /bin/bash
source $_SCRIPT_INIT

#user=pi

_isRoot "exit"

arch=""
dist=""
sys=""

function detect_arch () {
	arch=`lscpu | grep "Architecture" | cut -d':' -f2 | tr -d '[:space:]'`
}

function detect_dist () {
	dist=`cat /etc/os-release | grep "ID=" | grep -v "VERSION_ID" | cut -d'=' -f2 | tr -d '[:space:]'`
}

function detect_sys () {
	if [[ "$dist" == "raspbian" && "$arch" == "armv7l" ]] ; then
		sys="rpi3"
	elif [[ "$dist" == "debian" && "$arch" == "x86_64" ]] ; then
		sys="debian64"
	else
		echo "Failed to detect system"
		exit 1
	fi
}

function setup_debian64 () {
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

	setup_common
}

function setup_rpi3 () {
	curl -sSL https://get.docker.com | sh

	setup_common
}

function setup_common () {
	#usermod -aG docker $user

	docker run hello-world

	cat >> /home/$user/.profile <<EOF

if [ -d "/saturn/docker/bin" ] ; then
    PATH='/saturn/docker/bin:$PATH'
fi
EOF
}

detect_arch
detect_dist
detect_sys

setup_${sys}
