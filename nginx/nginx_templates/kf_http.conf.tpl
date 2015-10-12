# We can unconditionally redirect KF to HTTPS since ODK Collect never
# touches it
listen      80;
access_log  ${KOBO_NGINX_LOG_DIR}/koboform.access.log;
error_log   ${KOBO_NGINX_LOG_DIR}/koboform.error.log;

return 301 https://%server_name%request_uri;
