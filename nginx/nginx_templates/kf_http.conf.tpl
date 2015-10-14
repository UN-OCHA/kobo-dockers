# We can unconditionally redirect KF to HTTPS since ODK Collect never
# touches it
listen      80;
access_log  ${KOBO_NGINX_LOG_DIR}/koboform.access.log;
error_log   ${KOBO_NGINX_LOG_DIR}/koboform.error.log;

return 301 https://%server_name%request_uri;

# or comment the line above and uncomment line below if you cant use http-to-https redirection
#include ${KOBO_NGINX_BASE_DIR}/kf_include.conf;
