FROM alpine:latest
LABEL key="mbrizion"

RUN apk update && apk add influxdb

COPY start.sh .

CMD ["sh", "start.sh"]