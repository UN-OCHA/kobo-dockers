FROM teodorescuserban/kobo-base:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

RUN apt-get -qq update && \
    apt-get -qq -y install \
        libpq-dev \
        libxml2 \
        libxml2-dev \
        libxslt1-dev \
        nodejs \
        npm \
        postgresql-client-9.3 \
        python2.7-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    mkdir -p /etc/service/wsgi && \
    touch /etc/service/wsgi/run && \
    curl -s https://bootstrap.pypa.io/get-pip.py -o /get-pip.py && \
    python /get-pip.py && \
    rm /get-pip.py && \
    pip install uwsgi

#        python-pip \
