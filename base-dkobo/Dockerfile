FROM teodorescuserban/kobo-base:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

RUN apt-get -qq update && \
    apt-get -qq -y install \
        python2.7-dev \
        libxml2 \
        libxml2-dev \
        libxslt1-dev \
        nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /etc/service/wsgi && \
    touch /etc/service/wsgi/run
