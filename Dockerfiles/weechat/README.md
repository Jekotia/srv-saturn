docker run \
-itd \
-v /saturn/data/weechat:/data \
-p 8443:8443 \
--name weechat \
jekotia/weechat:[tag]
