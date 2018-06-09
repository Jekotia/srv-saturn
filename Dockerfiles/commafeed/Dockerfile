FROM	jekotia/resin-raspberrypi3-debian

ENV	UID=2155 \
	GID=2155 \
	USER=commafeed \
	GROUP=commafeed \
	HOME=/home/commafeed \
	DATA=/data \
	APP=/app \
	COMMAFEED_VER=2.4.0

RUN	[ "cross-build-start" ]
###
##
#

RUN	apt-get update \
	&& apt-get install -y \
		openjdk-8-jre-headless \
		wget \
	&& apt-cleanup

RUN	mkdir -p $APP \
	&& mkdir -p $DATA \
	&& addgroup \
		--gid $GID \
		--system \
		$GROUP \
	&& adduser \
		--uid $UID \
		--disabled-password \
		--system \
		--home $HOME \
		--shell /sbin/nologin \
		--gid $GID \
		$USER \
	&& mkdir -p $HOME \
	&& chown -R $USER:$GROUP $HOME

RUN	wget -O /app/commafeed.jar https://github.com/Athou/commafeed/releases/download/${COMMAFEED_VER}/commafeed.jar

COPY	copy/entrypoint.sh /

RUN	chmod +x /entrypoint.sh

#
##
###
RUN	[ "cross-build-end" ]

WORKDIR	$APP

VOLUME	$DATA

EXPOSE	8082
EXPOSE	8083

CMD	[ "/entrypoint.sh" ]
