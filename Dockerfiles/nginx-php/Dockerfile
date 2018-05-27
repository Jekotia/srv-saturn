FROM	jekotia/nginx

RUN	[ "cross-build-start" ]

RUN	apk --update add --no-cache \
		php7 \
		php7-fpm \
		php7-pear \
		php7-common \
		php7-mcrypt \
		php7-pdo_mysql \
		php7-mysqli \
		php7-mysqlnd \
		php7-cli \
		php7-gd \
		php7-curl \
		php7-apcu

RUN	apk add --no-cache \
		supervisor

RUN	[ "cross-build-end" ]

CMD     nginx -g "daemon off" ;
