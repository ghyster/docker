FROM golang:alpine
MAINTAINER Nicolas Le Gras <nicolas.legras@gmail.com>

ENV GOPATH="/go"

RUN    apk -U --no-progress upgrade \
    && apk -U --force --no-progress add \
          build-tools git ca-certificates \
    && go get github.com/mholt/caddy/caddy \
    && mv $GOPATH/bin/caddy /bin \
    && apk del --purge build-tools go git \
    && rm -rf /var/cache/apk/*

EXPOSE 80 443 2015
VOLUME /root/.caddy
VOLUME /var/www/html


ENTRYPOINT ["/bin/caddy"]
CMD ["-quic","--conf", "/etc/Caddyfile", "--log", "stdout"]
