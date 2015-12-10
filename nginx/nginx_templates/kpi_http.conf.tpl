# no `listen`, etc. for now, because that's done by the dkobo configuration,
# which is included before this
#listen      80;
#access_log  ${KOBO_NGINX_LOG_DIR}/kpi.access.log;
#error_log   ${KOBO_NGINX_LOG_DIR}/kpi.error.log;

# We can unconditionally redirect KPI to HTTPS since ODK Collect never
# touches it
return 301 https://%server_name%request_uri;

# or comment the line above and uncomment line below if you cant use http-to-https redirection
#include ${KOBO_NGINX_BASE_DIR}/kpi_include.conf;
