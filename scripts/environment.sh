#! /bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/functions/envAdd
source ${DIR}/functions/isRoot

srv_root="/saturn" # Where to symlink the server drive

srv_disk_mnt="/mnt/saturn" # Where to mount the server drive
srv_disk_path="/saturn" # Path on removable storage to the server directory. Leave blank if the entire drive is for the server
srv_disk_dev="by-partuuid" # What section under /dev/disk
srv_disk_id="6efcdd95-02" # Appropriate ID for the above device type

srv_data_path="${srv_root}/data"

srv_script_root="${DIR}" # Root directory for server scripts
srv_script_init="${srv_script_root}/init" # Script init file for one-line integration with 'source $SRV_SCRIPT_INIT'
srv_script_func="${srv_script_root}/functions" # Script functions directory

_isRoot

_envAdd	"SRV_ROOT"		"${srv_root}"
_envAdd	"SRV_DISK_MNT"		"${srv_disk_mnt}"
_envAdd "SRV_DISK_DEV"		"${srv_disk_dev}"
_envAdd "SRV_DISK_ID"		"${srv_disk_id}"
_envAdd	"SRV_DISK_PATH"		"${srv_disk_path}"

_envAdd "SRV_DATA_PATH"		"$srv_data_path"

_envAdd	"SRV_SCRIPT_INIT"	"${srv_script_root}"
_envAdd	"SRV_SCRIPT_INIT"	"${srv_script_init}"
_envAdd	"SRV_SCRIPT_FUNC"	"${srv_script_func}"
