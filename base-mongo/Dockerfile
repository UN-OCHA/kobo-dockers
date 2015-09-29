FROM teodorescuserban/kobo-base:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY mongodb.list /etc/apt/sources.list.d/

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    apt-get -qq update && \
    apt-get -qq -y install \
        mongodb-org-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    mkdir -p /etc/service/mongo && \
    touch /etc/service/mongo/run

#VOLUME ["/srv/mongo", "/srv/backup"]
#EXPOSE 5432

CMD ["/sbin/my_init"]

