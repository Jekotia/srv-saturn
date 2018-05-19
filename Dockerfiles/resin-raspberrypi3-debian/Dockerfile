FROM	resin/raspberrypi3-debian
COPY	copy/cleanup /usr/bin

#
##
###
RUN	[ "cross-build-start" ]

RUN	dpkg-reconfigure tzdata \
	&& echo "America/Toronto" > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata \
	&& chmod +x /usr/bin/cleanup

RUN	[ "cross-build-end" ]
###
##
#
