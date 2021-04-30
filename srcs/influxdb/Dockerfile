FROM alpine:3.13
LABEL key="mbrizion"

RUN apk update && apk add influxdb supervisor telegraf \
	&& mkdir /etc/influxdb && mkdir /etc/telegraf

COPY telegraf.conf /etc/telegraf/

COPY supervisord.conf	/etc/supervisord.conf
COPY start.sh .
CMD ["sh", "start.sh"]