#!/bin/sh
set -e

# Nginx User Sync for PHP-FPM
# When the user mounts a custom nginx.conf with a different `user` directive,
# this script syncs PHP_FPM_USER/GROUP to match, ensuring both services
# run as the same user without modifying the user's nginx.conf.
#
# Priority: explicit PHP_FPM_USER env > nginx.conf user > default (www-data)

DEFAULT_FPM_USER="www-data"

# Only sync if PHP_FPM_USER is still at the default value
# (i.e., the user hasn't explicitly overridden it)
if [ "${PHP_FPM_USER}" = "${DEFAULT_FPM_USER}" ]; then
  NGINX_CONF="/etc/nginx/nginx.conf"
  if [ -f "$NGINX_CONF" ]; then
    NGINX_USER=$(awk '/^[[:space:]]*user[[:space:]]/ {gsub(/;/, "", $2); print $2; exit}' "$NGINX_CONF")
    if [ -n "$NGINX_USER" ] && [ "$NGINX_USER" != "$DEFAULT_FPM_USER" ]; then
      export PHP_FPM_USER="$NGINX_USER"
      export PHP_FPM_GROUP="$NGINX_USER"
    fi
  fi
fi
