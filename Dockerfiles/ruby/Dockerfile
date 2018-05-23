FROM	jekotia/resin-raspberrypi3-debian:stretch

ENV	UID=2680 \
	GID=2680 \
	USER=ruby \
	GROUP=ruby \
	DATA=/data

#
##
###
RUN	[ "cross-build-start" ]

RUN	apt-get update \
	&& apt-get install -y \
		ruby \
	&& apt-cleanup

#RUN	mkdir -p $DATA \
#	&& mkdir -p $HOME \
#	&& addgroup \
#		-g $GID \
#		-S $GROUP \
#	&& adduser \
#		-u $UID \
#		-D \
#		-S \
#		-h $HOME \
#		-s /sbin/nologin \
#		-G $GROUP \
#		$USER

RUN	[ "cross-build-end" ]
###
##
#

CMD	[ "rbi" ]
