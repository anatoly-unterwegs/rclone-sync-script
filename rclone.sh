#!/bin/bash
####LOGGING####
MYLOG="/path/to/your/log"

####This prepends a timestamp before each line. ts is a part of moreutils package####
exec &> >(ts '[%F %T]' | tee -ai $MYLOG)

####Rclone password####
export RCLONE_CONFIG_PASS=<YOUR_RCLONE_PASS_ID_HERE>

####Source/Destination directories. See "man rclone"####
SOURCE_DIR="/path/to/source/dir"
RCLONE_SHARE="<rclone_share_name>"
RCLONE_REMOTE_DIR="<rclone_remote_dir>"

####If this script is currently running, exit####
if pidof -o %PPID -x $0; then
exit 1
fi

####Run the sync itself####
rclone sync ${SOURCE_DIR} ${RCLONE_SHARE}:${RCLONE_REMOTE_DIR} --ask-password=false -v
exit

