FROM alpine:3.11


RUN echo -e "http://mirrors.aliyun.com/alpine/v3.6/main\nhttp://mirrors.aliyun.com/alpine/v3.6/community" > /etc/apk/repositories
apk add --no-cache apache2 php7 php7-apache2 openldap-dev
rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/* /var/www/localhost/htdocs/*

EXPOSE 80

ADD ./www /var/www/localhost/htdocs

CMD ["apache2-foreground"]
