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
