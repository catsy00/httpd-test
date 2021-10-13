FROM registry.redhat.io/ubi8/ubi:8.3

LABEL email=catsy@naver.com

ENV PORT 8080

RUN yum install -y httpd && yum clean all

RUN sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && \
    sed -ri -e "/^#ServerName /c\ServerName localhost:${PORT}" /etc/httpd/conf/httpd.conf && \
    sed -ri -e "/^User default/c\User apache" /etc/httpd/conf/httpd.conf && \
    chown -R apache:apache /etc/httpd/logs/ && \
    chown -R apache:apache /etc/httpd/ 

# RUN rm -f /etc/httpd/run/httpd.pid

USER apache

EXPOSE ${PORT}

CMD ["httpd","-D","FOREGROUND"]
# CMD ["while true; do echo \"TEST\"; done"]
