FROM resin/raspberrypi3-alpine

#
##
###
RUN	[ "cross-build-start" ]

RUN	apk -U upgrade \
	&& apk add \
		tzdata \
		su-exec \
	&& cp /usr/share/zoneinfo/America/Toronto /etc/localtime \
	&& echo "America/Toronto" >  /etc/timezone \
	&& date \
	&& apk del tzdata

RUN	[ "cross-build-end" ]
###
##
#
