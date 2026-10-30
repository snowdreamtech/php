#!/bin/sh
set -e

# start nginx
NGINX_BIN=$(command -v nginx)
if [ -z "$NGINX_BIN" ]; then
  echo "Error: nginx binary not found" >&2
  exit 1
fi

"$NGINX_BIN" -c /etc/nginx/nginx.conf
