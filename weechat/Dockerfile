FROM resin/raspberrypi3-alpine:3.6

ENV TERM=screen-256color \
	LANG=C.UTF-8 \
	UID=1000 \
	GID=1000 \
	USER=weechat \
	GROUP=weechat \
	HOME=/home/weechat \
	DATA=/data

RUN [ "cross-build-start" ]

RUN BUILD_DEPS=" \
	cmake \
	build-base \
	libcurl \
	libintl \
	zlib-dev \
	curl-dev \
	perl-dev \
	gnutls-dev \
	python2-dev \
	ncurses-dev \
	libgcrypt-dev \
	ca-certificates \
	jq \
	tar" \
	&& apk -U upgrade && apk add \
	${BUILD_DEPS} \
	gnutls \
	ncurses \
	libgcrypt \
	python \
	su-exec \
	perl \
	curl \
	shadow \
	&& update-ca-certificates \
	&& WEECHAT_TARBALL="$(curl -sS https://api.github.com/repos/weechat/weechat/releases/latest | jq .tarball_url -r)" \
	&& curl -sSL $WEECHAT_TARBALL -o /tmp/weechat.tar.gz \
	&& mkdir -p /tmp/weechat/build \
	&& tar xzf /tmp/weechat.tar.gz --strip 1 -C /tmp/weechat \
	&& cd /tmp/weechat/build \
	&& cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	&& make && make install \
	&& apk del ${BUILD_DEPS} \
	&& rm -rf /var/cache/apk/* \
	&& rm -rf /tmp/*

COPY run.sh /
RUN	chmod +x /run.sh \
	&& mkdir -p $DATA \
	&& mkdir -p $HOME \
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

RUN [ "cross-build-end" ]

VOLUME $DATA

WORKDIR $HOME

EXPOSE 8443

ENTRYPOINT ["/run.sh"]
## CMD ["--dir /weechat"]
