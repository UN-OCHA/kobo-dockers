FROM teodorescuserban/kobo-base-nginx:latest

MAINTAINER Serban Teodorescu, teodorescu.serban@gmail.com

COPY nginx_includes hrinfo.bundle.crt kobo.conf run_nginx /srv/

RUN mv /srv/run_nginx /etc/service/nginx/run && \
    chmod +x /etc/service/nginx/run && \
    mv /srv/nginx_templates/* /etc/nginx/ && \
    rm -rf /srv/nginx_templates && \
    mv /srv/hrinfo.bundle.crt /etc/nginx/humanitarianresponse_info.bundle.crt && \
    rm -rf /etc/nginx/sites-enabled/* && \
    ln -s /etc/nginx/kobo.conf /etc/nginx/sites-enabled/kobo

EXPOSE 80 443

VOLUME ["/srv/www", "/var/log/nginx", "/etc/nginx", "/tmp"]

RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]
