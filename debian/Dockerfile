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
    PHP_MEMORY_LIMIT="1G" \
    PHP_MAX_UPLOAD="2G" \
    PHP_MAX_FILE_UPLOAD="200" \
    PHP_MAX_POST="2.1G" \
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
    addgroup --gid ${PGID} ${USER}; \
    adduser --home /home/${USER} --uid ${PUID} --gid ${PGID} --gecos ${USER} --shell /bin/bash --disabled-password ${USER}; \
    # sed -i "/%/c ${USER} ALL=(ALL:ALL) NOPASSWD:ALL" /etc/ers; \
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
    -exec sed -i "s|;*\s*display_errors\s*=\s*.*|display_errors = ${PHP_DISPLAY_ERRORS}|g" {} \; \
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
    -exec sed -i "s|;*\s*log_level\s*=\s*.*|log_level = notice|g" {} \; \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy --purge autoremove \
    && DEBIAN_FRONTEND=noninteractive apt-get -qqy clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

# Install Microsoft ODBC Driver for SQL Server（only for amd64 and arm64 architecture）
# see more: https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver16#debian
RUN if [ "$TARGETARCH" = "amd64" ] || [ "$TARGETARCH" = "arm64" ]; then \
        set -eux \
        && DEBIAN_FRONTEND=noninteractive apt-get -qqy update  \
        && DEBIAN_FRONTEND=noninteractive apt-get -qqy install --no-install-recommends \ 
        curl gnupg \
        && os_version=12\
        # && os_version=$(grep VERSION_ID /etc/os-release | cut -d '"' -f 2 | cut -d '.' -f 1) \
        # Download the package to configure the Microsoft repo
        && curl -sSL -O https://packages.microsoft.com/config/debian/$os_version/packages-microsoft-prod.deb \
        # Install the package
        && dpkg -i packages-microsoft-prod.deb \
        # Delete the file
        && rm packages-microsoft-prod.deb \
        # Install the Microsoft ODBC Driver for SQL Server
        && DEBIAN_FRONTEND=noninteractive apt-get -qqy update  \
        && ACCEPT_EULA=Y apt-get install -y msodbcsql18 \
        # optional: for bcp and sqlcmd
        && ACCEPT_EULA=Y apt-get install -y mssql-tools18 \
        && dpkg -l | grep msodbcsql18 \
        && dpkg -l | grep mssql-tools18 \
        # Add /opt/mssql-tools/bin/ to PATH environment variable
        && echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc \
        && . ~/.bashrc \
        # optional: for unixODBC development headers
        && apt-get install -y unixodbc-dev \
        # optional: kerberos library for debian-slim distributions
        && apt-get install -y libgssapi-krb5-2 \
        && DEBIAN_FRONTEND=noninteractive apt-get -qqy --purge autoremove \
        && DEBIAN_FRONTEND=noninteractive apt-get -qqy clean \
        && rm -rf /var/lib/apt/lists/* \
        && rm -rf /tmp/* \
        && rm -rf /var/tmp/* \
        ; \
    else \
        echo "Skipping Microsoft ODBC Driver install for $TARGETARCH"; \
    fi

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