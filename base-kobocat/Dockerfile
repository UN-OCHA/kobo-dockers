FROM teodorescuserban/kobo-base-kobos:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

# not sure if you really use this, but putting this in here
# because pylibmc is at the end of base.pip
RUN apt-get -qq update && \
    apt-get -qq -y install \
        libmemcached-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install https://bitbucket.org/fomcl/savreaderwriter/downloads/savReaderWriter-3.3.0.zip#egg=savreaderwriter && \
    pip install dj-database-url && \
    mkdir -p /srv/src && \
    cd /srv/src && \
    git clone --depth 1 https://github.com/kobotoolbox/kobocat.git -b master && \
    git clone --depth 1 https://github.com/kobotoolbox/kobocat-template.git -b master && \
    pip install -r /srv/src/kobocat/requirements/base.pip && \
    cd /srv/src/kobocat && \
    npm install -g --save-dev && \
    npm install -g \
        bower \
        karma \
        grunt-cli

# this leads to errors at least with pymongo
# (pybamboo installs pymongo 2.3 which doesnt have MongoClient)
#    pip install pybamboo && \
