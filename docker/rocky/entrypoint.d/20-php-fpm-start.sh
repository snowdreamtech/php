#!/bin/sh
set -e

# start php-fpm
FPM_CONF=$(find /etc -name "php-fpm.conf" | head -n 1)
if [ -n "$FPM_CONF" ]; then
  /usr/sbin/php-fpm --fpm-config "$FPM_CONF"
else
  /usr/sbin/php-fpm
fi
