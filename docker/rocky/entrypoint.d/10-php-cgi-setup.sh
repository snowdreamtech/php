#!/bin/sh
set -e

# Modifying configuration file php.ini
# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
find /etc  -name "php.ini" \
-exec sed -i "s|;*[[:space:]]*display_errors[[:space:]]*=[[:space:]]*.*|display_errors = ${PHP_DISPLAY_ERRORS}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*display_startup_errors[[:space:]]*=[[:space:]]*.*|display_startup_errors = ${PHP_DISPLAY_STARTUP_ERRORS}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*error_reporting[[:space:]]*=[[:space:]]*.*|error_reporting = ${PHP_ERROR_REPORTING}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*memory_limit =[[:space:]]*.*|memory_limit = ${PHP_MEMORY_LIMIT}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*upload_max_filesize =[[:space:]]*.*|upload_max_filesize = ${PHP_MAX_UPLOAD}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*max_file_uploads =[[:space:]]*.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*max_execution_time =[[:space:]]*.*|max_execution_time = ${PHP_MAX_EXECUTION_TIME}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*max_input_time =[[:space:]]*.*|max_input_time = ${PHP_MAX_INPUT_TIME}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*post_max_size =[[:space:]]*.*|post_max_size = ${PHP_MAX_POST}|g" {} \; \
-exec sed -i "s|;*[[:space:]]*cgi.fix_pathinfo=[[:space:]]*.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|g" {} \;