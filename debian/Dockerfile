FROM snowdreamtech/debian:13.1.0

# OCI annotations to image
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="PHP Image Based On Debian" \
    org.opencontainers.image.description="Docker Images for PHP on Debian. (i386,amd64,arm32v5,arm32v7,arm64,mips64le,ppc64le,s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/php" \
    org.opencontainers.image.base.name="snowdreamtech/php:debian" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/php" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.version="8.4.11" \
    org.opencontainers.image.url="https://github.com/snowdreamtech/php"

# Switch to the user
USER root

# Set the workdir
WORKDIR /root

# keep the docker container running
ARG DEBIAN_FRONTEND=noninteractive \
    KEEPALIVE=0 \
    # The cap_net_bind_service capability in Linux allows a process to bind a socket to Internet domain privileged ports, 
    # which are port numbers less than 1024. 
    CAP_NET_BIND_SERVICE=0 \
    # Ensure the container exec commands handle range of utf8 characters based of
    # default locales in base image (https://github.com/docker-library/docs/tree/master/debian#locales)
    LANG=C.UTF-8\
    UMASK=022 \
    DEBUG=false \
    PGID=0 \
    PUID=0  \
    USER=root \
    WORKDIR=/root 

ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND} \
    # keep the docker container running
    KEEPALIVE=${KEEPALIVE} \
    # The cap_net_bind_service capability in Linux allows a process to bind a socket to Internet domain privileged ports, 
    # which are port numbers less than 1024. 
    CAP_NET_BIND_SERVICE=${CAP_NET_BIND_SERVICE} \
    # Ensure the container exec commands handle range of utf8 characters based of
    # default locales in base image (https://github.com/docker-library/docs/tree/master/debian#locales)
    LANG=${LANG} \
    UMASK=${UMASK} \
    DEBUG=${DEBUG} \
    PGID=${PGID} \
    PUID=${PUID}  \
    USER=${USER} \
    WORKDIR=${WORKDIR} 

ENV PHP_VERSION=2:8.4+96 \ 
    PHP_MEMORY_LIMIT="512M" \
    PHP_MAX_UPLOAD="100M" \
    PHP_MAX_FILE_UPLOAD="200" \
    PHP_MAX_POST="100M" \
    PHP_MAX_EXECUTION_TIME=600 \
    PHP_DISPLAY_ERRORS="Off" \
    PHP_DISPLAY_STARTUP_ERRORS="Off" \
    PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR" \
    PHP_CGI_FIX_PATHINFO=0

ENV PHP_FPM_USER="root" \
    PHP_FPM_GROUP="root" \
    PHP_FPM_HOST="127.0.0.1" \
    PHP_FPM_PORT=9000 \
    PHP_FPM_LISTEN_MODE="0660"

# Create a user with PUID and PGID
RUN if [ "${USER}" != "root" ] && [ ! -d "/home/${USER}" ] && [ "${PUID}" -ne 0 ] && [ "${PGID}" -ne 0 ]; then \
    addgroup --gid ${PGID} ${USER}; \
    adduser --home /home/${USER} --uid ${PUID} --gid ${PGID} --gecos ${USER} --shell /bin/bash --disabled-password ${USER}; \
    # sed -i "/%sudo/c ${USER} ALL=(ALL:ALL) NOPASSWD:ALL" /etc/sudoers; \
    fi
    
RUN set -eux \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy update  \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy install --no-install-recommends \ 
    imagemagick \
    php=${PHP_VERSION} \
    && apt-cache search php8.4- | awk '{print $1}' | grep -Ev 'php8.4-yac|php8.4-gmagick' | xargs apt-get -qqy install --no-install-recommends \
    && mkdir -p /run/php \
    && touch /run/php/php8.4-fpm.pid \
    && touch /var/log/php8.4-fpm.log \
    && ln -sf `which php8.4` /usr/bin/php \
    && ln -sf `which php-fpm8.4` /usr/bin/php-fpm \
    && ln -sf `which php-cgi8.4` /usr/bin/php-cgi \
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
    -exec sed -i "s|;*\s*log_level\s*=\s*notice|log_level = notice|g" {} \; \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy --purge autoremove \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

# Enable CAP_NET_BIND_SERVICE
# RUN if [ "${USER}" != "root" ] && [ "${CAP_NET_BIND_SERVICE}" -eq 1 ]; then \
#     # setcap 'cap_net_bind_service=+ep' `which nginx`; \
#     fi

EXPOSE 9000

COPY entrypoint.d /usr/local/bin/entrypoint.d

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.d/*

ENTRYPOINT ["docker-entrypoint.sh"]