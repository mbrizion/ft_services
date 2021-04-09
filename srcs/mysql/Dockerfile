FROM alpine:latest

RUN apk update && apk add mysql mysql-client openrc
RUN openrc ;\
	touch /run/openrc/softlevel
COPY start_mysql.sh ./start_mysql.sh
COPY init.sql ./init.sql
COPY wordpress.sql /home/wordpress.sql

CMD ["sh", "start_mysql.sh"]

EXPOSE 3306