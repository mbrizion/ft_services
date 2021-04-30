FROM alpine:3.13
LABEL key="mbrizion"

RUN apk update && apk add nginx openssl telegraf supervisor\
	&& mkdir /etc/telegraf && mkdir -p /run/nginx

WORKDIR /var/www/

RUN adduser -D -g 'www' www
RUN mkdir       /www
RUN chown -R    www:www /var/lib/nginx
RUN chown -R    www:www /var/www/*

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/nginx.key \
	-out 	/etc/nginx/nginx.crt \
	-subj '/C=FR/ST=FRANCE/L=Paris/O=42/CN=42'

COPY supervisord.conf	/etc/supervisord.conf
COPY telegraf.conf 		/etc/telegraf/
COPY index.html 		/var/www/index.html
COPY favicon.ico 		/var/www/favicon.ico
COPY nginx.conf 		/etc/nginx/nginx.conf
COPY start.sh   		/www/
CMD  sh         		/www/start.sh

EXPOSE 80 443