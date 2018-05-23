FROM jekotia/ruby:stretch
COPY copy /

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


RUN addgroup -Sg 1000 jekyll
RUN adduser  -Su 1000 -G \
  jekyll jekyll

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
