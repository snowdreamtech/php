#!/bin/sh
set -e

# start nginx
/usr/sbin/nginx -c /etc/nginx/nginx.conf

#cgi
/usr/bin/php-cgi -b 127.0.0.1:9000 &

# exec commands
if [ -n "$*" ]; then
    sh -c "$*"
fi

# keep the docker container running
# https://github.com/docker/compose/issues/1926#issuecomment-422351028
if [ "${KEEPALIVE}" -eq 1 ]; then
    trap : TERM INT
    tail -f /dev/null & wait
    # sleep infinity & wait
fi