FROM	gogs/gogs-rpi

ENV	QEMU_EXECVE 1

COPY	crossbuild/qemu-arm-static /usr/bin/
COPY	crossbuild/resin-xbuild /usr/bin/

RUN [ "/usr/bin/qemu-arm-static", "/bin/sh", "-c", "ln -s resin-xbuild /usr/bin/cross-build-start; ln -s resin-xbuild /usr/bin/cross-build-end; ln /bin/sh /bin/sh.real" ]

ENV	UID=2252 \
	GID=2252 \
	USER=gogs \
	GROUP=gogs \
	PUID=2252 \
	PGID=2252

RUN	[ "cross-build-start" ]
RUN	addgroup \
		-g $GID \
		-S $GROUP \
	&& adduser \
		-u $UID \
		-D \
		-S \
		-h $HOME \
		-s /sbin/nologin \
		-G $GROUP \
		$USER
RUN	[ "cross-build-end" ]
