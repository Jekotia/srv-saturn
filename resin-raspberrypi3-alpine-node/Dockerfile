FROM	resin/raspberrypi3-alpine-node

#
##
###
RUN	[ "cross-build-start" ]

RUN	apk -U upgrade \
	&& apk add tzdata \
	&& npm i -g npm \
	&& cp /usr/share/zoneinfo/America/Toronto /etc/localtime \
	&& echo "America/Toronto" >  /etc/timezone \
	&& date \
	&& apk del tzdata

RUN	[ "cross-build-end" ]
###
##
#
