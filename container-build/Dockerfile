FROM registry.access.redhat.com/ubi8/ubi:8.0 

MAINTAINER Red Hat Training <training@redhat.com>

# DocumentRoot for Apache
ENV DOCROOT=/var/www/html 
ENV PORT 8080

RUN   yum install -y --no-docs --disableplugin=subscription-manager httpd && \ 
      yum clean all --disableplugin=subscription-manager -y && \
      echo "Hello from the httpd-parent container!" > ${DOCROOT}/index.html

RUN sed -i "s/Listen 80/Listen ${PORT}/g" /etc/httpd/conf/httpd.conf && \
    sed -i "s/#ServerName www.example.com:80/ServerName 0.0.0.0:${PORT}/g" /etc/httpd/conf/httpd.conf

# Allows child images to inject their own content into DocumentRoot
ONBUILD COPY src/ ${DOCROOT}/ 

EXPOSE ${PORT}

# This stuff is needed to ensure a clean start
RUN rm -rf /run/httpd && mkdir /run/httpd && \
    chgrp -R 0 /var/log/httpd /var/run/httpd && \
    chmod -R g=u /var/log/httpd /var/run/httpd

# Run as the root user
USER 1001

# Launch httpd
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]