#!/bin/sh
set -e

# start php-fpm
PHP_FPM_BIN=$(command -v php-fpm || command -v php-fpm8.4 || command -v php84-fpm || command -v php-fpm84)
if [ -z "$PHP_FPM_BIN" ]; then
  echo "Error: php-fpm binary not found" >&2
  exit 1
fi

# Find the real php-fpm.conf by checking known standard paths only.
# Avoids 'find' which picks up spurious configs shipped by php-fpm RPM
# under /etc/nginx/, /etc/systemd/, /etc/httpd/ on RHEL-based distros.
FPM_CONF=""
for conf in /etc/php-fpm.conf /etc/php/*/fpm/php-fpm.conf /etc/php*/php-fpm.conf; do
  if [ -f "$conf" ]; then
    FPM_CONF="$conf"
    break
  fi
done

# Ensure PID file directory exists (normally created by systemd, absent in containers)
mkdir -p /run/php-fpm

if [ -n "$FPM_CONF" ]; then
  "$PHP_FPM_BIN" --allow-to-run-as-root --fpm-config "$FPM_CONF"
else
  "$PHP_FPM_BIN" --allow-to-run-as-root
fi
