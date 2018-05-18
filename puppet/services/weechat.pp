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
