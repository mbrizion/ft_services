FROM alpine:latest
LABEL key="mbrizion"
WORKDIR /var/www/

RUN apk update && apk add nginx php php7-common \
	php7-iconv php7-json php7-gd php7-curl php7-xml php7-opcache \
	php7-mysqli php7-imap php7-cgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
	php7-ldap php7-ctype php7-dom php7-fpm && mkdir -p /run/nginx

RUN adduser -D -g 'www' www ;\
mkdir       /www ;\
chown -R    www:www /var/lib/nginx ;\
chown -R    www:www /var/www/* ;

COPY nginx.conf 	/etc/nginx/nginx.conf

RUN	mkdir -p /usr/share/webapps/

COPY wordpress/		/usr/share/webapps/wordpress

RUN	ln -s /usr/share/webapps/wordpress/ /var/www/localhost/wordpress;\
	chown -R www:www /usr/share/webapps/wordpress

COPY wp-config.php  /usr/share/webapps/wordpress/wp-config.php

COPY start_wp.sh   	/www/
CMD ["sh", "/www/start_wp.sh"]

EXPOSE 5050