FROM alpine:3.13

ARG minikube_ip

RUN apk update && apk add mysql mysql-client telegraf supervisor openrc
RUN openrc ;\
	touch /run/openrc/softlevel && mkdir /etc/telegraf

COPY supervisord.conf	/etc/supervisord.conf
COPY telegraf.conf /etc/telegraf/
COPY start_mysql.sh ./start_mysql.sh
COPY init.sql ./init.sql
COPY wordpress.sql /home/wordpress.sql
RUN	sed -i -e "s/minikube_ip/$minikube_ip/g" /home/wordpress.sql

CMD ["sh", "start_mysql.sh"]

EXPOSE 3306