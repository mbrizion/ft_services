FROM alpine:3.13
LABEL key="mbrizion"

RUN apk update && apk add grafana telegraf supervisor && mkdir /etc/telegraf

COPY telegraf.conf /etc/telegraf/
COPY supervisord.conf	/etc/supervisord.conf
COPY dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY Dashboard-1619869831008.json /usr/share/grafana/conf/provisioning/dashboards/
COPY datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY start.sh .
CMD ["sh", "start.sh"]