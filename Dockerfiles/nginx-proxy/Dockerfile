FROM	jekotia/resin-raspberrypi3-alpine

ENV	UID=2665 \
	GID=2665 \
	USER=proxy \
	GROUP=proxy \
	DATA=/data

RUN	[ "cross-build-start" ]

RUN	addgroup -g ${GID} -S ${GROUP} \
	&& adduser -D -S -s /sbin/nologin -G ${GROUP} ${USER}

RUN	apk add --no-cache --virtual \
		nginx

	# forward request and error logs to docker log collector
RUN	ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

##
RUN	mkdir /defaults \
	&& mv /etc/nginx/* /defaults \
	&& chown -R proxy:proxy /defaults \
	&& ln -sf /etc/nginx /data

COPY	copy/entrypoint.sh /
RUN	chmod +x /entrypoint.sh

RUN	[ "cross-build-end" ]

#COPY nginx.conf /etc/nginx/nginx.conf
#COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

VOLUME $DATA

EXPOSE	80
EXPOSE	443

STOPSIGNAL SIGTERM

ENTRYPOINT [ "/entrypoint.sh" ]
#CMD	["nginx", "-g", "daemon off;"]
