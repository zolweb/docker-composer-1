FROM composer/composer:1.1-alpine

RUN apk --update add git openssh sudo bash curl && \
    rm -rf /var/cache/apk/*

ENV COMPOSER_BIN_DIR /usr/local/bin
ENV COMPOSER_HOME /root/.composer
ENV PATH "$COMPOSER_BIN_DIR:$PATH"

RUN mkdir -p $COMPOSER_HOME

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=$COMPOSER_BIN_DIR --filename=composer \
	&& $COMPOSER_BIN_DIR/composer global require "hirak/prestissimo:^0.3" \
	&& rm -rf $COMPOSER_HOME/cache/*

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD []
