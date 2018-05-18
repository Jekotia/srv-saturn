#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/functions/envAdd
source ${DIR}/functions/isRoot

envList="/saturn/puppet/envList"

_root="/saturn" # Where to symlink the server drive
_uid="1000" # UID of primary user
_gid="1000" # GID of primary user
_data="${_root}/data" # Location of data directory
_name="saturn"
_ip="192.168.0.5"
_logs=${_root}/logs

_disk_mnt="/mnt/saturn" # Where to mount the server drive
_disk_path="/saturn" # Path on removable storage to the server directory. Leave blank if the entire drive is for the server
_disk_dev="by-partuuid" # What section under /dev/disk
_disk_id="6efcdd95-02" # Appropriate ID for the above device type

_script_root="${DIR}" # Root directory for server scripts
_script_init="${_script_root}/init" # Script init file for one-line integration with 'source $_SCRIPT_INIT'
_script_func="${_script_root}/functions" # Script functions directory
_script_ddns="${_script_root}/ddns.sh"


_puppet_root="${_root}/puppet" # root for puppet files

_alerthub_data="${_data}/alerthub"
_alerthub_uid="2041"
_alerthub_gid="2041"

_dehydrated_data="${_data}/ssl"
_dehydrated_uid="2113"
_dehydrated_gid="2113"

_discordirc_data="${_data}/discord-irc"
_discordirc_uid="2137"
_discordirc_gid="2137"

_gogs_data="${_data}/gogs"
_gogs_uid="2252"
_gogs_gid="2252"

_hass_data="${_data}/hass"
_hass_uid="2307"
_hass_gid="2307"

_mysql_data="${_data}/mysql"
_mysql_uid="2597"
_mysql_gid="2597"

_nginx_data="${_data}/nginx"
_nginx_uid="523"
_nginx_gid="523"

_pihole_data="${_data}/pihole"
_pihole_uid="2633"
_pihole_gid="2633"

_pivpn_data="${_data}/pivpn"
_pivpn_uid="2638"
_pivpn_gid="2638"

_portainer_data="${_data}/portainer"
_portainer_uid="2656"
_portainer_gid="2656"

_proxy_data="${_data}/proxy"
_proxy_uid="2665"
_proxy_gid="2665"

_weechat_data="${_data}/weechat"
_weechat_uid="2811"
_weechat_gid="2811"


_isRoot "exit"

rm -f ${envList}
> /etc/environment

_envAdd	"_ROOT"			"${_root}"
_envAdd "_UID"			"${_uid}"
_envAdd "_GID"			"${_gid}"
_envAdd "_DATA"			"${_data}"
_envAdd "_NAME"			"${_name}"
_envAdd "_IP"			"${_ip}"
_envAdd "_LOGS"			"${_logs}"

_envAdd	"_DISK_MNT"		"${_disk_mnt}"
_envAdd "_DISK_DEV"		"${_disk_dev}"
_envAdd "_DISK_ID"		"${_disk_id}"
_envAdd	"_DISK_PATH"		"${_disk_path}"

_envAdd	"_SCRIPT_ROOT"		"${_script_root}"
_envAdd	"_SCRIPT_INIT"		"${_script_init}"
_envAdd	"_SCRIPT_FUNC"		"${_script_func}"
_envAdd "_SCRIPT_DDNS"		"${_script_ddns}"

_envAdd "_PUPPET_ROOT"		"${_puppet_root}"

_envAdd "_ALERTHUB_DATA"	"${_alerthub_data}"
_envAdd "_ALERTHUB_UID"		"${_alerthub_uid}"
_envAdd "_ALERTHUB_GID"		"${_alerthub_gid}"

_envAdd "_DEHYDRATED_DATA"	"${_dehydrated_data}"
_envAdd "_DEHYDRATED_UID"	"${_dehydrated_uid}"
_envAdd "_DEHYDRATED_GID"	"${_dehydrated_gid}"

_envAdd "_DISCORDIRC_DATA"	"${_discordirc_data}"
_envAdd "_DISCORDIRC_UID"	"${_discordirc_uid}"
_envAdd "_DISCORDIRC_GID"	"${_discordirc_gid}"

_envAdd "_GOGS_DATA"		"${_gogs_data}"
_envAdd "_GOGS_UID"		"${_gogs_uid}"
_envAdd "_GOGS_GID"		"${_gogs_gid}"

_envAdd "_HASS_DATA"		"${_hass_data}"
_envAdd "_HASS_UID"		"${_hass_uid}"
_envAdd "_HASS_GID"		"${_hass_gid}"

_envAdd "_MYSQL_DATA"		"${_mysql_data}"
_envAdd "_MYSQL_UID"		"${_mysql_uid}"
_envAdd "_MYSQL_GID"		"${_mysql_gid}"

_envAdd "_NGINX_DATA"		"${_nginx_data}"
_envAdd "_NGINX_UID"		"${_nginx_uid}"
_envAdd "_NGINX_GID"		"${_nginx_gid}"

_envAdd "_PIHOLE_DATA"		"${_pihole_data}"
_envAdd "_PIHOLE_UID"		"${_pihole_uid}"
_envAdd "_PIHOLE_GID"		"${_pihole_gid}"

_envAdd "_PIVPN_DATA"		"${_pivpn_data}"
_envAdd "_PIVPN_UID"		"${_pivpn_uid}"
_envAdd "_PIVPN_GID"		"${_pivpn_gid}"

_envAdd "_PORTAINER_DATA"	"${_portainer_data}"
_envAdd "_PORTAINER_UID"	"${_portainer_uid}"
_envAdd "_PORTAINER_GID"	"${_portainer_gid}"

_envAdd "_PROXY_DATA"		"${_proxy_data}"
_envAdd "_PROXY_UID"		"${_proxy_uid}"
_envAdd "_PROXY_GID"		"${_proxy_gid}"

_envAdd "_WEECHAT_DATA"		"${_weechat_data}"
_envAdd "_WEECHAT_UID"		"${_weechat_uid}"
_envAdd "_WEECHAT_GID"		"${_weechat_gid}"

chown ${_UID}:${_GID} ${puppetEnvFile}
