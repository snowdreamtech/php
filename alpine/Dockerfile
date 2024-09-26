FROM snowdreamtech/alpine:3.20.3

# OCI annotations to image
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="PHP Image Based On Alpine" \
    org.opencontainers.image.description="Docker Images for PHP on Alpine. (i386, amd64, arm32v6, arm32v7, arm64, ppc64le,riscv64, s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/php" \
    org.opencontainers.image.base.name="snowdreamtech/php:alpine" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/php" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.version="3.20.3" \
    org.opencontainers.image.url="https://github.com/snowdreamtech/php"

ENV PHP_MEMORY_LIMIT="512M" \
    PHP_MAX_UPLOAD="100M" \
    PHP_MAX_FILE_UPLOAD="200" \
    PHP_MAX_POST="100M" \
    PHP_MAX_EXECUTION_TIME=600 \
    PHP_DISPLAY_ERRORS="Off" \
    PHP_DISPLAY_STARTUP_ERRORS="Off" \
    PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR" \
    PHP_CGI_FIX_PATHINFO=0 \
    PHP_CONFIG_PATH=/etc/php82/php.ini

RUN apk add --no-cache php82@testing=8.2.24-r0 \
    php82-apache2@testing \
    php82-bcmath@testing \
    php82-bz2@testing \
    php82-calendar@testing \
    php82-cgi@testing \
    php82-common@testing \
    php82-ctype@testing \
    php82-curl@testing \
    php82-dba@testing \
    php82-dbg@testing \
    php82-dev@testing \
    php82-doc@testing \
    php82-dom@testing \
    php82-embed@testing \
    php82-enchant@testing \
    php82-exif@testing \
    php82-ffi@testing \
    php82-fileinfo@testing \
    php82-fpm@testing \
    php82-ftp@testing \
    php82-gd@testing \
    php82-gettext@testing \
    php82-gmp@testing \
    php82-iconv@testing \
    php82-imap@testing \
    php82-intl@testing \
    php82-ldap@testing \
    php82-litespeed@testing \
    php82-mbstring@testing \
    php82-mysqli@testing \
    php82-mysqlnd@testing \
    php82-odbc@testing \
    php82-opcache@testing \
    php82-openssl@testing \
    php82-pcntl@testing \
    php82-pdlib@testing \
    php82-pdo@testing \
    php82-pdo_dblib@testing \
    php82-pdo_mysql@testing \
    php82-pdo_odbc@testing \
    php82-pdo_pgsql@testing \
    php82-pdo_sqlite@testing \
    php82-pear@testing \
    php82-pecl-amqp@testing \
    php82-pecl-apcu@testing \
    php82-pecl-apfd@testing \
    php82-pecl-ast@testing \
    php82-pecl-brotli@testing \
    php82-pecl-couchbase@testing \
    php82-pecl-decimal@testing \
    php82-pecl-ds@testing \
    php82-pecl-event@testing \
    php82-pecl-excimer@testing \
    php82-pecl-grpc@testing \
    php82-pecl-igbinary@testing \
    php82-pecl-imagick@testing \
    php82-pecl-imagick-dev@testing \
    php82-pecl-immutable_cache@testing \
    php82-pecl-jsmin@testing \
    php82-pecl-luasandbox@testing \
    php82-pecl-lzf@testing \
    php82-pecl-mailparse@testing \
    php82-pecl-maxminddb@testing \
    php82-pecl-mcrypt@testing \
    php82-pecl-memcache-8.2-r2 \
    php82-pecl-memcached@testing \
    php82-pecl-mongodb@testing \
    php82-pecl-msgpack@testing \
    php82-pecl-oauth@testing \
    php82-pecl-opentelemetry@testing \
    php82-pecl-pcov@testing \
    php82-pecl-phalcon@testing \
    php82-pecl-protobuf@testing \
    php82-pecl-psr@testing \
    php82-pecl-rdkafka@testing \
    php82-pecl-redis@testing \
    php82-pecl-runkit7@testing \
    php82-pecl-smbclient@testing \
    php82-pecl-ssh2@testing \
    php82-pecl-swoole@testing \
    php82-pecl-swoole-dev@testing \
    php82-pecl-teds@testing \
    php82-pecl-timezonedb@testing \
    php82-pecl-uploadprogress@testing \
    php82-pecl-uploadprogress-doc@testing \
    php82-pecl-uuid@testing \
    php82-pecl-vips@testing \
    php82-pecl-vld@testing \
    php82-pecl-xdebug@testing \
    php82-pecl-xhprof@testing \
    php82-pecl-xhprof-assets@testing \
    php82-pecl-xlswriter@testing \
    php82-pecl-yaml@testing \
    php82-pecl-zephir_parser@testing \
    php82-pecl-zstd@testing \
    php82-pgsql@testing \
    php82-phar@testing \
    php82-phpdbg@testing \
    php82-posix@testing \
    php82-pspell@testing \
    php82-session@testing \
    php82-shmop@testing \
    php82-simplexml@testing \
    php82-snappy@testing \
    php82-snmp@testing \
    php82-soap@testing \
    php82-sockets@testing \
    php82-sodium@testing \
    php82-spx@testing \
    php82-sqlite3@testing \
    php82-sysvmsg@testing \
    php82-sysvsem@testing \
    php82-sysvshm@testing \
    php82-tidy@testing \
    php82-tokenizer@testing \
    php82-xml@testing \
    php82-xmlreader@testing \
    php82-xmlwriter@testing \
    php82-xsl@testing \
    php82-zip@testing \
    unit-php82@testing \
    xapian-bindings-php82@testing \
    && ln -s /usr/bin/php82 /usr/bin/php \
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
    && sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|i" ${PHP_CONFIG_PATH}

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]