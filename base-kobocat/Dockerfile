FROM teodorescuserban/kobo-base-kobos:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

RUN pip install https://bitbucket.org/fomcl/savreaderwriter/downloads/savReaderWriter-3.3.0.zip#egg=savreaderwriter && \
    pip install dj-database-url && \
    mkdir -p /srv/src && \
    cd /srv/src && \
    git clone --depth 1 https://github.com/kobotoolbox/kobocat.git -b master && \
    git clone --depth 1 https://github.com/kobotoolbox/kobocat-template.git -b master && \
    pip install -r /srv/src/kobocat/requirements/base.pip && \
    pip install \
        boto==2.1.1 \
        django-storages==1.1.4 \
        django-ses==0.4.0 && \
    chown -R wsgi /srv/src/kobocat*
