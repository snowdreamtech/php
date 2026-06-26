#!/bin/sh
set -e

# start cron daemon for scheduled tasks (e.g. acme.sh auto-renewal)
if command -v crond >/dev/null 2>&1; then
  crond
elif command -v cron >/dev/null 2>&1; then
  cron
fi
