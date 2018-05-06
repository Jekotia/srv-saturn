FROM resin/raspberrypi3-alpine:3.6

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

RUN [ "cross-build-start" ]

RUN	apk -U upgrade \
	&& apk add \
		git \
		sudo \
		openssl \
		curl

#RUN	mkdir -p $DATA \
#	&& mkdir -p $HOME \
COPY	copy/entrypoint.sh /
RUN	chmod +x /entrypoint.sh \
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
		$USER

RUN	git clone https://github.com/lukas2511/dehydrated.git $APP \
	&& git clone https://github.com/owhen/dns-01-manual.git $HOOK \
	&& chown -R $USER:$GROUP $APP \
	&& chmod +x $HOOK/hook.sh

RUN [ "cross-build-end" ]

VOLUME $DATA

ENTRYPOINT ["/extrypoint.sh"]
