FROM alpine:latest
LABEL key="mbrizion"

RUN apk update && apk add vsftpd openssl openrc
RUN echo -e "pass\npass" | adduser -h / user

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/vsftpd/vsftpd.key \
	-out 	/etc/vsftpd/vsftpd.crt \
	-subj '/C=FR/ST=FRANCE/L=Paris/O=42/CN=42'

COPY vsftpd.conf	/etc/vsftpd/vsftpd.conf
COPY start_ftps.sh  ./vsftpd/start_ftps.sh
CMD  sh         	./vsftpd/start_ftps.sh

EXPOSE 21