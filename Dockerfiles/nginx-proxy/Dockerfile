FROM	jekotia/resin-raspberrypi3-alpine

ENV	UID=2665 \
	GID=2665 \
	USER=proxy \
	GROUP=proxy

RUN	[ "cross-build-start" ]

RUN	addgroup -g ${GID} -S ${GROUP} \
	&& adduser -D -S -s /sbin/nologin -G ${GROUP} ${USER} \
	&& apk add --no-cache \
		nginx \
	# forward request and error logs to docker log collector \
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log \
	&& mkdir -p /run/nginx

RUN	[ "cross-build-end" ]

VOLUME	/etc/nginx
VOLUME	/cert

EXPOSE	80
EXPOSE	443

STOPSIGNAL SIGTERM

CMD	["nginx", "-g", "daemon off;"]
