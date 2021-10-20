FROM registry.access.redhat.com/rhscl/httpd-24-rhel7
CMD ab -dSrk -c 20 -n 50000000 http://${HTTPD_TEST_SERVICE_HOST}:${HTTPD_TEST_SERVICE_PORT}/index.html