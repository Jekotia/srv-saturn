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
