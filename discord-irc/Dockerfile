FROM resin/raspberrypi3-alpine-node

ENV TERM=screen-256color \
	LANG=C.UTF-8 \
	UID=1000 \
	GID=1000 \
	USER=nodejs \
	GROUP=nodejs \
	HOME=/home/nodejs \
	DATA=/data

RUN [ "cross-build-start" ]

RUN	apk -U upgrade
#	&& apk add

RUN	npm i -g npm \
	&& npm install -g zlib-sync discordapp/erlpack uws \
	&& npm install -g discord.js \
	&& npm install -g discord-irc

#ADD run.sh /
#RUN	chmod +x /run.sh \
RUN	mkdir -p $DATA \
	&& mkdir -p $HOME \
	&& chown -R $UID:$GID $HOME \
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

RUN [ "cross-build-end" ]

VOLUME $DATA

WORKDIR $HOME

USER $USER

ENTRYPOINT ["discord-irc, --config $DATA/discord-irc.json"]
#ENTRYPOINT ["/run.sh"]
