FROM alpine:latest
LABEL key="mbrizion"

RUN apk update && apk add nginx php php7-common \
	php7-iconv php7-json php7-gd php7-curl php7-xml php7-opcache \
	php7-mysqli php7-imap php7-cgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
	php7-ldap php7-ctype php7-dom php7-fpm php7-session php7-mbstring && mkdir -p /run/nginx

RUN  adduser -D -g 'www' www ;\
mkdir       /www ;\
chown -R    www:www /var/lib/nginx ;\
chown -R    www:www /var/www/* 

COPY nginx.conf 	/etc/nginx/nginx.conf

RUN mkdir -p /usr/share/webapps/ ;\
	cd /usr/share/webapps ;\
	wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz ;\
	tar zxvf phpMyAdmin-5.1.0-all-languages.tar.gz ;\
	rm phpMyAdmin-5.1.0-all-languages.tar.gz ;\
	mv phpMyAdmin-5.1.0-all-languages phpmyadmin ;\
	chmod -R 777 /usr/share/webapps/ ;\
	ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/phpmyadmin

# RUN touch /usr/share/webapps/phpmyadmin/index.php ;\
# 	echo "<?php phpinfo(); ?>" > /usr/share/webapps/phpmyadmin/index.php

COPY config.inc.php /usr/share/webapps/phpmyadmin/

COPY start_pma.sh ./start_pma.sh

CMD ["sh", "start_pma.sh"]

EXPOSE 5000