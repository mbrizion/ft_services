FROM alpine:latest
MAINTAINER mbrizion

RUN apk update
RUN apk add nginx openssl
RUN mkdir -p /run/nginx

WORKDIR /var/www/

RUN adduser -D -g 'www' www
RUN mkdir       /www
RUN chown -R    www:www /var/lib/nginx
RUN chown -R    www:www /var/www/*

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/nginx.key \
	-out 	/etc/nginx/nginx.crt \
	-subj '/C=FR/ST=FRANCE/L=Paris/O=42/CN=42'


COPY index.html 	/var/www/index.html
COPY style.css 		/var/www/style.css
COPY favicon.ico 	/var/www/favicon.ico
COPY nginx.conf 	/etc/nginx/nginx.conf
COPY start.sh   	/www/
RUN  chmod +x   	/www/start.sh
CMD  sh         	/www/start.sh

EXPOSE 80 443