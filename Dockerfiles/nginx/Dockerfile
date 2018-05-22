FROM	jekotia/resin-raspberrypi3-alpine

ENV	UID=2523 \
	GID=2523 \
	USER=nginx \
	GROUP=nginx

RUN	[ "cross-build-start" ]

RUN	addgroup -g ${GID} -S ${GROUP} \
	&& adduser -D -S -s /sbin/nologin -G ${GROUP} ${USER} \
	&& apk add --no-cache --virtual \
		nginx \
	# forward request and error logs to docker log collector \
	&& ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log \
	&& mkdir -p /run/nginx

RUN	[ "cross-build-end" ]

VOLUME	/etc/nginx
VOLUME	/var/www

EXPOSE	80
EXPOSE	443

STOPSIGNAL SIGTERM

CMD	["nginx", "-g", "daemon off;"]
