FROM	jekotia/resin-raspberrypi3-debian:stretch

ENV	APP=/app \
	DATA=/data

RUN	[ "cross-build-start" ]
###
##
#

## Install & configure apache + php
RUN	apt-get update \
	&& apt-get install \
		wget \
		apache2 \
		libapache2-mod-php7.0 \
	&& apt-cleanup \
	&& mkdir ${APP} ${DATA} \
	&& rm -rf /etc/apache2/sites-enabled/*

COPY	copy/apache2.conf /etc/apache2/apache2.conf
COPY	copy/app.conf /etc/apache2/sites-enabled/app.conf
RUN	apachectl configtest

#
##
###
RUN	[ "cross-build-end" ]

EXPOSE	80

VOLUME	[ "${APP}","${DATA}" ]

CMD	[ "apachectl","-D","FOREGROUND" ]
