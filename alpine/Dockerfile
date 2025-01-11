FROM snowdreamtech/nginx:1.26.2-alpine

# OCI annotations to image
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="PHP Image Based On Alpine" \
    org.opencontainers.image.description="Docker Images for PHP on Alpine. (i386, amd64, arm32v6, arm32v7, arm64, ppc64le,riscv64, s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/php" \
    org.opencontainers.image.base.name="snowdreamtech/php:alpine" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/php" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.version="8.4.2" \
    org.opencontainers.image.url="https://github.com/snowdreamtech/php"

# Switch to the user
USER root

# Set the workdir
WORKDIR /root

# keep the docker container running
ENV KEEPALIVE=1 \
    # The cap_net_bind_service capability in Linux allows a process to bind a socket to Internet domain privileged ports, 
    # which are port numbers less than 1024. 
    CAP_NET_BIND_SERVICE=0 

ENV PHP_VERSION=8.4.2-r0 \ 
    PHP_MEMORY_LIMIT="512M" \
    PHP_MAX_UPLOAD="100M" \
    PHP_MAX_FILE_UPLOAD="200" \
    PHP_MAX_POST="100M" \
    PHP_MAX_EXECUTION_TIME=600 \
    PHP_DISPLAY_ERRORS="Off" \
    PHP_DISPLAY_STARTUP_ERRORS="Off" \
    PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR" \
    PHP_CGI_FIX_PATHINFO=0

ENV PHP_FPM_USER="nginx" \
    PHP_FPM_GROUP="nginx" \
    PHP_FPM_HOST="127.0.0.1" \
    PHP_FPM_PORT=9000 \
    PHP_FPM_LISTEN_MODE="0660"

ARG GID=1000 \
    UID=1000  \
    USER=php \
    WORKDIR=/home/php

# Create a user with UID and GID
RUN if [ "${USER}" != "root" ]; then \
    addgroup -g ${GID} ${USER}; \
    adduser -h /home/${USER} -u ${UID} -g ${USER} -G ${USER} -s /bin/sh -D ${USER}; \
    # sed -i "/%sudo/c ${USER} ALL=(ALL:ALL) NOPASSWD:ALL" /etc/sudoers; \
    fi

RUN apk add --no-cache \
    php84=${PHP_VERSION} \
    php84-apache2 \
    php84-bcmath \
    php84-bz2 \
    php84-calendar \
    php84-cgi \
    php84-common \
    php84-ctype \
    php84-curl \
    php84-dba \
    php84-dbg \
    # php84-dev \
    php84-doc \
    php84-dom \
    php84-embed \
    php84-enchant \
    php84-exif \
    php84-ffi \
    php84-fileinfo \
    php84-fpm \
    php84-ftp \
    php84-gd \
    php84-gettext \
    php84-gmp \
    php84-iconv \
    php84-imap \
    php84-intl \
    php84-ldap \
    php84-litespeed \
    php84-mbstring \
    php84-mysqli \
    php84-mysqlnd \
    php84-odbc \
    php84-opcache \
    php84-openssl \
    php84-pcntl \
    # php84-pdlib \
    php84-pdo \
    php84-pdo_dblib \
    php84-pdo_mysql \
    php84-pdo_odbc \
    php84-pdo_pgsql \
    php84-pdo_sqlite \
    php84-pgsql \
    php84-phar \
    php84-phpdbg \
    php84-posix \
    php84-session \
    php84-shmop \
    php84-simplexml \
    php84-snmp \
    php84-soap \
    php84-sockets \
    php84-sodium \
    # php84-spx \
    php84-sqlite3 \
    php84-sysvmsg \
    php84-sysvsem \
    php84-sysvshm \
    php84-tidy \
    php84-tokenizer \
    php84-xml \
    php84-xmlreader \
    php84-xmlwriter \
    php84-xsl \
    php84-zip \
    unit-php84 \   
    && ln -sf `which php84` /usr/bin/php \
    && ln -sf `which php-fpm84` /usr/bin/php-fpm \
    && ln -sf `which php-cgi84` /usr/bin/php-cgi \
    # Installing composer
    && wget -c https://getcomposer.org/installer -O composer-setup.php \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm -rf composer-setup.php \
    # Modifying configuration file php.ini
    # https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
    && find /etc  -name "php.ini" \
    -exec sed -i "s|;*\s*display_errors\s*=\s*Off|display_errors = ${PHP_DISPLAY_ERRORS}|g" {} \; \
    -exec sed -i "s|;*\s*display_startup_errors\s*=\s*Off|display_startup_errors = ${PHP_DISPLAY_STARTUP_ERRORS}|g" {} \; \
    -exec sed -i "s|;*\s*error_reporting\s*=\s*E_ALL & ~E_DEPRECATED & ~E_STRICT|error_reporting = ${PHP_ERROR_REPORTING}|g" {} \; \
    -exec sed -i "s|;*\s*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|g" {} \; \
    -exec sed -i "s|;*\s*upload_max_filesize =.*|upload_max_filesize = ${PHP_MAX_UPLOAD}|g" {} \; \
    -exec sed -i "s|;*\s*max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|g" {} \; \
    -exec sed -i "s|;*\s*max_execution_time =.*|max_execution_time = ${PHP_MAX_EXECUTION_TIME}|g" {} \; \
    -exec sed -i "s|;*\s*post_max_size =.*|post_max_size = ${PHP_MAX_POST}|g" {} \; \
    -exec sed -i "s|;*\s*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|g" {} \; \
    # Modifying configuration file www.conf
    # https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
    && find /etc  -name "www.conf" \
    -exec sed -i "s|;*\s*listen.owner\s*=\s*.*|listen.owner = ${PHP_FPM_USER}|g" {} \; \
    -exec sed -i "s|;*\s*listen.group\s*=\s*.*|listen.group = ${PHP_FPM_GROUP}|g" {} \; \
    -exec sed -i "s|;*\s*listen\s*=\s*|listen = ${PHP_FPM_HOST}:${PHP_FPM_PORT}|g" {} \; \
    -exec sed -i "s|;*\s*listen.mode\s*=\s*0660|listen.mode = ${PHP_FPM_LISTEN_MODE}|g" {} \; \
    -exec sed -i "s|;*\s*user\s*=\s*.*|user = ${PHP_FPM_USER}|g" {} \; \
    -exec sed -i "s|;*\s*group\s*=\s*.*|group = ${PHP_FPM_GROUP}|g" {} \; \
    -exec sed -i "s|;*\s*log_level\s*=\s*notice|log_level = notice|g" {} \; 

# Enable CAP_NET_BIND_SERVICE
RUN if [ "${USER}" != "root" ] && [ "${CAP_NET_BIND_SERVICE}" -eq 1 ]; then \
    apk add --no-cache libcap; \
    # setcap 'cap_net_bind_service=+ep' `which nginx`; \
    fi

# Switch to the user
USER ${USER}

# Set the workdir
WORKDIR ${WORKDIR}

EXPOSE 9000

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]