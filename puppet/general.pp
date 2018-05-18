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
