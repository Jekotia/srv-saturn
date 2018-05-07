FROM resin/raspberrypi3-alpine

RUN	cross-build-start \
	&& apk -U upgrade \
	&& apk add \
		tzdata \
		su-exec \
	&& cp /usr/share/zoneinfo/America/Toronto /etc/localtime \
	&& echo "America/Toronto" >  /etc/timezone \
	&& date \
	&& apk del tzdata \
	&& cross-build-end
