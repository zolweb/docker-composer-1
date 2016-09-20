FROM composer/composer:1.1-alpine

RUN apk --update add git openssh sudo bash && \
    rm -rf /var/cache/apk/*

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /home/.composer

RUN composer --version

CMD []
ENTRYPOINT []
