#! /bin/bash
if [ ! -e /etc/nginx/nginx.conf ] ; then
	cp -r /defaults/* /etc/nginx
fi

su-exec proxy:proxy nginx -g 'daemon off'
