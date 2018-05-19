FROM resin/raspberrypi3-debian

#
##
###
RUN [ "cross-build-start" ]

COPY	copy/cleanup.sh /

RUN	dpkg-reconfigure tzdata \
	&& echo "America/Toronto" > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata \
	&& chmod +x /cleanup.sh

RUN [ "cross-build-end" ]
###
##
#
