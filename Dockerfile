FROM alpine:edge

RUN echo "http://nl.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories \
&& echo "http://nl.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories \
&& echo "http://nl.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories \
&& apk update && apk upgrade

RUN apk add --virtual  .install_dependencies_paramiko\
    gcc \
    musl-dev \
    python-dev \
    libffi-dev \
    openssl-dev \
    build-base \
    py-pip \
&&  apk add zlib \
    zlib-dev \
#    libssl1.0 \
    openssl-dev 
&&  pip install cffi \
&&  pip install paramiko \
&&  apk del .install_dependencies_paramiko

ENTRYPOINT ["/bin/sh"]
