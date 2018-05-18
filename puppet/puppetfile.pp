
#---- /saturn/puppet/envList ----#
$_ROOT = "/saturn"
$_UID = "1000"
$_GID = "1000"
$_DATA = "/saturn/data"
$_NAME = "saturn"
$_IP = "192.168.0.5"
$_LOGS = "/saturn/logs"
$_DISK_MNT = "/mnt/saturn"
$_DISK_DEV = "by-partuuid"
$_DISK_ID = "6efcdd95-02"
$_DISK_PATH = "/saturn"
$_SCRIPT_ROOT = "/mnt/saturn/saturn/scripts"
$_SCRIPT_INIT = "/mnt/saturn/saturn/scripts/init"
$_SCRIPT_FUNC = "/mnt/saturn/saturn/scripts/functions"
$_SCRIPT_DDNS = "/mnt/saturn/saturn/scripts/ddns.sh"
$_PUPPET_ROOT = "/saturn/puppet"
$_ALERTHUB_DATA = "/saturn/data/alerthub"
$_ALERTHUB_UID = "2041"
$_ALERTHUB_GID = "2041"
$_DEHYDRATED_DATA = "/saturn/data/ssl"
$_DEHYDRATED_UID = "2113"
$_DEHYDRATED_GID = "2113"
$_DISCORDIRC_DATA = "/saturn/data/discord-irc"
$_DISCORDIRC_UID = "2137"
$_DISCORDIRC_GID = "2137"
$_GOGS_DATA = "/saturn/data/gogs"
$_GOGS_UID = "2252"
$_GOGS_GID = "2252"
$_HASS_DATA = "/saturn/data/hass"
$_HASS_UID = "2307"
$_HASS_GID = "2307"
$_MYSQL_DATA = "/saturn/data/mysql"
$_MYSQL_UID = "2597"
$_MYSQL_GID = "2597"
$_NGINX_DATA = "/saturn/data/nginx"
$_NGINX_UID = "523"
$_NGINX_GID = "523"
$_PIHOLE_DATA = "/saturn/data/pihole"
$_PIHOLE_UID = "2633"
$_PIHOLE_GID = "2633"
$_PIVPN_DATA = "/saturn/data/pivpn"
$_PIVPN_UID = "2638"
$_PIVPN_GID = "2638"
$_PORTAINER_DATA = "/saturn/data/portainer"
$_PORTAINER_UID = "2656"
$_PORTAINER_GID = "2656"
$_PROXY_DATA = "/saturn/data/proxy"
$_PROXY_UID = "2665"
$_PROXY_GID = "2665"
$_WEECHAT_DATA = "/saturn/data/weechat"
$_WEECHAT_UID = "2811"
$_WEECHAT_GID = "2811"

#---- /saturn/puppet/general.pp ----#
host { "system":
	name		=> "$_NAME",
	ensure		=> "present",
	ip		=> "$_IP",
}

cron { "ddns-update":
	ensure		=> "present",
	command		=> "$_SCRIPT_DDNS > /dev/null 2>&1",
	user		=> "root",
	minute		=> "*/5",
	hour		=> "absent",
	monthday	=> "absent",
	month		=> "absent",
	weekday		=> "absent",
	special		=> "absent",
}

# Mounts
mount { "$_DISK_MNT":
	ensure		=> "mounted",
	atboot		=> "true",
	device		=> "PARTUUID=$_DISK_ID",
	fstype		=> "ext4",
	options		=> "defaults,noatime",
}

# Symlinks
file { "$_ROOT":
	ensure		=> "link",
	target		=> "$_DISK_MNT$_DISK_PATH",
}

file { "/etc/nginx":
	ensure		=> "link",
	target		=> "$_NGINX_DATA",
}


#mod "AlexCline-fstab", "0.5.4"

#fstab { "saturn":
#	ensure	=> "present",
#	source	=> "/dev/disk/$_DISK_DEV/$_DISK_ID",
#	dest	=> "/saturn",
#	type	=> "ext4",
#	opts	=> "defaults,noatime",
	#dump	=> 0,
	#passno	=> 0,
#}

#---- /saturn/puppet/services/alerthub.pp ----#
user { "alerthub":
	ensure		=> "present",
	uid		=> "$_ALERTHUB_UID",
	gid		=> "$_ALERTHUB_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "alerthub":
	ensure		=> "present",
	gid		=> "$_ALERTHUB_GID",
	system		=> "true",
}

file { "alerthub folder":
	path		=> "$_ALERTHUB_DATA",
	ensure		=> "directory",
	group		=> "$_ALERTHUB_GID",
	owner		=> "$_ALERTHUB_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/dehydrated.pp ----#
user { "dehydrated":
	ensure		=> "present",
	uid		=> "$_DEHYDRATED_UID",
	gid		=> "$_DEHYDRATED_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "dehydrated":
	ensure		=> "present",
	gid		=> "$_DEHYDRATED_GID",
	system		=> "true",
}

file { "dehydrated data folder":
	path		=> "$_DEHYDRATED_DATA",
	ensure		=> "directory",
	group		=> "$_DEHYDRATED_GID",
	owner		=> "$_DEHYDRATED_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/discord-irc.pp ----#
user { "discord-irc":
	ensure		=> "present",
	uid		=> "$_DISCORDIRC_UID",
	gid		=> "$_DISCORDIRC_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "discord-irc":
	ensure		=> "present",
	gid		=> "$_DISCORDIRC_GID",
	system		=> "true",
}

file { "discordirc data folder":
	path		=> "$_DISCORDIRC_DATA",
	ensure		=> "directory",
	group		=> "$_DISCORDIRC_GID",
	owner		=> "$_DISCORDIRC_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/gogs.pp ----#
user { "gogs":
	ensure		=> "present",
	uid		=> "$_GOGS_UID",
	gid		=> "$_GOGS_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "gogs":
	ensure		=> "present",
	gid		=> "$_GOGS_GID",
	system		=> "true",
}

file { "gogs data folder":
	path		=> "$_GOGS_DATA",
	ensure		=> "directory",
	group		=> "$_GOGS_GID",
	owner		=> "$_GOGS_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/hass.pp ----#
user { "hass":
	ensure		=> "present",
	uid		=> "$_HASS_UID",
	gid		=> "$_HASS_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "hass":
	ensure		=> "present",
	gid		=> "$_HASS_GID",
	system		=> "true",
}

file { "hass data folder":
	path		=> "$_HASS_DATA",
	ensure		=> "directory",
	group		=> "$_HASS_GID",
	owner		=> "$_HASS_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/mysql.pp ----#
user { "mysql":
	ensure		=> "present",
	uid		=> "$_MYSQL_UID",
	gid		=> "$_MYSQL_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "mysql":
	ensure		=> "present",
	gid		=> "$_MYSQL_GID",
	system		=> "true",
}

file { "MySQL data folder":
	path		=> "$_MYSQL_DATA",
	ensure		=> "directory",
	group		=> "$_MYSQL_GID",
	owner		=> "$_MYSQL_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/nginx.pp ----#
user { "nginx":
	ensure		=> "present",
	uid		=> "$_NGINX_UID",
	gid		=> "$_NGINX_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "nginx":
	ensure		=> "present",
	gid		=> "$_NGINX_GID",
	system		=> "true",
}

file { "nginx data folder":
	path		=> "$_NGINX_DATA",
	ensure		=> "directory",
	group		=> "$_NGINX_GID",
	owner		=> "$_NGINX_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/pihole.pp ----#
user { "pihole":
	ensure		=> "present",
	uid		=> "$_PIHOLE_UID",
	gid		=> "$_PIHOLE_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "pihole":
	ensure		=> "present",
	gid		=> "$_PIHOLE_GID",
	system		=> "true",
}

file { "pihole data folder":
	path		=> "$_PIHOLE_DATA",
	ensure		=> "directory",
	group		=> "$_PIHOLE_GID",
	owner		=> "$_PIHOLE_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/pivpn.pp ----#
user { "pivpn":
	ensure		=> "present",
	uid		=> "$_PIVPN_UID",
	gid		=> "$_PIVPN_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "pivpn":
	ensure		=> "present",
	gid		=> "$_PIVPN_GID",
	system		=> "true",
}

file { "pivpn data folder":
	path		=> "$_PIVPN_DATA",
	ensure		=> "directory",
	group		=> "$_PIVPN_GID",
	owner		=> "$_PIVPN_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/portainer.pp ----#
user { "portainer":
	ensure		=> "present",
	uid		=> "$_PORTAINER_UID",
	gid		=> "$_PORTAINER_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "portainer":
	ensure		=> "present",
	gid		=> "$_PORTAINER_GID",
	system		=> "true",
}

file { "portainer data folder":
	path		=> "$_PORTAINER_DATA",
	ensure		=> "directory",
	group		=> "$_PORTAINER_GID",
	owner		=> "$_PORTAINER_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/proxy.pp ----#
user { "proxy":
	ensure		=> "present",
	uid		=> "$_PROXY_UID",
	gid		=> "$_PROXY_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "proxy":
	ensure		=> "present",
	gid		=> "$_PROXY_GID",
	system		=> "true",
}

file { "proxy data folder":
	path		=> "$_PROXY_DATA",
	ensure		=> "directory",
	group		=> "$_PROXY_GID",
	owner		=> "$_PROXY_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/services/weechat.pp ----#
user { "weechat":
	ensure		=> "present",
	uid		=> "$_WEECHAT_UID",
	gid		=> "$_WEECHAT_GID",
	membership	=> "inclusive",
	system		=> "true",
}
group { "weechat":
	ensure		=> "present",
	gid		=> "$_WEECHAT_GID",
	system		=> "true",
}

cron { "weechat-ssl":
	ensure		=> "present",
	command		=> "$_WEECHAT_DATA/ssl.sh",
	user		=> "root",
	minute		=> "0",
	hour		=> "absent",
	monthday	=> "absent",
	month		=> "absent",
	weekday		=> "absent",
	special		=> "absent",
}

file { "weechat data folder":
	path		=> "$_WEECHAT_DATA",
	ensure		=> "directory",
	group		=> "$_WEECHAT_GID",
	owner		=> "$_WEECHAT_UID",
	recurse		=> "true",
}

#---- /saturn/puppet/packages.pp ----#
package { "git":	ensure	=> "installed" }
package { "zsh":	ensure	=> "installed" }
package { "nginx":	ensure	=> "installed" }
