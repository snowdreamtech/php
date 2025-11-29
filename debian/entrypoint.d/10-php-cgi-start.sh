#!/bin/sh
set -e

# start php-cgi
/usr/bin/php-cgi -b 127.0.0.1:9000 &
