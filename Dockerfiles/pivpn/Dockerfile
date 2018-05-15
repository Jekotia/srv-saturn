FROM	jekotia/resin-raspberrypi3-debian

ENV	TERM=screen-256color \
	LANG=C.UTF-8 \
	UID=1000 \
	GID=1000 \
	USER=pivpn \
	GROUP=pivpn \
	HOME=/home/pivpn \
	DATA=/data

#
##
###
RUN	[ "cross-build-start" ]

RUN	apt-get update \
	&& apt-get upgrade \
	&& apt-get install -y \
		debconf-utils \
		software-properties-common \
		curl \
		git \
		nano \
		whiptail \
		openvpn \
		dhcpcd5 \
		dnsutils \
		expect

RUN	mkdir -p $DATA \
	&& addgroup \
		--gid $GID \
		--system \
		$GROUP \
	&& adduser \
		--uid $UID \
		--disabled-password \
		--system \
		--home $HOME \
		--shell /sbin/nologin \
		--gid $GID \
		$USER \
	&& mkdir -p $HOME \
	&& chown -R $USER:$GROUP $HOME

COPY	copy/setupVars.conf /etc/pivpn/setupVars.conf
#RUN	mkdir -p /etc/pivpn && touch /etc/pivpn/setupVars.conf
RUN	curl -L https://install.pivpn.io -o /install.sh \
	&& bash /install.sh --unattended

 #--unattended

RUN [ "cross-build-end" ]
###
##
#

VOLUME $DATA

EXPOSE 1194

#CMD /run.sh

#ENTRYPOINT ["/run.sh"]
## CMD ["--dir /weechat"]
