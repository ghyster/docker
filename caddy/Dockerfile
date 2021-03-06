#
# Builder
#
FROM ghyster/caddy-builder:arm64-0.11.3 as builder

ARG version="0.11.3"
ARG plugins="filebrowser,cors,realip,expires,cache,ipfilter"

# process wrapper
RUN go get -v github.com/abiosoft/parent

RUN VERSION=${version} PLUGINS=${plugins} /bin/sh /usr/bin/builder.sh

#
# Final stage
#
FROM alpine:3.8
LABEL maintainer "Nicolas Le Gras <nicolas.legras@gmail.com>"

ARG version="0.11.3"
LABEL caddy_version="$version"

# Let's Encrypt Agreement
ENV ACME_AGREE="true"

RUN apk add --no-cache openssh-client git

# install caddy
COPY --from=builder /install/caddy /usr/bin/caddy

# validate install
RUN /usr/bin/caddy -version
RUN /usr/bin/caddy -plugins

EXPOSE 80 443 2015
VOLUME /root/.caddy 

# install process wrapper
COPY --from=builder /go/bin/parent /bin/parent

ENTRYPOINT ["/bin/parent", "caddy"]
CMD ["-quic","--conf", "/etc/Caddyfile", "--log", "stdout", "--agree=$ACME_AGREE"]
