#!/bin/sh

usermod -o -u "$GID" $USER
groupmod -o -g "$UID" $GROUP

chown -R $USER:$GROUP $DATA
chown -R $USER:$GROUP $HOME

exec su-exec $USER /usr/bin/tmux -2 new-session -d -s weechat /usr/bin/weechat -d $DATA
##exec su-exec $USER /usr/bin/weechat -d $DATA
