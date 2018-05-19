FROM	resin/raspberrypi3-debian
COPY	copy/cleanup /usr/bin

#
##
###
RUN	[ "cross-build-start" ]

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& dpkg-reconfigure tzdata \
	&& echo "America/Toronto" > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata \
	&& chmod +x /usr/bin/cleanup \
	&& cleanup

RUN	[ "cross-build-end" ]
###
##
#
