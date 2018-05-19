#! /bin/bash
# https://4z2.de/2014/07/06/weechat-trusted-relay
keySource=${_DEHYDRATED_DATA}/certs/jekotia.net
relay=${_WEECHAT_DATA}/ssl/relay.pem

mkdir `dirname $relay` > /dev/null 2>&1

cat $keySource/privkey.pem \
$keySource/fullchain.pem > \
$relay

chown ${_WEECHAT_UID}:${_WEECHAT_GID} `dirname $relay`
chown  ${_WEECHAT_UID}:${_WEECHAT_GID} $relay
