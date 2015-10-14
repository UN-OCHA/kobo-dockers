location /static {
   alias /srv/www/kobocat;
}

location / {
   uwsgi_pass kobocat;
   include /etc/nginx/uwsgi_params;
}
