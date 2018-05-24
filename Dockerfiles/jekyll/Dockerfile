FROM jekotia/ruby:stretch
COPY copy /

ENV	USER=jekyll \
	GROUP=jekyll \
	UID=2314 \
	GID=2314

#
##
###
RUN	[ "cross-build-start" ]

RUN     apt-get update \
	&& apt-get install -y \
                ruby-dev \
                build-essential \
	&& apt-cleanup
RUN     gem install jekyll bundler

RUN     mkdir -p $DATA \
        && addgroup \
                --gid $GID \
                --system \
                $GROUP \
        && adduser \
                --uid $UID \
                --disabled-password \
                --system \
                --shell /sbin/nologin \
                --gid $GID \
                $USER

#RUN addgroup -Sg 1000 jekyll
#RUN adduser  -Su 1000 -G \
#  jekyll jekyll

RUN	[ "cross-build-end" ]
###
##
#


# --
CMD ["jekyll", "--help"]
ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
WORKDIR /srv/jekyll
VOLUME  /srv/jekyll
EXPOSE 35729
EXPOSE 4000
