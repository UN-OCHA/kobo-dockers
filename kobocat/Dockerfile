FROM teodorescuserban/kobo-base-kobocat:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

RUN mkdir -p /etc/service/celery

#COPY *.sh kobocat.ini /srv/src/
#COPY run_wsgi /etc/service/wsgi/run

COPY *.sh gunicorn_conf.py /srv/
COPY run_gunicorn /etc/service/wsgi/run
COPY run_celery /etc/service/celery/run

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    chmod +x /etc/service/celery/run && \
    chmod +x /etc/service/wsgi/run && \
    echo "db:*:*:kobo:kobo" > /root/.pgpass && \
    chmod 600 /root/.pgpass

VOLUME ["/srv/src/kobocat", "/srv/src/kobocat/onadata/media", "/srv/src/kobocat-template", "/tmp", "/var/log/wsgi"]

EXPOSE 8000

CMD ["/sbin/my_init"]
