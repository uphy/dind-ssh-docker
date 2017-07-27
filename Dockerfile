FROM docker:17.06.0-ce-dind

RUN apk --update add \
    bash \
    py-pip \
    supervisor \
    openssh \
    curl \
    && \
    rm -rf /var/cache/apk/* && \
    pip install docker-compose && \
    mkdir -p /var/log/supervisor

COPY files /
EXPOSE 22
ENTRYPOINT ["/docker-entrypoint.sh"]