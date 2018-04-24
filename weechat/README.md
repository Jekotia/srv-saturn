docker run \
-itd \
-v /saturn/data/weechat/:/weechat \
-p 9001:9001/tcp \
-p 8443:8443/tcp \
--name weechat \
jekotia/weechat:armv7hf
