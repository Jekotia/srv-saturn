FROM resin/raspberrypi3-alpine-node

ENV TERM=screen-256color \
	LANG=C.UTF-8 \
	UID=1000 \
	GID=1000 \
	USER=nodejs \
	GROUP=nodejs \
	DATA=/data \
	HOME=/home/nodejs \
	APPDIR=/home/nodejs/alerthub \
	CONFIG=/home/nodejs/alerthub/etc/config.js

RUN [ "cross-build-start" ]

RUN	apk -U upgrade \
	&& apk add \
		git \
		su-exec \
	&& npm i -g npm

RUN	mkdir -p $HOME \
	&& mkdir -p $DATA \
	&& chown -R $UID:$GID $HOME \
	&& chown -R $UID:$GID $DATA \
	&& addgroup \
		-g $GID \
		-S \
		$GROUP \
	&& adduser \
		-u $UID \
		-D \
		-S \
		-h $HOME \
		-s /sbin/nologin \
		-G $GROUP \
		$USER

RUN	su-exec $USER$GROUP git clone https://github.com/Ardakilic/alerthub.git $APPDIR \
	&& rm -f $CONFIG \
	&& ln -s /data/config.js $CONFIG

WORKDIR	$APPDIR
RUN	su-exec $USER$GROUP npm install \
	&& su-exec $USER$GROUP npm run init \
	&& chown -R $UID:$GID $HOME \
	&& chown -R $UID:$GID $DATA

RUN [ "cross-build-end" ]

VOLUME $DATA/config.js

USER $USER
CMD cd $APPDIR && npm start
