#! /bin/bash
cp -nr /defaults/* /etc/nginx

su-exec proxy:proxy nginx -g daemon off
