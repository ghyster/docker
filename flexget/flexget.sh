#!/bin/ash

rm -f /var/lib/flexget/.config-lock
/usr/local/bin/flexget --loglevel info -c /var/lib/flexget/config.yml daemon start
