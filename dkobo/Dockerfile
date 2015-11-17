FROM teodorescuserban/kobo-base-dkobo:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

#COPY *.sh koboform.ini /srv/src/
COPY run_gunicorn /etc/service/wsgi/run
COPY gunicorn_conf.py /srv/

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    chmod +x /etc/service/wsgi/run && \
    chown -R www-data /srv/src/koboform

USER www-data

RUN cd /srv/src/koboform && \
    bower install --config.interactive=false && \
    npm --no-color install --save-dev

USER root

VOLUME ["/srv/src/koboform", "/var/log/wsgi"]

EXPOSE 8000

CMD ["/sbin/my_init"]
