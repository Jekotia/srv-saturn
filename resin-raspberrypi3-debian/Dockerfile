FROM resin/raspberrypi3-debian

#
##
###
RUN [ "cross-build-start" ]

RUN	dpkg-reconfigure tzdata \
	&& echo "America/Toronto" > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata

RUN [ "cross-build-end" ]
###
##
#
