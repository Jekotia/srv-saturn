#!/bin/sh

usermod -o -u "$GID" $USER
groupmod -o -g "$UID" $GROUP

chown -R $USER:$GROUP $DATA
chown -R $USER:$GROUP $HOME

exec /usr/bin/weechat -d $DATA
## exec su-exec $USER /usr/bin/weechat -d $DATA
