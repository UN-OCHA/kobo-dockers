FROM teodorescuserban/kobo-base-kobocat:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

RUN mkdir -p /etc/service/celery

COPY run_wsgi /etc/service/wsgi/run
COPY run_celery /etc/service/celery/run
COPY env_kobocat init_db.sh kobocat.ini kobocat_settings.py /srv/src/

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    chmod +x /etc/service/wsgi/run && \
    chmod +x /etc/service/celery/run

VOLUME ["/srv/src"]

EXPOSE 80 8000

CMD ["/sbin/my_init"]