FROM golang:alpine
MAINTAINER Nicolas Le Gras <nicolas.legras@gmail.com>

ENV GOPATH="/go"
ENV CADDY_REPO_OWNER mholt
ENV CADDY_REPO_NAME caddy

COPY ./plugins.txt /plugins.txt

RUN    apk -U --no-progress upgrade \
    && apk -U --force --no-progress add \
          build-tools git ca-certificates \
    && mkdir -p $GOPATH/src/github.com/$CADDY_REPO_OWNER \
    && cd $GOPATH/src/github.com/$CADDY_REPO_OWNER \
    && git clone https://github.com/$CADDY_REPO_OWNER/$CADDY_REPO_NAME \
    && cd $CADDY_REPO_NAME/caddy/caddymain \
    && head -n 23 run.go > newrun.go \
    && cat /plugins.txt >> newrun.go \
    && tail -n +24 run.go >> newrun.go \
    && rm -f run.go \
    && mv newrun.go run.go \
    && go get github.com/mholt/caddy/caddy \
    && mv $GOPATH/bin/caddy /bin \
    && apk del --purge build-tools go git \
    && rm -rf /var/cache/apk/* \
    && rm -rf /go

EXPOSE 80 443 2015
VOLUME /root/.caddy
VOLUME /var/www/html


ENTRYPOINT ["/bin/caddy"]
CMD ["-quic","--conf", "/etc/Caddyfile", "--log", "stdout"]
