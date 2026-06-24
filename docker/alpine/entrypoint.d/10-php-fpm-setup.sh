#!/bin/sh
set -e

# Modifying configuration file php.ini
# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
find /etc  -name "php.ini" \
-exec sed -i "s|;*[[:space:]]*display_errors[[:space:]]*=[[:space:]]*.*|display_errors = ${PHP_DISPLAY_ERRORS:-Off}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*display_startup_errors[[:space:]]*=[[:space:]]*.*|display_startup_errors = ${PHP_DISPLAY_STARTUP_ERRORS:-Off}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*error_reporting[[:space:]]*=[[:space:]]*.*|error_reporting = ${PHP_ERROR_REPORTING:-E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*memory_limit =[[:space:]]*.*|memory_limit = ${PHP_MEMORY_LIMIT:-1G}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*upload_max_filesize =[[:space:]]*.*|upload_max_filesize = ${PHP_MAX_UPLOAD:-2G}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*max_file_uploads =[[:space:]]*.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD:-200}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*max_execution_time =[[:space:]]*.*|max_execution_time = ${PHP_MAX_EXECUTION_TIME:-600}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*max_input_time =[[:space:]]*.*|max_input_time = ${PHP_MAX_INPUT_TIME:-600}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*post_max_size =[[:space:]]*.*|post_max_size = ${PHP_MAX_POST:-2G}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*cgi.fix_pathinfo=[[:space:]]*.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO:-0}|g" {} \; 

# Modifying configuration file www.conf
# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
find /etc  -name "www.conf" \
-exec sed -i "s|;*[[:space:]]*listen.owner[[:space:]]*=[[:space:]]*.*|listen.owner = ${PHP_FPM_USER:-root}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*listen.group[[:space:]]*=[[:space:]]*.*|listen.group = ${PHP_FPM_GROUP:-root}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*listen[[:space:]]*=[[:space:]]*.*|listen = ${PHP_FPM_HOST:-127.0.0.1}:${PHP_FPM_PORT:-9000}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*listen.mode[[:space:]]*=[[:space:]]*.*|listen.mode = ${PHP_FPM_LISTEN_MODE:-0660}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*user[[:space:]]*=[[:space:]]*.*|user = ${PHP_FPM_USER:-root}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*group[[:space:]]*=[[:space:]]*.*|group = ${PHP_FPM_GROUP:-root}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*log_level[[:space:]]*=[[:space:]]*.*|log_level = notice|g" {} \; 