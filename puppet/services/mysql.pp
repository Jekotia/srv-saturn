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
