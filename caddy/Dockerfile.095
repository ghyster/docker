FROM alpine:edge
MAINTAINER Nicolas Le Gras <nicolas.legras@gmail.com>

LABEL caddy_version="0.9.5" architecture="amd64"

RUN apk add --no-cache curl \
    && curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/build?os=linux&arch=amd64" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy \
    && /usr/bin/caddy -version

EXPOSE 80 443 2015
VOLUME /root/.caddy
VOLUME /var/www/html


ENTRYPOINT ["/usr/bin/caddy"]
CMD ["-quic","--conf", "/etc/Caddyfile", "--log", "stdout"]
