FROM	jekotia/apache-php

ENV	APP_VER=17.4
ENV	APP_DL=https://git.tt-rss.org/fox/tt-rss/archive/${APP_VER}.tar.gz

RUN	[ "cross-build-start" ]
###
##
#

WORKDIR	$APP

RUN	wget ${APP_DL} -O ${APP}/tt-rss_${APP_VER}.tar.gz \
	&& tar -xvf ${APP}/tt-rss_${APP_VER}.tar.gz --strip 1 \
	&& rm -rf tt-rss_${APP_VER}.tar.gz

#
##
###
RUN	[ "cross-build-end" ]

VOLUME [ "${DATA}" ]
