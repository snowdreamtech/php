#!/bin/sh
set -e

# start php-fpm
PHP_FPM_BIN=$(command -v php-fpm || command -v php-fpm8.4 || command -v php84-fpm || command -v php-fpm84)
if [ -z "$PHP_FPM_BIN" ]; then
  echo "Error: php-fpm binary not found" >&2
  exit 1
fi

FPM_CONF=$(find /etc -name "php-fpm.conf" | head -n 1)
if [ -n "$FPM_CONF" ]; then
  "$PHP_FPM_BIN" --allow-to-run-as-root --fpm-config "$FPM_CONF"
else
  "$PHP_FPM_BIN" --allow-to-run-as-root
fi
