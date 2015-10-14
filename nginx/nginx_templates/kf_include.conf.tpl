location /static {
    alias /srv/www/koboform;
}

location / {
    uwsgi_pass koboform;
    include /etc/nginx/uwsgi_params;
}
