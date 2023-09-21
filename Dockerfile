FROM docker:24.0.6-dind

RUN apk --update add \
    supervisor \
    openssh \
    && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /var/log/supervisor

COPY files /
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]