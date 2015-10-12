listen      localhost:80;
charset     utf-8;
access_log  ${KOBO_NGINX_LOG_DIR}/kobocat.access.log;
error_log   ${KOBO_NGINX_LOG_DIR}/kobocat.error.log;

# max upload size
client_max_body_size 75M;

location /static {
   # alias ${KOBO_NGINX_KOBOCAT_BASE_DIR}/onadata/static;
   alias ${KOBO_NGINX_KOBOCAT_BASE_DIR};
}

location / {
   uwsgi_pass kobocat;
   include /etc/nginx/uwsgi_params;
}
