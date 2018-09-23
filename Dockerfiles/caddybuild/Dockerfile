FROM	resin/raspberrypi3-golang as build
#RUN	["cross-build-start"]

RUN	go get github.com/mholt/caddy/caddy
RUN	go get github.com/caddyserver/builds
RUN	go get github.com/lucaslorentz/caddy-docker-proxy/plugin
RUN	go get github.com/caddyserver/dnsproviders/cloudflare
WORKDIR	$GOPATH/src/github.com/mholt/caddy/caddy
COPY	copy/plugins plugins
RUN	sed -i -e "/\/\/\sThis\sis\swhere\sother\splugins\sget\splugged\sin\s.imported./ r plugins" caddymain/run.go
RUN	grep -f plugins caddymain/run.go
#RUN	sed -i -e 's/\/\/\sThis\sis\swhere\sother\splugins\sget\splugged\sin\s.imported./`cat plugins`/' caddymain/run.go
#RUN	mv run.go original.run.go
#RUN	sed '/\s*\/\/\sThis\sis\swhere\sother\splugins\sget\splugged\sin\s\(imported\)/a $(</plugins)' caddymain/run.go
#RUN	sed "s/\s*\/\/\sThis\sis\swhere\sother\splugins\sget\splugged\sin\s\(imported\)/ $(</plugins)/" caddymain/run.go
#RUN	sed "\s./\/\/\ This\ is\ where\ other\ plugins\ get\ plugged\ in\ \(imported\)/ $(</plugins)/" caddymain/run.go
#RUN	sed '|\/\/\ This\ is\ where\ other\ plugins\ get\ plugged\ in\ (imported)|i ' \
#	&& head -n 23 run.go > newrun.go \
#	&& cat /plugins >> newrun.go \
#	&& tail -n +24 run.go >> newrun.go \
#	&& rm -f run.go \
#	&& mv newrun.go run.go
#RUN	pwd
#RUN head -45 caddymain/run.go
#RUN return 1

RUN	go run build.go
RUN return 1


#RUN	["cross-build-end"]


FROM	scratch
ENV	CADDYPATH=/caddy

COPY	--from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY	--from=build /go /bin/
RUN	mkdir /caddy

WORKDIR	/caddy

VOLUME	/caddy

EXPOSE	80, 443

#STOPSIGNAL SIGTERM

ENTRYPOINT	["/bin/caddy"]
