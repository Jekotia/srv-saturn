FROM	jekotia/ruby:stretch

COPY	copy/bundle /usr/jekyll/bin/
COPY	copy/connected /usr/jekyll/bin/
COPY	copy/default-args /usr/jekyll/bin/
COPY	copy/entrypoint /usr/jekyll/bin/
COPY	copy/jekyll /usr/jekyll/bin/

ENV	USER=jekyll \
	GROUP=jekyll \
	UID=2314 \
	GID=2314 \
	HOME=/home/jekyll

RUN	[ "cross-build-start" ]
###
##
#


RUN	apt-get update \
	&& apt-get install -y \
		ruby-dev \
		build-essential \
		git \
	&& apt-cleanup

RUN	mkdir -p $DATA \
	&& addgroup \
		--gid $GID \
		--system \
		$GROUP \
		&& adduser \
		--uid $UID \
		--disabled-password \
		--system \
		--shell /bin/sh \
		--gid $GID \
		--home $HOME \
		$USER


RUN	gem install bundler
## RUN	gem install github-pages
## RUN	gem install jekyll-github-metadata
RUN	gem install jekyll
RUN	gem install jekyll-redirect-from
RUN	gem install jekyll-reload
## RUN	gem install jekyll-mentions
RUN	gem install jekyll-coffeescript
RUN	gem install jekyll-sass-converter
RUN	gem install jekyll-commonmark
RUN	gem install jekyll-paginate
RUN	gem install jekyll-compose
## RUN	gem install jekyll-assets
RUN	gem install jekyll-sitemap
RUN	gem install jekyll-feed

RUN	gem install kramdown
RUN	gem install rdiscount
RUN	gem install rouge

## RUN	gem install html-proofer
RUN	gem install RedCloth
## RUN	gem install jemoji
RUN	gem install minima

## RUN	bundle install


#RUN addgroup -Sg 1000 jekyll
#RUN adduser -Su 1000 -G \
# jekyll jekyll


#
##
###
RUN	[ "cross-build-end" ]

WORKDIR	/srv/jekyll
VOLUME	/srv/jekyll

EXPOSE	35729
EXPOSE	4000

ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
#CMD	["jekyll", "--help"]
CMD	[ "jekyll","build" ]
