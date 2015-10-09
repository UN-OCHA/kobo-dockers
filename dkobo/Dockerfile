FROM teodorescuserban/kobo-base-dkobo:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY run_wsgi /etc/service/wsgi/run
COPY koboform.ini env_koboform /srv/src/

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh && \
    chmod +x /etc/service/wsgi/run && \
    useradd -s /bin/false wsgi -g wsgi && \
    cd /srv/src/koboform && \
    pip install -r requirements.txt

# && \
#    npm install bower && \
#    bower install --config.interactive=false --allow-root && \
#    npm install --save-dev

VOLUME ["/srv/src"]

EXPOSE 80 8000

CMD ["/sbin/my_init"]
