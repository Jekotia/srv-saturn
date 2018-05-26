FROM	jekotia/nginx

RUN	[ "cross-build-start" ]

RUN	apk add --no-cache \
		php7 \
		php7-fpm \
		php-pear \
		php7-common \
		php7-mcrypt \
		php7-mysql \
		php7-cli \
		php7-gd \
		php7-curl \
		php-apc

RUN	apk add --no-cache \
		supervisor

RUN	[ "cross-build-end" ]

CMD     nginx -g "daemon off" ;
