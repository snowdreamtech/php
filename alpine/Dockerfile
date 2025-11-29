FROM snowdreamtech/alpine:3.22.2

# OCI annotations to image
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="PHP Image Based On Alpine" \
    org.opencontainers.image.description="Docker Images for PHP on Alpine. (i386, amd64, arm32v6, arm32v7, arm64, ppc64le,riscv64, s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/php" \
    org.opencontainers.image.base.name="snowdreamtech/php:alpine" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/php" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.version="8.4.14" \
    org.opencontainers.image.url="https://github.com/snowdreamtech/php"
    
# Switch to the user
USER root

# Set the workdir
WORKDIR /root

# keep the docker container running
ARG KEEPALIVE=0 \
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

# keep the docker container running
ENV KEEPALIVE=${KEEPALIVE} \
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

ENV PHP_VERSION=8.4.14-r0 \ 
    PHP_MEMORY_LIMIT="1G" \
    PHP_MAX_UPLOAD="2G" \
    PHP_MAX_FILE_UPLOAD="200" \
    PHP_MAX_POST="2G" \
    PHP_MAX_EXECUTION_TIME=600 \
    PHP_MAX_INPUT_TIME=600 \
    PHP_DISPLAY_ERRORS="Off" \
    PHP_DISPLAY_STARTUP_ERRORS="Off" \
    PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR" \
    PHP_CGI_FIX_PATHINFO=0

ENV PHP_FPM_USER="root" \
    PHP_FPM_GROUP="root" \
    PHP_FPM_HOST="127.0.0.1" \
    PHP_FPM_PORT=9000 \
    PHP_FPM_LISTEN_MODE="0660"

ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH}

# Create a user with PUID and PGID
RUN if [ "${USER}" != "root" ] && [ ! -d "/home/${USER}" ] && [ "${PUID}" -ne 0 ] && [ "${PGID}" -ne 0 ]; then \
    addgroup -g ${PGID} ${USER}; \
    adduser -h /home/${USER} -u ${PUID} -g ${USER} -G ${USER} -s /bin/sh -D ${USER}; \
    # sed -i "/%sudo/c ${USER} ALL=(ALL:ALL) NOPASSWD:ALL" /etc/sudoers; \
    fi
    
RUN sed -i '3,$d' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
    php84=${PHP_VERSION} \
    && apk search php84- \
    | awk -F'-[0-9]' '{print $1}' \
    | grep -Ev 'php84-yac|php84-gmagick' \
    | xargs apk add --no-cache \
    && echo "@main https://dl-cdn.alpinelinux.org/alpine/edge/main" | tee -a /etc/apk/repositories \
    && echo "@community https://dl-cdn.alpinelinux.org/alpine/edge/community" | tee -a /etc/apk/repositories \
    && echo "@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing" | tee -a /etc/apk/repositories \
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
    -exec sed -i "s|;*\s*display_errors\s*=\\s*.*|display_errors = ${PHP_DISPLAY_ERRORS}|g" {} \; \
    -exec sed -i "s|;*\s*display_startup_errors\s*=\s*.*|display_startup_errors = ${PHP_DISPLAY_STARTUP_ERRORS}|g" {} \; \
    -exec sed -i "s|;*\s*error_reporting\s*=\s*.*|error_reporting = ${PHP_ERROR_REPORTING}|g" {} \; \
    -exec sed -i "s|;*\s*memory_limit =\s*.*|memory_limit = ${PHP_MEMORY_LIMIT}|g" {} \; \
    -exec sed -i "s|;*\s*upload_max_filesize =\s*.*|upload_max_filesize = ${PHP_MAX_UPLOAD}|g" {} \; \
    -exec sed -i "s|;*\s*max_file_uploads =\s*.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|g" {} \; \
    -exec sed -i "s|;*\s*max_execution_time =\s*.*|max_execution_time = ${PHP_MAX_EXECUTION_TIME}|g" {} \; \
    -exec sed -i "s|;*\s*max_input_time =\s*.*|max_input_time = ${PHP_MAX_INPUT_TIME}|g" {} \; \
    -exec sed -i "s|;*\s*post_max_size =\s*.*|post_max_size = ${PHP_MAX_POST}|g" {} \; \
    -exec sed -i "s|;*\s*cgi.fix_pathinfo=\s*.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|g" {} \; \
    # Modifying configuration file www.conf
    # https://wiki.alpinelinux.org/wiki/Nginx_with_PHP
    && find /etc  -name "www.conf" \
    -exec sed -i "s|;*\s*listen.owner\s*=\s*.*|listen.owner = ${PHP_FPM_USER}|g" {} \; \
    -exec sed -i "s|;*\s*listen.group\s*=\s*.*|listen.group = ${PHP_FPM_GROUP}|g" {} \; \
    -exec sed -i "s|;*\s*listen\s*=\s*.*|listen = ${PHP_FPM_HOST}:${PHP_FPM_PORT}|g" {} \; \
    -exec sed -i "s|;*\s*listen.mode\s*=\s*.*|listen.mode = ${PHP_FPM_LISTEN_MODE}|g" {} \; \
    -exec sed -i "s|;*\s*user\s*=\s*.*|user = ${PHP_FPM_USER}|g" {} \; \
    -exec sed -i "s|;*\s*group\s*=\s*.*|group = ${PHP_FPM_GROUP}|g" {} \; \
    -exec sed -i "s|;*\s*log_level\s*=\s*.*|log_level = notice|g" {} \; 

RUN if [ "$TARGETARCH" = "amd64" ] || [ "$TARGETARCH" = "arm64" ]; then \
        # install dependencies
        apk update \
        && apk add --no-cache php84 php84-dev php84-pear php84-pdo php84-openssl autoconf make g++ unixodbc-dev \
        # The following symbolic links are optional but useful
        && ln -sf /usr/bin/php84 /usr/bin/php \
        && ln -sf /usr/bin/phpize84 /usr/bin/phpize \
        && ln -sf /usr/bin/pecl84 /usr/bin/pecl \
        && ln -sf /usr/bin/php-config84 /usr/bin/php-config ; \
    fi

# Install Microsoft ODBC Driver for SQL Server（only for amd64 and arm64 architecture）
# see more: https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16#alpine
RUN if [ "$TARGETARCH" = "amd64" ] || [ "$TARGETARCH" = "arm64" ]; then \
        architecture="$TARGETARCH"; \
        # install dependencies
        apk update \
        && apk add --no-cache curl gnupg \
        # Download the desired package(s)
        && curl -O https://download.microsoft.com/download/fae28b9a-d880-42fd-9b98-d779f0fdd77f/msodbcsql18_18.5.1.1-1_$architecture.apk \
        && curl -O https://download.microsoft.com/download/7/6/d/76de322a-d860-4894-9945-f0cc5d6a45f8/mssql-tools18_18.4.1.1-1_$architecture.apk \
        # (Optional) Verify signature, if 'gpg' is missing install it using 'apk add gnupg':
        && curl -O https://download.microsoft.com/download/fae28b9a-d880-42fd-9b98-d779f0fdd77f/msodbcsql18_18.5.1.1-1_$architecture.sig \
        && curl -O https://download.microsoft.com/download/7/6/d/76de322a-d860-4894-9945-f0cc5d6a45f8/mssql-tools18_18.4.1.1-1_$architecture.sig \
        && curl https://packages.microsoft.com/keys/microsoft.asc  | gpg --import - \
        && gpg --verify msodbcsql18_18.5.1.1-1_$architecture.sig msodbcsql18_18.5.1.1-1_$architecture.apk \
        && gpg --verify mssql-tools18_18.4.1.1-1_$architecture.sig mssql-tools18_18.4.1.1-1_$architecture.apk \
        # Install the package(s)
        && apk add --allow-untrusted msodbcsql18_18.5.1.1-1_$architecture.apk \
        && apk add --allow-untrusted mssql-tools18_18.4.1.1-1_$architecture.apk \
        && apk info | grep msodbcsql18 \
        && apk info | grep mssql-tools18 \
        # Clean up
        && rm -f msodbcsql18_18.5.1.1-1_$architecture.apk msodbcsql18_18.5.1.1-1_$architecture.sig \
        && rm -f mssql-tools18_18.4.1.1-1_$architecture.apk mssql-tools18_18.4.1.1-1_$architecture.sig \
        && apk del --no-cache gnupg; \
    else \
        echo "Skipping Microsoft ODBC Driver install for $TARGETARCH"; \
    fi

#  Install the PHP drivers for Microsoft SQL Server (Alpine)（only for amd64 and arm64 architecture）
RUN if [ "$TARGETARCH" = "amd64" ] || [ "$TARGETARCH" = "arm64" ]; then \
        pecl install sqlsrv \
        && pecl install pdo_sqlsrv \
        && echo extension=pdo_sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/10_pdo_sqlsrv.ini \
        && echo extension=sqlsrv.so >> `php --ini | grep "Scan for additional .ini files" | sed -e "s|.*:\s*||"`/20_sqlsrv.ini \
        && php -m | grep -E 'pdo_sqlsrv' \
        && php -m | grep -E 'sqlsrv' \
        && php -m | grep -E 'odbc' ; \
    fi

# Composer install elasticsearch/elasticsearch
RUN composer --no-interaction require elasticsearch/elasticsearch \
    && composer --no-interaction show elasticsearch/elasticsearch

# Enable CAP_NET_BIND_SERVICE
# RUN if [ "${USER}" != "root" ] && [ "${CAP_NET_BIND_SERVICE}" -eq 1 ]; then \
    # setcap 'cap_net_bind_service=+ep' `which nginx`; \
    # fi
    
EXPOSE 9000

COPY entrypoint.d /usr/local/bin/entrypoint.d

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.d/*

ENTRYPOINT ["docker-entrypoint.sh"]