FROM snowdreamtech/alpine:3.20.2
LABEL maintainer="snowdream <sn0wdr1am@qq.com>"

ENV PHP_FPM_USER="nobody" \
    PHP_FPM_GROUP="nobody" \
    PHP_FPM_HOST="127.0.0.1" \
    PHP_FPM_PORT=9000 \
    PHP_FPM_LISTEN_MODE="0660" \
    PHP_MEMORY_LIMIT="512M" \
    PHP_MAX_UPLOAD="100M" \
    PHP_MAX_FILE_UPLOAD="200" \
    PHP_MAX_POST="100M" \
    PHP_MAX_EXECUTION_TIME=600 \
    PHP_DISPLAY_ERRORS="On" \
    PHP_DISPLAY_STARTUP_ERRORS="On" \
    PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR" \
    PHP_CGI_FIX_PATHINFO=0 \
    PHP_CONFIG_PATH=/etc/php81/php.ini  \
    PHP_FPM_CONFIG_PATH=/etc/php81/php-fpm.d/www.conf 

RUN apk add --no-cache php81@testing=8.1.29-r0 \
    # cacti-php@testing \
    unit-php81@testing \ 
    # php81-apache2@testing \
    php81-bcmath@testing \
    php81-bz2@testing \
    php81-calendar@testing \
    php81-cgi@testing \
    php81-common@testing \
    php81-ctype@testing \
    php81-curl@testing \
    php81-dba@testing \
    # php81-doc@testing \
    php81-dom@testing \
    php81-embed@testing \
    php81-enchant@testing \
    php81-exif@testing \
    php81-ffi@testing \
    php81-fileinfo@testing \
    php81-fpm@testing \
    php81-ftp@testing \
    php81-gd@testing \
    php81-gettext@testing \
    php81-gmp@testing \
    php81-iconv@testing \
    php81-imap@testing \
    php81-intl@testing \
    php81-ldap@testing \
    php81-litespeed@testing \
    php81-mbstring@testing \
    php81-mysqli@testing \
    php81-mysqlnd@testing \
    php81-odbc@testing \
    php81-opcache@testing \
    php81-openssl@testing \
    php81-pcntl@testing \
    php81-pdo@testing \
    php81-pdo_dblib@testing \
    php81-pdo_mysql@testing \
    php81-pdo_odbc@testing \
    php81-pdo_pgsql@testing \
    php81-pdo_sqlite@testing \
    php81-pear@testing \
    php81-pecl-amqp@testing \
    php81-pecl-apcu@testing \
    php81-pecl-ast@testing \
    php81-pecl-brotli@testing \
    # php81-pecl-couchbase@testing \
    php81-pecl-csv@testing \
    php81-pecl-decimal@testing \
    php81-pecl-ds@testing \
    php81-pecl-event@testing \
    # php81-pecl-grpc@testing \
    php81-pecl-igbinary@testing \
    # php81-pecl-imagick@testing \
    php81-pecl-immutable_cache@testing \
    # php81-pecl-jsmin@testing \
    php81-pecl-luasandbox@testing \
    php81-pecl-lzf@testing \
    php81-pecl-mailparse@testing \
    php81-pecl-maxminddb@testing \
    php81-pecl-mcrypt@testing \
    php81-pecl-memcache@testing \
    # php81-pecl-memcached@testing \
    # php81-pecl-memprof@testing \
    php81-pecl-mongodb@testing \
    # php81-pecl-msgpack@testing \
    php81-pecl-oauth@testing \
    php81-pecl-opentelemetry@testing \
    php81-pecl-pcov@testing \
    php81-pecl-protobuf@testing \
    php81-pecl-psr@testing \
    php81-pecl-rdkafka@testing \
    # php81-pecl-redis@testing \
    php81-pecl-smbclient@testing \
    php81-pecl-ssh2@testing \
    # php81-pecl-swoole@testing \
    php81-pecl-timezonedb@testing \
    php81-pecl-uploadprogress@testing \
    php81-pecl-uploadprogress-doc@testing \
    php81-pecl-uuid@testing \
    # php81-pecl-vips@testing \
    php81-pecl-xdebug@testing \
    php81-pecl-xhprof@testing \
    php81-pecl-xhprof-assets@testing \
    php81-pecl-xlswriter@testing \
    php81-pecl-xmlrpc@testing \
    php81-pecl-yaml@testing \
    php81-pecl-zephir_parser@testing \
    php81-pecl-zstd@testing \
    php81-pgsql@testing \
    php81-phar@testing \
    # php81-phpdbg@testing \
    php81-posix@testing \
    php81-pspell@testing \
    php81-session@testing \
    php81-shmop@testing \
    php81-simplexml@testing \
    php81-snmp@testing \
    php81-soap@testing \
    php81-sockets@testing \
    php81-sodium@testing \
    # php81-spx@testing \
    php81-sqlite3@testing \
    php81-sysvmsg@testing \
    php81-sysvsem@testing \
    php81-sysvshm@testing \
    # php81-tideways_xhprof@testing \
    php81-tidy@testing \
    php81-tokenizer@testing \
    php81-xml@testing \
    php81-xmlreader@testing \
    php81-xmlwriter@testing \
    php81-xsl@testing \
    php81-zip@testing \ 
    && ln -s /usr/bin/php81 /usr/bin/php \
    && ln -s /usr/bin/php-fpm81 /usr/bin/php-fpm \
    && ln -s /usr/bin/php-cgi81 /usr/bin/php-cgi \
    # Installing composer
    && wget -c https://getcomposer.org/installer -O composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm -rf composer-setup.php \
    # Modifying configuration file php.ini
    # https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
    && sed -i "s|display_errors\s*=\s*Off|display_errors = ${PHP_DISPLAY_ERRORS}|i" ${PHP_CONFIG_PATH} \
    && sed -i "s|display_startup_errors\s*=\s*Off|display_startup_errors = ${PHP_DISPLAY_STARTUP_ERRORS}|i" ${PHP_CONFIG_PATH} \
    && sed -i "s|error_reporting\s*=\s*E_ALL & ~E_DEPRECATED & ~E_STRICT|error_reporting = ${PHP_ERROR_REPORTING}|i" ${PHP_CONFIG_PATH} \
    && sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" ${PHP_CONFIG_PATH} \
    && sed -i "s|;*upload_max_filesize =.*|upload_max_filesize = ${PHP_MAX_UPLOAD}|i" ${PHP_CONFIG_PATH} \
    && sed -i "s|;*max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|i" ${PHP_CONFIG_PATH} \
    && sed -i "s|;*max_execution_time =.*|max_execution_time = ${PHP_MAX_EXECUTION_TIME}|i" ${PHP_CONFIG_PATH} \
    && sed -i "s|;*post_max_size =.*|post_max_size = ${PHP_MAX_POST}|i" ${PHP_CONFIG_PATH} \
    && sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|i" ${PHP_CONFIG_PATH} \
    # Modifying configuration file www.conf
    # https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
    && sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = ${PHP_FPM_USER}|g" ${PHP_FPM_CONFIG_PATH} \
    && sed -i "s|;listen.group\s*=\s*nobody|listen.group = ${PHP_FPM_GROUP}|g" ${PHP_FPM_CONFIG_PATH} \
    && sed -i "s|;listen\s*=\s*|listen = ${PHP_FPM_HOST}:${PHP_FPM_PORT}|g" ${PHP_FPM_CONFIG_PATH} \
    && sed -i "s|;listen.mode\s*=\s*0660|listen.mode = ${PHP_FPM_LISTEN_MODE}|g" ${PHP_FPM_CONFIG_PATH} \
    && sed -i "s|user\s*=\s*nobody|user = ${PHP_FPM_USER}|g" ${PHP_FPM_CONFIG_PATH} \
    && sed -i "s|group\s*=\s*nobody|group = ${PHP_FPM_GROUP}|g" ${PHP_FPM_CONFIG_PATH} \
    && sed -i "s|;log_level\s*=\s*notice|log_level = notice|g" ${PHP_FPM_CONFIG_PATH} 


COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/sbin/php-fpm81","--nodaemonize","--fpm-config","/etc/php81/php-fpm.conf","-R"]