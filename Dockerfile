FROM python:3.6-alpine
COPY requirements.txt /tmp/requirements.txt
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache --virtual .build-deps gcc musl-dev python3-dev g++ lapack-dev postgresql-dev openssl-dev libffi-dev make gfortran && \
    ln -s locale.h /usr/include/xlocale.h && \
    pip --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install -r /tmp/requirements.txt && \
    apk del .build-deps && \
    apk add --no-cache curl libpq libgcc libstdc++ && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/requirements.txt
