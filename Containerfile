FROM registry.redhat.io/ubi8/ubi:8.3

LABEL email=catsy@naver.com

ENV PORT 8080

RUN yum install -y httpd && yum clean all

RUN sed -ri -e "/Listen 80/Listen ${PORT}/" /etc/httpd/conf/httpd.conf && \
    chown -R apache:apache /etc/httpd/logs/ && \
    chown -R apache:apache /run/httpd/

USER apache

EXPOSE ${PORT}

CMD ["httpd","-D","FOREGROUND"]
