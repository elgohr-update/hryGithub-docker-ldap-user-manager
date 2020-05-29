FROM alpine:latest


RUN sed -i "s@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g" /etc/apk/repositories
RUN apk update && apk add --no-cache apache2 php7 php7-apache2 php7-ldap openldap-dev \
    && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* /var/www/localhost/htdocs/*

EXPOSE 80

ADD ./www /var/www/localhost/htdocs

CMD ["httpd", "-DFOREGROUND"]
