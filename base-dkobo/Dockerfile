FROM teodorescuserban/kobo-base-kobos:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

RUN mkdir -p /srv/src && \
    cd /srv/src && \
    git clone https://github.com/kobotoolbox/dkobo.git -b master koboform && \
    cd /srv/src/koboform && \
    pip install -r requirements.txt

# && \
#    npm install -g --save-dev && \
#    npm install -g bower --allow-root


#    bower install --config.interactive=false --allow-root && \
