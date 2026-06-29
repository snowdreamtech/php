# PHP Image (Alpine Variant)
# Extends snowdreamtech/alpine with additional tooling and configuration.

FROM snowdreamtech/alpine:3.24.0

# Build-time Configuration
ARG BUILDTIME \
    VERSION \
    REVISION \
    KEEPALIVE=1 \
    CAP_NET_BIND_SERVICE=0 \
    LANG=C.UTF-8 \
    UMASK=022 \
    DEBUG=false \
    PASSWORDLESS_SUDO=false \
    PGID=0 \
    PUID=0 \
    USER=root \
    WORKDIR=/root \
    PHP_VERSION=8.4.22-r0

# Standard OCI Metadata (https://github.com/opencontainers/image-spec)
LABEL org.opencontainers.image.authors="Snowdream Tech" \
    org.opencontainers.image.title="PHP Image Based On Alpine" \
    org.opencontainers.image.description="Docker Images for PHP on Alpine. (i386, amd64, arm32v6, arm32v7, arm64, ppc64le, riscv64, s390x)" \
    org.opencontainers.image.documentation="https://hub.docker.com/r/snowdreamtech/php" \
    org.opencontainers.image.base.name="snowdreamtech/alpine:3.24.0" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.source="https://github.com/snowdreamtech/php" \
    org.opencontainers.image.vendor="Snowdream Tech" \
    org.opencontainers.image.created="${BUILDTIME}" \
    org.opencontainers.image.revision="${REVISION}" \
    org.opencontainers.image.url="https://github.com/snowdreamtech/php"

# x-release-please-start-version
LABEL org.opencontainers.image.version="${VERSION:-8.4.22}"
# x-release-please-end

# Runtime Environment Configuration
ENV KEEPALIVE=${KEEPALIVE} \
    CAP_NET_BIND_SERVICE=${CAP_NET_BIND_SERVICE} \
    LANG=${LANG} \
    UMASK=${UMASK} \
    DEBUG=${DEBUG} \
    PASSWORDLESS_SUDO=${PASSWORDLESS_SUDO} \
    PGID=${PGID} \
    PUID=${PUID} \
    USER=${USER} \
    WORKDIR=${WORKDIR} \
    PHP_VERSION=${PHP_VERSION}


ENV PHP_MEMORY_LIMIT="1G" \
    PHP_MAX_UPLOAD="2G" \
    PHP_MAX_FILE_UPLOAD="200" \
    PHP_MAX_POST="2G" \
    PHP_MAX_EXECUTION_TIME=600 \
    PHP_MAX_INPUT_TIME=600 \
    PHP_DISPLAY_ERRORS="Off" \
    PHP_DISPLAY_STARTUP_ERRORS="Off" \
    PHP_ERROR_REPORTING="E_COMPILE_ERROR\|E_RECOVERABLE_ERROR\|E_ERROR\|E_CORE_ERROR" \
    PHP_CGI_FIX_PATHINFO=0

# Additional tooling and configuration for PHP image
RUN set -eux \
    && apk update \
    && apk add --no-cache \
    php84-cgi=${PHP_VERSION} \
    php84-bcmath=${PHP_VERSION} \
    php84-curl=${PHP_VERSION} \
    php84-gd=${PHP_VERSION} \
    php84-intl=${PHP_VERSION} \
    php84-mbstring=${PHP_VERSION} \
    php84-mysqli=${PHP_VERSION} \
    php84-mysqlnd=${PHP_VERSION} \
    php84-opcache=${PHP_VERSION} \
    php84-pdo_mysql=${PHP_VERSION} \
    php84-pdo_pgsql=${PHP_VERSION} \
    php84-pdo_sqlite=${PHP_VERSION} \
    php84-pgsql=${PHP_VERSION} \
    php84-sqlite3=${PHP_VERSION} \
    php84-xml=${PHP_VERSION} \
    php84-zip=${PHP_VERSION} \
    php84-pcntl=${PHP_VERSION} \
    php84-posix=${PHP_VERSION} \
    php84-exif=${PHP_VERSION} \
    php84-fileinfo=${PHP_VERSION} \
    php84-iconv=${PHP_VERSION} \
    php84-sockets=${PHP_VERSION} \
    php84-sodium=${PHP_VERSION} \
    php84-bz2=${PHP_VERSION} \
    php84-pecl-apcu \
    php84-gmp=${PHP_VERSION} \
    php84-soap=${PHP_VERSION} \
    php84-ldap=${PHP_VERSION} \
    php84-phar=${PHP_VERSION} \
    php84-openssl=${PHP_VERSION} \
    php84-pecl-redis \
    php84-pecl-memcached \
    php84-pecl-mongodb \
    php84-pecl-igbinary \
    && ln -sf /usr/bin/php84 /usr/bin/php

# Container Orchestration Files
RUN set -eux \
    && (if ! command -v php >/dev/null 2>&1; then ln -s $(find /usr/bin /usr/local/bin /usr/sbin /usr/local/sbin -name "php[0-9]*" -type f -executable 2>/dev/null | grep -E "php[0-9.]+$" | head -n 1) /usr/bin/php || true; fi) \
    && curl --retry 5 -sS https://getcomposer.org/installer -o /tmp/composer-setup.php \
    && EXPECTED_CHECKSUM="$(curl --retry 5 -sS https://composer.github.io/installer.sig)" \
    && ACTUAL_CHECKSUM="$(php -r 'echo hash_file('"'sha384'"', '"'/tmp/composer-setup.php'"');')" \
    && if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]; then echo "Composer installer checksum mismatch" >&2; rm /tmp/composer-setup.php; exit 1; fi \
    && php /tmp/composer-setup.php --install-dir=/usr/bin --filename=composer \
    && rm /tmp/composer-setup.php
COPY entrypoint.d/*cgi* /usr/local/bin/entrypoint.d/

RUN chmod +x /usr/local/bin/entrypoint.d/*

# Standard Healthcheck (Verification of core system responsiveness)
HEALTHCHECK NONE

# Process Execution
EXPOSE 9000
USER root
WORKDIR /root
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/sh"]
