#! /bin/bash
saturnBy="by-partuuid"
saturnBytarget=6efcdd95-02
saturnMnt=/mnt/saturn
saturnDir=/saturn
saturnPath=${saturnMnt}${saturnDir}
puppetDebURL="https://apt.puppetlabs.com/puppet5-release-stretch.deb"

function _isRoot () {
	if [[ `id -u` == "0" ]] ; then
		return
	else
		echo "This script requires root/sudo!"
		exit 99
	fi
}

function _general () {
	apt-get update && apt-get upgrade -y && apt-get dis-upgrade -y || exit 1
	echo 'alias docker="sudo docker"' >> /home/pi/.profile
	echo 'alias docker="sudo docker-compose"' >> /home/pi/.profile
}

function _mounts () {
	mkdir -p ${saturnMnt} || exit 10

#	echo "PARTUUID=${saturnBytarget}  ${saturnMnt}     ext4    defaults,noatime  0       1" >> /etc/fstab || exit 11
	mount /dev/disk/${saturnBy}/${saturnBytarget} ${saturnMnt} || exit 12
}

function _puppet() {
	wget -O /tmp/puppet.deb  ${puppetDebURL} || exit 20
	dpkg -i /tmp/puppet.deb || exit 21
	rm -f /tmp/puppet.deb || exit 22
	apt-get update || exit 23
	apt-get install -y puppet || exit 24
}

function _docker () {
	${saturnPath}/docker/scripts/engine.sh || exit 30
	${saturnPath}/docker/scripts/compose.sh || exit 31
}

function _env () {
	git clone ${saturnPath}/data/gogs/git/jekotia/.zsh.git /tmp/zsh || exit 50
	sed -i.bak 's/zshSource=.*/zshSource="\/saturn\/data\/gogs\/git\/jekotia\/.zsh.git"/g' /tmp/zsh/shell-setup.sh || exit 51
	bash /tmp/zsh/shell-setup.sh "pi" || exit 52
	rm -rf /tmp/zsh || exit 53
}

function _configure () {
	puppet apply ${saturnPath}/puppet/computer.pp
	puppet apply ${saturnPath}/puppet/cron.pp
	puppet apply ${saturnPath}/puppet/symlinks.pp
	puppet apply ${saturnPath}/puppet/mounts.pp
	puppet apply ${saturnPath}/puppet/packages.pp
	puppet apply ${saturnPath}/puppet/users-groups.pp
}

_isRoot "exit"

#_general

#_mounts

_env

_puppet

#_docker

