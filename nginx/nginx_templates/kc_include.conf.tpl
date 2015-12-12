location /static {
   alias /srv/www/kobocat;
}

location / {
    if (%maintenance = "yes") {
        rewrite .* http://${KOBO_PREFIX}kobo.${KOBO_DOMAIN};
    }
   uwsgi_pass kobocat;
   include /etc/nginx/uwsgi_params;
}
