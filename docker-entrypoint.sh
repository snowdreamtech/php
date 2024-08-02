#!/bin/sh
set -e

PHP_CONFIG_PATH=/etc/php81/php.ini

# Modifying configuration file php.ini
# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
sed -i "s|display_errors\s*=\s*Off|display_errors = ${PHP_DISPLAY_ERRORS}|i" ${PHP_CONFIG_PATH}
sed -i "s|display_startup_errors\s*=\s*Off|display_startup_errors = ${PHP_DISPLAY_STARTUP_ERRORS}|i" ${PHP_CONFIG_PATH}
sed -i "s|error_reporting\s*=\s*E_ALL & ~E_DEPRECATED & ~E_STRICT|error_reporting = ${PHP_ERROR_REPORTING}|i" ${PHP_CONFIG_PATH}
sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" ${PHP_CONFIG_PATH}
sed -i "s|;*upload_max_filesize =.*|upload_max_filesize = ${PHP_MAX_UPLOAD}|i" ${PHP_CONFIG_PATH}
sed -i "s|;*max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|i" ${PHP_CONFIG_PATH}
sed -i "s|;*post_max_size =.*|post_max_size = ${PHP_MAX_POST}|i" ${PHP_CONFIG_PATH}
sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|i" ${PHP_CONFIG_PATH}

# exec commands
exec "$@"
