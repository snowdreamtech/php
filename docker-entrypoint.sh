#!/bin/sh
set -e

#nginx 
/usr/sbin/nginx -c /etc/nginx/nginx.conf

#fpm
/usr/sbin/php-fpm81 --nodaemonize --fpm-config /etc/php81/php-fpm.conf -R 

# exec commands
exec "$@"
