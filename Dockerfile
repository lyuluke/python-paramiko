FROM python:3.6-alpine

RUN apk add --virtual .install_dependencies_paramiko \
    gcc \
    musl-dev \
    python-dev \
    libffi-dev \
    openssl-dev \
    build-base \
    py-pip \
&&  apk add zlib \
    zlib-dev \
    libssl1.0 \
    openssl-dev \
&&  pip install cffi \
&&  pip install paramiko \
&&  apk del .install_dependencies_paramiko

ENTRYPOINT ["/bin/sh"]
