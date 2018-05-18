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
