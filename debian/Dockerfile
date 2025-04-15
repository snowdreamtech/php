FROM snowdreamtech/nginx:1.22.1-debian

# OCI annotations to image
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="PHP Image Based On Debian" \
    org.opencontainers.image.description="Docker Images for PHP on Debian. (i386,amd64,arm32v5,arm32v7,arm64,mips64le,ppc64le,s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/php" \
    org.opencontainers.image.base.name="snowdreamtech/php:debian" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/php" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.version="8.2.26" \
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

ENV PHP_VERSION=2:8.2+93 \ 
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

ARG GID=1001 \
    UID=1001  \
    USER=php \
    WORKDIR=/home/php

# Create a user with UID and GID
RUN set -eux \
    && if [ "${USER}" != "root" ]; then \
    addgroup --gid ${GID} ${USER}; \
    adduser --home /home/${USER} --uid ${UID} --gid ${GID} --gecos ${USER} --shell /bin/bash --disabled-password ${USER}; \
    # sed -i "/%sudo/c ${USER} ALL=(ALL:ALL) NOPASSWD:ALL" /etc/sudoers; \
    fi \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy --purge autoremove \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/* 

COPY --chown=nginx:nginx default.conf /etc/nginx/conf.d

RUN set -eux \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy update  \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy install --no-install-recommends \ 
    imagemagick \
    php=${PHP_VERSION} \
    php8.2-amqp \
    php8.2-apcu \
    php8.2-ast \
    php8.2-bcmath \
    php8.2-bz2 \
    php8.2-cgi \
    php8.2-cli \
    php8.2-common \
    php8.2-curl \
    php8.2-dba \
    php8.2-dev \
    php8.2-ds \
    php8.2-enchant \
    php8.2-fpm \
    php8.2-gd \
    php8.2-gearman \
    # php8.2-gmagick \
    php8.2-gmp \
    php8.2-gnupg \
    php8.2-http \
    php8.2-igbinary \
    php8.2-imagick \
    php8.2-imap \
    php8.2-interbase \
    php8.2-intl \
    php8.2-ldap \
    php8.2-libvirt-php \
    php8.2-mailparse \
    php8.2-maxminddb \
    php8.2-mbstring \
    php8.2-mcrypt \
    php8.2-memcache \
    php8.2-memcached \
    php8.2-mongodb \
    php8.2-msgpack \
    php8.2-mysql \
    php8.2-oauth \
    php8.2-odbc \
    php8.2-opcache \
    php8.2-pcov \
    php8.2-pgsql \
    php8.2-phpdbg \
    php8.2-pinba \
    php8.2-ps \
    php8.2-pspell \
    php8.2-psr \
    php8.2-raphf \
    php8.2-readline \
    php8.2-redis \
    php8.2-rrd \
    php8.2-snmp \
    php8.2-soap \
    php8.2-solr \
    php8.2-sqlite3 \
    php8.2-ssh2 \
    php8.2-stomp \
    php8.2-sybase \
    php8.2-tideways \
    php8.2-tidy \
    # php8.2-uopz \
    php8.2-uploadprogress \
    php8.2-uuid \
    php8.2-xdebug \
    php8.2-xml \
    php8.2-xmlrpc \
    php8.2-xsl \
    # php8.2-yac \
    php8.2-yaml \
    php8.2-zip \
    php8.2-zmq \
    && mkdir -p /run/php \
    && touch /run/php/php8.2-fpm.pid \
    && touch /var/log/php8.2-fpm.log \
    && ln -sf `which php8.2` /usr/bin/php \
    && ln -sf `which php-fpm8.2` /usr/bin/php-fpm \
    && ln -sf `which php-cgi8.2` /usr/bin/php-cgi \
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
    -exec sed -i "s|;*\s*listen\s*=\s*.*|listen = ${PHP_FPM_HOST}:${PHP_FPM_PORT}|g" {} \; \
    -exec sed -i "s|;*\s*listen.mode\s*=\s*0660|listen.mode = ${PHP_FPM_LISTEN_MODE}|g" {} \; \
    -exec sed -i "s|;*\s*user\s*=\s*.*|user = ${PHP_FPM_USER}|g" {} \; \
    -exec sed -i "s|;*\s*group\s*=\s*.*|group = ${PHP_FPM_GROUP}|g" {} \; \
    -exec sed -i "s|;*\s*log_level\s*=\s*notice|log_level = notice|g" {} \; \ 
    # Chown the files of php to nginx
    && find /etc  -name "*php*" -exec chown -Rv nginx:nginx {} \; \
    && find /usr  -name "*php*" -exec chown -Rv nginx:nginx {} \; \
    && find /var/log  -name "*php*" -exec chown -Rv nginx:nginx {} \; \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy --purge autoremove \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

# Enable CAP_NET_BIND_SERVICE
RUN set -eux \
    && if [ "${USER}" != "root" ] && [ "${CAP_NET_BIND_SERVICE}" -eq 1 ]; then \
    DEBIAN_FRONTEND=noninteractive apt-get -qqy update; \
    DEBIAN_FRONTEND=noninteractive apt-get -qqy install --no-install-recommends libcap2-bin; \
    # setcap 'cap_net_bind_service=+ep' `which nginx`; \
    fi \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy --purge autoremove \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/* 

# Switch to the user
USER nginx

# Set the workdir
WORKDIR /home/nginx

EXPOSE 9000

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]