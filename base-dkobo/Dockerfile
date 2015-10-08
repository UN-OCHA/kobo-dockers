FROM teodorescuserban/kobo-base-kobos:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

RUN apt-get -qq update && \
    apt-get -qq -y install \
        libmemcached-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /srv/src && \
    cd /srv/src && \
    git clone https://github.com/kobotoolbox/dkobo.git -b master koboform && \
    cd /srv/src/koboform && \
    pip install -r requirements.txt && \
    npm install bower && \
    bower install --config.interactive=false --allow-root && \
    npm install --save-dev
