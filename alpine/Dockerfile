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

RUN apk add --no-cache php82@community=8.2.25-r0 \
    php82-apache2@community \
    php82-bcmath@community \
    php82-bz2@community \
    php82-calendar@community \
    php82-cgi@community \
    php82-common@community \
    php82-ctype@community \
    php82-curl@community \
    php82-dba@community \
    php82-dbg@community \
    # php82-dev@community \
    php82-doc@community \
    php82-dom@community \
    php82-embed@community \
    php82-enchant@community \
    php82-exif@community \
    php82-ffi@community \
    php82-fileinfo@community \
    php82-fpm@community \
    php82-ftp@community \
    php82-gd@community \
    php82-gettext@community \
    php82-gmp@community \
    php82-iconv@community \
    php82-imap@community \
    php82-intl@community \
    php82-ldap@community \
    php82-litespeed@community \
    php82-mbstring@community \
    php82-mysqli@community \
    php82-mysqlnd@community \
    php82-odbc@community \
    php82-opcache@community \
    php82-openssl@community \
    php82-pcntl@community \
    # php82-pdlib@testing \
    php82-pdo@community \
    php82-pdo_dblib@community \
    php82-pdo_mysql@community \
    php82-pdo_odbc@community \
    php82-pdo_pgsql@community \
    php82-pdo_sqlite@community \
    php82-pear@community \
    php82-pecl-amqp@community \
    php82-pecl-apcu@community \
    php82-pecl-apfd@testing \
    php82-pecl-ast@community \
    php82-pecl-brotli@community \
    # php82-pecl-couchbase@community \
    php82-pecl-decimal@community \
    php82-pecl-ds@community \
    php82-pecl-event@community \
    php82-pecl-excimer@testing \
    # php82-pecl-grpc@community \
    php82-pecl-igbinary@community \
    # php82-pecl-imagick@community \
    # php82-pecl-imagick-dev@community \
    php82-pecl-immutable_cache@testing \
    # php82-pecl-jsmin@testing \
    php82-pecl-luasandbox@community \
    php82-pecl-lzf@community \
    php82-pecl-mailparse@community \
    php82-pecl-maxminddb@community \
    php82-pecl-mcrypt@community \
    php82-pecl-memcache@community \
    php82-pecl-memcached@community \
    php82-pecl-mongodb@community \
    php82-pecl-msgpack@community \
    php82-pecl-oauth@testing \
    php82-pecl-opentelemetry@community \
    php82-pecl-pcov@community \
    # php82-pecl-phalcon@testing \
    php82-pecl-protobuf@community \
    php82-pecl-psr@community \
    php82-pecl-rdkafka@community \
    php82-pecl-redis@community \
    php82-pecl-runkit7@testing \
    php82-pecl-smbclient@community \
    php82-pecl-ssh2@community \
    # php82-pecl-swoole@community \
    # php82-pecl-swoole-dev@community \
    php82-pecl-teds@testing \
    php82-pecl-timezonedb@community \
    php82-pecl-uploadprogress@community \
    php82-pecl-uploadprogress-doc@community \
    php82-pecl-uuid@community \
    php82-pecl-vips@community \
    php82-pecl-vld@testing \
    php82-pecl-xdebug@community \
    php82-pecl-xhprof@community \
    php82-pecl-xhprof-assets@community \
    php82-pecl-xlswriter@community \
    php82-pecl-yaml@community \
    php82-pecl-zephir_parser@testing \
    php82-pecl-zstd@community \
    php82-pgsql@community \
    php82-phar@community \
    php82-phpdbg@community \
    php82-posix@community \
    php82-pspell@community \
    php82-session@community \
    php82-shmop@community \
    php82-simplexml@community \
    php82-snappy@testing \
    php82-snmp@community \
    php82-soap@community \
    php82-sockets@community \
    php82-sodium@community \
    # php82-spx@community \
    php82-sqlite3@community \
    php82-sysvmsg@community \
    php82-sysvsem@community \
    php82-sysvshm@community \
    php82-tidy@community \
    php82-tokenizer@community \
    php82-xml@community \
    php82-xmlreader@community \
    php82-xmlwriter@community \
    php82-xsl@community \
    php82-zip@community \
    unit-php82@community \
    xapian-bindings-php82@community \
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