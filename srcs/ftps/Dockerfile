FROM alpine:3.13
LABEL key="mbrizion"

ARG minikube_ip

RUN apk update && apk add vsftpd openssl telegraf supervisor && mkdir /etc/telegraf

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/vsftpd/vsftpd.key \
	-out 	/etc/vsftpd/vsftpd.crt \
	-subj '/C=FR/ST=FRANCE/L=Paris/O=42/CN=42'

RUN { echo "pass"; echo "pass"; } | adduser user
COPY supervisord.conf	/etc/supervisord.conf
COPY telegraf.conf 	/etc/telegraf/
COPY vsftpd.conf	/etc/vsftpd/vsftpd.conf
RUN	sed -i -e "s/minikube_ip/$minikube_ip/g" /etc/vsftpd/vsftpd.conf
COPY start_ftps.sh  ./vsftpd/start_ftps.sh
CMD  sh         	./vsftpd/start_ftps.sh

EXPOSE 21 40000