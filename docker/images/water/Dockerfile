FROM alpine:3.19
LABEL Maintainer="Da Dao" \
    Description="Lightweight container with Nginx 1.16 & php83-FPM 8 based on Alpine Linux.  Run with --no-cache to make an optimised production image." 

# Install packages
RUN mkdir -p /var/log/supd && \
    mkdir -p /etc/supervisor.d && \
    mkdir -p /var/log/nginx && \
    mkdir -p /etc/php
RUN apk update && \
    apk add --no-cache \
    php83 \
    php83-dev \
    php83-fpm \
    php83-opcache \
    php83-pecl-apcu \
    php83-mysqli \
    php83-pgsql \
    php83-json \
    php83-openssl \
    php83-curl \
    php83-zlib \
    php83-soap \
    php83-xml \
    php83-fileinfo \
    php83-phar \
    php83-intl \
    php83-dom \
    php83-xmlreader \
    php83-xmlwriter \
    php83-ctype \
    php83-session \
    php83-iconv \
    php83-tokenizer \
    php83-zip \
    php83-simplexml \
    php83-mbstring \
    php83-gd \
    php83-calendar \
    php83-pdo_mysql \
    php83-pdo \
    php83-pdo_sqlite \
    php83-pcntl \
    php83-sockets \
    php83-sqlite3 \
    php83-gettext \
    php83-pear \
    php83-pecl-redis \
    php83-pecl-xdebug \
    php83-pecl-memcached \
    php83-bcmath \
    php83-gmp

RUN apk add --no-cache \
    nginx \
    runit \
    bash \
    curl \
    git \
    redis \
    mysql-client \
    supervisor \
    libmcrypt nginx-mod-http-headers-more nginx-mod-http-lua lua-resty-http luarocks5.1 nodejs npm && \
    mkdir -p /var/log/php

RUN apk add --no-cache --virtual .build-deps  lua5.1-dev libc-dev gcc libmcrypt-dev g++ git file make autoconf &&  \
    rm -rf /var/cache/apk/* && apk del .build-deps && rm -rf tmp/*  && \
    /bin/ln -s /usr/sbin/php-fpm83 /usr/bin/php-fpm && \
    ln -sf /usr/bin/php83 /usr/bin/php

RUN apk add --update --no-cache python3 && \
    ln -sf python3 /usr/bin/python && \
    apk add py3-pip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN addgroup -g 1000 app && \
    addgroup nginx app && \
    adduser -D -g '' -G app -u 1000 app && \
    mkdir -m 1777 -p /var/tmp/php

CMD ["/usr/bin/supervisord", "--nodaemon", "-c", "/etc/supervisord.conf"]
