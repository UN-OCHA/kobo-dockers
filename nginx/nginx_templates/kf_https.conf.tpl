listen      443 ssl;
charset     utf-8;
access_log  ${KOBO_NGINX_LOG_DIR}/koboform.access.log;
error_log   ${KOBO_NGINX_LOG_DIR}/koboform.error.log;

# max upload size
client_max_body_size 75M;

ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
ssl_ciphers   'AES256+EECDH:AES256+EDH';

location /static {
    alias /srv/www/koboform;
}

location / {
    uwsgi_pass koboform;
    include /etc/nginx/uwsgi_params;
}
