FROM python:3.6-alpine
COPY requirements.txt /tmp/requirements.txt
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache --virtual .build-deps gcc musl-dev g++ libstdc++ lapack-dev postgresql-dev openssl-dev libffi-dev make gfortran && \
    apk add --no-cache curl libpq && \
    rm -rf /var/cache/apk/* && \
    ln -s locale.h /usr/include/xlocale.h && \
    pip --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install -r /requirements.txt && \
    apk del .build-deps && \
    rm -rf /tmp/requirements.txt
