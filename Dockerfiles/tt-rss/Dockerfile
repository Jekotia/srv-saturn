FROM	jekotia/apache-php

ENV	APP_VER=17.4
ENV	APP_DL=https://git.tt-rss.org/fox/tt-rss/archive/${APP_VER}.tar.gz

RUN	[ "cross-build-start" ]
###
##
#

RUN	wget ${APP_DL} -O tt-rss_${APP_VER}.tar.gz
RUN	tar -xf tt-rss_${APP_VER}.tar.gz
RUN	rm -rf ${APP}
RUN	mv tt-rss ${APP}
RUN	rm -rf tt-rss_${APP_VER}.tar.gz

WORKDIR	$APP

#
##
###
RUN	[ "cross-build-end" ]
