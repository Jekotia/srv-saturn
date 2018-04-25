#! /bin/bash
docker container rm -f weechat

docker run \
-v /saturn/data/weechat:/data \
--name "weechat" \
jekotia/weechat_amd64
