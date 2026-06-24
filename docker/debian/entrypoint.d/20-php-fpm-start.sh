#!/bin/sh
set -e

# start php-fpm
/usr/bin/php-fpm --fpm-config /etc/php/8.4/fpm/php-fpm.conf
