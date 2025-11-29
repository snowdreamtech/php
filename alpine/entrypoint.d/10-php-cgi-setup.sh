#!/bin/sh
set -e

# Modifying configuration file php.ini
# https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
find /etc  -name "php.ini" \
-exec sed -i "s|;*\s*display_errors\s*=\\s*.*|display_errors = ${PHP_DISPLAY_ERRORS}|g" {} \; \
-exec sed -i "s|;*\s*display_startup_errors\s*=\s*.*|display_startup_errors = ${PHP_DISPLAY_STARTUP_ERRORS}|g" {} \; \
-exec sed -i "s|;*\s*error_reporting\s*=\s*.*|error_reporting = ${PHP_ERROR_REPORTING}|g" {} \; \
-exec sed -i "s|;*\s*memory_limit =\s*.*|memory_limit = ${PHP_MEMORY_LIMIT}|g" {} \; \
-exec sed -i "s|;*\s*upload_max_filesize =\s*.*|upload_max_filesize = ${PHP_MAX_UPLOAD}|g" {} \; \
-exec sed -i "s|;*\s*max_file_uploads =\s*.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|g" {} \; \
-exec sed -i "s|;*\s*max_execution_time =\s*.*|max_execution_time = ${PHP_MAX_EXECUTION_TIME}|g" {} \; \
-exec sed -i "s|;*\s*max_input_time =\s*.*|max_input_time = ${PHP_MAX_INPUT_TIME}|g" {} \; \
-exec sed -i "s|;*\s*post_max_size =\s*.*|post_max_size = ${PHP_MAX_POST}|g" {} \; \
-exec sed -i "s|;*\s*cgi.fix_pathinfo=\s*.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|g" {} \; 