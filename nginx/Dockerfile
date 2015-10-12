FROM teodorescuserban/kobo-base-nginx:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY nginx_templates/* hrinfo.bundle.crt run_nginx /srv/

RUN mv /srv/run_nginx /etc/service/nginx/run && \
    chmod +x /etc/service/nginx/run && \
    mv /srv/hrinfo.bundle.crt /etc/nginx/humanitarianresponse_info.bundle.crt && \
    mv /srv/* /etc/nginx/ && \
    rm -rf /etc/nginx/sites-enabled/* && \
    ln -s /etc/nginx/kobo.conf /etc/nginx/sites-enabled/kobo && \
    rm -rf /etc/nginx/kobo.conf

EXPOSE 80 443

VOLUME ["/srv/www", "/var/log/nginx", "/etc/nginx", "/tmp"]

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]
