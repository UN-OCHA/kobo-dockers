# The ORDER of the servers is important!
# Dumb, non-SNI clients will receive the certificate
# for the first HTTPS server listed.

upstream kobocat {
    # server unix:///home/ubuntu/sockets/kobocat.sock;
    server ${KOBOCAT_SERVER_ADDR}:${KOBOCAT_SERVER_PORT};
}

server {
    include ${KOBO_NGINX_BASE_DIR}/kc_http.conf;
    server_name kc.humanitarianresponse.info;
}

server {
    include ${KOBO_NGINX_BASE_DIR}/kc_loopback.conf;
    # Be sure that hostname specified for server_name resolves to the same
    # address as localhost. Set it in /etc/hosts if necessary.
    server_name kc.humanitarianresponse.info;
}

server {
    include ${KOBO_NGINX_BASE_DIR}/kc_https.conf;
    server_name kc.humanitarianresponse.info;
    ssl_certificate ${KOBO_NGINX_BASE_DIR}/humanitarianresponse_info.bundle.crt;
    ssl_certificate_key ${KOBO_NGINX_BASE_DIR}/humanitarianresponse_info.key;
}

upstream koboform {
    # server unix:///home/ubuntu/sockets/koboform.sock;
    server ${KOBOFORM_SERVER_ADDR}:${KOBOFORM_SERVER_PORT};
}

server {
    include ${KOBO_NGINX_BASE_DIR}/kf_http.conf;
    server_name kobo.humanitarianresponse.info;
}

server {
    include ${KOBO_NGINX_BASE_DIR}/kf_https.conf;
    server_name kobo.humanitarianresponse.info;
    ssl_certificate ${KOBO_NGINX_BASE_DIR}/humanitarianresponse_info.bundle.crt;
    ssl_certificate_key ${KOBO_NGINX_BASE_DIR}/humanitarianresponse_info.key;
}
