#!/bin/sh
set -e

# start php-fpm
/usr/bin/php-fpm --fpm-config /etc/php84/php-fpm.conf
