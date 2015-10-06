FROM teodorescuserban/kobo-base-dkobo:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY run_wsgi /etc/service/wsgi/run

#RUN apt-get -qq update && \
#    apt-get -qq -y install \
#        python2.7-dev \
#        libxml2 \
#        libxml2-dev \
#        libxslt1-dev \
#        nodejs && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    chmod +x /etc/service/wsgi/run && \
    mkdir -p /srv/src

VOLUME ["/srv/src"]

EXPOSE 80

CMD ["/sbin/my_init"]
