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

cron { "rsnapshot hourly":
	ensure		=> "present",
	command		=> "rsnapshot hourly",
	user		=> "root",
	minute		=> "0",
	hour		=> "absent",
	monthday	=> "absent",
	month		=> "absent",
	weekday		=> "absent",
	special		=> "absent",
}

cron { "rsnapshot daily":
	ensure		=> "present",
	command		=> "rsnapshot daily",
	user		=> "root",
	minute		=> "0",
	hour		=> "0",
	monthday	=> "absent",
	month		=> "absent",
	weekday		=> "absent",
	special		=> "absent",
}

cron { "rsnapshot weekly":
	ensure		=> "present",
	command		=> "rsnapshot weekly",
	user		=> "root",
	minute		=> "0",
	hour		=> "0",
	monthday	=> "absent",
	month		=> "absent",
	weekday		=> "0",
	special		=> "absent",
}

cron { "rsnapshot monthly":
	ensure		=> "present",
	command		=> "rsnapshot monthly",
	user		=> "root",
	minute		=> "0",
	hour		=> "0",
	monthday	=> "1",
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

file { "/etc/ssmtp":
	ensure		=> "link",
	target		=> "$_DATA/ssmtp",
}

file { "/etc/nginx":
	ensure		=> "link",
	target		=> "$_NGINX_DATA",
}

file { "/etc/rsnapshot.conf":
	ensure		=> "link",
	target		=> "$_DATA/rsnapshot.conf",
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
