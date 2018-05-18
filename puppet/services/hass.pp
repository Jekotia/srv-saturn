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
