FROM registry.redhat.io/ubi8/ubi:8.3

LABEL email=catsy@naver.com

ENV PORT 8080

RUN yum install -y httpd && yum clean all

RUN sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && \
    chown -R apache:apache /etc/httpd/logs/ && \
    chown -R apache:apache /run/httpd/

RUN echo "TEST" >> /var/www/html/index.html && \
    chown -R apache:apache /var/www/html/

USER apache

EXPOSE ${PORT}

CMD ["httpd","-D","FOREGROUND"]
