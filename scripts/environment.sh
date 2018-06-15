#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/functions/envAdd
source ${DIR}/functions/isRoot

envList="/saturn/puppet/envList"

_root="/saturn" # Where to symlink the server drive
_user="pi"
_group="${_user}"
_uid="1000" # UID of primary user
_gid="${_uid}" # GID of primary user
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

_ssl_data="${_data}/ssl"

_puppet_root="${_root}/puppet" # root for puppet files

_alerthub_data="${_data}/alerthub"
_alerthub_user="alerthub"
_alerthub_group="${_alerthub_user}"
_alerthub_uid="2041"
_alerthub_gid="${_alerthub_uid}"

_commafeed_data="${_data}/commafeed"
_commafeed_user="commafeed"
_commafeed_group="${_commafeed_user}"
_commafeed_uid="2155"
_commafeed_gid="${_commafeed_uid}"

_dehydrated_data="${_ssl_data}"
_dehydrated_user="dehydrated"
_dehydrated_group="${_dehydrated_user}"
_dehydrated_uid="2113"
_dehydrated_gid="${_dehydrated_uid}"

_discordirc_data="${_data}/discord-irc"
_discordirc_user="discord-irc"
_discordirc_group="${_discordirc_user}"
_discordirc_uid="2137"
_discordirc_gid="${_discordirc_uid}"

_gogs_data="${_data}/gogs"
_gogs_user="gogs" #"${_user}"
_gogs_group="${_gogs_user}"
_gogs_uid="${_uid}" #_gogs_uid="2252"
_gogs_gid="${_gogs_uid}"

_hass_data="${_data}/hass"
_hass_user="hass" #"${_user}"
_hass_group="${_hass_user}"
_hass_uid="${_uid}" #_hass_uid="2307"
_hass_gid="${_hass_uid}"

_mysql_data="${_data}/mysql"
_mysql_user="mysql"
_mysql_group="${_mysql_user}"
_mysql_uid="2597"
_mysql_gid="${_mysql_uid}"

_nginx_data="${_data}/nginx"
_nginx_user="nginx"
_nginx_group="${_nginx_user}"
_nginx_uid="523"
_nginx_gid="${_nginx_uid}"

_portainer_data="${_data}/portainer"
_portainer_user="portainer"
_portainer_group="${_portainer_user}"
_portainer_uid="2656"
_portainer_gid="${_portainer_uid}"

_proxy_data="${_data}/proxy"
_proxy_user="proxy"
_proxy_group="${_proxy_user}"
_proxy_uid="2665"
_proxy_gid="${_proxy_uid}"

_weechat_data="${_data}/weechat"
_weechat_user="weechat"
_weechat_group="${_weechat_user}"
_weechat_uid="2811"
_weechat_gid="${_weechat_uid}"


_isRoot "exit"

rm -f ${envList}
> /etc/environment

_envAdd	"_ROOT"			"${_root}"
_envAdd "_USER"			"${_user}"
_envAdd "_GROUP"		"${_group}"
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

_envAdd "_SSL_DATA"		"${_ssl_data}"

_envAdd "_PUPPET_ROOT"		"${_puppet_root}"

_envAdd "_ALERTHUB_DATA"	"${_alerthub_data}"
_envAdd "_ALERTHUB_USER"	"${_alerthub_user}"
_envAdd "_ALERTHUB_GROUP"	"${_alerthub_group}"
_envAdd "_ALERTHUB_UID"		"${_alerthub_uid}"
_envAdd "_ALERTHUB_GID"		"${_alerthub_gid}"

_envAdd "_COMMAFEED_DATA"	"${_commafeed_data}"
_envAdd "_COMMAFEED_USER"	"${_commafeed_user}"
_envAdd "_COMMAFEED_GROUP"	"${_commafeed_group}"
_envAdd "_COMMAFEED_UID"	"${_commafeed_uid}"
_envAdd "_COMMAFEED_GID"	"${_commafeed_gid}"

_envAdd "_DEHYDRATED_DATA"	"${_dehydrated_data}"
_envAdd "_DEHYDRATED_USER"	"${_dehydrated_user}"
_envAdd "_DEHYDRATED_GROUP"	"${_dehydrated_group}"
_envAdd "_DEHYDRATED_UID"	"${_dehydrated_uid}"
_envAdd "_DEHYDRATED_GID"	"${_dehydrated_gid}"

_envAdd "_DISCORDIRC_DATA"	"${_discordirc_data}"
_envAdd "_DISCORDIRC_USER"	"${_discordirc_user}"
_envAdd "_DISCORDIRC_GROUP"	"${_discordirc_group}"
_envAdd "_DISCORDIRC_UID"	"${_discordirc_uid}"
_envAdd "_DISCORDIRC_GID"	"${_discordirc_gid}"

_envAdd "_GOGS_DATA"		"${_gogs_data}"
_envAdd "_GOGS_USER"		"${_gogs_user}"
_envAdd "_GOGS_GROUP"		"${_gogs_group}"
_envAdd "_GOGS_UID"		"${_gogs_uid}"
_envAdd "_GOGS_GID"		"${_gogs_gid}"

_envAdd "_HASS_DATA"		"${_hass_data}"
_envAdd "_HASS_USER"		"${_hass_user}"
_envAdd "_HASS_GROUP"		"${_hass_group}"
_envAdd "_HASS_UID"		"${_hass_uid}"
_envAdd "_HASS_GID"		"${_hass_gid}"

_envAdd "_MYSQL_DATA"		"${_mysql_data}"
_envAdd "_MYSQL_USER"		"${_mysql_user}"
_envAdd "_MYSQL_GROUP"		"${_mysql_group}"
_envAdd "_MYSQL_UID"		"${_mysql_uid}"
_envAdd "_MYSQL_GID"		"${_mysql_gid}"

_envAdd "_NGINX_DATA"		"${_nginx_data}"
_envAdd "_NGINX_USER"		"${_nginx_user}"
_envAdd "_NGINX_GROUP"		"${_nginx_group}"
_envAdd "_NGINX_UID"		"${_nginx_uid}"
_envAdd "_NGINX_GID"		"${_nginx_gid}"

_envAdd "_PORTAINER_DATA"	"${_portainer_data}"
_envAdd "_PORTAINER_USER"	"${_portainer_user}"
_envAdd "_PORTAINER_GROUP"	"${_portainer_group}"
_envAdd "_PORTAINER_UID"	"${_portainer_uid}"
_envAdd "_PORTAINER_GID"	"${_portainer_gid}"

_envAdd "_PROXY_DATA"		"${_proxy_data}"
_envAdd "_PROXY_USER"		"${_proxy_user}"
_envAdd "_PROXY_GROUP"		"${_proxy_group}"
_envAdd "_PROXY_UID"		"${_proxy_uid}"
_envAdd "_PROXY_GID"		"${_proxy_gid}"

_envAdd "_WEECHAT_DATA"		"${_weechat_data}"
_envAdd "_WEECHAT_USER"		"${_weechat_user}"
_envAdd "_WEECHAT_GROUP"	"${_weechat_group}"
_envAdd "_WEECHAT_UID"		"${_weechat_uid}"
_envAdd "_WEECHAT_GID"		"${_weechat_gid}"

chown ${_UID}:${_GID} ${puppetEnvFile}
