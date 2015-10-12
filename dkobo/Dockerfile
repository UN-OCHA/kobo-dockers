FROM teodorescuserban/kobo-base-dkobo:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY run_wsgi /etc/service/wsgi/run
COPY env_koboform init.sh koboform.ini /srv/src/

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    chmod +x /etc/service/wsgi/run

VOLUME ["/srv/src/koboform"]

EXPOSE 8000

CMD ["/sbin/my_init"]
