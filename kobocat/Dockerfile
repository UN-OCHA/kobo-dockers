FROM teodorescuserban/kobo-base-kobocat:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

RUN mkdir -p /etc/service/celery

COPY run_wsgi /etc/service/wsgi/run
COPY run_celery /etc/service/celery/run
COPY kobocat.ini init_db.sh kobocat_settings.py env_kobocat /srv/src/

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    useradd -s /bin/false wsgi -g wsgi && \
    chmod +x /etc/service/wsgi/run && \
    chmod +x /etc/service/celery/run

VOLUME ["/srv/src"]

EXPOSE 80 8000

CMD ["/sbin/my_init"]
