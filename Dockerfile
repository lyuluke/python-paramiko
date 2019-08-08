FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN \

#==================================================
# supervisor
#==================================================
  apt-get update && apt-get install -y supervisor &&\
  apt-get clean && rm -rf /var/lib/apt/lists/* && \
  
#==================================================
# Python3.6
#==================================================
  apt-get update &&\
  apt-get -qqy --no-install-recommends install \
    python3.6 \
    python-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    build-essential \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    python-pip \
    curl \
    git \
    supervisor \
    libltdl-dev &&\

#==================================================
# Flask
#==================================================
  pip3 install flask_restplus &&\
  pip3 install requests &&\
  pip3 install opencv-python &&\
  pip3 install vncdotool &&\
  pip3 install paramiko &&\

#==================================================
# apt clean
#==================================================
  apt-get clean && rm -rf /var/lib/apt/lists/* 
