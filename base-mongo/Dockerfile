FROM teodorescuserban/kobo-base:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY mongodb.list /etc/apt/sources.list.d/

RUN apt-get -qq update && \
    apt-get -qq -y install \
        mongodb-org-server
        git \
        build-essential && \
    apt-get clean && \
    /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /etc/services/mongo && \
    touch /etc/services/mongo/run

#VOLUME ["/srv/mongo", "/srv/backup"]
#EXPOSE 5432

CMD ["/sbin/my_init"]

