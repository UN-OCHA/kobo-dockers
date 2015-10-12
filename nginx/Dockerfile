FROM teodorescuserban/kobo-base-nginx:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY nginx_includes hrinfo.bundle.crt kobo.conf run_nginx /srv/

RUN mv /srv/run_nginx /etc/service/nginx/run && \
    mv /srv/nginx_includes /etc/nginx/ && \
    mv /srv/hrinfo.bundle.crt /etc/nginx/ && \
    mv /srv/kobo.conf /etc/nginx/sites-available/kobo && \
    chmod +x /etc/service/nginx/run && \
    rm -rf /etc/nginx/sites-enabled/* && \
    ln -s /etc/nginx/sites-available/kobo /etc/nginx/sites-enabled/kobo

EXPOSE 80 443

VOLUME ["/srv/www", "/var/log/nginx", "/etc/nginx", "/tmp"]

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]
