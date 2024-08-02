FROM snowdreamtech/alpine:3.20.2
LABEL maintainer="snowdream <sn0wdr1am@qq.com>"

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
    # php81-fpm@testing \
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
    ln -s /usr/bin/php81 /usr/bin/php

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]