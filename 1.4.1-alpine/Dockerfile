FROM composer:1.4.1

RUN apk --update add git openssh sudo bash && \
    rm -rf /var/cache/apk/*


COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD []