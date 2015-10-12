FROM teodorescuserban/kobo-base-kobos:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

#RUN apt-get -qq update && \
#    apt-get -qq -y install \
#        binutils \
#        libproj-dev \
#        gdal-bin && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

RUN mkdir -p /srv/src && \
    cd /srv/src && \
    git clone https://github.com/kobotoolbox/dkobo.git -b master koboform && \
    cd /srv/src/koboform && \
    pip install -r requirements.txt && \
    npm install -g --save-dev && \
    npm install -g bower


#    bower install --config.interactive=false --allow-root && \
