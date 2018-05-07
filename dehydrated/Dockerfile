#FROM resin/raspberrypi3-alpine:3.6
FROM jekotia/resin-raspberrypi3-alpine

ENV TERM=screen-256color \
	LANG=C.UTF-8 \
	UID=1000 \
	GID=1000 \
	USER=dehydrated \
	GROUP=dehydrated \
	APP=/dehydrated \
	HOOK=/dehydrated/dns-01-manual \
	DATA=/data \
	CONFIG=/data/config

COPY	copy/entrypoint.sh /

RUN	cross-build-start \
	&& chmod +x /entrypoint.sh \
	&& apk add \
		git \
		sudo \
		openssl \
		curl \
	&& addgroup \
		-g $GID \
		-S $GROUP \
	&& adduser \
		-u $UID \
		-D \
		-S \
		-h $HOME \
		-s /sbin/nologin \
		-G $GROUP \
		$USER \
	&& git clone https://github.com/lukas2511/dehydrated.git $APP \
	&& git clone https://github.com/owhen/dns-01-manual.git $HOOK \
	&& chown -R $USER:$GROUP $APP \
	&& chmod +x $HOOK/hook.sh \
	&& cross-build-end

#RUN	mkdir -p $DATA \
#	&& mkdir -p $HOME \

VOLUME $DATA

ENTRYPOINT [ "/entrypoint.sh" ]
