location /static {
    alias /srv/www/koboform;
}

error_page 418 = /static/html/Offline.html;

location / {
    if (%maintenance = "yes") {
        return 418;
    }
    # uwsgi_pass koboform;
    # include /etc/nginx/uwsgi_params;
    proxy_pass http://koboform;
    include /etc/nginx/proxy_params;
}
