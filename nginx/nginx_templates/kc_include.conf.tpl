location /static {
   alias /srv/www/kobocat;
}

location / {
    if (%maintenance = "yes") {
        rewrite .* http://${KOBO_PREFIX}kobo.${KOBO_DOMAIN};
    }
    #uwsgi_pass kobocat;
    #include /etc/nginx/uwsgi_params;
    proxy_pass http://kobocat;
    include /etc/nginx/proxy_params;
}
