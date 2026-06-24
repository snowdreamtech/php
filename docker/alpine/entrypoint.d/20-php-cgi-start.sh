#!/bin/sh
set -e

# start php-cgi
PHP_CGI_BIN=$(command -v php-cgi || command -v php-cgi8.4 || command -v php84-cgi || command -v php-cgi84)
if [ -n "$PHP_CGI_BIN" ]; then
  "$PHP_CGI_BIN" -b 127.0.0.1:9000 &
else
  echo "Error: php-cgi binary not found" >&2
  exit 1
fi
