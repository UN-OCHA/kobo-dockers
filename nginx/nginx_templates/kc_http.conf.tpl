listen      80;
charset     utf-8;
access_log  ${KOBO_NGINX_LOG_DIR}/kobocat.access.log;
error_log   ${KOBO_NGINX_LOG_DIR}/kobocat.error.log;

# max upload size
client_max_body_size 75M;

# Serve locations containing 'submission' or 'formList' via HTTP without
# further ado, since ODK Collect makes requests containing those terms and
# does not support any kind of redirection.
location ~ (submission|formList) {
   uwsgi_pass kobocat;
   include /etc/nginx/uwsgi_params;
}

# Redirect all other requests to HTTPS
location / {
   return 301 https://%server_name%request_uri;
}

# or comment block above and uncomment line below if you cant use http-to-https redirection
#include ${KOBO_NGINX_BASE_DIR}/kc_include.conf;
