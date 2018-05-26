FROM	resin/raspberrypi3-alpine

RUN	[ "cross-build-start" ]
###
##
#

RUN	BUILD_DEPS=" \
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
	&& apk add --no-cache \
	${BUILD_DEPS} \
	gnutls \
	ncurses \
	libgcrypt \
	python \
	perl \
	curl \
	shadow \
	tmux \
	&& update-ca-certificates \
	&& WEECHAT_TARBALL="$(curl -sS https://api.github.com/repos/weechat/weechat/releases/latest | jq .tarball_url -r)" \
	&& curl -sSL $WEECHAT_TARBALL -o /tmp/weechat.tar.gz \
	&& mkdir -p /tmp/weechat/build \
	&& tar xzf /tmp/weechat.tar.gz --strip 1 -C /tmp/weechat \
	&& cd /tmp/weechat/build \
	&& cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
	&& make && make install


FROM	jekotia/resin-raspberrypi3-alpine
COPY	--from=0 /usr/bin/weechat /usr/bin/weechat

ENV	TERM=screen-256color \
	LANG=C.UTF-8 \
	UID=2811 \
	GID=2811 \
	USER=weechat \
	GROUP=weechat \
	HOME=/home/weechat \
	DATA=/data

COPY	copy/entrypoint.sh /

RUN	[ "cross-build-start" ]
###
##
#

RUN	chmod +x /entrypoint.sh \
	&& mkdir -p $DATA \
#	&& mkdir -p $HOME \
	&& addgroup \
		-g $GID \
		-S $GROUP \
	&& adduser \
		-u $UID \
		-D \
		-S \
#		-h $HOME \
		-s /sbin/nologin \
		-G $GROUP \
		$USER
#
##
###
RUN	[ "cross-build-end" ]

VOLUME $DATA

WORKDIR $DATA
#$HOME

EXPOSE 8443

ENTRYPOINT ["/entrypoint.sh"]
## CMD ["--dir /weechat"]
